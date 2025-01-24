### Project Automation Scripts
This repository contains three PowerShell scripts designed to automate the creation of popular development environments. 
These scripts make it quick and easy to set up fully functional projects for React, Django, and Django REST Framework.
### Features
React Project Automation

Creates a new React project using Vite.
Installs dependencies, including styled-components and axios.
Generates a .gitignore file for clean version control.
Automatically opens the project in Visual Studio Code after setup.
Django REST Framework Automation

Sets up a Django project with Django REST Framework.
Creates a virtual environment (venv) and installs all required dependencies.
Saves dependencies to a requirements.txt file for easy sharing.
Initializes the database with migrations and prompts for superuser creation.
Automatically opens the project in Visual Studio Code.
Monolithic Django Project Automation

Creates a traditional Django project.
Sets up a virtual environment and installs Django.
Saves dependencies to a requirements.txt file.
Initializes the database with migrations and prompts for superuser creation.
Automatically opens the project in Visual Studio Code.

### Benefits
Time-saving: Automates repetitive setup tasks.
Consistent structure: Ensures every project follows the same reliable structure.
Developer-friendly: Automatically opens the project in Visual Studio Code for immediate work.

### How to Use
Clone or download the repository.
Run the desired script in PowerShell:

.\<script_name>.ps1
Replace <script_name> with:

django.ps1 for a monolithic Django project
djangoRFM.ps1 for Django REST Framework
react_vite.ps1 for React

Follow on-screen prompts for additional setup steps.

### Requirements
PowerShell 7 or higher.
Node.js and npm installed (for React projects).
Python 3.x installed (for Django projects).
Visual Studio Code installed with code command in PATH.

### Contribute
Feel free to fork this repository, suggest improvements, or submit pull requests to help make these scripts even better!
