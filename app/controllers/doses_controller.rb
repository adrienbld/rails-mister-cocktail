class DosesController < ApplicationController
   # before_action :set_, only: [:show, :edit, :update, :destroy]
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    raise
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # @cocktail.dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
