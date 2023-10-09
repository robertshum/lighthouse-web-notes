### Callback and Functions
..is a fn passed (bt ref) into another function.  The received fn can callback the passed in fn at any time, as many times.

array.forEach(...)

A very common implementation of callback functions is with forEach which uses callbacks to allow us to easily iterate through the elements of an array.

1st param - item or element
2nd param - index (optional)
3rd param - original array (optional)

ex:

```js
names.forEach((element, index) => {
  console.log("element is:", element, "index is:", index);

  //we can put a callback function here as well
})

```


### Array Filter

```js
array.filter(function(num) {
  return num % 2 === 0;
});
```
returns true or false, indicating which elements to KEEP


## Higher Order Functions

Functions that take in callbacks are referred to as Higher Order Functions (Like filter!)

Having functions available to us as values allows us to pass them around. In programming languages like JS which support this, we are able to create higher-order functions. This is a major part of Functional Programming.


if the => function fits in one line, we don't need to have a return value!!! WTF (ES6+).  Example:

```js
//Noob
const arrayOfLengths = lighthouses.map((x) => {return x.length});

//pro l33t programmer
const arrayOfLengths = lighthouses.map((x) => return x.length);
```
