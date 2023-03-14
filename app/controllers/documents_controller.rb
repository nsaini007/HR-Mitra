class DocumentsController < ApplicationController
    before_action :set_document, only: [:edit, :update, :destroy, :show]
    def index
      @documents = Document.all
    end
  
    def new
      @document = Document.new
    end
  
    def show
    end
    
    def destroy
      if @document.delete
        redirect_to documents_path, notice: "Document has been deleted successfully"
      else
        # notice: "FUCK YOU"
      end    
    end
  
    def edit
    end
    
    def update
      if @document.update(document_params)
        redirect_to documents_path, notice: "Document has been updated successfully"
      else
        render :edit
      end
      
    end
  
    def create
      # not recommended use permit for less writing of code
  
      # @document = document.new(first_name: params[:document][:first_name],middle_name:params[:document][:middle_name], last_name: params[:document][:last_name], personal_email: params[:document][:personal_email], city: params[:document][:city], state: params[:document][:state], country: params[:document][:country], pincode: params[:document][:pincode], address_line_1: params[:document][:address_line_1], address_line_2: params[:document][:address_line_2])
  
      @document = Document.new(document_params)
  
      if @document.save
        redirect_to documents_path, notice: "Document has been created successfully"
      else
        render :new
      end
    end
  
    private
    #permitting strong perameters
      def document_params
          params.require(:document).permit(:name, :doc_type, :employee_id, :image)
      end
  
      def set_document
        @document = Document.find(params[:id])
      rescue ActiveRecord::RecordNotFound => error
        redirect_to documents_path, notice: error
      end
  end
  