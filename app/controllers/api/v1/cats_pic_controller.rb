class Api::V1::CatsPicController < ApplicationController
  before_action :set_cat_pic, only: [:show, :destroy, :update]

  # @route GET /api/v1/cats_pic (api_v1_cats_pic_index)
  def index
    cat_pics = CatPic.all
    render json: cat_pics.map { |cat_pic| serialize(cat_pic) }
  end

  # @route GET /api/v1/cats_pic/:id (api_v1_cats_pic)
  def show
    render json: serialize(@cat_pic)
  end

  # @route POST /api/v1/cats_pic (api_v1_cats_pic_index)
  def create
    cat_pic = CatPic.new(cat_pic_params)

    if cat_pic.save
      render json: serialize(cat_pic), status: 201
    else
      render json: { errors: cat_pic.errors.full_messages }, status: 400
    end
  end

  # @route PATCH /api/v1/cats_pic/:id (api_v1_cats_pic)
  # @route PUT /api/v1/cats_pic/:id (api_v1_cats_pic)
  def update
    if @cat_pic.update(cat_pic_params)
      render json: serialize(@cat_pic)
    else
      render json: { errors: @cat_pic.errors.full_messages }, status: 400
    end
  end

  # @route DELETE /api/v1/cats_pic/:id (api_v1_cats_pic)
  def destroy
    @cat_pic.destroy
    head :no_content
  end

  private

  def set_cat_pic
    @cat_pic = CatPic.find_by(id: params[:id])
    render json: { error: "Not found" }, status: 404 unless @cat_pic
  end

  def serialize(cat_pic)
    {
      id: cat_pic.id,
      title: cat_pic.title,
      description: cat_pic.description,
      image: url_for(cat_pic.image)
    }
  end

  def cat_pic_params
    params.permit(:title, :description, :image)
  end
end
