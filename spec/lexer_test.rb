
require 'rspec'
require_relative '../lib/lexer'


class HCLLexerTest

  describe "Tests for HCL Lexer" do
    before do
      @lexer = HCLLexer.new
    end

    it '=> comments.hcl' do
      result = @lexer.lex(File.read("tests/lex-fixtures/comment.hcl"))
      expect(result.map(&:first)).to eq(
        [:IDENTIFIER, :EQUAL, :NUMBER, :FLOAT, :IDENTIFIER, :EQUAL, :STRING]
      )
    end

    it '=> multiple.hcl' do
      result = @lexer.lex(File.read("tests/lex-fixtures/multiple.hcl"))
      expect(result.map(&:first)).to eq(
        [
         :IDENTIFIER, :EQUAL, :STRING,
         :IDENTIFIER, :EQUAL, :NUMBER
        ]
      )
    end

    it '=> list.hcl' do
      result = @lexer.lex(File.read("tests/lex-fixtures/list.hcl"))
      expect(result.map(&:first)).to eq(
        [
         :IDENTIFIER, :EQUAL, :LEFTBRACKET,
         :NUMBER, :COMMA, :NUMBER, :COMMA, :STRING,
         :RIGHTBRACKET
        ]
      )
    end

    it '=> structure_basic.hcl' do
      result = @lexer.lex(File.read("tests/lex-fixtures/structure_basic.hcl"))
      expect(result.map(&:first)).to eq(
        [
          :IDENTIFIER, :LEFTBRACE,
          :IDENTIFIER, :EQUAL, :NUMBER,
          :STRING, :EQUAL, :NUMBER,
          :STRING, :EQUAL, :NUMBER,
          :RIGHTBRACE
        ]
      )
    end

    it '=> structure.hcl' do
      result = @lexer.lex(File.read("tests/lex-fixtures/structure.hcl"))
      expect(result.map(&:first)).to eq(
        [
          :IDENTIFIER, :IDENTIFIER, :STRING, :LEFTBRACE,
          :IDENTIFIER, :EQUAL, :NUMBER,
          :IDENTIFIER, :EQUAL, :STRING,
          :RIGHTBRACE
        ]
      )
    end



  end
end
