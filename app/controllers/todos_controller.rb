class TodosController < ApplicationController

    def index
        @todos = Todo.order(:id)
    end

    def new
        @todo = Todo.new
    end
    
    def create
        todo = Todo.new(todo_params)
        todo.save

        if todo.save
            redirect_to root_path, notice: 'EL ToDo fue almacenado con éxito!'
        else
            redirect_to root_path, alert: 'No se ha podido almacenar el ToDo'
        end
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end
    
    def update
        @todo = Todo.find(params[:id]) 
        @todo.update(todo_params)

        redirect_to root_path, notice: 'El ToDo fue actualizado'
    end
    
    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy

        redirect_to root_path
    end
    
    def complete
        @todo = Todo.find(params[:id])
        @todo.completed = true
        @todo.save

        redirect_to root_path
    end
    
    def list
        @completed = Todo.where(completed: true)
        @nocompleted = Todo.where(completed: false)
    end
    

    private

    def todo_params
    params.require(:todo).permit(:description, :completed)
    end
end
