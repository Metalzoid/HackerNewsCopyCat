class Interaction < ApplicationRecord
  belongs_to :user
  belongs_to :interactable, polymorphic: true
end
