def echo(insert1)
insert1
end

def shout(insert2)
  insert2.upcase
end

def repeat(insert3, nomer = 2)
  array = []
  (1..nomer).each { array.push(insert3) }
  array.join(" ")
end

def start_of_word(word1, num)
   word1[0..num - 1]
end

def first_word (word2)
  word2.split(" ").first
end
def titleize(word3)
    word3.capitalize!
    words = word3.split(" ")
    words.each do |x|
      x.capitalize! unless ["the", "and", "over"].include? x
    end
    words.join(" ")
end