class SubsidiariesController < ApplicationController
    def index
        @subsidiaries = Subsidiary.all
    end

    def show
        @subsidiary = Subsidiary.find(params[:id]) # params é um HASH
    end
end