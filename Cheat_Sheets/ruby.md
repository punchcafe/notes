## Ruby cheat sheet

#### Strings
```ruby
str.capitalize
str.upcase
str.downcase
str.length
str.include?
str.gsub
str.slice #return a slice of the string depending on the arg
str.slice!
str.split
str.chars #returns an array of all the characters in string
```
#### Arrays
```ruby
array.first
array.last
array.length
array.empty?
array.include?
<<
array.sort!
array.delete
array.pop
array.shift #conceptual opposite of pop, but if given an arg n, will remove first n terms.
array.to_h #assumes array contains key-value pairs and converts to hash, e.g. [[some_key1,someval1],[some_key2,someval2]] => to hash
array.to_s #creates a string representation of self.
array.each
array.select 
array.reject
array.map
```

#### Hashes
```ruby
dict.key(value) #returns key for a given value
dict.keys #returns array of keys
dict.has_key?
dict.has_value?
dict.invert #returns a hash with values and keys flipped.
dict.flatten
dict.to_a
dict.to_s
dict.select returns hash of block == true
dict.reject
dict.each 
dict.each_key
dict.each_value 
dict.each_pair
```


The return value of the block is defined by the last executed statement. The return value is only accessible to the invoked method (in our example, that's each). The invoked method may choose to return the value that the block returns but it doesn't have to. In this example, the method each returns the original array that it was called on and not the return value of the block. This is the reason we see ["hello", "world"] in the output as the return value. The block itself returns nil, the return value of the puts method.