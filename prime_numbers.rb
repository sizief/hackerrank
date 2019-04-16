
def loop_in_loop a
  res =[]
  not_prime =0;
  (2..a.to_i).each do |i|
    (2..a.to_i).each do |j| 
      next if i == j
      not_prime = 1 if i % j == 0
    end
    res.push(i) if not_prime ==0
    not_prime = 0
  end
  res
end

def aristo a
  res = []

  (0..a).each {|x| res.push x}
  
  (0..a).each do |el|
    next if [0,1].include? el
    j = 2*el
    while j <= a
      res[j] = 0
      j += el
    end
  end
  res.uniq
end

a = ARGV[0] #gets.chomp.to_i
puts loop_in_loop a
#puts aristo a.to_i

