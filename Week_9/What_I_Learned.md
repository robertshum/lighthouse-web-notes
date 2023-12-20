# What I learned This Week

## RUBY ON RAILS

* Very opinionated language.  Hard because it follows a structure, good because the structure will always be the same, 5 years from now.
* All ruby linters/auto formaters sucks.
* Allows for very powerful Model tools, like AR - where we can perform CRUD operations with something that's SQL-like.
* Follows the MVC framework.
* Can be made as a back-end app and use a different front end framework to handle front-end.

## MVC

* Model, View, Controller.  Came before the internet apparently.

### Model

* The application that deals with the database.
* Can be designed so that it's DB agnostic.

### View

* What the viewer sees as served by the controller.
* ERB (similar to EJS files) server side templates.

### Controller

* Business logic.
* Routes traffic from users to different 'controllers'.
* Controllers construct the view and serves it back to the client.


## RAILS - 'render @products' inside ERB file example

* Rails / Ruby does SO MANY THINGS IMPLICITLY AND INFERRED, it's hard to keep up
* example explained from chatGPT:

In Rails, the render @products syntax is based on conventions and conventions are a fundamental principle of Rails' philosophy—often referred to as "Convention over Configuration."

When you write render @products, Rails infers the model name from the instance variable @products. Specifically, it assumes that the instance variable represents a collection of records from a database table that corresponds to a model.

Here's how the inference works:

Instance Variable Naming Convention:
When you use an instance variable with a pluralized name (e.g., @products), Rails assumes that it represents a collection of records, and it derives the model name by singularizing the pluralized variable name.

Implicit Model Naming:
In the case of @products, Rails assumes that it corresponds to a Product model because the pluralized form products is singularized to Product.

Convention for Directory Structure:
Rails also follows a convention for the directory structure in the views folder. It assumes that the partial for rendering an individual item in the collection should be located in a directory named after the pluralized model name. For example, if the model is Product, Rails looks for the partial in the views/products/ directory.

Partial Naming Convention:
Rails expects the partial file to have the same name as the singularized model name with an underscore (_) prefix. So, in this case, it looks for a partial named _product.html.erb.
Putting it all together, when you write render @products, Rails infers that you want to render a collection of Product model instances based on the naming conventions and directory structure.


In other words:

```html
  <div class="products">
    <%= render @products %>
  </div>
```

will auto-magically render partials x times, x = number of products (plural!!) by looking inside views (where partials are) > products (looks at plural model name) > _product.html.eb (looks at _ for partials)

* They were REALLY serious when they said convention over configuration.

* This helper method creates a link (from rails) using this specification ACTION - NAMESPACE - CONTROLLER.  Ex: New category button, with action = new, namespace = admin, and controller = category

```rb
    <%= link_to '+ New Category', [:new, :admin, :category], class: 'btn btn-info' %>
```