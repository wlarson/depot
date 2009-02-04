class OrderItemsController < ApplicationController
  # GET /order_items
  # GET /order_items.xml
  def index
    @order_items = OrderItems.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_items }
    end
  end

  # GET /order_items/1
  # GET /order_items/1.xml
  def show
    @order_items = OrderItems.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_items }
    end
  end

  # GET /order_items/new
  # GET /order_items/new.xml
  def new
    @order_items = OrderItems.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_items }
    end
  end

  # GET /order_items/1/edit
  def edit
    @order_items = OrderItems.find(params[:id])
  end

  # POST /order_items
  # POST /order_items.xml
  def create
    @order_items = OrderItems.new(params[:order_items])

    respond_to do |format|
      if @order_items.save
        flash[:notice] = 'OrderItems was successfully created.'
        format.html { redirect_to(@order_items) }
        format.xml  { render :xml => @order_items, :status => :created, :location => @order_items }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order_items.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_items/1
  # PUT /order_items/1.xml
  def update
    @order_items = OrderItems.find(params[:id])

    respond_to do |format|
      if @order_items.update_attributes(params[:order_items])
        flash[:notice] = 'OrderItems was successfully updated.'
        format.html { redirect_to(@order_items) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order_items.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.xml
  def destroy
    @order_items = OrderItems.find(params[:id])
    @order_items.destroy

    respond_to do |format|
      format.html { redirect_to(order_items_url) }
      format.xml  { head :ok }
    end
  end
end
