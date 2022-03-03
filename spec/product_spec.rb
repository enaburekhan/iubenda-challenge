require_relative '../lib/product'

RSpec.describe 'Product' do
  it 'only allows defined methods to be invoked' do
    Product = double('product')
    allow(Product).to receive_messages(name: 'A T&C Document.',
                                       desc: 'This document is made of plaintext.', uniform_word: 'Is made of')
    expect(Product.name).to eq('A T&C Document.')
    expect(Product.desc).to eq('This document is made of plaintext.')
    expect(Product.uniform_word).to eq('Is made of')
  end
end
