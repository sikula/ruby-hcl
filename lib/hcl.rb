
require_relative './hcl/lexer'
require_relative './hcl/parser'

require 'json'


class HCL

  def initialize

  end


  def parse(file)
    parser = HCL::Parser.new.parse(File.read(file))
  end
end


