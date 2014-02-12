require 'benchmark'

###############
### Setup!
###############

arr = (1..500).to_a.shuffle

class Array

  def bubble_sort
    return self if self.size <= 1 # an array of size 1 is already sorted
    swapped = true
    while swapped do
      swapped = false
      1.upto(self.size-1) do |i|
        if self[i-1] > self[i]
          self[i-1], self[i] = self[i], self[i-1] #this swaps them
          swapped = true #remember there was a swap
        end
      end    
    end
    self
  end

  # wiki psudo code
  # function quicksort(array)
  #    if length(array) ≤ 1
  #        return array  // an array of zero or one elements is already sorted
  #    select and remove a pivot element pivot from 'array'  // see '#Choice of pivot' below
  #    create empty lists less and greater
  #    for each x in array
  #        if x ≤ pivot then append x to less
  #        else append x to greater
  #    return concatenate(quicksort(less), list(pivot), quicksort(greater)) // two recursive calls
  #


  def quick_sort

    if self.length <= 1
      return self
    else
   
      pivot = self.slice!(0)
      
      less, greater = [], []
      
      self.each do |x|
        x <= pivot ? less.push(x) : greater.push(x)
      end
    
    return less.quick_sort + [pivot] + greater.quick_sort
  
  end

  end
  
end

###############
### Thunderdome
###############
puts "Ready, steady, Go!"
# http://www.ruby-doc.org/stdlib-1.9.3/libdoc/benchmark/rdoc/Benchmark.html
# http://rubylearning.com/blog/2013/06/19/how-do-i-benchmark-ruby-code/

iterations = 10 # Run the test mutliple iterations to make sure we get a meaningful number.

# (10) is padding for headers so we get nice looking output
Benchmark.bmbm(10) do |bm|
  # The times for some benchmarks depend on the order in which items are run. 
  # These differences are due to the cost of memory allocation and garbage collection.
  # To avoid these discrepancies, the bmbm method is provided. 
  # `bmbm` first runs the code as a 'rehearsal' to force any initialization that needs to happen and 
  # and ensure that the system is fully initialized and the benchmark is fair.

  bm.report("Bubble") do
    iterations.times do
      arr.dup.bubble_sort #My bubble sort is destructive so I am using the .dup to make a duplicate before we sort
    end
  end

# Uncomment the code below when you are ready!
  bm.report("Quick") do
    iterations.times do
      arr.dup.quick_sort
    end
  end

  bm.report("Ruby") do
    iterations.times do
      arr.dup.sort
    end
  end

end