class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update destroy]

  # GET /projects
  def index
    @projects = Project.all

    render json: @projects, except: %i[created_at updated_at], include: {
      editions: { only: %i[id name] }
    }
  end

  # GET /projects/1
  def show
    render json: @project, except: %i[parent_id created_at updated_at], include: {
      parent: { only: %i[id name] },
      editions: { only: %i[id name] }
    }
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save
      render json: @project, status: :created, location: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    authorize @project
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    authorize @project
    @project.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :resume, :released_at, :finished_at, :parent_id)
  end
end
