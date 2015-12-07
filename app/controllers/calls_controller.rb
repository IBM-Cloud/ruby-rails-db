class CallsController < ApplicationController
  # GET /calls
  # GET /calls.json
  def index
    @calls = Call.all
    if !session[:twilio_sid] || !session[:twilio_secret] || !session[:twilio_from_number]
      redirect_to '/configs/new'
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @calls }
      end
    end
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
    @call = Call.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call }
    end
  end

  # GET /calls/new
  # GET /calls/new.json
  def new
    @call = Call.new
    @contacts = Contact.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call }
    end
  end

  # GET /calls/1/edit
  def edit
    @call = Call.find(params[:id])
  end

  # POST /calls
  # POST /calls.json
  def create
    require 'twilio-ruby'
    twilio = Twilio::REST::Client.new session[:twilio_sid], session[:twilio_secret]


    begin
      params[:numbers].each do |num|
        twilio.calls.create(
            :from => session[:twilio_from_number],
            :to => num,
            :url => 'http://bluemix-rails32.mybluemix.net/bridge/index.xml'
        )
      end
        respond_to do |format|
          format.html {redirect_to '/calls', notice: 'Call was succesfully created.'}
        end
    rescue Exception => e
        respond_to do |format|
          format.html {redirect_to '/calls', error: 'Call was succesfully created.'}
        end
    end


    #@call = Call.new(params[:call])

    #respond_to do |format|
      #if @call.save
      #  format.html { redirect_to @call, notice: 'Call was successfully created.' }
      #  format.json { render json: @call, status: :created, location: @call }
      #else
      #  format.html { render action: "new" }
        #format.json { render json: @call.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PUT /calls/1
  # PUT /calls/1.json
  def update
    @call = Call.find(params[:id])

    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call = Call.find(params[:id])
    @call.destroy

    respond_to do |format|
      format.html { redirect_to calls_url }
      format.json { head :no_content }
    end
  end
end
