require_relative '../lib/document'

describe Listings do
  describe '#Listings is a class type' do
    let(:list) { Listings.new }

    it 'should return an class object' do
      expect(list.class).to eql(Listings)
    end
  end

  describe Listings.new('This document is made of plaintext') do
    it 'checks for object attribute and proper values' do
      expect(subject).to have_attributes(product: 'This document is made of plaintext')
    end
  end
end
