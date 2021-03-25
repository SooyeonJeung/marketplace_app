# Phase Two 
This is a user guide for the **Phase Two** application. The application is built on Ruby on Rails version ruby-2.7.2). 

<br>

## Set Up
1. Clone your fork to your local development environment
- mkdir (local repo name)
- cd (local repo name)
- git clone (paste the link from Github that says Clone with SSH from github(https://github.com/SooyeonJeung/marketplace_app)
- cd into the new folder, it will have the same name as the repo

2. Install dependencies bundle install
- bundle install

3. Check node dependencies 
- yarn install --check-files
4. run rails s and check that everything is working (you should see welcome to rails!)

<br>

## About
**Phase Two** is an online marketplace for secondhand maternity and baby products. 

### The Problem: 
For Moms:

- Maternity cloth is necessary but only needed for 3-5 months.
- Quality maternity cloth is important and they are pricey.
- It’s very difficult to decide which size to buy (e.g. up 1 size? or 2 sizes?)
- Sharing the journey of pregnancy and motherhood with others is important.

For Babies:
- Babies grow very fast! 
- Babies are demanding! Need a lot of stuff to keep them safe, curious, and entertained

### Solve the initial problem by:
- Get quality products that are a long-lasting and fair trade 
- Make an economical decision for both sellers and buyers
- Contribute to sustainability and environmental-friendly actions
- Build a sense of community 
- Equip yourself well throughout the pregnancy and childcare journey with the products that you need 

<br>

## Context
Pregnancy is a beautiful part of the new adventure that you get to share with others. However, it can be quite overwhelming as a first-time parent, especially for a mom-to-be. With all the physical changes during the pregnancy, it's necessary to be equipped with maternity and baby products. 

Going through pregnancy myself during this course, I've experienced that it's quite expensive to go shopping for the whole new wardrobe that I'll only need for 3-5 months. But at the same time, I wanted to buy good quality clothes that don't cause additional trouble on my already stretching skin. I was desperate to find clothes that would fit me already starting from 2.5 months onwards. I'm the first one to be pregnant in my family and friends group, hence, really faced the problem and opportunity in this pace to buy/sell gently-used pregnancy and baby products that are no longer needed. 

More people in the world go through the journey of pregnancy and parenthood than people who don't. It's an exciting and emotional phase in life that brings a lot of changes in daily lifestyle. Especially in Australia, I found that the market for pregnancy products is extremely small compared to the demand. Of course, the secondhand market is nearly non-existence. This is a great business opportunity to address the pain point of the broad, but forgotten users in the market. 

<br>

## Application Link (deployed)
www.marketplace-app201.herokuapp.com

<br>

## GitHub repository (source control)
https://github.com/SooyeonJeung/marketplace_app

<br>

## Website Layout & Details
- Purpose: 
    - When a user lands on the website, the user can see the home page.
    - When the user is signed-in, the user can create a profile. 
    - Regardless of sign-in/out, any user can see the lists of products.
    - Regardless of sign-in/out, any user can search the lists of products.
    - When the user is signed-in, the user can select and purchase a product. 
    - When the user is signed-in, the user can message another user. 
- Functionality / Features:
    - Ruby on Rails
    - Postgresql
    - Authentication (devise)
    - Authorization
    - Image upload 
    - Deployment (heroku)
    - Navigation Bar (bootstrap)
    - Naming search
    - Messaging 
    - Payment (stripe)
    - Testing (rspec)
- Sitemap
![ERD](docs/sitemap.png)

- Screenshots
![ERD](docs/screenshot/screenshot_home.png)
![ERD](docs/screenshot/screenshot_view_profile.png)
![ERD](docs/screenshot/screenshot_add_new_profile.png)
![ERD](docs/screenshot/screenshot_view_products.png)
![ERD](docs/screenshot/screenshot_add_new_product.png)
![ERD](docs/screenshot/screenshot_messages.png)

- The target audience is parents going through pregnancy and parenthood who are looking for quality secondhand products for moms and babies. Regarding the maternity section, the core audience would be women going through pregnancy.

- Tech Stack (e.g. html, css, deployment platform, etc)
    - html
    - scss
    - Ruby on Rails
    - AWS S3 (image upload)
    - Heroku (deployment)
    - Bootstrap (design)
    - Github
    - Stripe

<br>

## User Stories
- As a *User*, I can sign in to enjoy the full functionality of the website.
- As a *Seller*, I can post and sell secondhand pregnancy and baby products.
- As a *Seller*, I can access the lists of all my products. 
- As a *Buyer*, I can select and buy secondhand pregnancy and baby products.
- As a *Buyer*, I can search for a specific product by name. 
- As a *User*, I can interact with another user through messaging.

<br>

## Wireframes
![Home_Page](docs/wireframe_slides/Home_Page_wireframe_1:11.png)
![Sign_In](docs/wireframe_slides/Sign_In_wireframe_2:11.png)
![Sign_Up](docs/wireframe_slides/Sign_Up_wireframe_3:11.png)
![Navbar](docs/wireframe_slides/Navbar_Details_wireframe_4:11.png)
![Signed_In_Home](docs/wireframe_slides/Signed_In_Home_wireframe_5:11.png)
![Signed_In_Profile](docs/wireframe_slides/Signed_In_Profile_wireframe_6:11.png)
![Add_New_Profile](docs/wireframe_slides/Signed_In_Add_New_Profile_wireframe_7:11.png)
![Shopping_View_All_Products](docs/wireframe_slides/Shopping_View_All_Products_wireframe_8:11.png)
![Shopping_Show_Payment](docs/wireframe_slides/Shopping_Show_Payment_wireframe_9:11.png)
![Add_New_Products](docs/wireframe_slides/Add_New_Products_wireframe_10:11.png)
![Message](docs/wireframe_slides/Message_wireframe_11:11.png)

<br>

## ERD
![ERD](docs/erd_marketplaceapp.png)

<br>

## Components & Abstractions
- This application is built with simple configuration thanks to Ruby on Rails. (version ruby-2.7.2) Ruby on Rails is a developer's choice for the convention over configuration. Created on **MVC** framework, *Model(data)*, *Controller(processer, bridge between the Model and the View)*, and *View(UI of the application)* handle different parts of the application functions and enables easy built and customization based on data and logic. 

- To store object-oriented data (business logic format) accordingly into the database form, **Active Record** performs its role as an *Object Relational Mapping* system. It's like a bridging function between the application layer object and the database. 

- This application is built on **REST** by using the HTTP requests to determine the routes. With this *RESTful Architecture*, the sets of 7 routes are created as default through `resources` which gets stored in the `config/routes.rb` file. 

- Database is configured through 3 files (`developpment.rb`. `test.rb`, and `production.rb`) in `confing/enviornments` foler.

- The application is built on the **PostgreSQL** database which is an open-source object-relational database. It is scalable, reliable, and can handle a variety of data types. The *Database* stores the updated data whenever the *Migration* happens, which then shows the latest version of migration in our *Schema* file to ensure the most updated database state. On top of the file, it'll indicate the latest version as ` ActiveRecord::Schema.define(version: 2021_03_18_044133)`

- The `assets` folder contains files for the UI parts such as images and stylesheets. 

- The `Gemfile` contains information about all the gems installed. 

<br>

## Third-party Service Integration
- Image Upload: I used **AWS S3** for storing images that the users would upload. This simple and easy-to-use service enables flexible storage with no restrictions on time and place. Also, it reduces the risks of an image not loading properly when saved locally or elsewhere. 
- Navigation Design: I used **Bootstrap**'s awesome template to create neat and handy navigation that appears throughout all pages. 
- Payment function: I used **Stripe** for enabling payment functions and being able to track the history of the payment through webhook. Webhook integration allows more stable connection and verification by creating a notification for every purchase.  
- Deployment: I used **Heroku** for my application deployment. It's an easy, secure, and economical platform for application development. 

<br>

## Relationships (Active Record Associations) 
Products:
- Have one User (Mandatory)
- Have one Payment (Optional)

Users:
- Have one Profile (Optional)
- Have many Products (Optional)
- Have many Messengers (Optional)
- Have many Payments (Optional)

Profiles:
- Have one User (Mandatory)
- Have many Products (Optional)

Payments:
- Have one Product (Mandatory)

<br>

## Database Relations
- I've created the **Users** table with the devise and implemented the authentication function. Users table has username as a string and has email, password, created_at, updated_at attributes which get auto-build through devise. 

- I've created the **Products** table next with scaffolding. **Products** belongs to **Users**, and *A User* have *many Products*. 

- Next, the **Profiles** table was created for the user profile functionality. *A User* has *one profile (optional)* and profile belongs to **Users**. 

- **Message** belongs to **Conversations**, and both tables were created for enabling the two-way messaging functionality. **Conversations** belongs to **Users**, and *A User* have *many Conversations*.

- I was going to create a separate **Payments** table but just used the **Products** database for enabling the payment function (accommodated via Payment controller, routes). 

<br>

## Database Schema Design
This section of information can be found in `db/schema.rb` in more detail. All the tables stores auto-generated attributes such as `created_at(datetime)` and `updated_at(datetime)'.

### Users: 
- email (string)
- password (string)
- reset password token (string)
- username (string)

### Products: 
- name (string)
- category (text)
- quantity (int)
- price (decimal)
- user_id (bigint)
- brand (string)
- sold (boolean)

### Profiles: 
- fname (string)
- lname (string)
- user_id (bigint)
- location (string)
- activity (int)
- seller (boolean)
- buyer (boolean)
- selfintro (text)

### Conversations: 
- sender_id (int)
- receiver_id (int)

### Messages: 
- body (text)
- conversation_id (bigint)
- user_id (bigint)
- read (boolean)

### Foreign Key

- add_foreign_key "messages", "conversations"
- add_foreign_key "messages", "users"
- add_foreign_key "products", "users"
- add_foreign_key "profiles", "users"

### Active Storage
Used for storing images in the application. Contains information such as fillename(string), created_at(datetime), byte_size(bigint), metadata(text).
- active_storage_attachments
- active_storage_blobs
- active_storage_variant_records

<br>

## Project Tracking & Management
- I used **Trello board** to write an MVP, to-do lists, and project management plan(priorities, deadline, the checklist). 
Link: https://trello.com/b/jFsidEyu/two-sided-marketplace-app
![ERD](docs/trello_board.png)

- I used **Github** to track my source code and working history versions. I've also written a readme documentation to create a user guide. 
Link: https://github.com/SooyeonJeung/marketplace_app

## Testing
Implemented rspec for unit testing and it's been tested on Mac. 
- bundle exec rspec