require_relative '../lib/document'

describe Listings do
  describe '#Listings is a class type' do
    let(:list) { Listings.new }
    # let(:list_product) { list.select_list }

    it 'should return an Hash object' do
      expect(list.class).to eql(Listings)
    end

    # it 'should return a key and a value' do
    #   expect(request_random.length).to eql(2)
    # end
  end
end
