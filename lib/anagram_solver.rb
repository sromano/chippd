class AnagramSolver

  #An anagram includes exactly the same characters than the original word but in different order (except for the original word that can be consider an anagram of itself)
  #So in this code, we think of strings as array's of characters and see if they have exactly the same elements not matter in which order they are (to test this, we sort the array and see if they are the same)

  def find_anagrams(array,string)
    sorted_chars = string.chars.sort
    array.inject([]) do |resulting_array,current_string|
      resulting_array << current_string if current_string.chars.sort == sorted_chars
      resulting_array
    end
  end
end

#Test
require "test/unit/assertions.rb"

class AnagramTest
  include Test::Unit::Assertions

  def test_anagram_finder

    af = AnagramSolver.new

    arr = ["parts",
    "flights",
    "trips",
    "pears",
    "fights",
    "parse",
    "apple",
    "spear",
    "spears",
    "smear",
    "spares"]

    string = "spare"

    assert_equal(3,af.find_anagrams(arr,string).size,"Should find 3 anagrams")
    assert(af.find_anagrams(arr,string).include?("pears"),"Should find pears anagrams")
    assert(af.find_anagrams([string],string).include?(string),"Should find same string if included in array")
    assert_equal([],af.find_anagrams([],string),"Should return an empty array when no element is provided")
    assert_equal([],af.find_anagrams(arr,""),"Should return an empty array when empty string is provided")

  end
end
