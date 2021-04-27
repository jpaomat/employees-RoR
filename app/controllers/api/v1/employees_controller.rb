module Api
    module V1
        #El nomnre del controlador debe ser plural y la clase se debe llamar igual que el controlador.
        class EmployeesController < ApplicationController
            # Obtener empleados de la db, ordenados por fechga de registro
            def index
                employees = Employee.order('created_at')
                render json: response_json("Employees loaded correctly", employees), status: :ok
            end

            def show
                employee = Employee.find(params[:id])
                render json: response_json("Employee loaded correctly", employee), status: :ok
            end

            def create
                employee = Employee.new(employee_params)
                if employee.save
                    render json: response_json("Employee created correctly", employee), status: :ok
                else
                    render json: response_json("Internal server error", employee, true), status: :unprocessable_entity
                end
            end

            def destroy
                employee = Employee.find(params[:id])
                if employee.destroy
                    render json: response_json("Employee deleted correctly", employee), status: :ok
                else
                    render json: response_json("Internal server error", employee, true), status: :unprocessable_entity
                end
            end

            def update
                employee = Employee.find(params[:id])
                if employee.update(employee_params) # Se verifica que los datos a actualizar esten correctos(que se envien los que son reuqeridos) y los actualiza
                    render json: response_json("Employee updated correctly", employee), status: :ok
                else
                    render json: response_json("Internal server error", employee, true), status: :unprocessable_entity
                end
            end

            private
                def employee_params
                    params.permit(:idEmployee, :fullname, :occupation, :idBoss)
                end

                def response_json(message, data, error = false)
                    {
                        status: (!error) ? "Successfully" : "Error",
                        message: message,
                        data: (!error) ? data : data.error
                    }
                end
        end
    end
end