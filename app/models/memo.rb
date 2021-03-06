class Memo < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  default_scope { where(deleted_at: nil) }

  extend FriendlyId
  friendly_id :slug_candidate, use: :slugged
  # Use Babosa with Friendly/id
  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :vietnamese).to_s
  end

  include AASM
  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end

  def destroy
    update(deleted_at: Time.now)
  end

  private
  def slug_candidate
    [
      :title,
      [:title, SecureRandom.hex[0, 8]]
    ]
  end
end
