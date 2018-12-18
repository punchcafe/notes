puzzle = [[5,2,6,1,7,9,3,8,4],
          [6,3,2,1,9,5,0,0,0],
          [0,9,8,0,0,0,0,6,0],
          [8,0,0,0,6,0,0,0,3],
          [4,0,0,8,0,3,0,0,1],
          [7,0,0,0,2,0,0,0,6],
          [0,6,0,0,0,0,2,8,0],
          [0,0,0,4,1,9,0,0,5],
          [0,6,2,4,3,0,5,0,7]]

puzzle2 = [[0,6,2,4,3,0,5,0,7],
          [0,6,2,4,3,0,5,0,7],
          [0,6,2,4,3,0,5,0,7],
          [0,6,2,4,3,0,5,0,7],
          [0,6,2,4,3,0,5,0,7],
          [0,6,2,4,3,0,5,0,7],
          [0,6,2,4,3,0,5,0,7],
          [0,6,2,4,3,0,5,0,7],
          [0,6,2,4,3,0,5,0,7]]


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

veryeasy =   
  [[5,3,0,0,0,8,9,0,2],
  [6,7,2,0,9,5,0,0,0],
  [1,0,8,3,4,0,5,6,0],
  [8,5,9,0,6,0,0,0,3],
  [4,2,0,8,0,3,7,9,0],
  [7,1,0,0,2,0,8,5,6],
  [9,6,1,5,0,7,0,0,4],
  [2,8,0,4,1,9,0,3,5],
  [3,0,5,0,8,0,1,0,9]]

nearly_right = 
 [[5,3,4,6,7,8,9,1,2],
  [6,7,2,1,9,5,3,4,8],
  [1,9,8,3,4,2,5,6,7],
  [8,5,9,7,6,1,4,2,3],
  [4,2,6,8,5,3,7,9,1],
  [7,1,3,9,2,4,8,5,6],
  [9,6,1,5,3,7,2,8,4],
  [2,8,7,4,1,9,6,8,5],
  [3,4,5,2,8,6,8,7,9]]

class Puzzle

  def initialize(puzzle)
    @puzzle = puzzle
    @missing_elements = []
    @perms = []
    @soln_rows = []
    @max_increment = []
    @solution = []
    strip
    makePerms
    makeSolns
    puts ""
    #print @missing_elements
    puts""
    #print @perms
    @soln_rows.each.with_index{|x,ind|
    puts ""
    puts "Row #{ind+1} yo"
    puts""
    print x
    }
    puts""
    setMaxIncrement
    #print incrementer([5,5,5,5,5,4,5,5,5],@soln_rows)
    print placementSolnConversion([5,5,5,5,5,4,5,5,5])
    incrementLoop
    puts ""
    @solution.each{|x|
      print x
      print "\n"
    }
    
    #incrementer(@soln_rows)    
  end

  def genSoln
  end

  private 

  def strip
    @puzzle.each{|x|
      to_insert = [1,2,3,4,5,6,7,8,9]
      x.each{|i|
        #puts i
        to_insert.delete(i) if to_insert.include?(i)
        #print to_insert
      }
      @missing_elements << to_insert.sort.join
    }
  end

def permutations(cand)
  perm_list = []
  cand.each_char.with_index{|insert,ind|
    if ind == 0
      perm_list << insert
    else
      new_perm = []
      perm_list.each{|x|
        x.each_char.with_index{|y,ind|
          new_perm << (x*1).insert(ind,insert)
        }
        new_perm << ((x*1)<<insert)
      }
      perm_list = new_perm
    end
  }
  perm_list.sort!
  return perm_list
end

def makePerms()
  @missing_elements.each{|x|
  @perms << permutations(x)
  }
end

def makeSolns()
  soln_rows = []
  @perms.each.with_index{|x,ind|
    solns=[]
    solns << @puzzle[ind] if x.length == 0
    x.each{|a_perm|
      temp_perm = a_perm*1
      indi_soln = []
      @puzzle[ind].each{|p_i|
      if p_i == 0
        indi_soln << temp_perm[0].to_i
        temp_perm.slice!(0)
      else
        indi_soln << p_i.to_i
      end
      }
      solns << indi_soln
    }
    soln_rows << solns 
  }
  @soln_rows = soln_rows
end

"""
def add_one(soln_rows,placement=[],index=-1)
  soln_rows.length().times{placement << 0} if placement == []
  result = placement*1
  if placement[index] < (soln_rows[index].length-1)
    result[index] += 1
  else 
    add_one(soln_rows,placement=placement,index=index-1)
  end 
  print placement
end
"""

#brute forcing different combinations 

def setMaxIncrement(soln_rows=@soln_rows)
  index_max = 0
  soln_rows.each{|soln_row|
    @max_increment << (soln_row.length-1)
  }
  print "this is the max increment: "
  print @max_increment
end

def incrementer(placement,soln_rows=@soln_rows,index=-1)
  if placement == @max_increment 
    placement = "end"
    return placement
  end
  insert_index = index
  if placement[insert_index] >= (soln_rows[index].length-1)
    placement[insert_index] = 0
    incrementer(placement,soln_rows,index=insert_index-1) 
  else
    placement[insert_index] += 1
    end
  return placement
end

def placementSolnConversion(placement)
  soln = []
  placement.each.with_index{|x,ind|
  soln << @soln_rows[ind][x]
  }
  return soln
end

def incrementLoop
  permutation = []
  @soln_rows.length.times{permutation << 0}
  while permutation != "end"
    if iscorrect?(placementSolnConversion(permutation))
      @solution = placementSolnConversion(permutation)
      print permutation 
      break
    end
    #puts iscorrect?(placementSolnConversion(permutation))
    #print ": #{permutation}"
    permutation = incrementer(permutation.clone)
  end
end





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
        #diagnostics >>
        puts x.to_s+", "+y.to_s+": "+soln[y][x].to_s+" => "+ (soln[y][x] == cell and !((y == j) and (x == i))).to_s if diag == true
        #<< diagnostics 
        return false if (soln[y][x] == cell and !((y == j) and (x == i)))
        }
      }
      return false if !(1..9).to_a.include?(cell)

      temp_row = row*1
      temp_row.slice!(i)
      if temp_row.include?(cell)
        return false
      end

      temp_verts = soln*1
      temp_verts.slice!(j)
      temp_verts.each{|x
|        return false if x[i] == cell
      }
  }  
  }
  return true
end
end
"""
try_2 = [
  [5, 6, 1, 8, 4, 7, 9, 2, 3], 
  [3, 7, 9, 5, 2, 1, 6, 8, 4], 
  [4, 2, 8, 9, 6, 3, 1, 7, 5], 
  [6, 1, 3, 7, 8, 9, 5, 4, 2], 
  [7, 9, 4, 6, 5, 2, 3, 1, 8], 
  [8, 5, 2, 1, 3, 4, 7, 9, 6], 
  [9, 3, 5, 4, 7, 8, 2, 6, 1], 
  [1, 4, 6, 2, 9, 5, 8, 3, 7], 
  [2, 8, 7, 3, 1, 6, 4, 5, 9]]
"""
#iscorrect?(try_2, diag=true)
#print iscorrect?(puzzle)
#print iscorrect?(correct)
poozzle = Puzzle.new(veryeasy)
#poozzle.strip 

=begin

refactor, write a blog
  
so this needs dynamic programming. any index which is stopped can be discarded, i.e. [2,3,4,X,X,X,X,X]
if the issue occurs at 2 and 4, we can simply discard all 2,3,4,x,x,x,x boys.
or instead test from the bottom up [1,X,X,X,X,X,X], [1,1,X,X,X,X,X], as soon as you get an error you change the increment before by one,
so:
[1,1,X,X,X,X,X] safe [1,1,1,X,X,X] safe [1,1,1,1,1,X,X] not safe, so change 1 to 2 => [1,1,1,1,2,X,X] => [1,1,1,1,2,1,X]. we can ignore all other combinations
of [1,1,1,1,1,X,X]
  [1,2,X,X,X,X,X] safe [1,3,X,X,X,X,X] safe 

  change iscorrect to true and partially true
  
consider locking in guaranteed numbers
=end