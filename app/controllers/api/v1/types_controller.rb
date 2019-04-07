class Api::V1::TypesController < ApplicationController
  before_action :set_type, only: [:show]

  # GET /types
  def index
    @types = Type.all

    render json: @types
  end

end
