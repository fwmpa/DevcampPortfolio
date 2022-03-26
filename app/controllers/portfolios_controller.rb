class PortfoliosController < ApplicationController
  layout "portfolio"
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def ruby_on_rails
    @ruby_on_rails_portfolio_items = Portfolio.ruby_on_rails_portfolio_items
  end
  
  def new
    @portfolio_item = Portfolio.new         #build instanciantes 3 portfolio_item with technologies
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item =
      Portfolio.new(portfolio_params)
        #allows to receive name attribute from techonologies 

    respond_to do |format|
      if @portfolio_item.save
        format.html do
          redirect_to portfolios_path, notice: 'Your post is now live'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html do
          redirect_to portfolios_path, notice: 'Your post is now updated. '
        end
      else
        format.html { rendeer :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Record was successfully destroyed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body,
                                      technologies_attributes: [:name])
  end
  
end
