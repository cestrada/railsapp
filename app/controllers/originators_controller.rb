#encoding: utf-8
class OriginatorsController < ApplicationController
  before_filter :require_user
  load_and_authorize_resource

  # GET /originators
  # GET /originators.json
  def index
    @originators = Originator.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @originators }
    end
  end

  # GET /originators/1
  # GET /originators/1.json
  def show
    @originator = Originator.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @originator }
    end
  end

  # GET /originators/new
  # GET /originators/new.json
  def new
    @originator = Originator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @originator }
    end
  end

  # GET /originators/1/edit
  def edit
    @originator = Originator.find(params[:id])
  end

  # POST /originators
  # POST /originators.json
  def create
    @originator = Originator.new(params[:originator])

    respond_to do |format|
      if @originator.save
        format.html { redirect_to originators_url, notice: 'Originator was successfully created.' }
        format.json { render json: @originator, status: :created, location: @originator }
      else
        format.html { render action: "new" }
        format.json { render json: @originator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /originators/1
  # PUT /originators/1.json
  def update
    @originator = Originator.find(params[:id])

    respond_to do |format|
      if @originator.update_attributes(params[:originator])
        format.html { redirect_to originators_url, notice: 'Originator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @originator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /originators/1
  # DELETE /originators/1.json
  def destroy
    @originator = Originator.find(params[:id])
    @originator.destroy

    respond_to do |format|
      format.html { redirect_to originators_url }
      format.json { head :no_content }
    end
  end
end
