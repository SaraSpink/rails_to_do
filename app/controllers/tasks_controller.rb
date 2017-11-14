class TasksController < ApplicationController
  def show
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])

  end

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)

    if @task.save
      flash
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
      flash[:notice] = "Task successfully added"
      redirect_to list_path(@task.list)
      else
    end
  end

  # def isDone
  #   @list = List.find(params[:list_id])
  #   @task = @list.tasks.find(params[:id])
  #   @task.isDone(params[:done])
  # end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(@task.list)
  end

private
  def task_params
    params.require(:task).permit(:description, :done)
  end
end
