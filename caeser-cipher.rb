def shift_alphabet(alphabet, shift)
  shifted_alphabet = alphabet.dup
  shift.times do 
    char = shifted_alphabet.shift
    shifted_alphabet.push(char)
  end 
  alphabet = Hash[alphabet.zip(shifted_alphabet)]
end


def caeser_cipher(string, shift)
  ciphered_string = []

  lower_alphabet = ('a'..'z').to_a
  lower_alphabet = shift_alphabet(lower_alphabet, shift)

  upper_alphabet = ('A'..'Z').to_a
  upper_alphabet = shift_alphabet(upper_alphabet, shift)

  string.chars.each do |char|
    if /[[:upper:]]/.match(char)
      ciphered_string.push(upper_alphabet[char])
    elsif char == " "
      ciphered_string.push(" ")
    elsif /[[:lower:]]/.match(char)
      ciphered_string.push(lower_alphabet[char])
    else
      ciphered_string.push(char)
    end
  end
  return ciphered_string.join('')
end


def main()
  puts "Insert the string: "
  string = gets.chomp
  puts "Insert the shift: "
  shift = gets.chomp.to_i
  ciphered_string = caeser_cipher(string, shift)
  puts ciphered_string
end


main()
