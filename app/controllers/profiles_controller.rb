require_relative 'products_controller'  

class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:restricted]
  before_action :set_product, only: %i[ show edit update destroy ]
  
  def index
    @profiles = Profile.all

  end

  def show
    
  end
  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = current_user.profile.create(profile_params)

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
      format.html { redirect_to products_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:fname, :lname, :location, :transaction, :seller, :buyer, :selfintro, :picture)
    end

end
