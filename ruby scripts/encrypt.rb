require 'openssl'

class Encryptor
  def self.encrypt(str, key)
		cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
		cipher.key = Digest::SHA1.hexdigest key
		s = cipher.update(str) + cipher.final
		s.unpack('H*')[0].upcase
	end

  def self.decrypt(str, key)
		cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').decrypt
		cipher.key = Digest::SHA1.hexdigest key
		s = [str].pack("H*").unpack("C*").pack("c*")

		cipher.update(s) + cipher.final
	end
end

key = "Zc9dvKDT9tJD"
str = "WPvn62SWCx79"
puts str.encrypt(key)
