class CartitemsController < ApplicationController
  before_action :set_cartitem, only: %i[ show edit update_q update destroy ]

  def index
    @cartitems = Cartitem.all
  end

  def show
  end

  def new
    @cartitem = Cartitem.new
  end

  def edit
  end
  
  def insert_article
  end

  def create
#    @cartitem = Cartitem.new
#    quantity_ordered = params[:cartitem][:q_order].to_d
#    price_um = article.sell_price
    @cart = Cart.find(params[:cartitem][:cart_id])
    @article = Article.find(params[:cartitem][:article_id])
    price_ordered = @article.sell_price * params[:cartitem][:quantity_ordered].to_d

    @cartitem = Cartitem.create(article_id: @article.id, quantity_ordered: params[:cartitem][:quantity_ordered].to_d, price_ordered: price_ordered, cart_id: params[:cartitem][:cart_id].to_i)
    @destroy = false

    respond_to do |format|
      if @cartitem.save
        format.turbo_stream
#        format.html { redirect_to cartitem_url(@cartitem), notice: "Cartitem was successfully created." }
      else
        format.turbo_stream { render turbo_stream:  turbo_stream.replace( @article, partial: 'carts/cartitem_block', locals: { article: @article } ) }
        # :cartitem_errors }
#        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update_q
    @article = @cartitem.article
    @cart = @cartitem.cart
    if params[:quantity_ordered].to_d == 0
      @cartitem.destroy
      respond_to do |format|
      format.turbo_stream do
          turbo_stream.replace "article_#{@article.id}" do
            render 'cartitem_block', article: @article
          end
#          render turbo_stream.replace(@article, partial: 'cartitem_block', locals: { article: @article } )
        end
      end
    else
      price_ordered = @cartitem.article.sell_price.to_d * params[:quantity_ordered].to_d
      @cartitem.update(quantity_ordered: params[:quantity_ordered].to_d, price_ordered: price_ordered)
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  def update
    respond_to do |format|
      if @cartitem.update(cartitem_params)
        format.turbo_stream
        format.html { redirect_to cartitem_url(@cartitem), notice: "Cartitem was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cartitems/1 or /cartitems/1.json
  def destroy
    @cartitem.destroy

    respond_to do |format|
      format.html { redirect_to cartitems_url, notice: "Cartitem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartitem
      @cartitem = Cartitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cartitem_params
      params.require(:cartitem).permit(:article_id, :cart_id, :fulfilled, :price_ordered, :quantity_ordered, :quantity_prepared)
    end

  def set_cart_item_params
    quantity_ordered = params[:cartitem][:q_order].to_d
    article = Article.find(params[:cartitem][:article_id])
    price_um = article.sell_price
    price_ordered = article.sell_price * quantity_ordered
  end

end
