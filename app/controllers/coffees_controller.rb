# app/controllers/coffees_controller.rb

class CoffeesController < ApplicationController
  before_action :set_coffee, only: [:show, :edit, :update, :destroy]

  def index
    @coffees = Coffee.all
  end

  def show
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)

    if @coffee.save
      redirect_to coffee_path, notice: 'Coffee was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @coffee.update(coffee_params)
      redirect_to coffee_path(@coffee), notice: 'Coffee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @coffee.destroy
    redirect_to coffees_path, notice: 'Coffee was successfully destroyed.'
  end

  # Ação para gerenciar o catálogo (incluindo adição de café)
  def manage_catalog
    @coffees = Coffee.all
    @new_coffee = Coffee.new
  end

  def create_coffee
    @coffee = Coffee.new(coffee_params)

    if @coffee.save
      redirect_to manage_catalog_path, notice: 'Coffee was successfully created.'
    else
      @coffees = Coffee.all
      render :manage_catalog
    end
  end

  private

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def coffee_params
    params.require(:coffee).permit(:name, :description, :category, :image)
  end
end
