# efood README

## Introduction

Welcome to the efood application! Here you can browse our product catalog and-given you login with a github account-are free to add and delete items from your cart which will be saved for you each time you login. To access the application, you will need to start the phoenix server on your system. Don't worry, the setup instructions below will guide you through the process. Once the server is running, you can enjoy the application and get browsing!

## Setup

To start your Phoenix server, open your computer's terminal and navigate to the `efood` directory inside of the `tech-challenge` folder. From there, do the following:

  * Install dependencies with `mix deps.get`
  * Start up the postgres database
    * Mac: `brew services start postgresql`
    * Windows: `pg_ctl -D "postgres_sql_database_directory" start` (i.e. `pg_ctl -D "C:\Program Files\PostgreSQL\12.2\data" start`)
  * Create and migrate your database with `mix ecto.setup`
	* To do this, you will need to change the username in the dev.ex file to that of your local user. Open `efood/config/dev.exs` and change `thomasstern` to whatever your username is. I had trouble implementing environment variables here and will need to make this process easier in the future. Here is an example of what it should look like:

```
# Configure your database
config :efood, Efood.Repo,
  username: "insert_your_username_here",
  password: "",
  database: "efood_dev",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
  ```

  * Install Node.js dependencies with `cd assets && npm install` (make sure to cd back into the efood directory after)
  * Read the documentation by running `mix docs` and opening `doc/index.html`
    * Mac: run `open doc/index.html`
    * Windows: run `start doc/index.html`

  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser. You are now ready to use the efood application!

## Requirements

* phoenix 1.4.16 or greater
* psql (postgresql) 12.2 or greater
* elixir 1.10.2 or greater
* node.js 6 or greater


May work with earlier versions (not tested)

## Notes

This application is built for the [Salt tech-challenge](https://github.com/saltpay/tech-challenge) and is my first attempt at web development. With that in mind, there are some areas of improvement and features I would like to add in the future. These are listed below:

### Product Catalog

The current Product Catalog lists all the products in a single page. I would like to condense the page to a modular number of items per page and allow the user to navigate through all the pages as well as determine how many items to display per page.

### Cart

The current cart logic adds duplicate products as a new listing. I have already created a product_quantity field in the CartItem schema, but still need to implement a quantity view next to each product so that each product is listed just once and making use of the product_quantity field.

## Contact
My name is Thomas Stern and this is my first attempt at web development. I would love to hear what you think including questions, suggestions, and general remarks. You can contact me at tommystern@gmail.com.
