class AttendsController < ApplicationController
  before_action :set_attend, only: [:show, :edit, :update, :destroy]

  # GET /attends
  # GET /attends.json
  def index
    @attends = Attend.all
  end

  # GET /attends/1
  # GET /attends/1.json
  def show
  end

  # GET /attends/new
  def new
    @attend = Attend.new
  end

  # GET /attends/1/edit
  def edit
  end

  # POST /attends
  # POST /attends.json
  def create
    @attend = current_user.attends.build(in_date:Date.today ,in_time:Time.now)
    respond_to do |format|
      if @attend.save
        format.html { redirect_to root_path, notice: 'Attend was successfully created.' }
        format.json { render :show, status: :created, location: @attend }
      else
        format.html { render :new }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attends/1
  # PATCH/PUT /attends/1.json
  def update
    respond_to do |format|
      attend = Attend.find_by_id(params[:id])
      duration = Time.now - attend.in_time
      if attend.update(out_time:Time.now, duration: duration)
        format.html { redirect_to root_path, notice: 'Attend was successfully updated.' }
        format.json { render :show, status: :ok, location: @attend }
      else
        format.html { render :edit }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attends/1
  # DELETE /attends/1.json
  def destroy
    @attend.destroy
    respond_to do |format|
      format.html { redirect_to attends_url, notice: 'Attend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attend
      @attend = Attend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attend_params
      params.require(:attend).permit(:in_date, :in_time, :out_time, :duration, :user_id)
    end
end
