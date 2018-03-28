# https://www.reddit.com/r/dailyprogrammer/comments/879u8b/20180326_challenge_355_easy_alphabet_cipher/
class Crypto
  def encrypt(input)
    crypt(input,"encrypt")
  end

  def decrypt(input)
    crypt(input,"decrypt")
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
