def substring(keyword, substrings)
  #check that keyword is a string && substrings is an array of strings
  usage = "Usage: substring(String keyword, String[] substrings)" 
  return usage if(!keyword.is_a? String or !substrings.is_a? Array)
  substrings.each {|substring| return usage if !substring.is_a? String}

  #prepare keyword array and return array
  keywords = keyword.downcase.split
  substring_matches = Hash.new(0)
  
  #iterate through keywords and substrings matching each substring against each key
  keywords.each do |key|
    substrings.each do |substring|
      substring_matches[substring] += 1 if key.include?(substring)
    end
  end

  return substring_matches
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

p substring("below", dictionary)
p substring("Howdy partner, sit down! How's it going?", dictionary)
