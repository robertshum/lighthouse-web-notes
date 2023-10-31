# What I learned This Week

### HTML

3 Major essential tags.  There should only be ONE of each.

1. HTML

Just define it is a HTML document

2. HEAD

Metadata, linking other documents like css.  Head is not 'seen'.

3. BODY

Content of the page.

Random Facts
* Meta Tags are self enclosing
* Divs are the most generic elements in html.  TRY to find a better element than a DIV that conveys more meaning for the browser/user before using div.


#### CSS

Link vs Style element vs Inline style

Who wins, if we are trying to style the same element?

* If the selectors are equal, whatever comes LAST, WINS.
* Whichever selector is the most SPECIFIC, WINS.

#### BOX MODEL

Going from INSIDE to OUT.

Content -> Padding -> Border -> Margin

Content:
* Where content goes.
* Background color affects this.

Padding:
* Background color from content also affects this.

Border:
* Area around the padding.
* Has their own color/style/width.
* border-right...

Margin:
* Space outside the element (how far apart from other elements).
* margin-right...
* if you do margin-left/right : auto, it centers the box.  Just for margin.

The entire width of a element is the element width + padding (right/left) + border(right/left).  ANNOYING.

```css
.class{
  box-sizing: border-box;
}
```

The above will force the border/padding/content to fit within the width.  IE. content might shrink.  Very popular.

#### CSS RESET SCRIPTS

* Put external css in 'css/vendor' folders.
* A reset in css to ensure webpage looks the same for all browsers.
* Don't forget the link/attribution.


### Responsive Design Patterns

https://web.dev/learn/design/ui-patterns/

* One way to approach design is design for mobile FIRST, and then DESKTOP (or larger screens later).  This means designs get easier because we are working with more room later on.

#### Overflow Pattern

Too much content?  Truncate content and fit most important items on screen.  Make sure the users know that there is more content to interact with.

* use a faded gradient over truncated content.
* show a way for users to navigate to that content (arrow, scrollbar, etc.).

Carousels similar to overflow

* show everything on large screen.
* show content on a single line as a carousel to navigate left/right.

#### Other tricks

* use this for html.  This makes sure mobile devices doesn't zoom out to fit the entire page.  I think this is standard when we go ! in VCode and auto complete.

```html
<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0' />
```

### BIG O

Big O = Worst case scneario (asymptotic upper bound)
Big Omega Ω= lower bound = best case (asymptotic lower bound)
Big Theta Θ = somewhere in  the middle = avg. case (tightest bound)

### Good practices in jQuery

* Never use a direct search like this:

```js
const name = $('.randomclass');
```

this is very expensive.  Instead use .closest to find the closest parent that contains your target, and then .find to find the target.
Ex:

```js
const $form = $(this).closest('.parentform') // contains the target
$form.find('.randomclass');
```

This is a better practice because it's more performant.  "Ask your parents to look for your sibling's toy".


* Only keep code under document.ready for things that should execute, NOT function details.  EX, do this:

```js
#(document).ready(function(){
  $(".form_textarea").on("input", onInput);
});

// ...

const onInput = function(event){
  //do stuff outside
}
```

* we can make and call custom triggers

```js

$('.form').on('totallyMadeUpFn, ()=>{...});

//...

//this = form
$(this).trigger('totallyMadeUpFn');

```

* Wrap f(n) and document.ready in a {}.  That way we don't get interference with other method taking away similiar variable names.

Remember: when the browser loads the HTML, it collects ALL the js in the scripts and concats them into a SINGLE file, meaning variables are exposed to each other.

* Use an IIFE...because it's cool.  Good for calling things once and making it disappear.