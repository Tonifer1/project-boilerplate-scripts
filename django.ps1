# Parameters for project name
# Choose a name for your project and put it in the $ProjectName variable (your_project_name). 
# This name will be used to create a new directory and Django project with the specified name.
Param(
    [string]$ProjectName = "DjangoMonolith"
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

# Create and activate virtual environment
Write-Host "Creating virtual environment..."
python -m venv venv
.\venv\Scripts\Activate.ps1

# Install Django
Write-Host "Installing Django..."
pip install django

# Save dependencies to requirements.txt
Write-Host "Saving dependencies to requirements.txt..."
pip freeze > requirements.txt

# Create Django project in the current folder
Write-Host "Creating the Django project..."
django-admin startproject $ProjectName .

# Apply migrations
Write-Host "Running migrations..."
python manage.py migrate

# Create .gitignore file
Write-Host "Adding .gitignore file..."
@"
venv/
__pycache__/
*.pyc
*.pyo
*.env
db.sqlite3
"@ | Out-File -Encoding UTF8 .gitignore

# Create superuser
Write-Host "Creating superuser. Please provide username and password when prompted..."
python manage.py createsuperuser

# Ensure the 'code' command is available
if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: 'code' command is not available. Please ensure Visual Studio Code is installed and added to PATH." -ForegroundColor Red
    exit
}

# Open the project in Visual Studio Code
Write-Host "Opening $BasePath$ProjectName in VS Code..."
code $BasePath$ProjectName

# Final success message
Write-Host "All tasks are completed! Happy coding with your Django project!" -ForegroundColor Green
