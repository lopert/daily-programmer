require_relative "crypto"
require "test/unit"

class TestCrypto < Test::Unit::TestCase

  def test_encrypt
    assert_equal(Crypto.new.encrypt("snitch thepackagehasbeendelivered"), "lumicjcnoxjhkomxpkwyqogywq")
    assert_equal(Crypto.new.encrypt("bond theredfoxtrotsquietlyatmidnight"), "uvrufrsryherugdxjsgozogpjralhvg")
    assert_equal(Crypto.new.encrypt("train murderontheorientexpress"), "flrlrkfnbuxfrqrgkefckvsa")
    assert_equal(Crypto.new.encrypt("garden themolessnuckintothegardenlastnight"), "zhvpsyksjqypqiewsgnexdvqkncdwgtixkx")
  end

  def test_decrypt
    assert_equal(Crypto.new.decrypt("cloak klatrgafedvtssdwywcyty"), "iamtheprettiestunicorn")
    assert_equal(Crypto.new.decrypt("python pjphmfamhrcaifxifvvfmzwqtmyswst"), "alwayslookonthebrightsideoflife")
    assert_equal(Crypto.new.decrypt("moore rcfpsgfspiecbcc"), "foryoureyesonly")
  end

end
