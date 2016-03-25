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

class CountriesController < ApplicationController
  before_action :authenticated_user!
  before_action :authenticated_admin!
  before_action except: [:create, :index] do
    @country = Country.find(params[:id])
  end
  def create
    @country = Country.create! country_params
    redirect_to :back
  end
  def country_params
    params.require(:country).permit(:continent_id, :name, :flag)
  end
end
