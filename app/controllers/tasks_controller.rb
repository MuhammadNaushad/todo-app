class TasksController < ApplicationController
before_action :find_task, only: [ :show, :edit, :update, :destroy ]
before_action :require_user, only: [ :edit, :update ]
before_action :require_same_user, only: [ :edit, :update ]
def index
  @tasks = Task.paginate(page: params[:page], per_page: 5)
  render "task/index"
end

def new
  @task = Task.new
  render "task/new"
end
def show
  render "task/show"
end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      flash[:notice] = "Task was created successfully"
      redirect_to @task
    else
      puts "ERRORS: #{@task.errors.full_messages}"
      render "task/new"
    end
  end

  def edit
    render "task/edit"
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task was updated successfully"
      redirect_to @task
    else
      puts "ERRORS: #{@task.errors.full_messages}"
      render "task/edit"
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = "Task deleted successfully"
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :is_completed, :due_date, :priority)
  end

  def find_task
   @task = Task.find(params[:id])
  end

  def require_same_user
    if @task.user != current_user
        flash[:alert] = "You dont have access to perform this action"
        redirect_to tasks_path
    end
  end
end
