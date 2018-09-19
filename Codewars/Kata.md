
## IQ Test
Bob is preparing to pass IQ test. The most frequent task in this test is to find out which one of the given numbers differs from the others. Bob observed that one number usually differs from the others in evenness. Help Bob — to check his answers, he needs a program that among the given numbers finds one that is different in evenness, and return a position of this number.

! Keep in mind that your task is to help Bob solve a real IQ test, which means indexes of the elements start from 1 (not 0)

#### My solution
```ruby
def iq_test(numbers)
  even_count=0
  numbers.strip.split(" ")[0..2].each{|x| even_count +=1 if x.to_i%2 == 0}
  lookfor_even = even_count < 2 ? true : false
  numbers.strip.split(" ").each.with_index{|x,index| return index+1 if (x.to_i%2 == 0)==lookfor_even} 
end 
```

#### Interesting solution
```ruby
def iq_test(numbers)
  nums = numbers.split.map(&:to_i).map(&:even?)
  nums.count(true) > 1 ? nums.index(false) + 1 : nums.index(true) + 1
end
```


## Sum of odd numbers

Given the triangle of consecutive odd numbers:

             1
          3     5
       7     9    11
   13    15    17    19
21    23    25    27    29
...
Calculate the row sums of this triangle from the row index (starting at index 1) e.g.:
```
row_sum_odd_numbers(1); # 1
row_sum_odd_numbers(2); # 3 + 5 = 8
```
#### My solution
```ruby
def row_sum_odd_numbers(n)
  return ((0.upto(n-1).sum).upto(0.upto(n).sum-1).collect{|x| 2*x +1}).sum
end
```


## Valid Braces

Write a function that takes a string of braces, and determines if the order of the braces is valid. It should return true if the string is valid, and false if it's invalid.

This Kata is similar to the Valid Parentheses Kata, but introduces new characters: brackets [], and curly braces {}. Thanks to @arnedag for the idea!

All input strings will be nonempty, and will only consist of parentheses, brackets and curly braces: ()[]{}.

What is considered Valid?
A string of braces is considered valid if all braces are matched with the correct brace.

Examples
"(){}[]"   =>  True
"([{}])"   =>  True
"(}"       =>  False
"[(])"     =>  False
"[({})](]" =>  False

#### My solution

```ruby
def validBraces(braces)
  return false if braces.length < 2
  pair = {"(" => ")", "{" => "}", "[" => "]"} 
  brace_order = ""
  valid = true
  braces.each_char{|x|
  if x == "(" or x == "[" or x == "{"
    brace_order += x
  elsif x == pair[brace_order[-1]] and brace_order.length > 0
    brace_order = brace_order[0...-1]
  else 
    valid = false
  end
  }
  valid = false if brace_order.length>0
  return valid
  end 
```

## String incrementer

Your job is to write a function which increments a string, to create a new string. If the string already ends with a number, the number should be incremented by 1. If the string does not end with a number the number 1 should be appended to the new string.

#### My Solution

```ruby
def increment_string(input)
  input.tr('^0-9','').length == 0 ? input += '1' : input = input.tr('0-9','')+'0'*((input.tr('^0-9','').length - (input.tr('^0-9','').to_i+1).to_s.length) > 0 ? (input.tr('^0-9','').length - (input.tr('^0-9','').to_i+1).to_s.length) : 0) +(input.tr('^0-9','').to_i+1).to_s 
end
```
This first solution didn't work because the axioms of the question weren't very clear. I still like it though, so I've kept it in.

#### *Appended solution*

By this point I had lost heart a little and brute forced it. Not very succinct code.

```ruby
def increment_string(input)
  number = ''
  index = 0
  input.reverse.each_char.with_index{|x,ind|
  if x.to_i == 0 and x!='0'
    index = input.length - ind 
    break
  else
    number+= x
  end
  }
  number.reverse!
  increased_number = (number.to_i+1).to_s
  appendedZeroes = number.length > increased_number.length ? '0'*(number.length - increased_number.length)+increased_number : increased_number 
  return input[0...index] + appendedZeroes
end
```

## The Supermarket Queue

There is a queue for the self-checkout tills at the supermarket. Your task is write a function to calculate the total time required for all the customers to check out!

The function has two input variables:

customers: an array (list in python) of positive integers representing the queue. Each integer represents a customer, and its value is the amount of time they require to check out.
n: a positive integer, the number of checkout tills.
The function should return an integer, the total time required.

#### My Solution

```ruby
def queue_time(customers, n)
  return 0 if customers.length == 0
  return nil if n==0  
  customers.reverse!
  time = 0
  tills = Array.new(n,0)
  tills.collect!{|x| customers[0] != nil ? customers.pop : 0}
  tills.sort!
  while customers.length != 0
    time += tills[0]
    next_que = tills.collect{|x| x-tills[0]}
    tills = next_que
    tills[0] = customers[0] != nil ? customers.pop : 0
    tills.sort!
    end
  time += tills[-1]
  return time
end
```

## Find The Parity Outlier

You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

#### My Solution

```ruby
def find_outlier(integers)
even_count = 0
integers[0..2].each{|x| even_count+=1 if x%2 == 0}
return even_count > 1 ? integers.select{|x| x%2 ==1}[0] : integers.select{|x| x%2 !=1}[0]
end 
```

This one wasn't very well refactored, but I was testing to see how fast I could do it more than anything.

## Human Readable Duration Format
Your task in order to complete this Kata is to write a function which formats a duration, given as a number of seconds, in a human-friendly way.

The function must accept a non-negative integer. If it is zero, it just returns "now". Otherwise, the duration is expressed as a combination of years, days, hours, minutes and seconds.

It is much easier to understand with an example:
```
format_duration(62)    # returns "1 minute and 2 seconds"
format_duration(3662)  # returns "1 hour, 1 minute and 2 seconds"
```

#### My Solution
```ruby
def format_duration(seconds)
  return "now" if seconds == 0
  conversion = {year: 31536000, day: 86400, hour: 3600, minute: 60, second: 1}
  time = {year: 0, day: 0, hour: 0, minute: 0, second: 0}
  time.collect{|unit,val|
    time[unit] = seconds / conversion[unit]
    seconds = seconds % conversion[unit]
    }
  time.reject!{|unit,val| val==0}
  string_array = []
  time.each{|unit,val|
  string_array << val.to_s+" #{unit.to_s}"+(val>1 ? "s" : "")
  }
  return string_array[0...-1].join(", ")+ " and "+string_array[-1] if string_array.length > 1
  return string_array[0]
end
```



4 kyu Permutations

recursive