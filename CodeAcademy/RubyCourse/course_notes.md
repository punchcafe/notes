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

### General conventions
-methods which end in `?` tend to be query methods which evaluate to `true` or `false`.
### Other notes

-variable naming convention: `ruby_variable`
## Booleans
### Boolean operatos
```ruby
 && , and
|| , or
!= 
<=
>= 
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
### Blocks
Blocks are blocks of executable code. various methods like .each take block as input.

Blocks are blocks of functions which modify whatever they are attatched to. what they are attartched to defines what goes into them. blocks require you to specify the variable, and are analagous to python's lambda.

*a note on blocks*
How Blocks Differ from Methods

Check out the code in the editor. The capitalize method capitalizes a word,
 and we can continually invoke the capitalize method by name. We can 
 capitalize("matz"), capitalize("eduardo"), or any string we like to 
 our hearts' content.

However, the block that we define (following .each) will only be called once,
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
Why do some methods accept a block and others don't? 
It's because methods that accept blocks have a way of transferring 
control from the calling method to the block and back again. We can
build this into the methods we define by using the yield keyword.
### Form

## Classes


