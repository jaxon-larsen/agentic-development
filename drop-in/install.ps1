# Install agent skills and project files into a codebase.
# Usage: .\drop-in\install.ps1 [-Target C:\path\to\project]
# Run from the agentic-development repo root.

param(
    [string]$Target = "."
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir
$Target = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Target)
if (-not (Test-Path $Target)) { New-Item -ItemType Directory -Force -Path $Target | Out-Null }
$Target = (Resolve-Path $Target).Path

Write-Host "Installing into: $Target"
Write-Host "From skill library: $RepoRoot"

$cursorSkills = Join-Path $Target ".cursor\skills"
$agentsSkills = Join-Path $Target ".agents\skills"
New-Item -ItemType Directory -Force -Path $cursorSkills, $agentsSkills | Out-Null

Get-ChildItem -Path (Join-Path $RepoRoot "skills") -Directory | ForEach-Object {
    $name = $_.Name
    $destCursor = Join-Path $cursorSkills $name
    $destAgents = Join-Path $agentsSkills $name
    if (Test-Path $destCursor) { Remove-Item -Recurse -Force $destCursor }
    if (Test-Path $destAgents) { Remove-Item -Recurse -Force $destAgents }
    Copy-Item -Recurse $_.FullName $destCursor
    Copy-Item -Recurse $_.FullName $destAgents
    Write-Host "  skill: $name"
}

function Copy-IfMissing($Src, $Dest) {
    if (Test-Path $Dest) {
        Write-Host "  skip (exists): $(Split-Path -Leaf $Dest)"
    } else {
        Copy-Item $Src $Dest
        Write-Host "  added: $(Split-Path -Leaf $Dest)"
    }
}

Copy-IfMissing (Join-Path $RepoRoot "INSTRUCTIONS.mdc") (Join-Path $Target "INSTRUCTIONS.mdc")
Copy-IfMissing (Join-Path $ScriptDir "AGENTS.mdc") (Join-Path $Target "AGENTS.mdc")
Copy-IfMissing (Join-Path $ScriptDir "CONTEXT.md") (Join-Path $Target "CONTEXT.md")

New-Item -ItemType Directory -Force -Path (Join-Path $Target "docs") | Out-Null
New-Item -ItemType File -Force -Path (Join-Path $Target "docs\.gitkeep") | Out-Null

Write-Host "Done. Open AGENTS.mdc in the target project and try /grill."
