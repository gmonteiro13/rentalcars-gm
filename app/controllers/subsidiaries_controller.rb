class SubsidiariesController < ApplicationController
    def index
        @subsidiaries = Subsidiary.all
    end

    def show
        @subsidiary = Subsidiary.find(params[:id]) # params é um HASH
    end

    def new
        @subsidiary = Subsidiary.new
    end

    def create
        @subsidiary = Subsidiary.new(subsidiary_params)
      if @subsidiary.save
        redirect_to @subsidiary, notice: 'Filial criada com sucesso!'
        
      else
        render :new
      end
    end

    private
  
    def subsidiary_params
      params.require(:subsidiary).permit(:name, :address, :cnpj)
    end
end