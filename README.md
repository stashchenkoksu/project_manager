[![View Code](https://img.shields.io/badge/View%20-Code-green)](https://github.com/stashchenkoksu/project_manager)

# About project manager

### General description:
This is a project and task manager. You can create projects and tasks in it. Assign users to teams, assign teams to a project, and track statistics on completed tasks

### Main models:
1. Project
2. Task
3. User
4. Team

### User roles:
1. Simple user (can manage all models)
2. Admin(can manage all models + statistic)

###User interaction
After registration, the user can manage projects(create, edit, assign teams), tasks (create, edit, assign users to tasks), teams(create, edit, assign users to teams), write comments, edit their profile

# Built With

- Ruby 2.7.0
- Rails 5.2.4
- MySql
- Bootstrap 4.0

# Getting Started <a name = "gs"></a>

To get a local copy of the repository please run the following commands on your terminal:
~~~bash
$ cd <folder>
$ git clone https://github.com/stashchenkoksu/project_manager.git
~~~

**Install gems with:**
~~~bash
$ bundle install
~~~

**Install project manager**
~~~bash
$ yarn or npm install
~~~

**Setup database with:**
>make sure you have postgress sql installed and running on your system
~~~bash
$ rails db:create
$ rails db:migrate
$ rails db:seed   # install sample list data
~~~

**Start server with:**
~~~bash
$ rails s
~~~

This app should be running at `http://localhost:3000/`

# Author
**Stashchenko Kseniya**

- Github: [https://github.com/stashchenkoksu](https://github.com/stashchenkoksu)
- Telegram: [https://t.me/StashchenkoKseniya](https://t.me/StashchenkoKseniya)
- Linkedin: [https://www.linkedin.com/in/stashchenkokseniya/](https://www.linkedin.com/in/stashchenkokseniya/)

