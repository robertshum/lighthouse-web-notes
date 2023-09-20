
### Arrays vs Strings
Arrays and string arrays are similar but not all array methods work.  For example we can't use shift() directly on strings, or push().

Push adds an element to an array.
Shift removes first element from array and returns that element.  The original array is modified.

However, we can do something similar for string

```javascript
let word = "hello";
word = word.substring(1); //removes first char 'h' from string.
```

we can also use slice:

```javascript
let word = "hello";
word = word.slice(1); //removes first char 'h' from string (and keeps the rest);
```