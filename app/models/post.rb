class Post < ApplicationRecord
  has_many :interactions, as: :interactable, dependent: :destroy
  has_many :comments, -> { where(type: 'Comment') }, class_name: 'Interaction', as: :interactable

  has_many :votes, -> { where(type: 'Vote') }, class_name: 'Interaction', as: :interactable

  validates :title, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validates :author, presence: true
  validates :post_type, presence: true
  validates :score, presence: true, numericality: { only_integer: true }

end
