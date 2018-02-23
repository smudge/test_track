class Decision
  include ActiveModel::Model

  attr_accessor :variant, :split, :admin

  validates :variant, presence: true, allow_blank: false
  validates :split, presence: true
  validates :admin, presence: true

  validate :variant_belongs_to_split
  validate :split_must_not_already_be_decided

  def save
    split.with_lock do
      if valid?
        save!
      else
        false
      end
    end
  end

  def save!
    raise errors.full_messages.to_sentence unless valid?
    split.decide!(variant: variant, admin: admin)
    true
  end

  private

  def variant_belongs_to_split
    errors.add(:variant, "#{variant} is not a valid variant for split") unless split.has_variant? variant
  end

  def split_must_not_already_be_decided
    errors.add(:split, 'has already been decided') if split.decided_at?
  end
end
