class PartitionPlatformsController < ApplicationController

  # GET /partition_platforms
  # GET /partition_platforms.json
  def index
    @partition_platforms = PartitionPlatform.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @partition_platforms }
    end
  end

  # GET /partition_platforms/1
  # GET /partition_platforms/1.json
  def show
    @partition_platform = PartitionPlatform.find_by_ppid(params[:id])

    Rails.logger.debug { params[:id] }
    respond_to do |format|
      format.html # show.html.erb
      format.json {
        render json: {
          :ppid=>@partition_platform.ppid,
          :description=>@partition_platform.description,
          :network=>@partition_platform.network.name,
          :datacenters=>@partition_platform.browsers.collect(&:datacenter).collect(&:name).uniq,
          :browsers=>@partition_platform.browsers.collect(&:hostname)
        }
      }
      format.xml{
        render xml: {
          :ppid=>@partition_platform.ppid,
          :description=>@partition_platform.description,
          :network=>@partition_platform.network.name,
          :datacenters=>@partition_platform.browsers.collect(&:datacenter).collect(&:name).uniq,
          :browsers=>@partition_platform.browsers.collect(&:hostname)
#          (:only => [:id, :content])
        }
      }
    end
  end

  # GET /partition_platforms/new
  # GET /partition_platforms/new.json
  def new
    @partition_platform = PartitionPlatform.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @partition_platform }
    end
  end

  # GET /partition_platforms/1/edit
  def edit
    @partition_platform = PartitionPlatform.find(params[:id])
  end

  # POST /partition_platforms
  # POST /partition_platforms.json
  def create
    @partition_platform = PartitionPlatform.new(params[:partition_platform])

    respond_to do |format|
      if @partition_platform.save
        format.html { redirect_to @partition_platform, notice: 'Partition platform was successfully created.' }
        format.json { render json: @partition_platform, status: :created, location: @partition_platform }
      else
        format.html { render action: "new" }
        format.json { render json: @partition_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /partition_platforms/1
  # PUT /partition_platforms/1.json
  def update
    @partition_platform = PartitionPlatform.find(params[:id])

    respond_to do |format|
      if @partition_platform.update_attributes(params[:partition_platform])
        format.html { redirect_to @partition_platform, notice: 'Partition platform was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @partition_platform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partition_platforms/1
  # DELETE /partition_platforms/1.json
  def destroy
    @partition_platform = PartitionPlatform.find(params[:id])
    @partition_platform.destroy

    respond_to do |format|
      format.html { redirect_to partition_platforms_url }
      format.json { head :ok }
    end
  end
end
