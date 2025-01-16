class Vote < Interaction
  validates :user_id, uniqueness: { scope: [:interactable_type, :interactable_id] }
end
