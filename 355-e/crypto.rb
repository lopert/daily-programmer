# https://www.reddit.com/r/dailyprogrammer/comments/879u8b/20180326_challenge_355_easy_alphabet_cipher/
class Crypto
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

end

crypto = Crypto.new
crypto.encrypt("snitch thepackagehasbeendelivered")
puts
crypto.encrypt("bond theredfoxtrotsquietlyatmidnight")
crypto.encrypt("train murderontheorientexpress")
crypto.encrypt("garden themolessnuckintothegardenlastnight")
puts
crypto.decrypt("cloak klatrgafedvtssdwywcyty")
crypto.decrypt("python pjphmfamhrcaifxifvvfmzwqtmyswst")
crypto.decrypt("moore rcfpsgfspiecbcc")
