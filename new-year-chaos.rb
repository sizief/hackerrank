#!/bin/ruby

require 'json'
require 'stringio'

# Complete the minimumBribes function below.
def minimumBribes(q)
  count = 0
  q.each_with_index do |element, index|
    return 'Too chaotic' if element-index-1>2
    start_index = index < 100 ? 0 : index-100

    (start_index..index-1).each do |x|
      count +=1 if q[x] > element
    end
  end 
  count
end

  
arr =[]
File.foreach('test_data/new-year-chaos') {|x| arr = x.split(' ').map(&:to_i) }
puts minimumBribes arr
