class PostsController < ApplicationController
  def update
    @post = Post.find(params[:id])
    if policy(@post).update?
      render json: {success: 'Updated'}
    else
      render json: {error: 'Unauthorised'}
    end
  end
end
