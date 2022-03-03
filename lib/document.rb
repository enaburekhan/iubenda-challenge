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
    ERB.new(<<-'END_PRODUCT'.gsub(/^\s+/, ''), 0, '', '@product').result b
      <%= PRODUCT[:name] %>
      <% if true %>
         <%= PRODUCT[:desc] %>
         <%= PRODUCT[:uniform_word] %> <%= PRODUCT[:clauses][2][:text] %>
         <%= PRODUCT[:uniform_word] %> <%= PRODUCT[:clauses][3][:text] %>
         <%= PRODUCT[:uniform_word] %> <%= PRODUCT[:sections][0][:clauses_ids] =
           [PRODUCT[:clauses][0][:text], PRODUCT[:clauses][1][:text]].join(';') %>
      <% end %>
      <%= PRODUCT[:footer] %>
    END_PRODUCT
  end
end

# setup template data
listings = Listings.new
listings.build

puts listings.product
