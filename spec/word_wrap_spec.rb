require_relative '../word_wrap'

describe WordWrap do
  describe 'wrap' do
    context 'input an empty string' do
      it 'returns an empty string' do
        expect(described_class.new.wrap('', 10)).to eq('')
      end
      it 'returns an error if integer is 0' do
        expect { described_class.new.wrap('', 0) }.to raise_error(ArgumentError)
      end   
    end

    context 'input a string with no spaces and integer' do
      it 'returns the string when integer is equal to string length' do
        expect(described_class.new.wrap('hello', 5)).to eq('hello')
      end 
      it 'returns a broken string when integer is less than word length' do
        expect(described_class.new.wrap("coffee", 4)).to eq("coff\nee")
        expect(described_class.new.wrap("telephone", 6)).to eq("teleph\none")
      end
      it 'returns multiple lines when integer is less than half the word length' do
        expect(described_class.new.wrap("coffee", 2)).to eq("co\nff\nee")
        expect(described_class.new.wrap("telephone", 2)).to eq("te\nle\nph\non\ne")
        expect(described_class.new.wrap("something", 2)).to eq("so\nme\nth\nin\ng")
      end
    end

    context 'input string with spaces and integer' do
      it 'returns string broken on space if integer is greater than word length' do
        expect(described_class.new.wrap('Hello world', 5)).to eq("Hello\nworld")
        expect(described_class.new.wrap('Hello hello', 5)).to eq("Hello\nhello")
        expect(described_class.new.wrap('World world', 5)).to eq("World\nworld")
      end
    end

  end
end
