require 'erb'
require_relative 'product'

# build data class
class Listings
  include Product

  attr_reader :product

  def initialize(product = '')
    @product = product
  end

  def build
    b = binding
    # create and run templates, filling member data variables
    ERB.new(<<-'END_Product'.gsub(/^\s+/, ''), 0, '-', '@product').result b
      <%= Product[:name] %>
      <% if true %>
         <%= Product[:desc] %>
         <%= Product[:uniform_word] %> <%= Product[:clauses][2][:text] %>
         <%= Product[:uniform_word] %> <%= Product[:clauses][3][:text] %>
         <%= Product[:uniform_word] %> <%= Product[:sections][0][:clauses_ids] =
           [Product[:clauses][0][:text], Product[:clauses][1][:text]].join(';') %>
      <% end %>
      <%= Product[:footer] %>
    END_Product
  end
end

# setup template data
listings = Listings.new
listings.build

puts listings.product
