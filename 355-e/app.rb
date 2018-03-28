def encrypt(input)
  key, text = input.split()
  encrypted = ""

  for i in 0..text.length-1
    e_char_ord = (text[i].ord + (key[i%key.length].ord - 97))
    e_char_ord -= 26 if e_char_ord > 122
    encrypted += e_char_ord.chr
  end
  puts encrypted

end

def decrypt(input)
  key, text = input.split()
  decrypted = ""

  for i in 0..text.length-1
    d_char_ord = (text[i].ord - (key[i%key.length].ord - 97))
    d_char_ord += 26 if d_char_ord < 97
    decrypted += d_char_ord.chr
  end

  puts decrypted
end

encrypt("snitch thepackagehasbeendelivered")
encrypt("bond theredfoxtrotsquietlyatmidnight")
encrypt("train murderontheorientexpress")
encrypt("garden themolessnuckintothegardenlastnight")

decrypt("cloak klatrgafedvtssdwywcyty")
decrypt("python pjphmfamhrcaifxifvvfmzwqtmyswst")
decrypt("moore rcfpsgfspiecbcc")
