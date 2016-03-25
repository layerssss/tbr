# == Schema Information
#
# Table name: stays
#
#  id         :integer          not null, primary key
#  country_id :integer
#  name       :string
#  arrival    :date
#  days       :integer          default(1)
#  amount     :integer          default(20)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module StaysHelper
end
