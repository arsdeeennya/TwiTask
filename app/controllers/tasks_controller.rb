class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    flash[:success] = "タスク「#{task.name}」を更新しました"
    redirect_to tasks_url
  end
  
  
  def create
    task = Task.new(task_params)
    task.save!
    flash[:success] = "タスク「#{task.name}」を登録しました"
    redirect_to tasks_url
  end
  
  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
