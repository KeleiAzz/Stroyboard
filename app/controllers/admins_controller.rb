class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_admin, only: [:new, :index, :show]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    if @admin.name != "Kelei"
      @admin.destroy
      respond_to do |format|
        format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      flash[:notice] = "You can't delete the default admin."
      redirect_to home_path
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:email, :password, :name)
    end

  def logged_in_admin
    if current_user.class != Admin
      flash[:notice] = "Only access by Admin."
      redirect_to root_path
    end
  end
  def correct_user
    if current_user.class == Admin
      @admin = Admin.find(params[:id])
      if current_user.id != @admin.id
        flash[:notice] = "You can't edit other's profile"
        redirect_to admins_path
      end
    else
      flash[:notice] = "Only access by Admin"
      redirect_to root_path
    end

  end
end
