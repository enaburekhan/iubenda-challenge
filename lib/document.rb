require 'erb'

# build data class
class Listings
  PRODUCT = { :name => 'A T&C Document',
              :desc => 'This document is made of plaintext.',
              :uniform_word => 'Is made of',
              #   :clause_3 => 'And dies.',
              #   :clause_4 => 'The white horse is white.',
              #   :footer => 'Your legals.',
              #   :SECTION-1 => []
              :clauses => [
                { 'id': 1, 'text': 'The quick brown fox.' },
                { 'id': 2, 'text': 'Jumps over the lazy dog.' },
                { 'id': 3, 'text': 'And dies.' },
                { 'id': 4, 'text': 'The white horse is white.' }
              ],
              :sections => [
                { "id": 1, "clauses_ids": [1, 2] }
              ]
             }
  #   :SECTION-1 => 'The white horse is white',

  attr_reader :product

  def initialize(product = '')
    @product = product
  end

  def build
    b = binding
    # create and run templates, filling member data variables
    ERB.new(<<-'END_PRODUCT'.gsub(/^\s+/, ''), 0, '', '@product').result b
      <%= PRODUCT[:name] %>
      <%= PRODUCT[:desc] %>
      <%= PRODUCT[:uniform_word] %>  <%= PRODUCT[:clauses][2][:text] %>
      <%= PRODUCT[:uniform_word] %>  <%= PRODUCT[:clauses][3][:text] %>
      <%= PRODUCT[:uniform_word] %>  <%= PRODUCT[:sections][0][:clauses_ids] = 
      PRODUCT[:clauses][0][:text], PRODUCT[:clauses][1][:text] %>

      <%= PRODUCT[:footer] %>
    END_PRODUCT
  end
end

# setup template data
listings = Listings.new
listings.build

puts listings.product
