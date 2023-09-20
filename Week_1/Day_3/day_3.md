### Objects

6 primitive data types
1.) undefined
2.) null
3.) boolean
4.) string
5.) number
6.) symbol

"If it's not an object, it's a primitive!"

Objects != Primitives

Functions are objects.  What.  Welcome to JS.

Objects = key + value pair.
  Keys are always strings (or symbols)
  Keys are unique
  Value can be any type

  the Object literal syntax is {}

  ex: const tinyObject = { "size": "Tiny" };

  the size can be written without quotes

  accessed by . or [] notation.

  if key doesn't exist, it will return undefined.

  Ojbects can be nested!

  ```javascript
const person = {
  name: "Paul",
  address: {
    street: "310 W 95th",
    city: "New York",
    zipCode: 10027
  }
};
  ```

### Iteration

for objects we need to iterate over KV pair using for ...in statement!

```js
var planetMoons = {
  mercury: 0,
  venus: 0,
  earth: 1,
  mars: 2,
  jupiter: 67,
  saturn: 62,
  uranus: 27,
  neptune: 14
};

for (var planet in planetMoons) {
  var numberOfMoons = planetMoons[planet];
  console.log("Planet: " + planet + ", # of Moons: "+ numberOfMoons);
}
```

#### LIMITATIONS:

for ...in statement may have unexpected results.  Could inherit from prototype chain (wtf is that).  To bypass this, do

```js
for (var planet in planetMoons) {
  // additional filter for object properties:
  if (planetMoons.hasOwnProperty(planet)) {
    //  ...
  }
}
```