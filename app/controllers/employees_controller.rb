class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_designation

  # GET /employees
  def index
    @employees = designation_class.all
  end

  # GET /employees/:id
  def show
    @response = designation_class.responsibilities
  end

  # GET /employees/new
  def new
    @employee = designation_class.new
  end

  # GET /employees/:id/edit
  def edit
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: '#{designation} was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/:id
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: '#{designation} was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/:id
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: '#{designation} was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_designation
      @designation = designation
    end

    def designation
      Employee.designations.include?(params[:type]) ? params[:type] : "Employee"
    end

    def designation_class
      designation.constantize
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(designation.underscore.to_sym).permit(:name, :email, :designation)
    end
end