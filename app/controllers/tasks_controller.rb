class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.Task.all
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
#    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Task が正常に作成されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが作成されませんでした'
      render 'toppages/index'
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'Task が正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskが更新されませんでした'
      render :edit
    end
  
  end

  def destroy
    @task.destroy
    
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to root_url
  end

  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status, :user_id)
  end

  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end

end
