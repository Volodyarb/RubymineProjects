def add(a,b)
  a + b
end
def subtract(a,b)
  a - b
end
def sum(array)
  sum = 0
  array.each do |x|
    sum += x
  end
  sum
end

def multiply(*numbers)
    numbers.inject(1, :*)
end

def power(base, exp)
  base**exp
end

def factorial(num)
  product = 1
  while num >= 1
    product *= num
    num -= 1
  end
  product
end