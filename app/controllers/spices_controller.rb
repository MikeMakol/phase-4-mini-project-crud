class SpicesController < ApplicationController
  rescue_from ActionController::RoutingError, with: :render_routing_error_response

  # GET /spices
  def index
    spices = Spice.all
    render json: spices
  end

  # POST /spices
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  # GET /spices/:id
  def show
    spice = find_spice
    render json: spice
  end

  # PATCH /spices/:id
  def update
      spice = find_spice
      spice.update(spice_params)
      render json: spice
  end

  # DELETE /spices/:id
  def destroy
      spice = find_spice
      spice.destroy
      head :no_content
  end

  private

  def find_spice
      Spice.find(params[:id])
  end

  def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
  end

  def render_routing_error_response
      render json: { error: "Spices does not have any unused routes" }, status: :bad_request
  end

end
