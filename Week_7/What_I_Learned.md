# What I learned This Week

## REACT

### High level overview - New React Apps from Scratch!

One approach is the component-first based approach.  Look at the 'leafs' of the app and start there.  Build components in isolation.

1.) Analyze the layout of the app (from a wireframe or mockup) and create components to represent the elements.
* they should be modular.
* single purpose.

2.) Look at the states they would have to manage each, and look at the data connection it requires.
* Do the parents need info from the children in order to operate?

3.) Retrieve data from api and render using components
4.) Implement advanced React patterns to manage state.

When coding / 1 possible developer workflow:

* Create a basic leaf component with hard coded simple semantic html and values.
* Render in app and pull out the props to make it more re-usable.
* Duplicate components to see how it looks as a group.
* Now you have a group, think about this new parent component.  A list?  a navigation component?
* Repeat?

### USE STATE

```js
import { useState } from "react";

function SpecialsMenu() {
  // currentSpecial is the variable we can call to reference state
  // setCurrentSpecial is the function used to set a new state
  const [currentSpecial, setCurrentSpecial] = useState("Pizza");
  const modifySpecialToTacos = () => {
    setCurrentSpecial("Tacos");
  };
  return (
    <div>
      <h1>Today's special is:</h1>
      <h2>{currentSpecial}</h2>
      <button onClick={modifySpecialToTacos}>We want tacos!</button>
    </div>
  );
}
```

* local variables changing does NOT cause a re-render.  Therefore, we need to use state.  See example below:
* if 'currentSpecial' is changed, then this will cause a re-render (what we want, to show the NEW special).
* modifySpecialToTacos gets called onClick, and then calls the useState Fn 'setCurrentSpecial'.
* Never change the state variable directly.  Use the fn from useState.  Will get weird behaviours.
* React uses 'equality references optimization'.  
  * When you want to update a state variable that is an array, make sure you are giving a new array or else it will look at the reference (and think it's the same).
  * The same goes for objects.
* When we are trying to setState to a new value that is based on a previous value, don't use the state as a parameter.  Instead, use 'prev'.

```js
useEffect(() => {
  if (likes > 0) {
    setTimeout(() => setLikes(prev => prev - 1), 1000);
  }
}, [likes]);
```



* The re-render from state variable change is ASYNCHRONOUS.


### USE REDUCER

* What in gods name.
* Works exactly like use state AND array.reduce(...).
* returns a state and a function that achieves same goal as setState.
* also has two parameters for the reducer function, and a initial state.

```js
const [sum, dispatch] = useReducer((state, action) => {
  return state + action;
}, 0);

```

### USE EFFECT

* similar rules as useState:
  1.) Don't call hooks inside loops, conditions or nested functions.
  2.) Call hooks only from inside react components, or custom hooks.
  3.) The function passed in must return undefined or a function.  (make the effect a multi line f(n)).
* returns nothing.
* use it for 'side effects'.
* when used on components, it will call the useEffect on every render (state or prop change, or initial render).
* Order: react renders ui -> browsers displays ui -> cleanup for effects (if any) -> run effects for current render
* Only need a cleanup if it's a recurring process.  Not for 1 and done code.


```js
useEffect(()=>{
  //All side effects go here!
  // fetching data
  // doing something that takes time
}, [])

useEffect(() => {...}) //        no dependancies == on every re-render, run this effect

useEffect(() => {...}, []) //    empty dependancy == only run this effect on the initial (after) render, and never do it again

useEffect(() => {...}, [val]) // dependancies  == when val changes, run this effect, if any other state changes, do not run this effect
```

## UseContext vs. Composition

useContext is great for handling global states like 'themes', 'user info' and anything that needs to be shared across all components.  However, we shouldn't use this every time because:

* Components that consume the context is tied to it, making that component harder to re-use elsewhere.
* Could be bad for performance if the tree is deeply nested.  It involves lookup for the closest provider everytime the component renders.