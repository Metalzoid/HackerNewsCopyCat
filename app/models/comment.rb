class Comment < Interaction
  has_many :reactions, -> { where(type: 'Reaction') }, class_name: 'Interaction', as: :interactable, dependent: :destroy

  validates :content, presence: true
end
