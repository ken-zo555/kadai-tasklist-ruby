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
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Task が正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが作成されませんでした'
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
      @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Task が正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが更新されませんでした'
      render :edit
    end
  
  end

  private
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end

end
