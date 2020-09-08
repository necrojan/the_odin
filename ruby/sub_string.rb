# Implement a method #substrings that takes a word as the first argument and 
# then an array of valid substrings (your dictionary) as the second argument. 
# It should return a hash listing each substring (case insensitive) that was 
# found in the original string and how many times it was found.

def substrings(word, dict)
  count = Hash.new(0)

  (0...word.length).each do |start_idx|
    (start_idx...word.length).each do |end_idx|
      found = word[start_idx..end_idx].downcase
      if dict.include?(found)
        count[found] += 1
      end
    end
  end
  count.sort_by{ |k| k }.to_h
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substrings("Howdy partner, sit down! How's it going?", dictionary)