# ELIB

> Note: All steps were performed using on Windows 10.

- [Screen Shots]()

  - [admin dashboard](docs/admin.md)
  - [user dashboard](docs/user.md)
  - [general](docs/general.md)

- [Run Locally](docs/install.md)

### DONE THE INSTALLATIONS

- Clone the Repo:

```
        $ git clone https://github.com/gaurav-chaurasia/IRIS_181CV155_1_Ruby-On-Rails.git
```

- Change directory into the folder named IRIS_181CV155_1_Ruby-On-Rails
- Install all the gems

```
        $ bundle install
```

- Make migrations, Seed data into the database and Run the server

```
        $ rails db:migrate
        $ rails db:seed
        $ rails server
```

- The above steps starts the development server on localhost:3000. Go to `http://localhost:3000/` in your browser. It will automatically redirect you to the Home page and then ask for Signup or Login.

- bootstrap-sass 3 used for styling many parts of the app and after adding small changes final could build beautiful UI

```
       $ gem 'twitter-bootstrap-rails'
       $ gem 'devise-bootstrap-views'

```

## List of all implemented features,

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

> some links

`https://stackoverflow.com/`  
`https://www.youtube.com/`  
`https://guides.rubyonrails.org/`  
`https://github.com/twbs/bootstrap-sass`  
`https://github.com/heartcombo/devise`  
`https://github.com/bokmann/font-awesome-rails`
