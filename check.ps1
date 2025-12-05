param (
    [string]$RepoUrl = "https://github.com/corenova95/macro.git",
    [string]$TargetDirectory = "C:\maro"
)

if (-not (Test-Path $TargetDirectory)) {
    Write-Host "Directory '$TargetDirectory' does not exist. Cloning repository..."
    git clone $RepoUrl $TargetDirectory
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Repository cloned successfully."
    } else {
        Write-Error "Failed to clone repository. Git exit code: $LASTEXITCODE"
    }
} else {
    Write-Host "Directory '$TargetDirectory' already exists. Skipping clone."
}
cd macro
node check.js
cd macro
node check.js
