# What I learned This Week

I'm no longer breaking out different days into separate MD files, that is way too much work.  Putting all the weekly learnings here now, in one MD file... unless it warrants a separate file.

### Mocha vs. Chai

#### Mocha

Gives us 'describe' and 'it' functions.

#### Chai

An assertion library.  Assert null, undefined, equals, etc.

### Property value shorthands

this is also valid

```js
let name = "Rob";

let person = {
  name
}
```

this Shorthand will set the key as name, and value as Rob (looks at the same variable for value!)

Destructuring also works with shorthands.  For ex:

```js
const x = 4;
const y = 1;
const obj = {x,y}; //<-- this is the same as const obj = {x: x, y: y};
```

and then...

```js
const obj = { x: 4, y: 1 };
const {x,y} = obj; //<-- Destructuring
console.log(x); // 4
console.log(y); // 1
```

### Asynchronous Programming

When unit of work splits off from the main thread, then eventually notifies program that it's finished.

JS has a few parts that work together to ensure multi tasking works

* Call stack
  * stacks run in order
* Web APIs
  * Run asynchrously
* Callback Queue
  * When a web API is finished, it gets added to the callback queue
* Event loop
  * The loop will pick up the first item in the cb queue and execute it on the stack
  * The main loop needs to execute first before the event loop starts

### User Events

a common type is user input, or mouse movement. These are examples of EVENTS that can happen at any time and therefore, have to handle them asynchrously.

Callbacks are a major way we deal with user events.

### Heaps vs. Stacks

This is a refresher, but sometimes I forget

Heaps are for storing complex data such as objects and arrays, the need references to access it.
Heap is managed by JS engine mem. management, has features like GC.

Stacks are for maintaining current function calls and context.  They also have knowledge of the current call stack (when a fn calls another fn, and so on).  They stores data about local parameters and variables.

Both are allocations in RAM.
Heaps generally have more space than stacks.

```js
function calculateSum(a, b) {
  const result = a + b; // `result` is stored in the stack frame
  return result;
}

const x = 5; // `x` is stored in the stack frame

const sum = calculateSum(x, 3); // Function call and `sum` are managed in the stack

const person = { name: 'John' }; // `person` object is stored in the heap
```

Ex above:
Stack is used for managing function call contexts (calculateSum, the main program, and others if present), local variables (result, x, sum), and function return addresses. 

Heap is storing the person object, which is more complex and of dynamic size.

### HTTP

HTTP is not alternative to TCP, but rather the text-based "language" that is used to communicate over a TCP connection.

#### HTTP Flow

1. Opens TCP connection, send a request to destination.
2. Sends HTTP message (with headers and info)
3. Receive and read response by destination
4. Close or re-use connection for further requests

#### HTTP Messages

Request

* Method (GET/POST/OPTIONS/HEAD... 9 total!)
  * Focus on GET POST PUT DELETE
* Path (where is the address of the resource / URL)
* Version of the HTTP Protocol
* Optional Headers
* Body 

Response

* Version of the HTTP Protocol
* Status Code (200 OK 404 Not Found, etc)
* Status Msg (short desc of status code)
* HTTP headers (similar to the requests)
* Body (optional - containing fetched resources)

### TCP vs UDP

TCP (transmission control protocol)
* larger header sizes
* requires 3 way handshake to establish connection
* security

UDP (user datagram protocol)
* smaller header sizes
* connectionless
* for low latency applications (streaming)

### JSON

Javascript Object Notation.  Built on two structures:

* Collection of Name Value pairs (sorta like objects)
* An ordered list of values

```json
{
  "name": "New York City",
  "boroughs": [
    "Manhattan",
    "Queens",
    "Brooklyn",
    "The Bronx",
    "Staten Island"],
  "population": 8491079,
  "area_codes": [212, 347, 646, 718, 917, 929],
  "position": { "lat": 40.7127, "lng": -74.0059 }
}
```

Notice the keys are always double quoted "strings".
Values can be numbers, strings, or objects themselves


### Serialization

Converts objects or data structures into a format that can be stored / transmitted between computers.

The opposite, going from STRING->OBJ is called deserialization.

### Promises

like callbacks, they have the same features but better because it has built in error handling.

They have 3 states:

* Pending
* Rejected
* Fulfilled

Better than callbacks, because:

* Easier to test
* Avoids callback chaining / waterfall hell
* Easier to read the chaining
* Easier to manage exceptions/errors

RESOLVES -> leads to .then statements
REJECT -> leads to .catch


### OOP / Classes

We can use get and set tokens to get and set values of a property in a class.
These values is both a function and a value.

The get and set syntax binds an object's property to a function that will be called when that value is looked up.  See below:

```js
class Pizza {

  // ...

  // replace our custom getters / setters with these ones!
  get price() {
    //...
  }

  set size(size) {
    //...
  }
}
```

### Dependency Injection

Pass in the object to a function or a class that it requires in order for it to do work, rather than hard referencing it.  This promotes:

* Modularity
* Mockability / Testability

Ex:

```js
// Client Class
class DataManager {
  constructor() {
    this.databaseService = new DatabaseService(); // Creating an instance internally
  }
```

This creates a tight coupling between the data manager and database service class.

```js

// Client Class
class DataManager {
  constructor(databaseService) {
    this.databaseService = databaseService;
  }
```

This is a better approach, as databaseService could be any variation of DatabaseService.  Ie: mock database object or a subclass of database service.

In the non-DI example, it is explicity requiring "DatabaseService".

### "Private" Variables

There is no such thing, anyone can access it.  We can add a "_" to let others know to not use it directly (either for accessing or modifying it).

Not enforced, more of an honor system.