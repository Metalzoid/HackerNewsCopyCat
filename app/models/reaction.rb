class Reaction < Interaction
  validates :content, presence: true
  validate :check_type

  private

  def check_type
    if self.interactable.class != Comment
      errors.add(:reaction, 'Reaction can only have a Comment on interactable_type')
    end
  end
end
