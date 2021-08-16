# Rails Sales Taxes Kata
## Description:
This application will let a logged in user upload a text file, and will parse the contents to create a receipt with the adjusted prices due to their tax categories.
![landing page link](https://user-images.githubusercontent.com/68167430/128925230-dc50d85b-5047-47fd-86c5-339ab2108733.png)


The uploaded text file will currently need to emulate the following:
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


## Item Categories
Item Categories are necessary to build LineItems and currently limited to the categories uploaded in the seeds file. To expand Item categories and allow a greater input of item descriptions, it is important to update the seeds file. To expand the categories, just add a category element to `categories` array to broaden ItemCategory model and input a new ***generalized description***(key) and ***item category***(value) to the line_item_descriptions hash that correlate with an items description.

`your_app/db/seeds.rb`
```
categories = ['Medicine', 'Book', 'Food', 'Others']
.
.
.

line_item_descriptions = {'book' => 'Book',
                          'music CD' => 'Others',
                          'chocolate' => 'Food',
                          'perfume' => 'Others',
                          'pills' => 'Medicine'
}
.
.
.
```
## Configuration and Testing
* This application was built on Ruby version: 2.7.2
* This application requires you to have an api key from the [CatAPI](https://thecatapi.com/) website.

* Configuration:
  1. `git clone`
  2. `bundle install`
  3. `yarn install`
  4. `rails db:setup`
  5. `bundle exec figaro install`
  6. navigate to `/config/application.yml` and create variable CAT_API_KEY: <'Your-api-key-here'>
  7. `bundle exec rspec` - there should be 31 passing examples
  8. `rails s`
  9. `navigate to localhost:3000`
## Deploying

* Setting up deployment to Heroku
  1. login to heroku cli
  2. heroku create <'YOUR-APP-NAME-HERE'>
  3. heroku config:set CAT_API_KEY=<'Your-api-key-here'>
  4. git push heroku main
  5. heroku run rake db:migrate
  6. heroku run rake db:seed

* Database creation: created and tested using psql and sqlite
## Demo

* [Sample Application](https://sample-basker-reader.herokuapp.com/)

Thanks for checking out this application!
