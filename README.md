# MoxiCloud API Endpoints Project

This project demonstrates the available endpoints in the MoxiCloud API and how their corresponding attributes associate with different products and the MoxiWorks UI.

## Table of Contents

- [Features and Information](#features-and-information)
- [API Support](#api-support)
- [Database](#database)
- [Authentication](#authentication)

## Features and Information

- **`/index`**
  - Search box checks against the database within `associated_attr` -> [attr_title, ui_info, associated_endpoints]. 
    - This scope can be updated in the `associated_attr.rb` model file.
    - [pg_search](https://github.com/Casecommons/pg_search) is used for search functionality.
  - After searching, product-related information populates for each attribute that is associated in some way.
    - Logic surrounding the order and how this returned content displays can be set in the `index.html.erb` file.
    - Updates to the corresponding titles (on the actual front end) representing this information on that index file can be set within the `application_helper.rb` file.

- **`/{#endpoint}`**
  - Infographic containing each attribute associated with that `{#endpoint}`, and what product(s) it associates with.

## API Support

- Use `/api/{#attr_title}` to call the related API data for an attribute and its associations.
  - `{#attr_title}` is the `attr_title` as seen in the `associated_attrs` table.

## Database

### Creating and Populating the Database

- There is a backup file in the `db/` folder, created with `pg_dump`, titled `{#endpoint}-{#endpoint}.sql`.
- Alternatively:
  - Run `rails db:create db:migrate db:seed`.
  - Connect to the database.
  - Run each `{#endpoint}.sql` file within the `db/` folder.

### Table Information

- **`associated_attrs`**: Attributes associated with an endpoint and a Moxi product.
  - `id`: The unique ID of the `associated_attr`.
  - `request_type`: The type of request(s) associated with an endpoint.
    - JSONB objects.
    - The title of each array indicates which endpoint is being referenced.
    - The contents of each array are strings that indicate the type(s) of requests, e.g., ['Create Request', 'Delete Request'].
  - `ui_info`: Information about the attribute, its association, the product it's associated with, and how it correlates to the UI and the Moxi product(s).
    - JSONB objects.
    - `ProductText` (e.g., APIText, ActionLogText): The actual string containing words about the specific attribute and its association with that product.
    - `Products` array: Contains all associated products, e.g., ["ActionLog", "API", "Engage"].
    - `Endpoint` array (e.g., ActionLog, Agent): Contains specific product associations based on the array selected, allowing for greater control of what displays when and where on the front end and use of the pg_search features.
  - `associated_endpoint`: Supplemental information related to which endpoints the attribute is associated with, used to control front-end display.
  - `attr_title`: The title of the attribute, as it can be called within the API and displayed within the documentation.
  - `created_at` and `updated_at`: Self-explanatory.

## Authentication

- **Devise Gem Implemented**
  - Users can sign up at `/users/sign_up` to create an account.
  - Accounts must be approved by someone with database access before the user can log in.
  - Once approved, users can make changes to `associated_attrs` from the front end as necessary using the `associated_attrs` index.
