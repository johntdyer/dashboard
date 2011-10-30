class PhonosController < ApplicationController
  before_filter :authenticate_user!, :except=>[:show,:index]
  
  # GET /phonos
  # GET /phonos.json
  def index
    @phonos = Phono.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phonos }
    end
  end

  # GET /phonos/1
  # GET /phonos/1.json
  def show
    @phono = Phono.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phono }
    end
  end

  # GET /phonos/new
  # GET /phonos/new.json
  def new
    @phono = Phono.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phono }
    end
  end

  # GET /phonos/1/edit
  def edit
    @phono = Phono.find(params[:id])
  end

  # POST /phonos
  # POST /phonos.json
  def create
    @phono = Phono.new(params[:phono])

    respond_to do |format|
      if @phono.save
        format.html { redirect_to @phono, notice: 'Phono was successfully created.' }
        format.json { render json: @phono, status: :created, location: @phono }
      else
        format.html { render action: "new" }
        format.json { render json: @phono.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phonos/1
  # PUT /phonos/1.json
  def update
    @phono = Phono.find(params[:id])

    respond_to do |format|
      if @phono.update_attributes(params[:phono])
        format.html { redirect_to @phono, notice: 'Phono was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @phono.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phonos/1
  # DELETE /phonos/1.json
  def destroy
    @phono = Phono.find(params[:id])
    @phono.destroy

    respond_to do |format|
      format.html { redirect_to phonos_url }
      format.json { head :ok }
    end
  end
end