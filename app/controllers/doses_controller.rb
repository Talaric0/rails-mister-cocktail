class DosesController < ApplicationController
  before_action :set_cocktail, only: :create
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = set_cocktail
    if @dose.save
      redirect_to @dose.cocktail, notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_url(@dose.cocktail), notice: 'Dose was successfully destroyed.'
  end

  private

  def set_cocktail
    Cocktail.find(params[:cocktail_id])
  end
  

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
