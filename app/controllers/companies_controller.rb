class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    if current_user.id == -100
      @companies = Company.all
    else
      kick_out
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @address = @company.addresses.find_by(current: true)
    @contact = Contact.find_by(contactable_id: @company.id, contactable_type: 'Company')
    @services = CompanyService.where(company_id: @company.id)
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
    if !@isowner
      kick_out
    end
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id

    respond_to do |format|
      if @company.save
        add_company_owner(@company.id)
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if check_company_ownership(@company.id)
      else
        kick_out
      end
      
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
      kick_out    
    # @company.destroy
    # respond_to do |format|
    #   format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
      @isowner = check_company_ownership(@company.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:user_id, :name)
    end
end