class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    @time = Time.now.strftime("%B  %d")
  end

  def show
    @companies = Company.companies(Company.all)
    @name = Company.find(params[:id]).name
    @company = @companies[@name]
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to root_path
    else
      render new_company_path
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :link)
  end
end
