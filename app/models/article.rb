class Article < ApplicationRecord
    include Visible
    has_many :comments, dependent: :destroy
    has_one_attached :avatar

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates :nome, presence: true, format: { with: /[A-Z][a-z]* [A-Z][a-z]*/,
        message: "Preencher nome e sobrenome" }
end
