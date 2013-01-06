class ZombiesController < ApplicationController
  before_filter :get_zombie, :only => [:show, :edit, :update, :destroy, :decomp, :custom_decomp]
  before_filter :authorize, :only => [:edit, :update]
  load_and_authorize_resource
  def get_zombie
    @zombie = Zombie.find(params[:id])
  end

  # GET /zombies
  # GET /zombies.json
  def index
    @zombies = Zombie.includes(:brain).includes(:tweets).all
    @rotting_zombies = Zombie.rotting

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zombies }
    end
  end
  
  def decomp
    if @zombie.decomp == "Dead (again)"
      render json: @zombie.to_json(only: :decomp), status: :unprocessable_entity
    else
      render json: @zombie.to_json(only: :decomp), status: :ok
    end
  end

  def custom_decomp
    @zombie.decomp = params[:zombie][:decomp] 
    @zombie.save

    respond_to do |format|
      format.js
      format.json {render json: @zombie.to_json(only: :decomp) }
    end
  end
  # GET /zombies/1
  # GET /zombies/1.json
  def show
    @tweets = @zombie.tweets
    @role_names = @zombie.role_names

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zombie }
    end
  end

  # GET /zombies/new
  # GET /zombies/new.json
  def new
    @zombie = Zombie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zombie }
    end
  end

  # GET /zombies/1/edit
  def edit
    authorize! :edit, @zombie
  end

  # POST /zombies
  # POST /zombies.json
  def create
    @zombie = Zombie.new(params[:zombie])

    respond_to do |format|
      if @zombie.save
        session[:zombie_id] = @zombie.id
        format.html { redirect_to @zombie, notice: 'Thank you for signing up!' }
        format.json { render json: @zombie, status: :created, location: @zombie }
      else
        format.html { render action: "new" }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PUT /zombies/1
  # PUT /zombies/1.json
  def update
    respond_to do |format|
      if @zombie.update_attributes(params[:zombie])
        format.html { redirect_to @zombie, notice: 'Zombie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zombie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zombies/1
  # DELETE /zombies/1.json
  def destroy
    @zombie.destroy

    respond_to do |format|
      format.html { redirect_to zombies_url }
      format.json { head :no_content }
      format.js 
    end
  end
end
