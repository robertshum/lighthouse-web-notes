# What I learned This Week

## Start of Final Project

* Not a lot to note.  Documentation/coming up with project ideas.

## Typescript

* Superset of JS
* static types
* requires compile from .ts -> .js
* simple as 'npm install -D typescript'
* it's more popular than Java lmao in 2023
* defaults to oldest version of JS when compiling, need to specify
* USE TYPESCRIPT IN THE BEGINNING.  Don't try to add it when the feature/project is finished.  It's pointless.

TSCONFIG

```bash
# creates ts config file
tsc --init
```

* target can be set. "target": "ES2016"
* allowJS: true //turns off JS checks

AFTER creating config file, we can just run:

```bash
tsc
```
* will compile entire project and output to build.
* can be set to 'watch' to compile.  (again, looks at config file)

Static Typing

```ts
// setting to string
let name: string = 5;
name = 45; //will throw an error
```

```ts
// setting to string...or...
let name: string | number | boolean = 5;
name = 45; //it's fine!
```

```ts
// setting array of nums
let arr: number[] = [];
arr.push(45);
arr.push(true); //throws error
```

```ts
// setting array of nums or booleans
let arr: (number | boolean)[] = [];
arr.push(45);
arr.push(true); //it's fine!
```

Objects

* Define the types, and then the values for objects

```ts
const user : {
  email: string;
  password: string;
} = {
  // the actual values
  email: 'rob',
  password: 'hello'
}
```
* Ewwww so ugly
* ...how about we use:

Interface

```ts
interface User {
  email: string;
  password: string;
}

const user : User {
  email: 'rob',
  password: 'hello',
  age: 42 //throws error.  Static typing has worked!
}

//holds an object of user type inside array
const users: User[] = [];
```

Extending Interfaces

* if we want to have different versions of objects:

```ts
interface User {
  id?: number; //? makes it optional, baby
  email: string;
  password: string;
}
```

Functions and Methods

* specify the return value with a type.  Could be 'void', 'undefined' as well.
```ts
const sayHello = (name: string, age: number): string => {};
// : string at the end is the return type

// this will throw an error!
sayHello(rob, 99, 'Ultimate Frisbee');
```

* optional parameters work too
```ts
const sayHello = (name: string, age?: number): string => {};
```

Promises

* Returns 'Promise<type>'

```ts
const returningPromise = (num: number): Promise<number> => {
  return new Promise((resolve)=> {
    resolve(num);
  })
}
```

Methods and Callbacks

```ts
interface Dog {
  breed: string;
  name: string;
  goForWalk: (distance: number) => boolean;
}

const myDog = {
  breed: 'corgi',
  name: 'dogggo',
  goForWalk: (distance: number) => {
    return true;
  }
};
```

higher order fn

```ts
const higherOrderFunc = (cb: (name: string, age: number) => string): void => {
  cb('alice, 42);
};

higherOrderFunction((name: string, age: number)=>{return 'hello'});
```

Duck Typing

* if it walks like a duck....eats like a duck...quacks....

```ts
interface User {
  email: string;
  password: string;
}

const myUser = {
  email: 'a@b.com',
  password: '1234',
}

const login = (user: user):boolean => {
  return true;
}

// does not complain.  Looks like a duck.
// 'casted' as a 'User'
login(myUser);
```

Generics

* a interface but we don't know what the types are
* the 'T' below is just a wild card variable.  It could be anything?
```ts
// user will TELL us what the type will be
interface Container<T> {
  name: string;
  contents: T; //dynamic type now
}

const stringContainer: Container<string> = {
  name: 'string container',
  contents: 'hello world'
}

const boolContainer: Container<boolean> = {
  name: 'bool container',
  contents: true,
}
```

ask for help
put in the ours
take breaks get sleep
don't compare yourself to others
be comfortable being uncomfortable

# Project Guideline

## Don't Start with code

Ideas -> User Stories -> Resources -> ERD -> Routes -> Wireframes

## Tips

* Leave polish/cleanup for W12.
* New frameworks/language = fewer features.
* Prioritize risk mitigation.
  * new framework?  that's a risk.
* Estimate.
* Break big problems down to smaller ones.

## What should the final look like

* Well designed.

## Alternative / New Ideas!

* 