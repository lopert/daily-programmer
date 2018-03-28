def encrypt(input)
  puts crypt(input,"encrypt")
end

def decrypt(input)
  puts crypt(input,"decrypt")
end

def crypt(input, operation)
  key, text = input.split()
  result = ""

  for i in 0..text.length-1
    text_ord = text[i].ord
    key_ord = key[i%key.length].ord - 97
    result_ord = ""

    if operation == "encrypt"
      result_ord = text_ord + key_ord
      result_ord -= 26 if result_ord > 122
    elsif operation == "decrypt"
      result_ord = text_ord - key_ord
      result_ord += 26 if result_ord < 97
    end

    result += result_ord.chr

  end

  result

end

encrypt("snitch thepackagehasbeendelivered")
puts
encrypt("bond theredfoxtrotsquietlyatmidnight")
encrypt("train murderontheorientexpress")
encrypt("garden themolessnuckintothegardenlastnight")
puts
decrypt("cloak klatrgafedvtssdwywcyty")
decrypt("python pjphmfamhrcaifxifvvfmzwqtmyswst")
decrypt("moore rcfpsgfspiecbcc")
