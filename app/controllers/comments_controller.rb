class CommentsController < ApplicationController
  def create
    @comment=Comment.new
    p current_user
    @comment.user_id=current_user.id;
    @comment.post_id=params[:post_id]
    @comment.content=params[:comment]
    @comment.save    
  end

  def destroy(id)
    Comment.find(id).destory
  end

  def show_post_comments()
    post_id = params[:post_id];
    @comments=Comment.where("post_id=?",post_id)
    json_array = [];
    # @user=@comment.user
    # render :json =>{}

    @comments.each do |comment|
      user = comment.user
      json_array.append({:comment=>comment.content,:user=>user.email});
    end

    render json: json_array.to_json
  end


  # def show_user_post(post_id)
  #   @post=Comments.find

  # end

  
end
