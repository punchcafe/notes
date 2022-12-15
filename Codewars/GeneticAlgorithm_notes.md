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






      def run fitness, length, p_c, p_m, iterations=100
    population = []
    fitnesses = []
    new_population = []
    100.times{
      new_chromosome = generate(length)
      population <<  new_chromosome
      fitnesses << fitness(new_chromosome)
    }
    puts population
    puts fitnesses
    puts "first"
    iterations.times{
      50.times{
      pair = select(population,fitnesses)
      puts "selected pair: #{pair[0]} and #{pair[1]}"
      pair = crossover(pair[0],pair[1]) if rand(0..1) > p_c
      pair.each{|x|
        new_population << mutate(x,p_m)
      }
      }
      population = new_population*1
      fitnesses = []
      population.each{|x| fitnesses << fitness(x)}
      new_population = []
    }
    puts population
    puts fitnesses
    puts "end"


  end

    def run fitness, length, p_c, p_m, iterations=100
    population = []
    fitnesses = []
    new_population = []
    100.times{
      new_chromosome = generate(length)
      population <<  new_chromosome
      fitnesses << fitness(new_chromosome)
    }
    puts population
    puts fitnesses
    puts "first"
    iterations.times{
      50.times{
      pair = select(population,fitnesses)
      puts "selected pair: #{pair[0]} and #{pair[1]}"
      pair = crossover(pair[0],pair[1]) if rand(0..1) > p_c
      pair.each{|x|
        new_population << mutate(x,p_m)
      }
      }
      population = new_population*1
      fitnesses = []
      population.each{|x| fitnesses << fitness(x)}
      new_population = []
    }
    puts population
    puts fitnesses
    puts "end"
    puts fitnesses.index(fitnesses.compact.max)
    puts fitnesses.compact.max
    return population[fitnesses.index(fitnesses.compact.max)]
  end

  ---last effort---

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
      new_chromosome = generate(length)
      population <<  new_chromosome
      fitnesses << fitness(new_chromosome)
    }
    puts population
    puts fitnesses
    puts "first"
    iterations.times{
      50.times{
      pair = select(population,fitnesses)
      puts "selected pair: #{pair[0]} and #{pair[1]}"
      pair = crossover(pair[0],pair[1]) if rand(0..1) > p_c
      pair.each{|x|
        new_population << mutate(x,p_m)
      }
      }
      population = new_population*1
      fitnesses = []
      population.each{|x| fitnesses << fitness(x)}
      new_population = []
    }
    puts population
    puts fitnesses
    puts "end"
    puts fitnesses.index(fitnesses.compact.max)
    puts fitnesses.compact.max
    puts population[fitnesses.index(fitnesses.compact.max)]
  end
end
#def fitness (x)
#  return rand(0.0...1.0)
#  end
#tester = GeneticAlgorithm.new()
#tester.run(fitness(5),5,0.4,0.05)

make problem generator, (with solutions)
conversion helper function ( part of function)
fitness function (uses solutions from problem generator)
```
