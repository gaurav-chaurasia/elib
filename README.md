# ELIB

> Note: All steps were performed using on Windows 10.

- [Screen Shots]()

  - [admin dashboard](readme/admin.md)
  - [user dashboard](readme/user.md)
  - [general](readme/general.md)

- [Run Locally](readme/install.md)

### DONE THE INSTALLATIONS

- Clone the Repo:

```
        $ git clone https://github.com/gaurav-chaurasia/elib.git
```

- Change directory into the folder named elib
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

- Multiple Image upload capability
- seperate dashboard for normal and admin user
- "Active storage used for image storing feature"
- show page for separate user and user can see their all request _USER DASHBOARD_
- admin can see all request, books, and can manage all these from _ADMIN DASHBOARD_
- only admins can download all request in csv format from _ADMIN DASHBOARD_
- admin can approve and reject request
- admin dashboard has seperate tab for pending, approved, and rejected books
- user can return any of his approved book
- user can not make request for same book again and again if
  - already approved
  - already a pending request exists
- if request is rejected he can make new request for same book again

## List of non-implemented/planned features,

- after rejecting any request from admin any user can make request after certain time only for the book
- admin can download request list in any format of his/her choise
- User profile picture
- make design it responsive
- improve view (inline CSS)

## Bugs

> some links

`https://stackoverflow.com/`  
`https://www.youtube.com/`  
`https://guides.rubyonrails.org/`  
`https://github.com/twbs/bootstrap-sass`  
`https://github.com/heartcombo/devise`  
`https://github.com/bokmann/font-awesome-rails`
