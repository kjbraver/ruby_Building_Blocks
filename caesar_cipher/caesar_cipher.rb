def caesar_cipher(message, key)
	unless(message.instance_of? String)
		p "Wrong argument type: caesar_cipher(string, int)"
		return -1
	end

	#convert key to an int, wrapping around for values greater than 26
	key = key.to_i % 26

	#create empty string to hold coded message
	coded_message = ""

	#iterate over each char in the message
	message.each_char do |char|
		#add char as is if char is a nonalphabetic character
		if(/[a-z]|[A-Z]/.match(char).nil?)
			coded_message << char
		else
			#Note: ascii 65-90 for uppercase and 97-122 for lowercase
			coded_char = char.ord + key
			#mechanism to loop to start of alphabet after z/Z
			if(coded_char > 90 && char.ord.between?(65,90))
				coded_char = coded_char % 90 + 64
			elsif(coded_char > 122 && char.ord.between?(97,122))
				coded_char = coded_char % 122 + 96
			end

			coded_message << coded_char.chr
		end
	end


	return coded_message
end

p caesar_cipher("What a string!", 5)
