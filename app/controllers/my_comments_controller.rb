class MyCommentsController < ApplicationController
	before_action :set_my_comment, only: [:edit, :update, :destroy]
	before_action :set_my_thread, only: [:update, :destroy]

  def index
    @my_comments = MyComment.all
  end

  def new
    @my_comment = MyComment.new
  end

  def edit
  end

  def create
  	@my_thread = MyThread.find(params[:my_thread_id])
    @my_comment = @my_thread.my_comments.build(my_comment_params)

    respond_to do |format|
      if @my_comment.save
        format.html { redirect_to [@my_thread, @my_comments], notice: 'MyComment was successfully created' }
        format.json { render :show, status: :created, location: [@my_thread, @my_comments] }
      else
        format.html { render :new }
        format.json { render json: @my_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @my_comment.update(my_comment_params)
        format.html { redirect_to [@my_thread, @my_comments], notice: 'MyComment was successfully updated' }
        format.json { render :show, status: :created, location: [@my_thread, @my_comments] }
      else
        format.html { render :edit }
        format.json { render json: @my_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @my_comment.destroy
    respond_to do |format|
      format.html { redirect_to [@my_thread, @my_comments], notice: 'MyComment was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private
    def my_comment_params
      params.require(:my_comment).permit(:pen_name, :comment)
    end

    def set_my_comment
      @my_comment = MyComment.find(params[:id])
    end

    def set_my_thread
    	@my_thread = MyThread.find_by_id(@my_comment.my_thread.id)
    end
end
