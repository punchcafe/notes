Kata-November

## Sudoku Solver
>Write a function that will solve a 9x9 Sudoku puzzle. The function will take one argument consisting of the 2D puzzle array, with the value 0 representing an unknown square.

>The Sudokus tested against your function will be "easy" (i.e. determinable; there will be no need to assume and test possibilities on unknowns) and can be solved with a brute-force approach.

```ruby
puzzle = [[5,3,0,0,7,0,0,0,0],
          [6,0,0,1,9,5,0,0,0],
          [0,9,8,0,0,0,0,6,0],
          [8,0,0,0,6,0,0,0,3],
          [4,0,0,8,0,3,0,0,1],
          [7,0,0,0,2,0,0,0,6],
          [0,6,0,0,0,0,2,8,0],
          [0,0,0,4,1,9,0,0,5],
          [0,0,0,0,8,0,0,7,9]]
sudoku(puzzle)
# Should return
 [[5,3,4,6,7,8,9,1,2],
  [6,7,2,1,9,5,3,4,8],
  [1,9,8,3,4,2,5,6,7],
  [8,5,9,7,6,1,4,2,3],
  [4,2,6,8,5,3,7,9,1],
  [7,1,3,9,2,4,8,5,6],
  [9,6,1,5,3,7,2,8,4],
  [2,8,7,4,1,9,6,3,5],
  [3,4,5,2,8,6,1,7,9]]
```
### Methodology
establish all permutations of each row, using availible numbers.
can use septembers version to do this with other numbers removed, and then re slot them in.
brute force comparing each permutation until finsing a winner
[firstrowpems[1],2,1,6,32,1,77,19,9] where each element is 
establish checker function to see if array is correct.

### My solution

```ruby
puzzle = [[5,3,0,0,7,0,0,0,0],
          [6,0,0,1,9,5,0,0,0],
          [0,9,8,0,0,0,0,6,0],
          [8,0,0,0,6,0,0,0,3],
          [4,0,0,8,0,3,0,0,1],
          [7,0,0,0,2,0,0,0,6],
          [0,6,0,0,0,0,2,8,0],
          [0,0,0,4,1,9,0,0,5],
          [0,0,0,0,8,0,0,7,9]]


correct =  [[5,3,4,6,7,8,9,1,2],
  [6,7,2,1,9,5,3,4,8],
  [1,9,8,3,4,2,5,6,7],
  [8,5,9,7,6,1,4,2,3],
  [4,2,6,8,5,3,7,9,1],
  [7,1,3,9,2,4,8,5,6],
  [9,6,1,5,3,7,2,8,4],
  [2,8,7,4,1,9,6,3,5],
  [3,4,5,2,8,6,1,7,9]]
def sudoku(puzzle)



end
def iscorrect?(soln)
  issoln = true
  soln.each.with_index{|row,i|
    row.each.with_index{|cell,j|
      
      return false if !(1..9).to_a.include?(cell)

      temp_row = row*1
      temp_row.slice!(j)
      if temp_row.include?(cell)
        return false
      end

      temp_verts = soln*1
      temp_verts.slice!(i)
      temp_verts.each{|x|
      return false if x[j] == cell
      }

      #position block = i/3 , j/3
      # i*3-(i*3+3)
      #pos.upto(newpos)

      #puts temp_row.include?(cell)
  }
  return true
  }
end

print iscorrect?(puzzle)
print iscorrect?(correct)
```

def iscorrect?(soln)
  issoln = true
  soln.each.with_index{|row,j|
    row.each.with_index{|cell,i|
      
      return false if !(1..9).to_a.include?(cell)

      temp_row = row*1
      temp_row.slice!(i)
      if temp_row.include?(cell)
        return false
      end

      temp_verts = soln*1
      temp_verts.slice!(j)
      temp_verts.each{|x|
        return false if x[i] == cell
      }

        ((j/3)*3).upto(((j/3)*3)+2){|y|
        ((i/3)*3).upto(((i/3)*3)+2){|x|
        puts x.to_s+", "+y.to_s
        }
      }


def iscorrect?(soln)
  issoln = true
  soln.each.with_index{|row,j|
    row.each.with_index{|cell,i|
      
      return false if !(1..9).to_a.include?(cell)

      temp_row = row*1
      temp_row.slice!(i)
      if temp_row.include?(cell)
        return false
      end

      temp_verts = soln*1
      temp_verts.slice!(j)
      temp_verts.each{|x|
        return false if x[i] == cell
      }
      puts j
      #((j/3)*3).upto(((j/3)*3)+2){|y|
      #  puts y
        #((i/3)*3).upto(((i/3)*3)+2){|x|
        #puts x.to_s+", "+y.to_s
        #}
      #}
      #position block = i/3 , j/3
      # i*3-(i+1)*3
      #pos.upto(newpos)

      #puts temp_row.include?(cell)
  }

def iscorrect?(soln)
  issoln = true
  soln.each.with_index{|row,j|
    row.each.with_index{|cell,i|
      
      return false if !(1..9).to_a.include?(cell)

      temp_row = row*1
      temp_row.slice!(i)
      if temp_row.include?(cell)
        return false
      end

      temp_verts = soln*1
      temp_verts.slice!(j)
      temp_verts.each{|x|
        return false if x[i] == cell
      }

      puts "new cell"
      ((j/3)*3).upto(((j/3)*3)+2){|y|
        ((i/3)*3).upto(((i/3)*3)+2){|x|
        puts x.to_s+", "+y.to_s
        }
      }
      #position block = i/3 , j/3
      # i*3-(i+1)*3
      #pos.upto(newpos)

      #puts temp_row.include?(cell)
  }
  
  }
  return true
end



**** newer

puzzle = [[5,3,0,0,7,0,0,0,0],
          [6,0,0,1,9,5,0,0,0],
          [0,9,8,0,0,0,0,6,0],
          [8,0,0,0,6,0,0,0,3],
          [4,0,0,8,0,3,0,0,1],
          [7,0,0,0,2,0,0,0,6],
          [0,6,0,0,0,0,2,8,0],
          [0,0,0,4,1,9,0,0,5],
          [0,0,0,0,8,0,0,7,9]]


correct =   
  [[5,3,4,6,7,8,9,1,2],
  [6,7,2,1,9,5,3,4,8],
  [1,9,8,3,4,2,5,6,7],
  [8,5,9,7,6,1,4,2,3],
  [4,2,6,8,5,3,7,9,1],
  [7,1,3,9,2,4,8,5,6],
  [9,6,1,5,3,7,2,8,4],
  [2,8,7,4,1,9,6,3,5],
  [3,4,5,2,8,6,1,7,9]]
nearly_right = 
 [[5,3,4,6,7,8,9,1,2],
  [6,3,2,1,9,5,3,4,8],
  [1,9,8,3,4,2,5,6,7],
  [8,5,9,7,6,1,4,2,3],
  [4,2,6,8,5,3,7,9,1],
  [7,1,3,9,2,4,8,5,6],
  [9,6,1,5,3,7,2,8,4],
  [3,8,7,4,1,9,6,3,5],
  [3,4,5,2,8,6,1,7,9]]

def iscorrect?(soln, diag=false)
  soln.each.with_index{|row,j|
    row.each.with_index{|cell,i|
      



      if diag == true
        puts "new cell: "+i.to_s+", "+j.to_s+" :"+soln[j][i].to_s 
        puts "index range: "
        print "x : "
        ((i/3)*3).upto(((i/3)*3)+2).each{|x| print x.to_s+" "}
        puts ""
        print "y : "
        ((j/3)*3).upto(((j/3)*3)+2).each{|x| print x.to_s+" "}
        puts ""
      end 

      ((j/3)*3).upto(((j/3)*3)+2){|y|
        ((i/3)*3).upto(((i/3)*3)+2){|x|
        puts x.to_s+", "+y.to_s+": "+soln[y][x].to_s+" => "+ (soln[y][x] == cell and ((y != j) and (x != i))).to_s if diag == true
        puts "uh-oh!" if soln[y][x] == cell and ((y != j) and (x != i)) if diag == true
        return false if soln[y][x] == cell and ((y != j) and (x != i))
        }
      }
      return false if !(1..9).to_a.include?(cell)
"""
      temp_row = row*1
      temp_row.slice!(i)
      if temp_row.include?(cell)
        return false
      end

      temp_verts = soln*1
      temp_verts.slice!(j)
      temp_verts.each{|x|
        return false if x[i] == cell
      }
"""
  }
  
  }
  return true
end

even newer

nearly_right = 
 [[5,3,4,6,7,8,9,1,2],
  [6,7,2,1,9,5,3,4,8],
  [1,9,8,3,4,2,5,6,7],
  [8,5,9,7,6,1,4,2,3],
  [4,2,6,8,5,3,7,9,1],
  [7,1,3,9,2,4,8,5,6],
  [2,6,1,5,3,7,2,8,4],
  [2,8,7,4,1,9,6,3,5],
  [3,4,5,2,8,6,1,7,9]]

def iscorrect?(soln, diag=false)
  soln.each.with_index{|row,j|
    row.each.with_index{|cell,i|
      


    # diagnostics
      if diag == true
        puts ""
        puts "new cell: "+i.to_s+", "+j.to_s+" :"+soln[j][i].to_s 
        puts "index range: "
        print "x : "
        ((i/3)*3).upto(((i/3)*3)+2).each{|x| print x.to_s+" "}
        puts ""
        print "y : "
        ((j/3)*3).upto(((j/3)*3)+2).each{|x| print x.to_s+" "}
        puts ""
      end 

      ((j/3)*3).upto(((j/3)*3)+2){|y|
        ((i/3)*3).upto(((i/3)*3)+2){|x|
        puts x.to_s+", "+y.to_s+": "+soln[y][x].to_s+" => "+ (soln[y][x] == cell and !((y == j) and (x == i))).to_s if diag == true
        puts "uh-oh!" if (soln[y][x] == cell and !((y == j) and (x == i))) and diag == true
        return false if (soln[y][x] == cell and !((y == j) and (x == i)))
        }
      }
      return false if !(1..9).to_a.include?(cell)
"""
      temp_row = row*1
      temp_row.slice!(i)
      if temp_row.include?(cell)
        return false
      end

      temp_verts = soln*1
      temp_verts.slice!(j)
      temp_verts.each{|x|
        return false if x[i] == cell
      }
"""
  }
  
  }
  return true
end
