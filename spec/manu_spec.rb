require 'spec_helper'

RSpec.describe Manu do
  describe '#title' do 
    it 'should format' do
      inp = '010-lorem-ipsum.txt'
      expect(Manu::title(inp)).to eq('Chapter 010: LOREM IPSUM')
    end
  end

  describe '#src_files' do 
    it 'return source files' do
      expect(Manu::src_files('spec/fixtures')).to match_array(%w(001-bar.txt 002-baz.txt))
    end
  end

end