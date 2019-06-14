class SalesController < ApplicationController

  def new
    
  end

  def create
    @sale = Sale.new(user_params)
    @sale.total = @sale.value - @sale.value * (@sale.discount.to_f/100)
    
    if @sale.tax == 0
      @sale.tax = 0
    else
      @sale.total = @sale.total* 0.81
      @sale.tax = 19
    end
    @sale.save
    redirect_to done_path(@sale)
  end 
   
  def done
    @sale = Sale.find(params[:id])
  end


  private
  def user_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax, :value)
  end

end
