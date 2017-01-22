class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.where(["nazwisko LIKE ?","%#{params[:search]}"])
     @users = User.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:"id"])
  end

  def search
    @usersfilter = User.where(["name LIKE ?","%#{params[:search]}"])
    User.paginate(:page => params[:page], :per_page => 10)
  end
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
    format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:imie, :nazwisko, :wiek, :ulica, :miasto, :kod_pocztowy, :Informacje_dodatkowe)
    end
end
