class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to company_path(@company)
    else  
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to company_path(@company)
    else  
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :status)
  end
end
