# efood README

## Introduction

Welcome to the efood application! Here you can browse our product catalog and-given you login with a github account-are free to add and delete items from your cart which will be saved for you each time you login. To access the application, you will need to start the phoenix server on your system. Don't worry, the setup instructions below will guide you through the process. Once the server is running, you can enjoy the application and get browsing!

## Setup

To start your Phoenix server, open your computer's terminal and navigate to the efood directory. From there, do the following:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Read the documentation by opening `docs/index.html`
    * Mac: run `open docs/index.html`
    * Windows: run `start docs/index.html`
    
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser. You are now ready to use the efood application!

## Requirements

* postgres 9.6.1 or greater
* elixir 1.4.5

## Notes

This application is built for the [Salt tech-challenge](https://github.com/saltpay/tech-challenge) and is my first attempt at web development. With that in mind, there are some areas of improvement and features I would like to add in the future. These are listed below:

### Product Catalog

The current Product Catalog lists all the products in a single page. I would like to condense the page to a modular number of items per page and allow the user to navigate through all the pages as well as determine how many items to display per page.

### Cart

The current cart logic adds duplicate products as a new listing. I have already created a product_quantity field in the CartItem schema, but still need to implement a quantity view next to each product so that each product is listed just once and making use of the product_quantity field.

## Contact
My name is Thomas Stern and this is my first attempt at web development. I would love to hear what you think including questions, suggestions, and general remarks. You can contact me at tommystern@gmail.com.
