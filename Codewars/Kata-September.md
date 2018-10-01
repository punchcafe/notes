
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



## Permutations

>In this kata you have to create all permutations of an input string and remove duplicates, if present. This means, you have to shuffle all letters from the input in all possible orders.

Examples:
```ruby
permutations('a'); # ['a']
permutations('ab'); # ['ab', 'ba']
permutations('aabb'); # ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']
The order of the permutations doesn't matter.
```

#### My Solution
I wanted to try and solve this problem using a recursive function. Perhaps (without any elements of dynamic programming), an iterative approach would have made more efficient code, but I wanted the practice.

when looping through `x.each_character` I had the issue of the `insert` method mutating the list as I went through it. Initially I tried to get around this by making a clone with `temp_array = x`, but discovered that this just creates an object `temp_array` which simply points to `x`. Thus any attempt to use `temp_array` still modified `x`. This was an interesting note since it showed me that Ruby assignments of variables don't inherently assign the variable to a copy of whatever it's assigned to. To get around this I used `x*1` to generate a clone, meaning I could mutate without worrying about disrupting the iterations.
```ruby
def permutations(string)
  if string.length == 1
    return [string]
  elsif string.length == 2
    return do_it([string[0]],string[1])
  else
    return do_it(permutations(string[0...-1]),string[-1])
  end
end

def do_it(my_array,new_char)
  return_array = []
  my_array.each{|x| 
    x.each_char.with_index{|char,ind| 
      return_array << (x*1).insert(ind,new_char)
    }
    return_array << (x*1 << new_char)
  }
  return_array.uniq!
  return return_array
end
```
## Greed is good

>Greed is a dice game played with five six-sided dice. Your mission, should you choose to accept it, is to score a throw according to these rules. You will always be given an array with five six-sided dice values.
```
 Three 1's => 1000 points
 Three 6's =>  600 points
 Three 5's =>  500 points
 Three 4's =>  400 points
 Three 3's =>  300 points
 Three 2's =>  200 points
 One   1   =>  100 points
 One   5   =>   50 point
```
A single die can only be counted once in each roll. For example, a "5" can only count as part of a triplet (contributing to the 500 points) or as a single 50 points, but not both in the same roll.

Example scoring
```
 Throw       Score
 ---------   ------------------
 5 1 3 4 1   50 + 2 * 100 = 250
 1 1 1 3 1   1000 + 100 = 1100
 2 4 4 5 4   400 + 50 = 450
```

#### My solution
```ruby
def score( dice )
  score = 0
  rolls = Hash.new(0)
  dice.each{|x|
    rolls[x] += 1
  }
  rolls.each{|key,val|
    case key
    when 1 then score += (val/3) * 1000 + (val%3)*100
    when 5 then score += (val/3) * 500 + (val%3)*50
    else  score += (val/3) * key*100  
    end
  }
  return score
end
```

## Binary Genetic Algorithms

>Explanation of the concept
Genetic algorithms are a useful tool for machine learning. One simple way to find a solution to a problem that would typically be too difficult to brute force is through algorithms such as these.

>For example, say our problem is, given the list [1,2,3,4,5,6,7,8,9,10], find a way to partition the list into two lists such that the sum of one list is 38 and the product of the other list is 210. You could of course brute force it, using the fact that you can find the divisors of 210. But say you have the list of numbers from 1 to 50! That makes it a lot more difficult, and if we are not looking for a sum or product that is actually possible, just close to a given number, it's even harder to do by brute force.

>Genetic algorithms are based on the idea that you can create a chromosome that represents a potential solution to your problem. One way of representing such a chromosome is with a binary string of digits. In our example, we could represent one chromosome as 0010010111, and decide that 0 means that the corresponding number is in the "sum" pile and 1 means it is in the "product" pile, so this chromosome gives us 1+2+4+5+7=19 and 3*6*8*9*10=12960. Not very close. But the point is that you can easily represent any potential solution as a binary string!

>Now, the key to a genetic algorithm is to generate many chromosomes, a large population, if you will. The "genetic" part of the name comes from the fact that we will, in a sense, let evolution bring our chromosomes as close as possible to our desired solution. So what we do is generate a population of random chromosomes. Then we calculate the fitness of those chromosomes in whatever way fits the problem. In our case, we want to minimize the absolute difference of the sum from the ideal sum and likewise for the product, so one way we can calculate a "score" of how good our estimate is is sqrt((chromosome sum - ideal sum)^2+(chromosome product - ideal product)^2). We want to, of course, maximize fitness, so the closer our score is to 0 (that is, the closer the chromosome is to ideal), the bigger the fitness is. So what we can do is let our fitness be 1/(score + 1); a fitness of 0 means it's nowhere near what we want, and a fitness of 1 means we have exactly the right answer!

>The evolution step involves taking a look at our population and selecting by fitness. This is done in a few steps:

>Select two chromosomes from our original population. This is not done purely randomly. This is done using what is called "roulette wheel selection", where the chances of picking a chromosome are proportional to its fitness! This means we are more likely to pick out chromosomes that are closer to our answer. Duplicate these chromosomes.
With a probability p_c, a crossover occurs between these two new chromosomes. That means at some random bit along the length of the chromosome, we cut off the rest of the chromosome and switch it with the cut off part of the other one. In other words, say we have 01011010 and 11110110 and we crossover at the 3rd bit. This results in 010 10110 and 111 11010.
With a probability p_m, a mutation can occur at every bit along each new chromosome; the mutation rate is typically very small.
Add these two new chromosomes into our new population and repeat steps 1-3 until you have a new population the same size as the original one. For obvious reasons, this is easier if you start off with an even sized original population.
Our goal here is to run the evolution process many times. Eventually, all the chromosomes in our population will have a fitness close to 1! When we feel we have done enough runs, that is the time to cut it off, find the chromosome with the highest fitness, and return that as the result.

>Your task
We'll keep this task fairly simple. You will be given an outline of a GeneticAlgorithm class with a few methods. The crossover and mutate methods are self-explanatory: they take in two chromosomes or one and a probability (respectively) and return a crossed-over pair or a mutated chromosome. The generate method generates a random chromosome of a given length (use this in your run method to create a population). The select method will take a population and a corresponding list of fitnesses and return two chromosomes selected with the roulette wheel method. The run method will take a fitness function that accepts a chromosome and returns the fitness of that chromosome, the length of the chromosomes to generate (should be the same length as the goal chromosome), the crossover and mutation probabilities, and an optional number of iterations (default to 100). Make the population size whatever you want; 100 is a good number but anywhere between 50 and 1000 will work just fine (although the bigger, the slower). After the iterations are finished, the method returns the chromosome it deemed to be fittest. This fitness function will be preloaded (Helper.Fitness in C#)! What the test will do is generate a random binary string of 35 digits (a random Integer with 35 bits for Ruby), and your algorithm must discover that string! The fitness will be calculated in a way similar to above, where the score of a chromosome is the number of bits that differ from the goal string.

>The crossover probability we will use is 0.6 and the mutation probability we will use is 0.002. Now, since the chromosome length is small, 100 iterations should be enough to get the correct answer every time. The test fixture will run the algorithm 10 times on 10 different goal strings. If not all of them work, then you can try again and you'll probably be fine.

>Good luck and have fun!

### Genetic Algorithm Series - #1 Generate
```ruby
def generate(length)
  chromosome = ""
  length.to_i.times{chromosome << Random.rand(2).to_s}
  return chromosome
end
```

### Genetic Algorithm Series - #2 Mutation
```ruby
def mutate (chromosome, p)
  new_chromosome = ""
  chromosome.each_char{|x|
    if p > rand(0.0...1.0)
      new_chromosome << (x=="1" ? "0" : "1")
    else
      new_chromosome << x
    end
    }
return new_chromosome
end
```

##### interesting other solutions
```
def mutate (chromosome, p)
  chromosome.chars.map { |i| rand < p ? i.tr('01', '10') : i }.join
end

def mutate(chromosome, p)
  chromosome.gsub(/./) { |m| rand < p ? m.tr("01", "10") : m }
end
```

### Genetic Algorithm Series - #3 Crossover

```ruby
def crossover (chromosome1, chromosome2, index)
  return [chromosome1[0...index]+chromosome2[index..-1],chromosome2[0...index]+chromosome1[index..-1]]
end
```


```ruby
class GeneticAlgorithm
  def generate length
    chromosome = ""
    length.to_i.times{chromosome << Random.rand(2).to_s}
    return chromosome
  end
  
  def select population, fitnesses
    returned = []
    2.times{
      selected = rand(0...fitnesses.sum)
      cumul = 0
      fitnesses.each.with_index{|x,ind|
        if cumul < selected and selected <= (cumul+x)
          returned << population[ind]
          population.delete_at(ind)
          fitnesses.delete_at(ind)
          break
        else
          cumul += x
        end
        }
    }
    return returned
  end

  
  def mutate chromosome, p
    new_chromosome = ""
    chromosome.each_char{|x|
      if p > rand(0.0...1.0)
        new_chromosome << (x=="1" ? "0" : "1")
      else
        new_chromosome << x
      end
      }
    return new_chromosome
  end
  
  def crossover chromosome1, chromosome2
    index = rand(0...chromosome1.length) 
    return [chromosome1[0...index]+chromosome2[index..-1],chromosome2[0...index]+chromosome1[index..-1]]
  end
  
  def run fitness, length, p_c, p_m, iterations=100
    population = []
    fitnesses = []
    new_population = []
    100.times{
      new_chromosome = GeneticAlgorithm.generate(length)
      population <<  new_chromosome
      fitnesses << fitness(new_chromosome)
    }
    iterations.times{
      50.times{
      pair = GeneticAlgorithm.select(population,fitnesses)
      pair = GeneticAlgorithm.crossover(pair[0],pair[1]) if rand(0..1) > p_c
      pair.each{|x|
        new_population << GeneticAlgorithm.mutate(x,p_m)
      }
      population = new_population*1
      fitnesses = []
      population.each{|x|
      fitnesses << fitness(x)
      }
      new_population = []
      }
    }
end
```
main solution



### Scrambles
>Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

>Notes:
>- Only lower case letters will be used (a-z). No punctuation or digits will be included.
>- Performance needs to be considered

#### My solution

```ruby
def scramble(s1,s2)
  return false if s2.length > s1.length or (s1.length == 0 or s2.length == 0)
  s2.each_char{|x|
  return false if !s1.include?(x)
  s1.slice!(s1.index(x))
  }
  return true
end
```

#### Notes
was initially having substantial 

Expected: false, instead got: ["scriptjavx", "javascript"]
Expected: false, instead got: ["scriptjavx", "javascript"]

```ruby
def scramble(s1,s2)
  return false if s2.length > s1.length or (s1.length == 0 or s2.length == 0)
  s2.each_char{|x|
  return false if !s1.include?(x)
  s1.slice!(s1.index(x))
  }
  return true
end
```


### Magnet particules in boxes

>Professor Chambouliard hast just discovered a new type of magnet material. He put particles of this material in a box made of small boxes arranged in K rows and N columns as a kind of 2D matrix K x N where K and N are postive integers. He thinks that his calculations show that the force exerted by the particle in the small box (k, n) is:

>v(k, n) = \frac{1}{k(n+1)^{2k}}

>The total force exerted by the first row with k = 1 is:

>u(1, N) = \sum_{n=1}^{n=N}v(1, n) = \frac{1}{1.2^2} + \frac{1}{1.3^2}+...+\frac{1}{1.(N+1)^2}

>We can go on with k = 2 and then k = 3 etc ... and consider:

>S(K, N) = \sum_{k=1}^{k=K}u(k, N) = \sum_{k=1}^{k=K}(\sum_{n=1}^{n=N}v(k, n)) \rightarrow (doubles(maxk, maxn))

>Task:
To help Professor Chambouliard can we calculate the function doubles that will take as parameter maxk and maxn such that doubles(maxk, maxn) = S(maxk, maxn)? Experiences seems to show that this could be something around 0.7 when maxk and maxn are big enough.

>Examples:
doubles(1, 3)  => 0.4236111111111111
doubles(1, 10) => 0.5580321939764581
doubles(10, 100) => 0.6832948559787737
Notes:
In u(1, N) the dot is the multiplication operator.
Don't truncate or round: Have a look in "RUN EXAMPLES" at "assertFuzzyEquals".

#### My solution
```ruby
def one_particle(k_i,n_j)
  return 1/(k_i*(n_j+1.0)**(2.0*k_i))
end
  
def one_row(k_i,n_max)
  sum_force = 0
  1.upto(n_max){|n_j|
    sum_force += one_particle(k_i,n_j)
  }
  return sum_force
end

def doubles(k_max,n_max)
  sum_force = 0
  1.upto(k_max){|k_i|
    sum_force += one_row(k_i,n_max)
  }
  return sum_force
end
```


todo:

Pick peaks

Decode the Morse code, advanced

Ten-Pin Bowling

Binary multiple of 3

Make a spiral


### Instant Runoff Voting

>Your task is to implement a function that calculates an election winner from a list of voter selections using an Instant Runoff Voting algorithm. If you haven't heard of IRV, here's a basic overview (slightly altered for this kata):

>-Each voter selects several candidates in order of preference.
-The votes are tallied from the each voter's first choice.
-If the first-place candidate has more than half the total votes, they win.
-Otherwise, find the candidate who got the least votes and remove them from each person's voting list.
-In case of a tie for least, remove all of the tying candidates.
-In case of a complete tie between every candidate, return nil(Ruby)/None(Python)/undefined(JS).
Start over.
-Continue until somebody has more than half the votes; they are the winner.
-Your function will be given a list of voter ballots; each ballot will be a list of candidates (symbols) in descending order of preference. You should return the symbol corresponding to the winning candidate. See the default test for an example!

```ruby
def runoff(voters)
init_length = voters[0].length
loop{
  votes = Hash.new(0)
  total = voters.length
  voters.each{|x|
    votes[x[0]] += 1
  }
  voters[0].each{ |y| votes[y] = 0 if !votes.keys.include?(y) }
  smallest = [[],votes.values.sample]
  votes.each{|x,val|
    return x if val*1.0/voters.length*1.0 > 0.5
    smallest = [[x],val] if val < smallest[1]
    smallest[0] << x if val == smallest[1]
    return nil if smallest[0].length == init_length
  }
  smallest[0].each{|x|
    voters.each{|y| y.delete(x)}
   } 
} 
end
```

