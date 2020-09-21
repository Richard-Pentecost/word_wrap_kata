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
    context 'input a string and integer' do
      it 'returns the string when integer is equal to string length' do
        expect(described_class.new.wrap('hello', 5)).to eq('hello')
      end 
      it 'returns a broken string when integer is less than word length' do
        expect(described_class.new.wrap("coffee", 4)).to eq("coff\nee")
        expect(described_class.new.wrap("telephone", 6)).to eq("teleph\none")
      end
    end
  end
end

# describe "#ip_lookup" do
#   it "should raise an ArgumentError error if no parameters passed" do
#     expect { @geolocater.ip_lookup }.to raise_error(ArgumentError)
#   end
# end