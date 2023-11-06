class Api::V1::PropertiesController < ApplicationController
    before_action :authenticate_user!
    def index
        @properties = Property.all
        render json: @properties
  end

  def show
    property = Property.find(params[:id])
    render json: property
  end

  def create
    @property = Property.new(property_params)

    if@property.save
      render json: { status: 'Success', message: 'Furniture created successfully' }, status: :created
    else
      render json: { errors:@property.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @property = Property.find(params[:id])

    if @property.destroy
      render json: { status: 'Success', message: 'Property deleted sucessfully' }, status: :ok
    else
      render json: { status: 'Failed', message: 'Failed to delete Property' }, status: :bad_request
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :description, :type, :price, :image, :location, :user_id)
  end

end
