class SessionsController < ApplicationController

  def index
    if current_user
      redirect_to events_path
    end
    User.new
    @errors = []
  end

  # =============================
  # Switch Controller for Log/Reg
  # =============================
  def switch
    if session[:form] === "login"
      session[:form] = "register"
    else
      session[:form] = "login"
    end
    redirect_to "/"
  end


  # =====================================
  # Handles User Login <users/login> form
  # =====================================
  def login
    @user = User.find_by_email(params[:email])
    respond_to do |format|
      if @user and @user.authenticate(params[:password])
        session["user_id"] = @user.id
        format.html { redirect_to "/events" } #, notice: 'User was successfully logged in!' }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:errors] = ["Email or Password is incorrect!"]
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # ===============================
  # DELETE request for </logout>
  # >> This shall terminate session
  # ===============================
  def logout
    reset_session
    respond_to do |format|
      format.html { redirect_to '/', notice: 'User was successfully logged out.' }
      format.json { head :no_content }
    end
  end


  # ===================
  # DELETE /user/1
  # DELETE /user/1.json
  # ===================
  def destroy
    User.find(params[:id]).destroy
    respond_to do |format|
      # format.html { redirect_to '/', notice: 'User was successfully destroyed.' }
      format.html { redirect_to "/users/#{params[:user_id]}", notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

end
