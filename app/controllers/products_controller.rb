require_relative 'profiles_controller' 

class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:restricted]
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def home

  end

  def payment
  end

  def index
    @products = Product.all
    @products = Product.search(params[:search])
  end

  # GET /products/1 or /products/1.json
  def show
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
          name: @product.name,
          description: @product.description,
          images: ["marketplace_app/app/assets/images/baby2.jpg"],
          amount: (@product.price * 100).to_i,
          currency: 'aud',
          quantity: 1,
      }],
      payment_intent_data: {
          metadata: {
          user_id: current_user.id,
          product_id: @product.id
          }
      },
      success_url: "#{root_url}payments/success?productId=#{@product.id}",
      cancel_url: "#{root_url}products"
      )
  @session_id = session.id
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  

  # POST /products or /products.json
  def create
    # @product = Product.new(product_params)
    # @product.user = current_user

    @product = current_user.products.create(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def restricted

  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
  
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :category, :description, :quantity, :price, :brand, :sold, :picture)
    end

end
