class QualificationsController < ApplicationController
  before_action :set_qualification, only: %i[ show edit update destroy ]

  def index
    @qualifications = Qualification.includes(:user).all
  end

  def show
  end

  def new
    @qualification = Qualification.new
  end

  def edit
  end

  def create
    @qualification = Qualification.new(qualification_params)

    if @qualification.save
      redirect_to @qualification, notice: "Kvalifikācija veiksmīgi izveidota."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @qualification.update(qualification_params)
      redirect_to @qualification, notice: "Kvalifikācija veiksmīgi atjaunināta."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @qualification.destroy
    redirect_to qualifications_url, notice: "Kvalifikācija veiksmīgi dzēsta."
  end

  private
    def set_qualification
      @qualification = Qualification.find(params[:id])
    end

    def qualification_params
      params.require(:qualification).permit(:user_id, :title, :level,
        :acquired_date, :valid_until, :description, :notes)
    end
end