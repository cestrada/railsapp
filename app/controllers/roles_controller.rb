#encoding: utf-8
class RolesController < ApplicationController
  before_filter :require_user
  load_and_authorize_resource
  
  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = get_role(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = get_role(params[:id])
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_url, notice: 'Rol creado exitosamente.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = get_role(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to roles_url, notice: 'Rol actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = get_role(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end

  private
  def get_role(role_id)
    Role.find(role_id)
  end

end
