class AvailabilitiesController < ApplicationController
  before_action :set_availability, only: %i[ show edit update destroy ]

  def index
    @availabilities = Availability.includes(:user).all
  end

  def show
  end

  def new
    @availability = Availability.new
  end

  def edit
  end

  def create
    @availability = Availability.new(availability_params)

    if @availability.save
      redirect_to @availability, notice: "Pieejamība veiksmīgi izveidota."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @availability.update(availability_params)
      redirect_to @availability, notice: "Pieejamība veiksmīgi atjaunināta."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @availability.destroy
    redirect_to availabilities_url, notice: "Pieejamība veiksmīgi dzēsta."
  end

  private
    def set_availability
      @availability = Availability.find(params[:id])
    end

    def availability_params
      params.require(:availability).permit(:user_id, :date, :time_slot,
        :is_available, :notes)
    end
end