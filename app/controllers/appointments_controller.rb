class AppointmentsController < ApplicationController
  before_action :authenticate_user!, except: [:getlist,:singular]               #It's necessary to comment this line to make rspecs tests work.
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  def index
    @appointments = policy_scope(Appointment)         #It's necessary to comment this line to make rspecs tests work.
    #@appointments = Appointment.all                  #It's necessary to uncomment this line to make rspecs tests work.
  end
  
  # GET /appointments/getlist.json
  def getlist
    @appointments = Appointment.all
    respond_to do |format|
      format.json { render json: @appointments }
    end
  end
  
  # GET /appointments/:id/singular.json
  def singular
    @appointments = Appointment.find(params[:id])
    respond_to do |format|
      format.json { render json: @appointments }
    end
  end

  # GET /appointments/1
  def show
    authorize @appointment     #It's necessary to comment this line to make rspecs tests work.
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
     authorize @appointment    #It's necessary to comment this line to make rspecs tests work.
  end

  # GET /appointments/1/edit
  def edit
     authorize @appointment   #It's necessary to comment this line to make rspecs tests work.
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
    authorize @appointment    #It's necessary to comment this line to make rspecs tests work.
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice:  'Appointment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /appointments/1
  def update
    authorize @appointment    #It's necessary to comment this line to make rspecs tests work.
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    authorize @appointment    #It's necessary to comment this line to make rspecs tests work.
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice:  'Appointment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:user_id, :date)
    end
    
    
end
