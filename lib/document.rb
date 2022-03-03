require "erb"

# build data class
class Listings
  PRODUCT = { :name => "A T&C Document",
              :desc => "This document is made of plaintext.",
              :uniform_word => 'Is made of',
              :clause_3 => 'And dies',
              :clause_4 => 'The white horse is white',
              :footer => 'Your legals.'
            #   :SECTION-1 => 'The white horse is white',
             }

  attr_reader :product, :clause

  def initialize( product = "", clause = "" )
    @product = product
    @clause = clause
  end

  def build
    b = binding
    # create and run templates, filling member data variables
    ERB.new(<<-'END_PRODUCT'.gsub(/^\s+/, ""), 0, "", "@product").result b
      <%= PRODUCT[:name] %>
      <%= PRODUCT[:desc] %>
      <%= PRODUCT[:uniform_word] %>  <%= PRODUCT[:clause_3] %>
      <%= PRODUCT[:uniform_word] %>  <%= PRODUCT[:clause_4] %>
      
      <%= PRODUCT[:footer] %>
    END_PRODUCT
  end
end

# setup template data
listings = Listings.new
listings.build

puts listings.product + "\n" + listings.clause