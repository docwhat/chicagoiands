class TexturesController < ApplicationController
  # GET /textures
  # GET /textures.json
  def index
    @textures = Texture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @textures }
    end
  end

  # GET /textures/1
  # GET /textures/1.json
  def show
    if params[:label].present?
      @texture = Texture.find_by_label(params[:label])
    else
      @texture = Texture.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @texture }
    end
  end

  # GET /textures/1/edit
  def edit
    @texture = Texture.find(params[:id])
  end

  # PUT /textures/1
  # PUT /textures/1.json
  def update
    @texture = Texture.find(params[:id])

    respond_to do |format|
      if @texture.update_attributes(params[:texture])
        format.html { redirect_to @texture, notice: 'Texture was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @texture.errors, status: :unprocessable_entity }
      end
    end
  end
end
