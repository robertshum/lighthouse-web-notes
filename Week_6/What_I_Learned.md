# What I learned This Week

## MIDTERM PROJECT!

### TAILWIND CSS

* It's weird
* Why is everything written within classes of HTML classes.
* This goes everything I learned.
* Why is SASS and Tailwind in the project stack.  It's like you are hosting a Thanksgiving dinner and you invited your die hard democrat and equally passionate republican friend to the party.
* Who cares when you can create pretty web interfaces using tailwind utility classes.

### Google Natural Language API

* Requires a service account in order to use, I don't think they have an API key for this API.
* Thank goodness they have a NPM for accessing their API.


## Frameworks!

Angular

* Real-time synchronization between the component and HTML
* Strict environment to better recognize errors
* Less flexible for smaller projects

Svelte

* New framework from 2022
* Faster and lightweight
* Right out of the box with libraries and state management
* Lacks community and support

Vue.js

* Less new framework from 2015
* Simpler syntax which means easier learning curve
* Flexibility
* Lacks community and support
* Flexibility can lead to inconsistency due to problem-solving options


## R E A C T

* A JS LIBRARY, but often discussed as a FRAMEWORK.
* Builds user interfaces.
* Manages a state of each view in our app.
* Use JSX to create special code within React.
* The require() syntax is based on CommonJS and is available inside Node. More recently, we use the import .. from .. syntax which is from the ES6 standard.

### JSX / REACT

* Looks like HTML, not HTML. If not using JSX we would use React to use the conversion tool to create HTML and it's more work.
```jsx
const element = <h2 className="name">Name</h2>
```

* Most applications call ReactDOM.render(element, container) a single time to render the application.

Rules!

1.) All tags must be closed. Open and close tag or self closing tag (<div></div> vs <Album />).  Will throw error if tags not closed.
2.) Child tags must clsoe b4 parent.  Can't think of why you would otherwise.
3.) Must return a root element, singular, no siblings (<div> or <>).
4.) No HTML comments.  /* Allowed */ <-- this is allowed. <!-- not allowed-->


## JS Fun-da-mentals

### ES Modules

* NodeJS = CommonJS.

```js
const SomeModule = require('some-module')
```

* Other = ES Modules
```js
import SomeModule from 'some-module'
```

### Object Destructuring

// If the curlies are on the right-hand sign of the
// expression (equal sign) then we're making an object
const obj = { x: 1, y: 2 }

// If they're on the left-hand side (or the receiving
// side as with parameters), then it's destructuring:
const { x } = obj
x // 1

### Spread
When creating objects or arrays, there is a new way to create properties from the properties of an existing object or array. This is much easier shown in code than explained:

```js
// Let's say you have this array
const person = ['Michael', 'Jackson']

// If you were to add the above array to a new one like this:
const profile = [person, 'developer']

// The end result would be an array in an array like this:
profile // [['Michael', 'Jackson'], 'developer']

profile[0] // this is an array
profile[1] // this is the string 'developer'

// However, if we had made profile like this with ...
const profile = [...person, 'developer']

// Then the end result would be this:
profile // ['Michael', 'Jackson', 'developer']

// The same concept works with objects
const person = { first: 'Michael', last: 'Jackson' }
const profile = { ...person, occupation: 'developer' }
profile // { first: 'Michael', last: 'Jackson', occupation: 'developer' }

```

### Rest

Used in conjunction with destructoring.  It means give me the rest.  Works with arrays or objects.

* Doesn't have to be named '...rest'.  '...whatever' also works.
* Rest for desturcture, Spread for creation of objects and arrays.

```js
const profile = { first: 'Michael', last: 'Jackson', occupation: 'developer' }
const { occupation, ...rest } = profile
occupation // developer
rest // { first: 'Michael', last: 'Jackson' }


//or

function myFunction(first, last, ...rest) {
  return rest
}

console.log(myFunction('Michael', 'Jackson', 'Developer', 'California'))
// output: ['Developer', 'California']

```