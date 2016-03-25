# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#  from       :string
#

class NotesController < ApplicationController
  before_action :authenticated_user!
  before_action do
    @email = session['auth']['info']['email']
    @from = session['auth']['info']['name']
  end
  def index
    @note = Note.new(email: @email, from: @from)
    @notes = Note.where(email: @email).order(created_at: :desc)
  end
  def create
    @note = Note.new(email: @email, from: @from)
    @note.assign_attributes params.require(:note).permit(:content)
    return redirect_to :back, alert: 'ReCaptcha verification failed.' unless verify_recaptcha(model: @note)
    @note.save!
    redirect_to :back
  end
end
