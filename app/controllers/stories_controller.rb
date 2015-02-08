class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :logged_in_developer, only: [:new]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def signup
    if current_user.class == Developer && Story.find(params[:id]).project_id == current_user.project_id
      current_user.story_id = params[:id]
      current_user.save
      redirect_to projects_path
    elsif current_user.class != Developer || current_user.project_id != Story.find(params[:id]).project_id
      flash[:notice] = "You can't sign up for story"
      redirect_to projects_path
    end
    # redirect_to projects_path
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :description, :point_value, :content, :stage, :project_id)
    end
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
       redirect_to root_path
     end
    end
    def logged_in_developer
      unless current_user.class == Developer
        flash[:notice] = "Can only be created by developer"
        redirect_to projects_path
      end
    end
    def correct_user
      if current_user.class == Developer
        @developer = Developer.find(params[:id])
      end
      unless current_user == @developer
        flash[:notice] = "You are not permited to edit/delete this story"
        redirect_to projects_path
      end

    end
end
