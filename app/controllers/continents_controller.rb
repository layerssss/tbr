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

class ContinentsController < ApplicationController
  before_action :authenticated_user!
  before_action :authenticated_admin!
  before_action except: [:create, :index] do
    @continent = Continent.includes(countries: :stays).find(params[:id])
  end
  def create
    @continent = Continent.create! continent_params
    redirect_to :back
  end
  def continent_params
    params.require(:continent).permit(:continent_id, :name, :flag)
  end
  def show
    @dates = (-5..10).map do |i|
      Date.today + i
    end
  end
end
