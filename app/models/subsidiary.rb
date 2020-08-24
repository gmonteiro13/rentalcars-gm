class Subsidiary < ApplicationRecord
    validates :name, :cnpj, :address, presence: true
    validate :cnpj_must_be_a_valid_number

    private

    def cnpj_must_be_a_valid_number
        return if cnpj.blank?
        return if CNPJ.valid?(cnpj)

        errors.add(:cnpj, :invalid)
    end
end
