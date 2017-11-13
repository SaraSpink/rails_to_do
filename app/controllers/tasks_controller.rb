class TasksController < ApplicationController
  def show
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    render :show
  end

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
      if @task.update(task_params)
      redirect_to list_task_path
    # else
    #   redirect_to
  end
  end

private
  def task_params
    params.require(:task).permit(:description)
  end
end
