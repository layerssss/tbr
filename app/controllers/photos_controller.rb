# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  thumbnail  :string
#  url        :string
#  time       :datetime
#  f_id       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  link       :string
#

class PhotosController < ApplicationController

  before_action :authenticated_user!, only: [:publish]
  before_action :authenticated_admin!, only: [:publish]
  def publish
  end
end
