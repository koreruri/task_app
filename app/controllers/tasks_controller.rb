class TasksController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all.order(start_date: :asc)
    @class = params[:class]
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @task.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to :tasks
    else
      flash[:failure] = "スケジュールを登録できませんでした"
      render "new"
    end
  end
  
  def show
    #before_actionで実装
  end
  
  def edit
    #before_actionで実装
  end
  
  def update
    if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :tasks
    else
      flash[:failure] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end
  
  def destroy
    @task.destroy
    flash[:delete] = "スケジュールを削除しました"
    redirect_to :tasks
  end
  
  private
  
    def set_user
      @user = User.find(params[:user_id])
    end
    
end
