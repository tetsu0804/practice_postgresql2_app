class Api::BlogsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    blogs = Blog.all
    render json: {blogs: blogs }
  end

  def create
    blog = Blog.new(blog_params)
    if blog.save
      render json: {blog: blog}
    else
      render json: "ブログ作成失敗しました", status: :unauthorized
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:name)
    end
end
