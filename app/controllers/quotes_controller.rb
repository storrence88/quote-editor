# frozen_string_literal: true

class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = current_company.quotes.ordered
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = current_company.quotes.build(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    if @quote.update(quote_params)
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
