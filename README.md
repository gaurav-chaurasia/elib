# ELIB
> Note: All steps were performed using on Windows 10.


- [SCREENSHOTS]()
  - [ADMIN DASHBOARD](docs/admin.md)
  - [USER DASHBOARD](docs/user.md)
  - [GENERAL](docs/general.md)
- [RUN LOCALLY](docs/install.md)


### DONE THE INSTALLATIONS
- Clone the Repo:

```py
        $ git clone https://github.com/gaurav-chaurasia/elib.git
```

- Change directory into the folder named elib
- Install all the gems

```py
        $ bundle install
```

- Make migrations, Seed data into the database and Run the server

```py
        $ rails db:migrate
        $ rails db:seed
        $ rails server
```

- The above steps starts the development server on localhost:3000. Go to `http://localhost:3000/` in your browser. It will automatically redirect you to the Home page and then ask for Signup or Login.

- bootstrap-sass 3 used for styling many parts of the app and after adding small changes final could build beautiful UI

```py
       $ gem 'twitter-bootstrap-rails'
       $ gem 'devise-bootstrap-views'

```

### Features
- [x] Multiple Image upload capability
- [x] seperate dashboard for normal and admin user
- [x] "Active storage used for image storing feature"
- [x] show page for separate user and user can see their all request _USER DASHBOARD_
- [x] admin can see all request, books, and can manage all these from _ADMIN DASHBOARD_
- [x] only admins can download all request in csv format from _ADMIN DASHBOARD_
- [x] admin can approve and reject request
- [x] admin dashboard has seperate tab for pending, approved, and rejected books
- [x] user can return any of his approved book
- [x] user can not make request for same book again and again if
  - [x] already approved
  - [x] already a pending request exists
- [x] if request is rejected he can make new request for same book again
- [x] User profile picture
- [ ] after rejecting any request from admin any user can make request after certain time only for the book
- [ ] admin can download request list in any format of his/her choise
- [ ] improve view

