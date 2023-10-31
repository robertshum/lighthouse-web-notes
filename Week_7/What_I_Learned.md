# What I learned This Week

## REACT

### USE STATE

* local variables changing does NOT cause a re-render.  Therefore, we need to use state.  See example below:
* if 'currentSpecial' is changed, then this will cause a re-render (what we want, to show the NEW special).
* modifySpecialToTacos gets called onClick, and then calls the useState Fn 'setCurrentSpecial'.

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