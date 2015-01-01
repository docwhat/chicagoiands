# coding: utf-8

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
  def update # rubocop:disable MethodLength, Metrics/AbcSize
    @texture = Texture.find(params[:id])

    respond_to do |format|
      if @texture.update_attributes(params[:texture])
        if @texture.label == 'welcome'
          redir_path = root_path
        else
          redir_path = root_path + @texture.label
        end
        format.html { redirect_to redir_path, notice: 'The text was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: 'edit' }
        format.json { render json: @texture.errors, status: :unprocessable_entity }
      end
    end
  end
end
