# Human-in-the-loop reproduction loop (PowerShell).
# Copy this file, edit the steps below, and run it.
# The agent runs the script; the user follows prompts in their terminal.
#
# Usage:
#   powershell -File hitl-loop.template.ps1
#
# Two helpers:
#   Step "<instruction>"          → show instruction, wait for Enter
#   Capture "<question>"          → show question, read response

$ErrorActionPreference = "Stop"

function Step([string]$Instruction) {
    Write-Host "`n>>> $Instruction"
    Read-Host "    [Enter when done]" | Out-Null
}

function Capture([string]$Question) {
    Write-Host "`n>>> $Question"
    return (Read-Host "    > ")
}

$Captured = [ordered]@{}

# --- edit below ---------------------------------------------------------

Step "Open the app at http://localhost:3000 and sign in."

$Captured["ERRORED"] = Capture "Click the 'Export' button. Did it throw an error? (y/n)"

$Captured["ERROR_MSG"] = Capture "Paste the error message (or 'none'):"

# --- edit above ---------------------------------------------------------

Write-Host "`n--- Captured ---"
foreach ($key in $Captured.Keys) {
    Write-Host "$key=$($Captured[$key])"
}
