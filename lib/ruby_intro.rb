# frozen_string_literal: true

# Part 1

def sum(arr)
  # Alternatively, use built in summation: total = arr.sum
  total = 0
  arr.each {|v| total = total + v}
  return total
end

def max_2_sum(arr)
  sum = 0
  if arr.length == 0
    return sum
  elsif arr.length == 1
    return arr[0]
  else
    arr.max(2).each {|v| sum = sum + v}
  end
  return sum
end

def sum_to_n?(arr, number)
  if arr.length <= 1
    return false
  else
    sorted = arr.sort
    sortLen = sorted.length - 1
    # print "#{sorted} and #{number}\n"
    sorted.each.with_index() do |v1,idx1|
      sorted.reverse_each.with_index() do |v2, idx2|
        sum = v1 + v2
        idx2 = sortLen - idx2
        # print "#{v1}(#{idx1}) + #{v2}(#{idx2}) = #{sum}\n"
        if sum < number
          break
        elsif idx1 == idx2
          break
        elsif sum == number
          return true
        end
      end
    end
  end
  return false
end

# Part 2

def hello(name)
  "Hello, "+ name
end

def starts_with_consonant?(string)
  if string.length == 0
    return false
  end
  
  vowelsASCII = [65, 97, 69, 101, 73, 105, 79, 111, 85, 117]
  num = string[0].bytes[0]
  # print "Num: #{num}\n"
  
  if 65 <= num && num <= 122
    if vowelsASCII.include?(num)
      return false
    else
      return true
    end
  end
  
end

def binary_multiple_of_4?(string)
  # puts "\n"+string
  origArr = string.split("")
  # print "Original array: #{origArr}\n"
  # print "Reversed: #{origArr.reverse}\n"
  if (origArr - ["0","1"]).length > 0
    return false
  elsif origArr.length == 1 && origArr[0] == "0"
    return true
  end
  origArr.reverse_each.with_index() do |v, idx|
    # print "#{v} at idx:#{idx}\n"
    if v == "1"
      if idx == 0
        return false
      elsif idx >= 2
        return true
      end
    end
  end
  return false
end

# Part 3

# Object representing a book
class BookInStock
  def initialize(newIsbn, newPrice)
    print "ISBN: #{newIsbn} is #{newIsbn.class} \n"
    print "Price: #{newPrice} is #{newPrice.class}\n"
    if newIsbn.class != String
      raise ArgumentError
    elsif newIsbn.length == 0
      raise ArgumentError
    elsif (newPrice.is_a? Numeric) != true
      raise ArgumentError
    elsif Float(newPrice) <= 0.00
      raise ArgumentError
    end

    @isbn = newIsbn
    @price = newPrice
    print "ACCEPTED\n\n"
  end

  def price_as_string
    return "$%0.2f"%[@price]
  end
  
  def isbn
    return @isbn
  end
  def isbn=(newIsbn)
    @isbn = newIsbn
  end

  def price
    return @price
  end
  def price=(newPrice)
    @price = newPrice
  end
end
