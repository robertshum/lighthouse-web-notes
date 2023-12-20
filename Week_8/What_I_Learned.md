# What I learned This Week

## PATTERNS

* Updating objects in an array.  Use 'map'
  * Returns a new array and transforms.  Ex:

```js

array.map(item=> {
  if(item.field === field) {
    item.otherField = input;
  }
  return item;
})
```

## CLASSES / CLASS COMPONENTS IN REACT

* They are syntactic sugar wrapper - not really real in JS.
  * sugar ex: promises -> async await

```js
class MyClass {}

const myClass = new Myclass();
```


* Why use it over functional components??
  * DON'T (performance might be better??  MAYBE).
  * $$$ (Legacy).
  * Can't afford to convert component libraries.


## INTRO TO RUBY
* What a funny language.
* Everything is an object, even primitives.  Everytime you instantiate a object, it carries all the methods of the class.  Even if an empty string "" is created.  Part of the reason is so slow.

### HASHES
* collection of kv pairs
* use symbols (more efficient) than strings.
* symbols prefixed with ":", but in hashes we can write it afterwards.

```ruby
const person = {
  name: "rob"
}

const person2 = {
  :name => "bob"
}
```

* both examples above do the same thing

### PROC

```ruby
my_block = Proc.new do |name|
  puts "hello #{name}"
end
```
* allows blocks of code to be re-used in the form of a variable my_block.
* have to call it with & in a .each code for example, because it will call it somehow in their function
* in our custom definition we have to .call it manually.

```ruby
names = ['rob','bob']
names.each &my_block

def do_stuff &my_block
  my_block.call
end
```

### CLASSES

```ruby
class Car
  def initialize make, model, year
    @make = make
    @model = model
    @year = year
  end

  # Set to read/write one at at time
  attr_reader :year
  attr_writer :year
  # OR we can setup both in one statement:
  attr_accessor :year
  # AND we can pass in multiple values to do it all at once:
  attr_accessor(:year, :model, :make)

  def make
    @make
  end
end

#talking TO the object.  not 'car = new Car()'
car = Car.new('honda', 'civic', 2016);

p car
```

* 'p' shows address and contents of the instance.

```ruby
# throws an error!
p car.model
```

* @ is a property, and is private!  Must use getter to access the variable.
* like make for example.
* for setters, there is no setting operator, we have to suffix it with = in the method

```ruby
#class details here ...

def make= new_make
  @make = new_make
end
```

* or use the accessor as shown in examples.


### POLYMORPHISM VS INHERITANCE

Poly. is:
* interfaces.
* objects that responds to a common 'method'
  * both fish and humans can use a 'eat' method.
* in ruby, another example of this is the use of Mixins via. Modules
  * modules cannot be instantiated (just like interfaces in C#, Java and header files in...C++?)
  * modules kinda like abstract classes (like in Java), because they have predefined behaviour that can be reused.

Inheritance is:
* super and subclasses
* both can be instantiated (generally) and the subclass are more specific but carry the same behaviour as the superclass.

### CLASS METHODS

* There are also class level methods, called class methods. Class methods are methods we can call directly on the class itself,

* Used when we don't need states.

```ruby
#rest of code ommitted for brevity

def self.what_am_i         # Class method definition
  "I'm a GoodDog class!"
end
```

### CLASS VARIABLES

* just like insantiated objects, these variables live in the class itself.  Denoted with '@@'

### MODULE NAMESPACING

* grouping similar classes together.

```ruby

module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end


buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
buddy.speak('Arf!')           # => "Arf!"
kitty.say_name('kitty')       # => "kitty"
```