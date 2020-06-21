# KanbanCollab
KanbanCollab - IMA - Feldgrill/Kristan/Schweighofer

KanbanCollab is a web application for agile projectmanagement. It is used to manage a project efficiently and effectively with your team members.
This project was developed in the course of the study Information Management (IMA18) at the University of Applied Sciences FH JOANNEUM.
The project was supervised by DI Stefan Krausler-Baumann and DI Dr. Peter Salhofer.

Team Members:

    Peter Feldgrill
    Martin Schweighofer
    Thomas Kristan

Workload distribution:
    
    In general most tasks were done together, however, some tasks were split between team members.
    -Peter Feldgrill: Basic project structure; listing, creating, editing and deleting projects; security.
    -Martin Schweighofer: Kanban Board, JavaScript, Dragula, JQuery and Ajaxsubmit.
    -Thomas Kristan: Styling of pages, register and login of new users.

Setup Guide

    Download the project from this repo.
    Open the project with IntelliJ Idea Ultimate.
    Make sure that Java Version 8 or higher is installed and configured correctly on your machine.
    In IntelliJ, click on File -> Project Structure -> Modules -> Web and then on the + in "Web Resource Directories" and select the "webapp" folder.
    Make sure Tomcat is installed and configured correctly. 
    Also make sure to install MYSQL Server and configure it according to the configuration in the application properties (username: kanbancollab, password: swenga).
    Download and run FakeSMTP on Port 25.
    Definitely refresh Gradle after this.
    The default login credentials for the Administrator user are username: admin; password: admin. Make sure to change them before you get your application up and running.
    Run your application with IntelliJ and open localhost:8080 in your preferred webbrowser - except if it is IE ;-).
    
    You have now configured your KanbanCollab webapplication correctly and can start using it right away to organize your projects!
