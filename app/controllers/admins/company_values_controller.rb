module Admins
  class CompanyValuesController < AdminController
    def index
      render :index, locals: { company_values: CompanyValue.all }
    end

    def edit
      render :edit, locals: { company_value: CompanyValue.find(params[:id]) }
    end

    def destroy
      @company_value = CompanyValue.find(params[:id])
      flash[:notice] = if @company_value.destroy
                         'Company value was deleted successfully'
                       else
                         'Company value deletion failed'
                       end
      redirect_to admins_company_values_path
    end

    def update
      company_value = CompanyValue.find(params[:id])
      if company_value.update(company_value_params)
        flash[:notice] = 'Company value was edited successfully'
        redirect_to admins_company_values_path
      else
        render :edit, locals: { company_value: }
      end
    end

    def new
      render :new, locals: { company_value: CompanyValue.new }
    end

    def create
      company_value = CompanyValue.new(company_value_params)
      if company_value.save
        flash[:notice] = 'Company value was created successfully'
        redirect_to admins_company_values_path
      else
        render :new, locals: { company_value: }
      end
    end

    private

    def company_value_params
      params.require(:company_value).permit(:title)
    end
  end
end
