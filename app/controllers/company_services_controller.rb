class CompanyServicesController < ApplicationController
  before_action :set_company_service, only: [:show, :edit, :update, :destroy]

  # GET /company_services
  # GET /company_services.json
  def index
    @company_services = CompanyService.all
  end

  # GET /company_services/1
  # GET /company_services/1.json
  def show
  end

  # GET /company_services/new
  def new
    @company = Company.find(params[:company_id])
    @company_service = @company.company_services.new
  end

  # GET /company_services/1/edit
  def edit
  end

  # POST /company_services
  # POST /company_services.json
  def create
    @company_service = CompanyService.new(company_service_params)

    respond_to do |format|
      if @company_service.save
        format.html { redirect_to @company_service, notice: 'Company service was successfully created.' }
        format.json { render :show, status: :created, location: @company_service }
      else
        format.html { render :new }
        format.json { render json: @company_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_services/1
  # PATCH/PUT /company_services/1.json
  def update
    respond_to do |format|
      if @company_service.update(company_service_params)
        format.html { redirect_to @company_service, notice: 'Company service was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_service }
      else
        format.html { render :edit }
        format.json { render json: @company_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_services/1
  # DELETE /company_services/1.json
  def destroy
    @company_service.destroy
    respond_to do |format|
      format.html { redirect_to company_services_url, notice: 'Company service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_service
      @company_service = CompanyService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_service_params
      params.require(:company_service).permit(:company_id, :service_id, :description)
    end
end
