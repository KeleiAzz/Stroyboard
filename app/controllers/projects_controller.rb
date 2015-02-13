class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show]
  before_action :correct_user,   only: [:new, :edit, :update, :destroy]
  #before_action :correct_user_admin,   only: [:new, ]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @developer = Developer.new()
    @project = Project.find(params[:id])
    if !params[:search].nil?
      self.search
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_to_dev
    if !params[:developer].nil?
      temp = Developer.find(params[:developer][:id])
      # if temp.project_id == params[:id]
      #   flash[:notice] = "This project is already assigned to this developer"
      # end
      if !temp.project_id.nil? & temp.project_id != params[:id]
        temp.story_id = nil
      end
      temp.project_id = params[:id]
      temp.save
      flash[:notice] = "Add developer to project succseefully!"
      redirect_to project_path({:id => params[:id]})
    elsif !params[:search].nil?
    redirect_to project_path({:id => params[:id], :search => params[:search]})
      end
  end
  def search
    params[:stories] = Story.where(:conditions => ['title LIKE ?', "%#{params[:search]}%"])

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description)
    end

    def logged_in_user
     unless logged_in?
       flash[:notice] = "Please log in."
       redirect_to root_path
     end
    end

    def correct_user
      unless current_user.class == Admin
        flash[:notice] = "Only access by Admin."
        redirect_to projects_path
      end
    end
end
