class BrowsersController < ApplicationController
  # GET /browsers
  # GET /browsers.json
  def index
    @browsers = Browser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @browsers }
    end
  end

  # GET /browsers/1
  # GET /browsers/1.json
  def show
    @browser = Browser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @browser }
    end
  end

  # GET /browsers/new
  # GET /browsers/new.json
  def new
    @browser = Browser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @browser }
    end
  end

  # GET /browsers/1/edit
  def edit
    @browser = Browser.find(params[:id])
  end

  # POST /browsers
  # POST /browsers.json
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

  # PUT /browsers/1
  # PUT /browsers/1.json
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

  # DELETE /browsers/1
  # DELETE /browsers/1.json
  def destroy
    @browser = Browser.find(params[:id])
    @browser.destroy

    respond_to do |format|
      format.html { redirect_to browsers_url }
      format.json { head :ok }
    end
  end
end
