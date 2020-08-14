class SubsidiariesController < ApplicationController
    def index
        @subsidiaries = Subsidiary.all
    end
end