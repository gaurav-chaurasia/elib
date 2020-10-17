# ELIB

> Note: All steps were performed using on Windows 10.

- [Screen Shots](screenshot.md)

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

- Make migrations, Seed data into the database and Run the test server

```
        $ rake db:migrate
        $ rake db:seed
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
- show page for separate user and user can see their products _USER DASHBOARD_
- description is for clarifying the books details
- admin can approve and reject request
- admin dashboard has seperate tab for pending, approved, and rejected books

## List of non-implemented/planned features,

- User dashboard not complete
- user can have their profile picture and some more details

## Bugs

- User can make more than one request on same book

> some links

`https://guides.rubyonrails.org/`  
`https://github.com/twbs/bootstrap-sass`  
`https://github.com/heartcombo/devise`  
`https://github.com/bokmann/font-awesome-rails`
