class Post < ApplicationRecord
  belongs_to :user
  has_many :interactions, as: :interactable, dependent: :destroy
end
