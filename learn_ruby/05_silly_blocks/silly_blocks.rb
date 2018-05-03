def reverser(&blo)
  words = yield.split(" ")
  transformed_words = words.inject(""){ |sum, word| sum += word.reverse + " "}
  transformed_words.strip
end

def adder(num=1, &blo)
  yield + num
end

def repeater(num=1, &blo)
  num.times { yield }
end