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
```
#### Codewars methods
```ruby
string.strip ## removes all leading and trailing whitespace
string.tr('()', '') # removes all characters in first arg
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
## Arrays
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
### Hash iterating

### Hash methods
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
## Case (Switch)
## Yield
## Blocs, Procs & Lambdas
### Blocs
### Procs
### Lambdas
## Classes


