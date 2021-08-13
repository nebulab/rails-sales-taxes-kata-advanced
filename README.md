# Rails Sales Taxes Kata
## Description:
This application will let you upload a text file, and will parse the contents to create a receipt with the adjusted prices due to their tax categories.
![landing page link](https://user-images.githubusercontent.com/68167430/128925230-dc50d85b-5047-47fd-86c5-339ab2108733.png)


The input text file will currently need to emulate the following:
```
1 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```
or in terms of what each element in the string represents:
```
<quantity> <description> at <price>
```
user create functionality is currently limited to orders, but can be easily scaled up from this point.

The output will be in the will similar to:
![output image](https://user-images.githubusercontent.com/68167430/129260301-eef07e34-8277-4090-9ffc-a4c2f01b9c5f.png)


## Configuration
* This application was built on Ruby version: 2.7.2

* Configuration:
  1. git clone
  2. bundle install
  3. yarn install
  4. rails db:setup
  5. rails s
  6. navigate to localhost:3000
## Deploying

* Setting up deployment to Heroku
  1. login to heroku cli
  2. heroku create <'YOUR-APP-NAME-HERE'>
  3. git push heroku main
  4. heroku run rake db:migrate
  5. heroku run rake db:seed

## Testing

* How to run the test suite
  1. git clone
  2. bundle install
  3. yarn install
  4. rails db:setup
  5.  bundle exec rspec


* Database creation: created and tested using psql and sqlite
## Demo

* [Sample Application](https://sample-basker-reader.herokuapp.com/)

Thanks for checking out this application!
