require_relative 'lovesong'
require_relative 'finished_madlibs'
require_relative 'content_words_hash'

user_words = Hash.new

# use method get_word to prompt user for replacement words
# populate the hash user_words with their input

def get_word(word)
	puts "Give me a #{word}."
	input = gets.chomp
	return input
end

content_words.each do |key, value| 
  get_word(value)
  user_words[:key] = input
end

# save progress:
File.open('finished_madlibs.md', "w") {|file| file.write(user_words.inspect)}

# automatically add line breaks between each line, 
# add each line to an array

def file_to_array(filename)
	file = File.open(filename)
	file.each_line do |line|
		arr = []
		arr.push(line + "\n")
		return arr
	end
end

poem = file_to_array('lovesong.txt')

# ## Try this next: arrayed_poem = poem.split(/\s{3,}/)

def build_new_poem(arrayed_poem)
  user_words.each do |key, value|
    new_poem = arrayed_poem.gsub(key.to_s, value)
    return new_poem
    File.open('finished_madlibs.md', "w") {|file| file.write(new_poem)}
  end
end

puts build_new_poem(poem)


# Unused Ideas Repository:

# search for words from my hash in each line and 
# replace them with their replacements from user_words hash

# user_words.each do |key, value|
# 		poem.each do |line|
# 			words = line.split(" ")
# 			if words.include?(key)
# 				i = words[key].index 
# 				words.delete_at(i)
# 				words.insert(i, user_words[key])
# 			end
# 		end
# end

# 

#
# internet also says:
#File.open(file_name, "w") {|file| file.puts output_of_gsub}


# File.write('my_hash.txt', 'w+')

# File.open(yourfile, 'w') { |file| file.write("your text") }

# File.open(file_name, "w") {|file| file.puts output_of_gsub}

