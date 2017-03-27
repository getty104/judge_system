require 'zlib'
require 'base64'
module ZlibInput
	def zlib input
		data = Zlib::Deflate.deflate(input)
		Base64.encode64(data)
	end
	module_function :zlib
end