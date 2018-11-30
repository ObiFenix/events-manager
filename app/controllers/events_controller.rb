class EventsController < ApplicationController

  before_action :set_event, only: [:name, :date, :city, :state]

  def index
    @events = Event.where(state: current_user.state)
    @otherevents = Event.where.not(state: current_user.state)
    @attend = Attend.all
  end

  def show
    @event = Event.find(id = params[:id])
    @attend = Attend.where("event_id = '#{params[:id]}'").count
    @attendees = Attend.where("event_id = '#{params[:id]}'")
    @comments = Comment.joins(:event).where(event_id: @event.id)
  end

  def new
    Event.new
  end


  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def create
    @new_event = Event.create(event_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @new_event.valid?
        # format.html { redirect_to dojo_student_url, notice: 'Student was successfully created.' }
	session[:event_id] = @new_event.id
        format.html { redirect_to events_path, notice: 'A new event has successfully been created!' }
        format.json { render :show, status: :created, location: @new_event }
      else
        flash[:errors] = @new_event.errors.full_messages
        format.html { redirect_to :back }
        format.json { render json: @new_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @event = Event.find(id = params[:id])
  end


  # =========================
  # PATCH/PUT Request [.html]
  # PATCH/PUT Request [.json]
  # =========================
  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    respond_to do |format|
      if @event.valid?
        format.html { redirect_to events_path, notice: 'Your event was successfully updated!' }
        format.json { render :show, status: :ok, location: @event }
      else
        flash[:errors] = @event.errors.full_messages
        format.html { redirect_to edit_event }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end


  # ===================
  # DELETE /user/1
  # DELETE /user/1.json
  # ===================
  def destroy
    Event.find(params[:id]).destroy
    respond_to do |format|
      # format.html { redirect_to '/', notice: 'User was successfully destroyed.' }
      format.html { redirect_to events_path, notice: 'Event was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @user = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :date, :city, :state)
    end

end
