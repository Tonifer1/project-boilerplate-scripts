# Parameters for project name
# Choose a name for your project and put it in the $ProjectName variable (your_project_name). 
# This name will be used to create a new directory and React Vite project with the specified name.
Param(
    [string]$ProjectName = "your_project_name"
)

# Specify the project path
$BasePath = "C:\"
Set-Location $BasePath

Write-Host "The project will be saved to: $BasePath$ProjectName"

# Check and remove an existing directory
if (Test-Path $ProjectName) {
    Write-Host "WARNING: The folder $BasePath$ProjectName already exists!" -ForegroundColor Yellow
    $response = Read-Host "Are you sure you want to delete this folder? (Yes/No)"
    if ($response -ne "Yes") {
        Write-Host "Operation canceled. The project was not deleted" -ForegroundColor Green
        exit
    }
    Write-Host "Deleting the existing folder $ProjectName..."
    Remove-Item -Recurse -Force $ProjectName
}

# Create a new directory and navigate to it
New-Item -ItemType Directory -Path $ProjectName | Out-Null
Set-Location $ProjectName

# Create the React Vite project directly in the current folder
Write-Host "Creating the React Vite project..."
Write-Host "NOTE: If the program pauses and prompts for input, press Enter to continue." -ForegroundColor Yellow
npx --yes create-vite@latest ./ --template react

# Check if npx command succeeded
if (-not (Test-Path "$BasePath$ProjectName\package.json")) {
    Write-Host "ERROR: React Vite project creation failed. Exiting..." -ForegroundColor Red
    exit
}

# Move to the project folder and install dependencies
Write-Host "Installing dependencies..."
npm install

Write-Host "Adding styled-components and axios..."
npm install styled-components axios

# Create the .gitignore file
Write-Host "Adding .gitignore file..."
@"
node_modules/
dist/
.env
"@ | Out-File -Encoding UTF8 .gitignore

# Ensure the 'code' command is available
if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: 'code' command is not available. Please ensure Visual Studio Code is installed and added to PATH." -ForegroundColor Red
    exit
}

# Open the project in Visual Studio Code
Write-Host "Opening $BasePath$ProjectName in VS Code..."
code $BasePath$ProjectName

# Final success message
Write-Host "All tasks are completed! Happy coding with your React Vite project!" -ForegroundColor Green
