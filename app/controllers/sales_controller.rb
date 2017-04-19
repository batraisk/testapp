class SalesController < ApplicationController
	before_action :require_error 

  def index
    to = date_params[:to].to_date
    from = date_params[:from].to_date
  	sales = Sale.where(date: from..to).group(:good).sum(:total)
    goods = []
    sales.each {|good, revenue| goods.push({ title: good.title, revenue: revenue})}
  	render json: {from: from, to: to, goods: goods}
  end

	def date_params
		params.permit(:to,:from)
	end

	def require_error
		if date_params[:from].to_date > date_params[:to].to_date
      render status: 422
    end
	end
end






