# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
# or `Array#member` methods in your implementation.**

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

def binary_search(arr, target)
  return nil if arr.empty?

  mid_idx = arr.length / 2
  left = arr.take(mid_idx)
  right = arr.drop(mid_idx + 1)

  case target <=> arr[mid_idx]
  when -1
    binary_search(left, target)
  when 0
    return mid_idx
  else
    result = binary_search(right, target)
    if result == nil
      return nil
    else
      mid_idx + result + 1
    end
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
    self.each_with_index do |ele1, idx1|
      self.each_with_index do |ele2, idx2| 
        pair = []
        if idx2 > idx1 && ele1 + ele2 == target
          pair << idx1
          pair << idx2
        end
        pairs << pair
      end
    end
    pairs.select! { |ele| ele.length > 0 }
  end
end

# Write a recursive method that returns the first "num" factorial numbers in
# ascending order. Note that the 1st factorial number is 0!, which equals 1.  
# The 2nd factorial is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1, 1] if num == 2
  facts = factorials_rec(num -1)
  facts << facts.last * (num -1)
  facts
end

class String
  # Write a `String#shuffled_sentence_detector(other_string)` method that 
  # returns true if the words in the string can be rearranged to form the 
  # sentence passed as an argument. Words are separated by spaces.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  # STRAT
  # Split the self into words1
  # Add the words to hash = 1
  # split the other_string into words2
  # Remove -= 1 from the hash
  # check if the val == 0?

  def shuffled_sentence_detector(other_string)
    words1 = self.split
    words2 = other_string.split
    words = Hash.new(0)
    words1.each { |word| words[word] += 1 }
    words2.each { |word| words[word] -= 1 }
    words.each { |k, v| return false if v > 0 }
    true
  end
end

# Write a method that returns the largest prime factor of a number. You may wish
# to write a `prime?(num)` helper method.

def largest_prime_factor(num)
  f = num
  while f > 0
    if num % f == 0 && prime?(f)
      return f
    end
    f -= 1
  end
end

def prime?(num)
  return false if num < 2
  (2...num).none? { |f| num % f == 0 }
end

class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an `Array#my_map` method that returns an array made up of the
  # elements in the array after being passed through the given block.
  # **Do NOT use the built-in `Array#map` method in your implementation.**

  def my_map(&prc)
    new_arr = []
    self.each do |ele| 
      new_arr << prc.call(ele)
    end
    new_arr
  end
end

