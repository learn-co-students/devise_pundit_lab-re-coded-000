class NotesController < ApplicationController
  before_action :authenticate_user! , only: [:show]
  def new
    
  end
  
  def create
    note = Note.new(note_params)
    note.user = current_user
    note.save!
    redirect_to '/'
    authorize(note)

  end

  def update
   # raise params.inspect
    @note = Note.find(params[:id])
    @note.update(note_params)
    redirect_to '/'    
    authorize(@note)
  end
  
  def edit

    @note = Note.find(params[:id])
    authorize(@note)
  end
  
  def show
    @note = Note.find(params[:id])
    authorize(@note)
  end

  def index
    @notes = Note.none
    if current_user
      @notes = current_user.readable
    end
    render '/application/index'
  end
  def destroy
     authorize(@note)
  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end

end
