class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end


  def show
    @result_task=Task.find(params[:id])
  end


  def new
    @task = Task.new
  end

  def create
    task = Task.create task_params
    unless task.id == nil
      redirect_to tasks_path
    end
  end

  def edit
    @task=Task.find(params[:id])
  end


  def update
      @task=Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    end
  end

  def destroy
    Task.destroy(params[:id])

    redirect_to tasks_path
  end

  def complete_task
    task=Task.find(params[:id])
    if task.completion_date == nil || complete_task.completion_date == ""
      task.completion_date = Time.now
    else
      task.completion_date = nil

    end
      task.save

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :owner, :completion_date)
  end
end
