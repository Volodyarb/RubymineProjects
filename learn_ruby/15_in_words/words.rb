class Fixnum
  def in_words
    number = self
    return "zero" if number == 0
    num_string = ""
    thousand = number / 1000
    if thousand == 0
      num_string = extract_digits(number)
    elsif thousand < 999
      num_string = get_thousand_digits(number)
    elsif thousand < 999999
      num_string = get_millions_digits(number)
    elsif thousand < 999999999
      num_string = get_billions_digits(number)
    else
      num_string = get_trillions_digits(number)
    end
    num_string
  end
  def extract_digits(number)
    digits = number.to_s.split('').size
    num_string = ""
    num_string = case digits
                 when 1
                   get_ones_digit(number)
                 when 2
                   get_tens_digits(number)
                 else
                   get_hundred_digits(number)
                 end
    num_string
  end
  def get_ones_digit(number)
    return "" if number == 0
    ones_place = %w{one two three four five six seven eight nine}
    ones_place[number-1]
  end
  def get_tens_digits(number)
    return "" if number == 0
    teenagers = %w{ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen}
    tens_place = %w{ten twenty thirty forty fifty sixty seventy eighty ninety}
    num_string = ""
    left_digit = number / 10
    right_digit = number % 10
    if left_digit == 1
      num_string = teenagers[number%10]
    else
      num_string = tens_place[(number/10)-1]
      unless right_digit == 0
        num_string = num_string + " " + get_ones_digit(number%10)
      end
    end
    num_string
  end
  def get_hundred_digits(number)
    hundred, *tens = number.to_s.split('')
    tens = tens.join.to_i
    num_string = get_ones_digit(hundred.to_i)
    if tens == 0
      num_string += " hundred"
    else
      num_string += " hundred " + get_tens_digits(tens)
    end
    num_string
  end
  def get_thousand_digits(number)
    thousand = number/1000
    hundred  = number%1000
    thousand_string = ""
    hundred_string = ""
    thousand_string = extract_digits(thousand) + " thousand" if thousand > 0
    hundred_string = " " + extract_digits(hundred) if hundred > 0
    thousand_string + hundred_string
  end
  def get_millions_digits(number)
    million  = number/1000000
    thousand = number%1000000
    million_string = ""
    million_string = extract_digits(million) + " million" if million > 0
    thousand_string = ""
    if thousand > 999
      thousand_string = " " + get_thousand_digits(thousand)
    else
      thousand_string = get_thousand_digits(thousand)
    end

    million_string + thousand_string
  end
  def get_billions_digits(number)
    billion = number/1000000000
    million = number%1000000000
    billion_string = ""
    billion_string = extract_digits(billion) + " billion" if billion > 0
    million_string = ""
    if million > 999
      million_string = " " + get_millions_digits(million)
    else
      million_string = get_millions_digits(million)
    end
    billion_string + million_string
  end
  def get_trillions_digits(number)

    trillion = number/1000000000000
    billion  = number%1000000000000
    trillion_string = ""
    trillion_string = extract_digits(trillion) + " trillion"
    billion_string = ""
    if billion > 999
      billion_string = " " + get_billions_digits(billion)
    else
      billion_string = get_billions_digits(billion)
    end
    trillion_string + billion_string
  end
end