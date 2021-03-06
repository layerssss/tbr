# == Schema Information
#
# Table name: continents
#
#  id         :integer          not null, primary key
#  name       :string
#  flag       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Continent < ActiveRecord::Base
  has_many :countries, dependent: :destroy
  def flag= value
    super("data:image/svg+xml;base64,#{Base64.encode64(value.read)}")
  end
end
