class DevelopersController < ApplicationController
  before_action :set_developer, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index]
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :correct_user_admin,   only: [:new, :destroy]
  # GET /Developers
  # GET /Developers.json
  def index
    @developers = Developer.all
  end

  # GET /Developers/1
  # GET /Developers/1.json
  def show
  end

  # GET /Developers/new
  def new
    @developer = Developer.new
  end

  # GET /Developers/1/edit
  def edit
  end

  # POST /Developers
  # POST /Developers.json
  def create
    @developer = Developer.new(developer_params)

    respond_to do |format|
      if @developer.save
        format.html { redirect_to @developer, notice: 'Developer was successfully created.' }
        format.json { render :show, status: :created, location: @developer }
      else
        format.html { render :new }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Developers/1
  # PATCH/PUT /Developers/1.json
  def update
    if params[:developer][:project_id] != @developer.project_id
      @developer.story_id = nil
      @developer.save
    end
    respond_to do |format|
      if @developer.update(developer_params)
        format.html { redirect_to @developer, notice: 'Developer was successfully updated.' }
        format.json { render :show, status: :ok, location: @developer }
      else
        format.html { render :edit }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Developers/1
  # DELETE /Developers/1.json
  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url, notice: 'Developer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def developer_params
      params.require(:developer).permit(:name, :email, :password, :project_id, :story_id)
    end
    def logged_in_user
      unless logged_in?
        flash[:notice] = "Please log in."
        redirect_to root_path
      end
    end
    def add_project
      Developer.find(params[:id]).project_id = params[:project_id]
    end
    def correct_user
      if current_user.class == Developer
        @developer = Developer.find(params[:id])
      end
      if current_user.class != Admin && current_user != @developer
        flash[:notice] = "Access denied!"
        redirect_to developers_path
      end

    end
    def correct_user_admin
      if current_user.class != Admin
        flash[:notice] = "Can only be accessed by Admin."
        redirect_to developers_path
      end

    end
end
