class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    t = Time.new(0) + seconds
    t.asctime.split(" ")[3]
  end
end