def caeser_cipher(str, num)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  new_str = ''

  str.each_char do |letter|
    caps = false

    if letter == letter.upcase
      caps = true
    end

    if alphabet.include?(letter.downcase)
      old_idx = alphabet.index(letter.downcase)
      new_idx = old_idx.to_i + num

      new_str += add_letter(alphabet, new_idx, caps)
    else
      new_str += letter
    end
    
  end

  new_str
end

def add_letter(alphabet, idx, caps)
  caps == true ? alphabet[idx % 26].upcase : alphabet[idx % 26]
end

p caeser_cipher("What a string!", 5)