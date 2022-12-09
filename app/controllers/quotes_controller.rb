class QuotesController < ApplicationController
  before_action :setup_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "Quote created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote updated."
    else
      render :edit
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote destroyed."
  end

  private

  def setup_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
