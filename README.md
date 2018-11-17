My-Pet-Store aka the Pet Listing

- Git clone the repo 
- Run `bundle install`
- Install Postgresql or db of choice
- Set env variables 
  - `IP` - for db IP address 
  - `dev_pet_user` - for dev user in db
  - `dev_pet_pass` - for dev password in db
  - `prod_pet_user` - for production user in db
  - `MYAPP_DATABASE_PASSWORD` - for production password in db
  - `SECRET_KEY_BASE` - as needed
- Run `rails db:schema:load`
- Run `rails db:seed`

Wiki splash page - https://github.com/Mirv/pet_store_003/wiki
