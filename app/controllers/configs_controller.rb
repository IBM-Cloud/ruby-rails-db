class ConfigsController < ApplicationController
  # GET /configs
  # GET /configs.json
  def index
    @configs = Config.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @configs }
    end
  end

  # GET /configs/1
  # GET /configs/1.json
  def show
    @config = Config.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @config }
    end
  end

  # GET /configs/new
  # GET /configs/new.json
  def new
    @config = Config.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @config }
    end
  end

  # GET /configs/1/edit
  def edit
    @config = Config.find(params[:id])
  end

  # POST /configs
  # POST /configs.json
  def create
    @config = Config.new(params[:config])

    session[:twilio_sid] = @config[:twilio_sid]
    session[:twilio_secret] = @config[:twilio_secret]
    session[:twilio_from_number] = @config[:twilio_from_number]

    redirect_to '/calls', notice: 'Twilio is now configured.'
    #respond_to do |format|
    #  if @config.save
    #    format.html { redirect_to @config, notice: 'Config was successfully created.' }
    #    format.json { render json: @config, status: :created, location: @config }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @config.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PUT /configs/1
  # PUT /configs/1.json
  def update
    @config = Config.find(params[:id])

    respond_to do |format|
      if @config.update_attributes(params[:config])
        format.html { redirect_to @config, notice: 'Config was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @config.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configs/1
  # DELETE /configs/1.json
  def destroy
    @config = Config.find(params[:id])
    @config.destroy

    respond_to do |format|
      format.html { redirect_to configs_url }
      format.json { head :no_content }
    end
  end
end
