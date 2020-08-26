class Client < ApplicationRecord
    def information
      "#{name} - #{cpf}"
    end
end