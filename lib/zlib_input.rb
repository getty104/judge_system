require 'zlib'

module ZlibInput
	def zlib input
		Zlib::Deflate.deflate(input,Zlib::BEST_SPEED)
	end
	module_function :zlib
end