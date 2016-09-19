
module Helpers

  class CategoryHelper

    @categories

    def initialize
      @categories = {
          :atm => "Atm",
          :bank => "Bank",
          :cafe => "Cafe",
          :bar => "Bar",
          :food => "Food",
          :gym => "Gym",
          :hospital => "Hospital",
          :museum => "Museum",
          :night_club => "Night club",
          :park => "Park",
          :pharmacy => "Pharmacy",
          :restaurant => "Restaurant",
          :shopping_mall => "Shopping mall",
          :store => "Store",
          :university => "University",
          :zoo => "Zoo"
      }

    end

    def get_categories
      @categories
    end

  end


end