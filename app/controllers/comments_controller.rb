class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :destroy]


  # GET /comments
  # GET /comments.json
  def index
    commentable = find_commentable
    @comments = commentable.comments
    @commentableName = commentable.class.name
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    path = find_redirect_route
    respond_to do |format|
      if @comment.save
        format.html { redirect_to  path, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if @comment.commentable_type == 'Professor'
      path = "/professors/#{@comment.commentable_id}/comments"
    else
      path = "/courses/#{@comment.commentable_id}/comments"
    end
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def find_redirect_route
      commentable = find_commentable
      if commentable.class.name == 'Professor'
        return professor_comments_path
      else
        return course_comments_path
      end
    end

    def find_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
