class RPNCalculator

  attr_accessor :calculator

  def initialize()
    @calculator=[]
  end

  def push(x)
    @calculator << x
  end

  def value
    @calculator.last
  end

  def plus
    if @calculator.size>=2
      sum=@calculator.pop + @calculator.pop
      @calculator << sum
    else
      raise "calculator is empty"
    end
  end

  def minus
    if @calculator.size>=2
      sec=@calculator.pop
      first=@calculator.pop
      diff=first-sec
      @calculator << diff
    else
      raise "calculator is empty"
    end
  end

  def divide
    if @calculator.size>=2
      x1=@calculator.pop.to_f
      x2=@calculator.pop.to_f
      x3=x2 / x1
      @calculator << x3
    else
      raise "calculator is empty"
    end
  end

  def times
    if @calculator.size>=2
      x=@calculator.pop.to_f
      y=@calculator.pop.to_f
      z=x * y
      @calculator << z
    else
      raise "calculator is empty"
    end
  end
  def tokens(string)
    tokens = string.split(" ").map{|char|
      if char.match(/[0-9]+/) != nil # if char is a number..
        char.to_i
      else
        char.to_sym
      end
    }
tokens
  end


  def evaluate(y)
    tokens(y).each do |s|
      if s==:+
        self.plus
      elsif s==:-
        self.minus
      elsif s==:/
        self.divide
      elsif s==:*
        self.times
      else
        self.push(s)
      end
    end
    self.value
  end
end