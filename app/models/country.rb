# == Schema Information
#
# Table name: countries
#
#  id           :integer          not null, primary key
#  name         :string
#  continent_id :integer
#  flag         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Country < ActiveRecord::Base
  belongs_to :continent
  has_many :stays, dependent: :destroy
  def flag= value
    super("data:image/svg+xml;base64,#{Base64.encode64(value.read)}")
  end
  def stays_for(date)
    self.stays.select{|stay| stay.arrival <= date && stay.arrival + stay.days > date }
  end
end
