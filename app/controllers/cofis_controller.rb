#encoding: utf-8
class CofisController < ApplicationController
  before_filter :require_user
  load_and_authorize_resource

  # GET /cofis
  # GET /cofis.json
  def index
    @cofis = Cofi.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cofis }
    end
  end

  # GET /cofis/1
  # GET /cofis/1.json
  def show
    @cofi = Cofi.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cofi }
    end
  end

  # GET /cofis/new
  # GET /cofis/new.json
  def new
    @cofi = Cofi.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cofi }
    end
  end

  # GET /cofis/1/edit
  def edit
    @cofi = Cofi.find(params[:id])
  end

  # POST /cofis
  # POST /cofis.json
  def create
    @cofi = Cofi.new(params[:cofi])

    respond_to do |format|
      if @cofi.save
        format.html { redirect_to cofis_url, notice: 'Cofi was successfully created.' }
        format.json { render json: @cofi, status: :created, location: @cofi }
      else
        format.html { render action: "new" }
        format.json { render json: @cofi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cofis/1
  # PUT /cofis/1.json
  def update
    @cofi = Cofi.find(params[:id])

    respond_to do |format|
      if @cofi.update_attributes(params[:cofi])
        format.html { redirect_to cofis_url, notice: 'Cofi was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cofi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cofis/1
  # DELETE /cofis/1.json
  def destroy
    @cofi = Cofi.find(params[:id])
    @cofi.destroy

    respond_to do |format|
      format.html { redirect_to cofis_url }
      format.json { head :no_content }
    end
  end
end
