class VolunteersController < ApplicationController
  before_action :set_volunteer, only: %i[ show edit update destroy ]

  # GET /volunteers or /volunteers.json
  def index
    @volunteers = Volunteer.all.includes(:user)
    @volunteers = Volunteer.page(params[:page])
  end

  # GET /volunteers/1 or /volunteers/1.json
  def show
    @volunteer.increment!(:view_count)
  end

  # GET /volunteers/new
  def new
    @volunteer = Volunteer.new
  end

  # GET /volunteers/1/edit
  def edit
  end

  # POST /volunteers or /volunteers.json
  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.user_id = current_user.id

    respond_to do |format|
      if @volunteer.save
        format.html { redirect_to @volunteer, notice: "Volunteer was successfully created." }
        format.json { render :show, status: :created, location: @volunteer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteers/1 or /volunteers/1.json
  def update
    @volunteer.user_id = current_user.id

    respond_to do |format|
      if @volunteer.update(volunteer_params)
        format.html { redirect_to @volunteer, notice: "Volunteer was successfully updated." }
        format.json { render :show, status: :ok, location: @volunteer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteers/1 or /volunteers/1.json
  def destroy
    @volunteer.destroy
    respond_to do |format|
      format.html { redirect_to volunteers_url, notice: "Volunteer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def activity
  end

  def volunteer_history
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def volunteer_params
      params.require(:volunteer).permit(:title, :content, :view_count, :user_id)
    end
end
