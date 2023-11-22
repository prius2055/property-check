class Api::V1::InspectionsController < ApplicationController
    before_action :authenticate_user!
    def index
        # @inspections = Inspection.includes(:property).where(user_id: params[:user_id])
        # @inspections = Inspection.includes(:property)

        @inspections = Inspection.all
        render json: @inspections
    end

  def new
    @inspection = Inspection.new
  end

   def show
    @inspection = Inspection.find(params[:id])
    render json: @inspection
  end

  def create
    @inspection = Inspection.new(inspection_params)

    if @inspection.save
      render json: { status: 'Success', message: 'Inspection created successfully' }, status: :created
    else
      render json: { errors: @inspection.errors.full_messages }, status: :unprocessable_entity
    end
  end

   def destroy
    @inspection = Inspection.find_by(id: params[:id])
    if @inspection
      if @inspection.destroy
        render json: { message: 'Inspection deleted successfully.' }
      else
        render json: { error: 'Unable to delete an inspection.' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Inspection not found.' }, status: :not_found
    end
  end

   private

  def inspection_params
    params.require(:inspection).permit(:inspection_date, :inspection_time, :property_id, :user_id)
  end

end
