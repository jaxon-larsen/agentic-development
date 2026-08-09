<#
.SYNOPSIS
    Deploys framework skills and rules from agentic-development into a target
    project's .cursor/ directory for Cursor compatibility.

.DESCRIPTION
    Syncs the universal framework files (11 skills + 5 framework rules) from the
    agentic-development template repository into a target project's .cursor/ dir.

    Domain-specific rules, project-unique skills, and memory files are preserved.

.PARAMETER Target
    Absolute path to the target project root directory.

.PARAMETER DryRun
    Preview changes without writing any files.

.PARAMETER Init
    If .cursor/ doesn't exist, create it and seed domain files from .agents/.

.EXAMPLE
    ./scripts/deploy.ps1 -Target "C:\Users\Jaxon\coding\godot\wizard-game"

.EXAMPLE
    ./scripts/deploy.ps1 -Target "C:\Users\Jaxon\coding\godot\wizard-game" -DryRun
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$Target,

    [switch]$DryRun,

    [switch]$Init
)

$ErrorActionPreference = "Stop"

# --- Paths ---
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourceRoot = (Resolve-Path (Join-Path $ScriptDir "..\.agents")).Path
$SourceSkills = Join-Path $SourceRoot "skills"
$SourceRules = Join-Path $SourceRoot "rules"

$CursorDir = Join-Path $Target ".cursor"
$CursorSkills = Join-Path $CursorDir "skills"
$CursorRules = Join-Path $CursorDir "rules"
$CursorMemory = Join-Path $CursorDir "memory"

# Framework rules that get synced (overwritten). Everything else is preserved.
$FrameworkRules = @(
    "collaboration.mdc",
    "docs.mdc",
    "git.mdc",
    "styling.mdc",
    "testing.mdc"
)

# Framework skills that get synced (overwritten). Everything else is preserved.
$FrameworkSkills = @(
    "debug-systematically",
    "enhance-docs",
    "expand-from-docs",
    "goal",
    "grill-me",
    "improve-codebase-architecture",
    "learn",
    "onboarding",
    "performance-audit",
    "prototype",
    "review"
)

# --- Validation ---
if (-not (Test-Path $Target)) {
    Write-Error "Target directory does not exist: $Target"
    exit 1
}
if (-not (Test-Path $SourceSkills)) {
    Write-Error "Source skills directory not found: $SourceSkills"
    exit 1
}

# --- Init: create .cursor/ if needed ---
if (-not (Test-Path $CursorDir)) {
    if ($Init -or $DryRun) {
        Write-Host "[INIT] .cursor/ does not exist" -ForegroundColor Yellow

        # Seed from .agents/ if present
        $AgentsDir = Join-Path $Target ".agents"
        if (Test-Path $AgentsDir) {
            if ($DryRun) {
                Write-Host "  [DRY-RUN] Would create .cursor/ and seed domain files from .agents/"
            } else {
                Write-Host "  Creating .cursor/ and seeding domain files from .agents/"
                New-Item -ItemType Directory -Path $CursorDir -Force | Out-Null
                New-Item -ItemType Directory -Path $CursorRules -Force | Out-Null
                New-Item -ItemType Directory -Path $CursorSkills -Force | Out-Null

                # Copy AGENTS.mdc
                $agentsMdc = Join-Path $AgentsDir "AGENTS.mdc"
                if (Test-Path $agentsMdc) {
                    Copy-Item $agentsMdc (Join-Path $CursorDir "AGENTS.mdc")
                    Write-Host "  Seeded: AGENTS.mdc"
                }

                # Copy memory/
                $agentsMemory = Join-Path $AgentsDir "memory"
                if (Test-Path $agentsMemory) {
                    Copy-Item $agentsMemory $CursorMemory -Recurse
                    Write-Host "  Seeded: memory/"
                }

                # Copy domain rules (non-framework)
                $agentsRules = Join-Path $AgentsDir "rules"
                if (Test-Path $agentsRules) {
                    Get-ChildItem $agentsRules -File | Where-Object {
                        $_.Name -notin $FrameworkRules
                    } | ForEach-Object {
                        Copy-Item $_.FullName (Join-Path $CursorRules $_.Name)
                        Write-Host "  Seeded domain rule: $($_.Name)"
                    }
                }

                # Copy project-unique skills (non-framework)
                $agentsSkills = Join-Path $AgentsDir "skills"
                if (Test-Path $agentsSkills) {
                    Get-ChildItem $agentsSkills -Directory | Where-Object {
                        $_.Name -notin $FrameworkSkills
                    } | ForEach-Object {
                        Copy-Item $_.FullName (Join-Path $CursorSkills $_.Name) -Recurse
                        Write-Host "  Seeded domain skill: $($_.Name)/"
                    }
                }
            }
        } else {
            if ($DryRun) {
                Write-Host "  [DRY-RUN] Would create empty .cursor/ structure"
            } else {
                New-Item -ItemType Directory -Path $CursorDir -Force | Out-Null
                New-Item -ItemType Directory -Path $CursorRules -Force | Out-Null
                New-Item -ItemType Directory -Path $CursorSkills -Force | Out-Null
                Write-Host "  Created empty .cursor/ structure"
            }
        }
    } else {
        Write-Error ".cursor/ does not exist in target. Run with -Init to create it."
        exit 1
    }
}

# --- Ensure directories exist ---
if (-not $DryRun) {
    if (-not (Test-Path $CursorRules)) { New-Item -ItemType Directory -Path $CursorRules -Force | Out-Null }
    if (-not (Test-Path $CursorSkills)) { New-Item -ItemType Directory -Path $CursorSkills -Force | Out-Null }
}

# --- Sync framework rules ---
Write-Host ""
Write-Host "=== Framework Rules ===" -ForegroundColor Cyan
foreach ($rule in $FrameworkRules) {
    $src = Join-Path $SourceRules $rule
    $dst = Join-Path $CursorRules $rule
    if (Test-Path $src) {
        if ($DryRun) {
            $action = if (Test-Path $dst) { "overwrite" } else { "create" }
            Write-Host "  [DRY-RUN] Would $action`: $rule"
        } else {
            Copy-Item $src $dst -Force
            Write-Host "  Synced: $rule"
        }
    } else {
        Write-Host "  [WARN] Source not found: $rule" -ForegroundColor Yellow
    }
}

# --- Sync framework skills ---
Write-Host ""
Write-Host "=== Framework Skills ===" -ForegroundColor Cyan
foreach ($skill in $FrameworkSkills) {
    $src = Join-Path $SourceSkills $skill
    $dst = Join-Path $CursorSkills $skill
    if (Test-Path $src) {
        if ($DryRun) {
            $action = if (Test-Path $dst) { "overwrite" } else { "create" }
            Write-Host "  [DRY-RUN] Would $action`: $skill/"
        } else {
            if (Test-Path $dst) { Remove-Item $dst -Recurse -Force }
            Copy-Item $src $dst -Recurse
            Write-Host "  Synced: $skill/"
        }
    } else {
        Write-Host "  [WARN] Source not found: $skill/" -ForegroundColor Yellow
    }
}

# --- Report preserved items ---
Write-Host ""
Write-Host "=== Preserved (not touched) ===" -ForegroundColor Green

# Domain rules
if (Test-Path $CursorRules) {
    Get-ChildItem $CursorRules -File | Where-Object {
        $_.Name -notin $FrameworkRules
    } | ForEach-Object {
        Write-Host "  Rule: $($_.Name)"
    }
}

# Project-unique skills
if (Test-Path $CursorSkills) {
    Get-ChildItem $CursorSkills -Directory | Where-Object {
        $_.Name -notin $FrameworkSkills
    } | ForEach-Object {
        Write-Host "  Skill: $($_.Name)/"
    }
}

# Memory
if (Test-Path $CursorMemory) {
    Write-Host "  memory/"
}

Write-Host ""
Write-Host "Done." -ForegroundColor Green
