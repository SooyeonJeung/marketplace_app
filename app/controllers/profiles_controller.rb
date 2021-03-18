require_relative 'products_controller'  

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :all_profiles, only: %i[ index ]
  
  def index
    # @profile = Profile.find(1)
    @profile = Profile.find_by(user: current_user)

    if !@profile
      redirect_to new_profile_url
    end
    puts "@profile is here:"
    p @profile
  end

  def show
    
  end
  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    # @profile = current_user.profile.create(profile_params)
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def restricted
  end

  def destroy
    @profile.destroy
  
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def all_profiles
      @profiles = Profile.all
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:fname, :lname, :location, :activity, :seller, :buyer, :selfintro, :picture)
    end

    def get_products
      @product_list = Product.where(user_id: current_user.id, sold: false)
    end

end
