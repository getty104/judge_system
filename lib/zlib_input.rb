require 'rbzip2'
require 'base64'
module BZip2Input
  def compress(input)
    string = StringIO.new
    bz2 = RBzip2::FFI::Compressor.new string
    bz2.write input
    bz2.close
    Base64.encode64(string.string)
  end
  module_function :compress
end
