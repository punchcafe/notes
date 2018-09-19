# codecademy *Learn Ruby* course notes
*by PunchCafe*
## General
### General syntax

- get user input with `gets`. Avoid line break with `gets.chomp`, e.g. `user_input = gets.chomp` 
- write extended notes with
```ruby
=begin
    <body>
=end
```
- `!` after a method re-writes the object with the returned value of the method, e.g. after `object.method!`, `object` will have the value of object.method.
- methods can be chained like so; `object.method1.method2.method3`
- conditional assignment ` x ||= y` will only assign `y` to `x` if `x` hasn't been assigned anything yet.
- Concatenation operator:
```ruby
#CONCATENATION OPERATOR
[1, 2, 3] << 4
"Yukihiro " << "Matsumoto"
```
- semicolon may be used for ending things on one line `class Dragon < Creature; end`
### General conventions

- methods which end in `?` tend to be query methods which evaluate to `true` or `false`.
- variable naming convention: `ruby_variable`
### Misc. methods
```ruby
object.respond_to?(:to_sym) 
#returns true if symbol is a method of the objects class.
```

## Booleans
### Boolean operatos
```ruby
 && , and
|| , or
!= 
<=
>= 
<=> #combined comparison operator
```

## Strings
#### String interpolation
insert variables into strings using the interpolation syntax `#{variable}` in the string, e.g.
```ruby
variable ="word"
"here any string can have a #{variable} inserted"
```

### String methods
#### Codecademy methods
```ruby
my_string.length
my_string.reverse
my_string.upcase
my_string.downcase
my_string.capitalize
my_string.include? arg # checks if argument is in string
my_string.split(arg) # returns array of strings, each element split by arg
my_string.gsub(/oldchar/,"newchar") #subs all instances of oldchar with str newchar and returns new array.
"L".upto("P"){|let| puts let} #puts all characteyrs between L and P.
```
#### Codewars methods
```ruby
string.strip ## removes all leading and trailing whitespace
string.tr('()', '') # replaces all characters in first arg with second
string.tr('^args','') # replaces all characters except those in first arg with second.
string.delete('afdnn') # same as above
string.gsub /[chars]/, ''
```
## Control Flow
### Standard control flow syntax
Standard universal control flow syntax in ruby looks like this:
```ruby
if true
    <body>
elsif true
    <body>
else
    <body>
end    
```
Ruby has a special keyword, `unless`:

```ruby
unless true #won't run
    <body>
end

unless false #will run
    <body>
end
```

### Compacted control flow
Ruby has a special compacted syntax for control flow. This syntax must follow the order `<statement> if boolean`
```ruby
<statement> if true
#e.g.
puts "true!" if 3 < 4
```
### Ternary conditional expression
A one line statement which generates an object dependant on the result of the boolean.
```ruby
#syntax:
boolean ? Do this if true: Do this if false
#e.g.
puts 3 < 4 ? "3 is less than 4!" : "3 is not less than 4."
```
## Loops and Iterators
### Loop syntax
example
```ruby
i = 5
loop {
  i -= 1
  next if i%2 != 0
  print "#{i}"
  break if i <= 0
  }
```
- `next` keyword skips to the next iteration of the loop.
- This example code shows a loop which prints all even numbers between `i=5` and `0`

### While loops
```ruby
while boolean
    <body>
end
```
### Until loops
```ruby
until boolean
    <body>
end
```
### For loops
```ruby
for num in 1...10
    <body>
end
```
in this loop, the `...` notation means that the last element, `10`, wont be included. To include the last element, we use the notation `..`;
```ruby
for num in 1..10
    <body>
end
```
### Integer/String Iterators
```ruby
10.times { print "Chunky bacon!" }
95.upto(100) { |num| print num, " " }
"L".upto("P"){|let| puts let}
```


## Arrays
### Array Syntax
```ruby
Array.new(n,d) #initiates an array of `n` elements with `d` default value
my_array = [1,2,3] #make new array, my_array
my_array[0] #access the first element

```
### Array methods

```ruby
array.each{|x| <body> } #returns an array with each element(x) acted on.
array.each.with_index{|x,ind| <body>} #as above, but also gives the index. 
array.select{bool} #returns array with only true bool values
array.sort! #remembering, ! overwrites
array.push #appends object to the end of array
array.include? arg #checks if arg is in array
array.reject{|x| boolean} #returns array withwout rejected values
a = [ "a", "b", "c", "d" ]
a.collect { |x| x + "!" }        #=> ["a!", "b!", "c!", "d!"]
a.map.with_index{ |x, i| x * i } #=> ["", "b", "cc", "ddd"]
[ "a", "b", "c" ].join        #=> "abc"
[ "a", "b", "c" ].join("-")   #=> "a-b-c"
```

## Hashes
### Hash syntax

```ruby
my_hash = Hash.new
my_hash_nil_set = Hash.new(0) #creates an empty instance of a Hash with a nil
#value set. Useful in allowing us to increment values which don't exist yet
# from a default value.
pets = Hash.new
pets["mimi"] = "dead"

pets = {
  "Stevie" => "cat",
  "Bowser" => "hamster",
  "Kevin Sorbo" => "fish"
}

#M O D E R N   H A S H   S T Y L E
movies = {
  lotr: "the best",
  jurassic: "the worst"
  }
```
-  If you have a hash with a default value, and you try to access a non-existent key, you get that default value.

### Hash iterating

```ruby
family = { "Homer" => "dad",
  "Marge" => "mom",
  "Lisa" => "sister",
  "Maggie" => "sister",
  "Abe" => "grandpa",
  "Santa's Little Helper" => "dog"
}

family.each { |x, y| puts "#{x}: #{y}" }
```

### Hash methods
```ruby
my_hash.each_key
my_hash.each_value
my_hash.keys.last
my_hash.values.last  
my_hash.delete(key)
my_hash.select{|key,value| bool} #returns hash of true bools
my_hash.sort_by{|key,val|}
```
## Methods
### Method syntax
```ruby
def my_function
    <body>
end

def some_function(x) #method with arguments
    body
end
#with splat arguments(denotes one or more arguments can be inserted in this field)
#parses them as an array? or atleast .each notation may be used
def splat_arg_fn(x,*y)
    body
end

#calling a function:
my_function
some_function(some_var)
```
#### Implicit return
one feature of Ruby's methods is that if no return is specified, the method will return the last evaluated expression. So, 
```ruby
def somefnk(x,y)
    return x+y
end
```
returns the same as
```ruby
def somefnk(x,y)
        x+y
end
```

## Symbols
### General Notes
- symbols are immutable
- symbols are primarily used as hashkeys
### Syntax
symbols are a type of object, defined by the colon first :
```ruby
:some_symbol
some_variable = :some_symbol
```
### Methods
```ruby
symbol.to_s # converts to string
"string".to_sym # converts string to symbol
```
## Case (Switch)
### Form
```ruby
case language
  when "JS"
    puts "Websites!"
  when "Python"
    puts "Science!"
  when "Ruby"
    puts "Web apps!"
  else
    puts "I don't know!"
end
```
### Folded Case syntax
```ruby
case language
  when "JS" then puts "Websites!"
  when "Python" then puts "Science!"
  when "Ruby" then puts "Web apps!"
  else puts "I don't know!"
end
```



## Blocks, Procs & Lambdas
>-A block is just a bit of code between do..end or {}. It's not an object on its own, but it can be passed to methods like .each or .select.
-A proc is a saved block we can use over and over.
-A lambda is just like a proc, only it cares about the number of arguments it gets and it returns to its calling method rather than returning immediately.
### Blocks

>Blocks are blocks of executable code. various methods like .each take block as input.

>Blocks are blocks of functions which modify whatever they are attatched to. what they are attartched to defines what goes into them. blocks require you to specify the variable, and are analagous to python's lambda.

*a note on blocks*
How Blocks Differ from Methods

>Check out the code in the editor. The capitalize method capitalizes a word,
 and we can continually invoke the capitalize method by name. We can 
 capitalize("matz"), capitalize("eduardo"), or any string we like to 
 our hearts' content.

>However, the block that we define (following .each) will only be called once,
 and in the context of the array that we are iterating over. It appears just 
 long enough to do some work for each, then vanishes into the night.

```ruby
def capitalize(string) 
  puts "#{string[0].upcase}#{string[1..-1]}"
end

capitalize("ryan") # prints "Ryan"
capitalize("jane") # prints "Jane"

# block that capitalizes each string in the array
["ryan", "jane"].each {|string| puts "#{string[0].upcase}#{string[1..-1]}"} # prints "Ryan", then "Jane"
```

#### Syntax
May be written between `do` and `end`, or alternatively between `{}`
```ruby
do
  <block body>
end

{
  <block body>
}
```
### Procs
Procs (short for procedures) are *saved* blocks.
#### Syntax
```ruby
new_proc = Proc.new { |n|
  <body>
}
```
#### Examples
```ruby
new_proc = Proc.new { |n|
  n%2 == 0
}
#call:
new_proc.call(arg)
```
-to be used as a block, the proc must be converted using `&`, e.g. `func(&new_proc)`

#### Using symbols as Procs

```ruby
numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
strings_array = numbers_array.collect(&:to_s)
puts strings_array
```




### Lambdas
#### Syntax
```ruby
lambda { |param| block }
```
#### Example
```ruby
strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda {|x| x.to_sym}
symbols = strings.collect(&symbolize)  #parse with & just like procs !
```
#### Lambdas v. Procs
Lambdas are almost identical to procs, with a few notable differences:

-First, a lambda checks the number of arguments passed to it, while a proc does not. 
This means that a lambda will throw an error if you pass it the wrong number of arguments, 
whereas a proc will ignore unexpected arguments and assign nil to any that are missing.

-Second, when a lambda returns, it passes control back to the calling method;
 when a proc returns, it does so immediately, without going back to the calling method.
```ruby
  def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_lambda
>>  Batman will win!
  Iron Man will win!
```

## Yield
>Why do some methods accept a block and others don't? 
It's because methods that accept blocks have a way of transferring 
control from the calling method to the block and back again. We can
build this into the methods we define by using the yield keyword.
### Form

```ruby
def some_func(arg)
  <body>
  yield
```
### Example
```ruby
def yield_name(name)
  puts "In the method! Let's yield."
  yield("Kim")
  puts "In between the yields!"
  yield(name)
  puts "Block complete! Back in the method."
end

#calling yeldname
yield_name("Eric") { |n| puts "My name is #{n}." }

>> In the method! Let's yield.
  My name is Kim.
  In between the yields!
  My name is Eric.
  Block complete! Back in the method.
  In the method! Let's yield.
  My name is Kim
  In between the yields!
  My name is Luca
  Block complete! Back in the method.
```

- A yeild statement will yeald a value (or two)? from a function which is then passed to a block.
- The |var| notation indicates the designation of the variable, and how it is to be used.


## Classes
###Syntax through example
```ruby
class Language
  @@classvar = sumnum
  def initialize(name, creator)
    @name = name
    @creator = creator
  end
  
  def description
    puts "I'm #{@name} and I was created by #{@creator}!"
  end
end

ruby = Language.new("Ruby", "Yukihiro Matsumoto")
python = Language.new("Python", "Guido van Rossum")
javascript = Language.new("JavaScript", "Brendan Eich")

#call 
ruby.description

@instance_var
@@class_var
$globalvar
```


>It may surprise you to learn that not all variables are accessible to all parts of a Ruby program at all times. 
When dealing with classes, you can have 
>- `$var`variables that are available everywhere (**global variables**),
>-  ones that are only available inside certain methods (**local variables**), 
>- `@@var`others that are members of a certain class (**class variables**),
>- `@var`and variables that are only available to particular instances of a class (**instance variables**).

Similarly with methods:
- Private methods may not be called.
- Public methods may be called.
- the keyword `public` means everytihng after it till the class end statement is public
- conversely, `private` does the opposite.

### Getters & Setters (ruby automation)

```ruby
class Person
  attr_reader :name
  attr_writer :job
  def initialize(name, job)
    @name = name
    @job = job
  end
end

class Person
  attr_accessor :name
  attr_accessor :job
```
These automate the creation of getters and setters for each variable. Read-only, write-only and both are enabled via `reader` `writer` and `accessor` respectively.

### Inheritance
```ruby
class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end
```
### `super()`

>Any function with the same name defined in a child class will overwrite the parent class, HOWEVER, using the super(optional args) function will call a method from the parent class with the same name as the method it's currently in.

```ruby
class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end

class Dragon < Creature
  def fight
    puts "Instead of breathing fire..."
    return super()
  end
end
```

### Initializing from parent class with `super`
```ruby
class Message
  @@messages_sent = 0
  def initialize(from,to)
    @from = from
    @to = to
    @@messages_sent += 1
  end
end
my_message = Message.new("me","you")

class Email < Message
  def initialize(from, to)
    super
  end
end
```

### Codecademy Example
```ruby
class Computer
  @@users = {}
  def Computer.get_users
    return @@users
  end
  def initialize(username,password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end
  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "You made the file at #{time},brah."
  end
  
end
my_computer = Computer.new("me","python")
```

## Modules
>You can think of a module as a toolbox that contains a set methods and constants. There are lots and lots of Ruby tools you might want to use, but it would clutter the interpreter to keep them around all the time. For that reason, we keep a bunch of them in modules and only pull in those module toolboxes when we need the constants and methods inside!

>You can think of modules as being very much like classes, only modules can't create instances and can't have subclasses. They're just used to store things!

>Ruby doesn't make you keep the same value for a constant once it's initialized, but it will warn you if you try to change it. Ruby constants are written in ALL_CAPS and are separated with underscores if there's more than one word.
### Syntax

```ruby
#define a module
module ModuleName
  <module body>
end

#accessing a module
Module::constant

#importing a module
require 'module'
#for from module import * (python equiv.)
inlcude Module
```

### Mixin

Mixin is using modules in convention with classes to create the effect of multi-inheritance.

#### Syntax
```ruby
class TheHereAnd
  extend ThePresent
end
```


>When a module is used to mix additional behavior 
and information into a class, it's called a mixin. 
Mixins allow us to customize a class without
 having to rewrite code!
 
>Now you understand why we said mixins could give us 
 the ability to mimic inheriting from more than one 
 class: by mixing in traits from various modules as 
 needed, we can add any combination of behaviors to 
 our classes we like!





