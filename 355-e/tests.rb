require_relative "crypto"
require "test/unit"

class TestCrypto < Test::Unit::TestCase

  def setup
    @Crypto = Crypto.new
  end

  def test_encrypt
    assert_equal(@Crypto.encrypt("snitch thepackagehasbeendelivered"), "lumicjcnoxjhkomxpkwyqogywq")
    assert_equal(@Crypto.encrypt("bond theredfoxtrotsquietlyatmidnight"), "uvrufrsryherugdxjsgozogpjralhvg")
    assert_equal(@Crypto.encrypt("train murderontheorientexpress"), "flrlrkfnbuxfrqrgkefckvsa")
    assert_equal(@Crypto.encrypt("garden themolessnuckintothegardenlastnight"), "zhvpsyksjqypqiewsgnexdvqkncdwgtixkx")
  end

  def test_decrypt
    assert_equal(@Crypto.decrypt("cloak klatrgafedvtssdwywcyty"), "iamtheprettiestunicorn")
    assert_equal(@Crypto.decrypt("python pjphmfamhrcaifxifvvfmzwqtmyswst"), "alwayslookonthebrightsideoflife")
    assert_equal(@Crypto.decrypt("moore rcfpsgfspiecbcc"), "foryoureyesonly")
  end

end
