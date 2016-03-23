class Continent < ActiveRecord::Base
  has_many :countries, dependent: :destroy
end
