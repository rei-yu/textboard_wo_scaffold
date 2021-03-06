class MyThreadsController < ApplicationController
  before_action :set_my_thread, only: [:show, :edit, :update, :destroy]

  def index
    @my_threads = MyThread.all
  end

  def show
    @my_thread = MyThread.find(params[:id])
    @my_comments = @my_thread.my_comments
    @my_comment = MyComment.new
  end

  def new
    @my_thread = MyThread.new
  end

  def edit
  end

  def create
    @my_thread = MyThread.new(my_thread_params)
    @user = current_user
    @my_thread.user_id = @user.id

    respond_to do |format|
      if @my_thread.save
        format.html { redirect_to @my_thread, notice: 'MyThread was successfully created' }
        format.json { render :show, status: :created, location: @my_thread }
      else
        format.html { render :new }
        format.json { render json: @my_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @my_thread.update(my_thread_params)
        format.html { redirect_to @my_thread, notice: 'MyThread was successfully updated' }
        format.json { render :show, status: :created, location: @my_thread }
      else
        format.html { render :edit }
        format.json { render json: @my_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @my_thread.destroy
    respond_to do |format|
      format.html { redirect_to my_threads_url, notice: 'MyThread was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private
    def my_thread_params
      params.require(:my_thread).permit(:title, :overview)
    end

    def set_my_thread
      @my_thread = MyThread.find(params[:id])
    end
end
