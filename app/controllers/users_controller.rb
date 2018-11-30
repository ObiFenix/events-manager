class UsersController < ApplicationController

  before_action :set_user, only: [:first_name, :last_name, :email, :city, :state, :password, :password_confirmation]

  def index
  end

  # =============================
  # GET Request - Renders [.html]
  # =============================
  def new
    @new_user = User.new
  end


  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def create
    @new_user = User.create(user_params)
    respond_to do |format|
      if @new_user.valid?
        # format.html { redirect_to dojo_student_url, notice: 'Student was successfully created.' }
	session[:user_id] = @new_user.id
	session[:form] = "login"
        format.html { redirect_to "/", notice: 'User was successfully registered!' }
        format.json { render :show, status: :created, location: @new_user }
      else
        flash[:errors] = @new_user.errors.full_messages
        format.html { redirect_to :back }
        format.json { render json: @new_user.errors, status: :unprocessable_entity }
      end
    end
  end


  # =============================
  # GET Request - Renders [.html]
  # =============================
  def edit
    @user = User.find(params[:id])
    render "edit"
  end


  # =========================
  # PATCH/PUT Request [.html]
  # PATCH/PUT Request [.json]
  # =========================
  def update
    @user = User.find(params[:id])
    @user.update(update_user_params)
    respond_to do |format|
      if @user.valid?
        format.html { redirect_to "/events", notice: 'Your profile was successfully updated!' }
        format.json { render :show, status: :ok, location: @user }
      else
        flash[:errors] = @user.errors.full_messages
        format.html { redirect_to "/users/#{params[:id]}/edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Sanatizing/Validating Parameters...
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end

    def update_user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state)
    end
end
