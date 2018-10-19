
## Decimal to any Rational or Irrational Base Converter

>I started this as a joke among friends, telling that converting numbers to other integer bases is for n00bs, while an actual coder at least converts numbers to more complex bases like pi (or π or however you wish to spell it in your language), so they dared me proving I was better.

>And I did it in few hours, discovering that what I started as a joke actually has some math ground and application (particularly the conversion to base pi, it seems).

>That said, now I am daring you to do the same, that is to build a function so that it takes a number (any number, you are warned!) and optionally the number of decimals (default: 0) and a base (default: pi), returning the proper conversion as a string:

>Note In Java there is no easy way with optional parameters so all three parameters will be given; the same in C# because, as of now, the used version is not known.
```
converter(13) #returns '103'
converter(13,3) #returns '103.010'
converter(-13,0,2) #returns '-1101'
```

>I know most of the world uses a comma as a decimal mark, but as English language and culture are de facto the Esperanto of us coders, we will stick to our common glorious traditions and uses, adopting the trivial dot (".") as decimal separator; if the absolute value of the result is <1, you have of course to put one (and only one) leading 0 before the decimal separator.

>Finally, you may assume that decimals if provided will always be >= 0 and that no test base will be smaller than 2 (because, you know, converting to base 1 is pretty lame) or greater than 36; as usual, for digits greater than 9 you can use uppercase alphabet letter, so your base of numeration is going to be: '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'.

### First Attempt
This attempt was an effort at digitizing the standard process of flat dividing numbers by there bases and using the remainders as power series co-effecients. It worked for a substantial amount of tests, but (especially around pi) it tended to struggle with substantial decimals.
```ruby
$pi = Math::PI

def test_converter(n,decimals=0,base=$pi)
  polarity = n>=0 ? "" : "-"
  n = n*(-1) if n<0
  n *= base**decimals
  extended_num = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  conversion = ""
  while true
    conversion << extended_num[(n % base)].to_s
    puts n
    puts "remainder: #{n % base}"
    break if n/base < 1
    n = (n / base)
  end
  conversion.reverse!
  conversion.insert(-(decimals+1),'.') if decimals!=0
  return polarity+conversion
end
```

### Second (successfull) attempt

After a sad fifteen minutes of realising I shold abandon ship on the last solution, this solution was a attempt to automate the Rényi Greedy algorithm
for beta-expansion.

```ruby
$pi=Math::PI #just to be sure we all use the same number of digits

def converter(n, decimals=0, base=$pi)
  renyiGreedy(n,base,decimals)
end

def kFind(n,base)
  k = 0
  loop{
    break if base**(k+1).to_i > n
    k += 1 
  }
  return k
end


def renyiGreedy(n,base=$pi, decimal=0)

$extended_num = {
  '0'=> 0, '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=>5, '6'=>6, 
  '7'=>7,'8'=>8,'9'=>9, 'A'=>10, 'B'=>11,'C'=>12,'D'=>13,'E'=>14,
  'F'=>15,'G'=>16,'H'=>17,'I'=>18,'J'=>19,'K'=>20,'L'=>21,'M'=>22,
  'N'=>23,'O'=>24,'P'=>25,'Q'=>26,'R'=>27,'S'=>28,'T'=>29,'U'=>30,
  'V'=>31,'W'=>32,'X'=>33,'Y'=>34,'Z'=>35 
  }

  $extended_num_str = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  polarity = n>=0 ? "" : "-"
  n = (-1)*n if n<0
  k = kFind(n,base)
  d_k = (n/base**k).to_i
  tot = 0
  js = []
  (decimal*-1).upto(k){|x|js<<x}
  js.reverse!
  output = '0'*js.length
  
  js.each.with_index{|j,ind|
    0.upto(base){|d_cand| output[ind] = $extended_num_str[d_cand] if d_cand*base**j+tot <= n}
    tot += $extended_num[output[ind]].to_i*base**j 
  }
  output.insert((-1)*decimal-1,'.') if decimal!= 0
  return polarity + output
end
```


```ruby
class User
  attr_accessor :progress
  attr_accessor :rank

def initialize()
  @rank = -8
  @progress = 0
end
  
def over_0?(x,y)
  return true if ((x>0 and y<0) or (y>0 and x<0))
  return false
end

def relative_exp(act_rank)
##fix over_0 case returns
  if over_0?(act_rank,@rank)
    return 10*(act_rank-@rank-1)**2 if act_rank-@rank > 0
    return 1 if act_rank-@rank == 0
    return 0 if act_rank-@rank < 0 
  else
    return 10*(act_rank-@rank)**2 if act_rank-@rank > 0 
    return 3 if act_rank-@rank == 0
    return 1 if act_rank-@rank == -1
    return 0 if act_rank-@rank < -1 
  end
end

def valid_act(act_rank)
 raise "Out of bounds" if act_rank > 8 or act_rank < -8 or act_rank == 0
end
def inc_progress(act_rank)
puts "rank #{@rank}"
puts "Act_rank#{act_rank}"
puts "progress: #{@progress}"
  valid_act(act_rank)
  if @rank < 8
  puts "relative exp"
  puts relative_exp(act_rank)
    exp = relative_exp(act_rank) + @progress
    (exp/100).times{rank_up} if @rank < 8
    @progress = exp % 100 if @rank < 8
  end
puts "progress after: #{@progress}"
puts "rank after: #{@rank}"
end


def rank_up()
if @rank != 8
  @rank += @rank != -1 ? 1 : 2
  @progress = 0
end
end


end
```


```ruby
class User
  attr_accessor :progress
  attr_accessor :rank

def initialize()
  @rank = -8
  @progress = 0
end
  
def over_0?(x,y)
  return true if (x>0 and y<0) or (y<0 and x>0) 
end

def relative_exp(act_rank)
  if over_0?(act_rank,@rank)
    return 10*(act_rank-@rank-1)**2 if act_rank-@rank > 0
    return 1 if act_rank-@rank == 0
    return 0 if act_rank-@rank < 0 
  else
    return 10*(act_rank-@rank)**2 if act_rank-@rank > 0 
    return 3 if act_rank-@rank == 0
    return 1 if act_rank-@rank == -1
    return 0 if act_rank-@rank < -1 
  end
end

def valid_act(act_rank)
 raise "Out of bounds" if act_rank > 8 or act_rank < -8 or act_rank == 0
end
def inc_progress(act_rank)
puts "rank #{@rank}"
puts "Act_rank#{act_rank}"
puts "progress: #{@progress}"
  valid_act(act_rank)
  if @rank < 8
    exp = relative_exp(act_rank) + @progress
    (exp/100).times{rank_up} if @rank < 8
    @progress = exp % 100 if @rank < 8
  end
puts "rank #{@rank}"
puts "Act_rank#{act_rank}"
puts "progress: #{@progress}"
end


def rank_up()
if @rank != 8
  @rank += @rank != -1 ? 1 : 2
  @progress = 0
end
end


end
```

```ruby
class User
  attr_accessor :progress
  attr_accessor :rank

def initialize()
  @rank = -8
  @progress = 0
end
  
def over_0?(x,y)
  return true if ((x>0 and y<0) or (y>0 and x<0))
  return false
end

def relative_exp(act_rank)
##fix over_0 case returns
  if over_0?(act_rank,@rank)
    return 10*(act_rank-@rank-1)**2 if act_rank-@rank > 0
    return 1 if act_rank-@rank + 1 == -1
    return 0 if act_rank-@rank < -1 
  else
    return 10*(act_rank-@rank)**2 if act_rank-@rank > 0 
    return 3 if act_rank-@rank == 0
    return 1 if act_rank-@rank == -1
    return 0 if act_rank-@rank < -1 
  end
end

def valid_act(act_rank)
 raise "Out of bounds" if act_rank > 8 or act_rank < -8 or act_rank == 0
end
def inc_progress(act_rank)
  valid_act(act_rank)
  if @rank < 8
    exp = relative_exp(act_rank) + @progress
    (exp/100).times{rank_up} if @rank < 8
    @progress = exp % 100 if @rank < 8
  end
end


def rank_up()
if @rank != 8
  @rank += @rank != -1 ? 1 : 2
  @progress = 0
end
end


end
```

to do

Codewars style ranking system

Pick peaks

Decode the Morse code, advanced

Ten-Pin Bowling

Binary multiple of 3

Make a spiral