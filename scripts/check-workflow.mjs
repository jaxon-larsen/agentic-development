import { existsSync, readFileSync, readdirSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const skillRoot = path.join(root, '.agents', 'skills');
const errors = [];
const checkedFiles = [];
const readme = existsSync(path.join(root, 'README.md'))
  ? readFileSync(path.join(root, 'README.md'), 'utf8')
  : '';

function relative(file) {
  return path.relative(root, file).replaceAll('\\', '/');
}

function walk(dir) {
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    const file = path.join(dir, entry.name);
    if (entry.isDirectory()) walk(file);
    else if (entry.isFile() && /\.(?:md|mdc)$/i.test(entry.name)) checkedFiles.push(file);
  }
}

if (!existsSync(path.join(root, 'AGENTS.md'))) errors.push('Missing root AGENTS.md');
if (!existsSync(skillRoot)) errors.push('Missing .agents/skills');

if (existsSync(skillRoot)) {
  for (const entry of readdirSync(skillRoot, { withFileTypes: true })) {
    if (!entry.isDirectory()) continue;
    const file = path.join(skillRoot, entry.name, 'SKILL.md');
    if (!existsSync(file)) {
      errors.push(`Missing SKILL.md in ${relative(path.dirname(file))}`);
      continue;
    }
    const body = readFileSync(file, 'utf8');
    const frontmatter = body.match(/^---\r?\n([\s\S]*?)\r?\n---(?:\r?\n|$)/)?.[1];
    const name = frontmatter?.match(/^name:\s*(.+)$/m)?.[1]?.trim();
    const description = frontmatter?.match(/^description:\s*(.+)$/m)?.[1]?.trim();
    if (!frontmatter || name !== entry.name || !description) {
      errors.push(`${relative(file)}: frontmatter needs matching name and nonempty description`);
    }
    if (!readme.includes(`./.agents/skills/${entry.name}/SKILL.md`)) {
      errors.push(`${relative(file)}: skill is missing from README.md`);
    }
  }
}

for (const dir of ['.agents', 'docs', 'evals']) {
  const full = path.join(root, dir);
  if (existsSync(full)) walk(full);
}
for (const file of ['AGENTS.md', 'README.md']) {
  const full = path.join(root, file);
  if (existsSync(full)) checkedFiles.push(full);
}

for (const file of checkedFiles) {
  const body = readFileSync(file, 'utf8');
  for (const match of body.matchAll(/\[[^\]]+\]\(([^)]+)\)/g)) {
    const target = match[1].trim().replace(/^<|>$/g, '').split('#')[0];
    if (!target || /^(?:[a-z][a-z\d+.-]*:|\/\/)/i.test(target)) continue;
    const resolved = path.resolve(path.dirname(file), decodeURIComponent(target));
    if (!existsSync(resolved)) {
      const line = body.slice(0, match.index).split('\n').length;
      errors.push(`${relative(file)}:${line}: missing link target ${target}`);
    }
  }
}

if (errors.length) {
  for (const error of errors) process.stderr.write(`FAIL ${error}\n`);
  process.exitCode = 1;
} else {
  process.stdout.write(`PASS: skill metadata and local links (${checkedFiles.length} files)\n`);
}
