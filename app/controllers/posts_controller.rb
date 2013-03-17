class PostsController < ApplicationController
 
load_and_authorize_resource
  # GET /posts
  # GET /posts.json
  def index
    
    @posts = Post.where(:approved => nil).all #approved
    if params[:view] == "top10"
        @posts = Post.where(:approved => 1).order("likes_n DESC").limit(10) #approved
      end
    if (params[:view] == "approve") && (can? :manage)     
          @posts = Post.where(:approved => 0) #approved
      end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
 
  # GET /posts/1
  # GET /posts/1.json
  def show

    @post = Post.find(params[:id])
   
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end


  # GET /posts/new
  # GET /posts/new.json
  def new
    #authorize! :index, @user, :message => 'Not authorized as an administrator1.'
    #@users = User.all

    @post = Post.new()
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }

    end
  end

  # GET /posts/1/edit
  def edit
     authorize! :index, @user, :message => 'Not authorized as an administrator1.'
    @post = Post.find(params[:id])
  end
# GET /posts/1/addlike
def addlike
 
  @ip = request.remote_ip
  @post = Post.find(params[:id])
  @like = Like.find_or_initialize_by_post_id_and_send_by_ip(@post.id, @ip ) #create_by
 
  @like.addlike(@post, @ip)
redirect_to posts_url
end
# GET /posts/1/adddislike
def adddislike
  @ip = request.remote_ip
  @post_id = Post.find(params[:id]).id
  @like = Like.find_or_initialize_by_post_id_and_send_by_ip(@post_id, @ip ) #create_by
  @like.adddislike(@post_id, @ip)
redirect_to posts_url
end

  # POST /posts
  # POST /posts.json
  # here go after new form
  def create  
    @post = Post.new(params[:post])
    @post.author = current_user.name 
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: posts_url }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
