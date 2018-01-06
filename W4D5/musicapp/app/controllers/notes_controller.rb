class NotesController < ApplicationController
  before_action :require_current_user

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.track_id = params[:track_id]
    if @note.save
      redirect_to track_url(@note.track_id)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(params[:track_id])
    end
  end


  def destroy
    @note = Note.find_by(id: params[:id])
    @note.destroy
    redirect_to track_url(@note.track_id)
  end

  private
  def note_params
    params.require(:note).permit(:body)
  end
end
