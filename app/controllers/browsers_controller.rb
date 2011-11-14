class BrowsersController < ApplicationController
  def index
    @browsers = Browser.all

    respond_to do |format|
      format.html
      format.json { render json: @browsers }
    end
  end

  def show
    if params[:browser]
      @browser = Browser.where("hostname like ?","#{params[:browser]}%").limit(1).first
    else
      @browser = Browser.find(params[:id])
    end

    @browser_status = @browser.status

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @browser }
    end
  end

  def new
    @browser = Browser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @browser }
    end
  end

  def edit
    @browser = Browser.find(params[:id])
  end

  def create
    @browser = Browser.new(params[:browser])

    respond_to do |format|
      if @browser.save
        format.html { redirect_to @browser, notice: 'Browser was successfully created.' }
        format.json { render json: @browser, status: :created, location: @browser }
      else
        format.html { render action: "new" }
        format.json { render json: @browser.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @browser = Browser.find(params[:id])

    respond_to do |format|
      if @browser.update_attributes(params[:browser])
        format.html { redirect_to @browser, notice: 'Browser was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @browser.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @browser = Browser.find(params[:id])
    @browser.destroy

    respond_to do |format|
      format.html { redirect_to browsers_url }
      format.json { head :ok }
    end
  end
end
