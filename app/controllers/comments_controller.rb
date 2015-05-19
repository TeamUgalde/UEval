class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :destroy]


  # GET /comments
  # GET /comments.json
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
    @commentableName = @commentable.class.name
    render layout: false
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    commentable = find_commentable
    cont = params[:content]
    @comment = Comment.new(user_id: current_user.id, commentable_id: commentable.id, commentable_type: commentable.class.name ,content: cont, flagged: false)
    @comment.save
    render :inline => ""
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    Comment.find(params[:id]).destroy
    render :inline => ""
  end

  def update
    comment = Comment.find(params[:id])
    comment.flagged = true
    comment.save
    render :inline => ""
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
