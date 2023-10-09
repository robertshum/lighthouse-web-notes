# What I learned This Week

Read the question carefully before proceeding.
Read the question again before proceeding.


### Why use EJS (Embedded JS) over FE frameworks like React?

* Simple and lightweight.
* Easier to adopt and learn.
* Compatibility with browsers (basic HTML).

### Why use EJS (Embedded JS) over FE frameworks like React?

* Better for making code modular and re-usable.
* Better for complex interactions and UIs.
* Vast ecosystem of libraries, tools and community support.


### CRUD Operations (Create, Read, Update Delete)

Also known as Post, Get, Put, Delete.

Safe and Idempototent methods are guidelines and should be followed but not enforced.

POST request has a body, while a GET request does not.

#### Safe Methods

A request method is safe if a request with that method has no intended effect on the server.

GET, HEAD, OPTIONS, and TRACE are defined as safe.


#### Idempototent Methods

Any number of identical requests with that method will have the same effect as a single such request.  PUT, DELETE and Safe Methods are considered Idemptotent.

EX:

A PUT endpoint to modify a user's recorded email address. If this endpoint is configured correctly, any requests which ask to change a user's email address to the same email address which is already recorded—e.g. duplicate requests following a successful request—will have no effect. 

Similarly, a request to DELETE a certain user will have no effect if that user has already been deleted.

POST, CONNECT, and PATCH are not necessarily idempotent.


### Node Express

Order of Route definitions matter!  It's possible for a route to pick up a request even though it was meant for a different route further down in the code.

General rule of thumb - order the routes from most specific, to least specific.

For example in Tiny App

```js
app.get("/urls/new", (req, res) => { //<--More specific
  res.render("urls_new");
});

app.get("/urls/:id", (req, res) => { //<--More generic
  const templateVars = { id: req.params.id, longURL: urlDatabase[req.params.id] };
  res.render("urls_show", templateVars);
});

```

### Nodemon

Nodemon is a utility that will monitor for any changes in our source code and automatically restart our server. Perfect for development.  Holy hot potatoes, Batman, that exists?

### Cookies 🍪

Allows sites to store data either in the client's computer OR their own server.

Generally set to a domain where only the website can access those cookies, however, it becomes tricky if sub-domains are involved.

Domain AND port specific.

Since public cookies can be stored and accessed directly by the user (from chrome dev tools, for ex.), we should encrypt them.



### Passwords

#### Encryptions VS. Hashing

Encryption

* Reversible process
* uses a secret key, which is stored somewhere, usually a server.

Hashing

* One way process
* Hash the password to store, hash the user input to see if it matches
* MD5 SHA1 not good enough, try bcrypt
* Using bcrypt, use 10 as the salt.  The higher the number, the longer it takes to hash.  10 is the sweetspot where it takes too long for hackers to test but not long enough for users to get pissed off.

### REST

REST is a set of conventions and practices in web development that deals with accessing and manipulating resources over HTTP.


1.) CRUD maps to HTTP methods
  * ex: Update maps to PUT/ PATCH.

2.) Identifiable resource
  * a name, lowercase, plural followed by an id
  * ex: /users/1 <-- gets user of id 1.

3.) Representation
  * Returns the appropriate format based on the request.
  * if req had "Accept: text/html", then the response should be HTML.


  ### I Hate Recursion

  ...but it's necessary for easier traversal of tree-like data structures

### DFS Depth First Search

* Searching through the leaves and then moving back up towards root.
* Can be done DLR, LDR, LRD, where D = data, L/R stands for left and right children
  * DLR = Preorder traversal, LRD = In order, LRD = Post order
  * In a binary SEARCH tree, if we do In order (LDR) and print out the data, it will be sorted.

### BFS Breadth First Search

* Searching starting from the root, then moving towards the children, then their children, in order.


### DOM Document Object Model


### CSS

Target elements by ID by using hashtag.  This should match 0 or 1.

```css
#buy-now-main-btn
```

We can also target elements with classes by using the dot prefix.  Can be 0 to n matches.

```css
.nav-item
```

Using IDs are more performant, only searching for 1 element, rather than 0 to n.


### EDA Event Driven Architecture

goes hand in hand with async callbacks, eh?

#### Client-Side Events
On the client side (browser), we have the DOM, which has events such as onClick, onFocus, onLoad, as well as custom events.

One library that we will use to demonstrate client-side events is jQuery.

#### Server-Side Events
Similarly, on a server running Node.js you can think of an incoming request as an event, with a callback function that handles the event (and could render a response).

The Node.js core API provides an EventEmitter class that is basis for event-driven patterns.


### DOM

Document object model:

Browser makes DOM in memory to create HTML elements, or DOM Nodes.  DOM allows JS code to manipulate the webpage in the 1st place.

The DOM is modified by client-side JavaScript

HTML -> DOM -> Render Tree Construction / Rendering

Any manipulation on the DOM via JS / other will display the final render.

#### Event Propagation

##### Bubbling

WTF.  Events that affects a child element will 'bubble up' through it's parents.

When an event happens on an element, it first runs the handlers on it, then on its parent, then all the way up on other ancestors.

Ex:

```html
<div onclick="alert('The handler!')">
  <em>If you click on <code>EM</code>, the handler on <code>DIV</code> runs.</em>
</div>
```

clicking on the em code will trigger the onclick in div.

Not all events bubble.  Events like 'focus' does not.

The 'event.target' shows the deepest/accurate of where the event has taken place.

the 'this' shows where the event was caught.

```js
form.onclick = function(event) {
  event.target.style.backgroundColor = 'yellow';

  // chrome needs some time to paint yellow
  setTimeout(() => {
    alert("target = " + event.target.tagName + ", this=" + this.tagName);
    event.target.style.backgroundColor = ''
  }, 0);
};
```

```html
<!DOCTYPE HTML>
<html>

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="example.css">
</head>

<body>
  A click shows both <code>event.target</code> and <code>this</code> to compare:

  <form id="form">FORM
    <div>DIV
      <p>P</p>
    </div>
  </form>
```

in the above example, if we click on a 'P' area, the event.target will be P and the this will be FORM.

### Tiny App Review

Iterating over Object keys / values

```js
const id = Object.keys(users); // keys of objects
const values = Object.values(users); //values of objects
```

```js
log //<-- shorthand to console log
```