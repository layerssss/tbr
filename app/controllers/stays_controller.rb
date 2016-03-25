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

class StaysController < ApplicationController
  before_action :authenticated_user!
  before_action :authenticated_admin!
  before_action except: [:create, :index, :new] do
    @stay = Stay.find(params[:id])
  end
  def new 
    @stay = Stay.new params.permit(:country_id, :arrival)
  end
  def create
    @stay = Stay.create! stay_params
    redirect_to @stay.country.continent
  end
  def update
    @stay.assign_attributes stay_params
    @stay.save!
    redirect_to @stay.country.continent
  end
  def destroy
    @stay.destroy!
    redirect_to @stay.country.continent
  end
  def stay_params
    params.require(:stay).permit(:name, :arrival, :country_id, :days)
  end
end
