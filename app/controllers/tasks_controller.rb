class TasksController < ApplicationController
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
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :tasks
    else
      flash[:failure] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:delete] = "スケジュールを削除しました"
    redirect_to :tasks
  end
end
