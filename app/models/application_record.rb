class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

class Country < ActiveRecord::Base

  before_create :set_defaults

  def set_defaults
    self.@countries_to_display = "water" if @countries_to_display.nil?
  end

end

