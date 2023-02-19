class Quote < ApplicationRecord
  has_many :line_item_dates, dependent: :destroy

  belongs_to :company
  validates :name, presence: true
  scope :ordered, -> { order(id: :desc) }

  # after_create_commit -> { broadcast_prepend_to "quotes" }
  # after_update_commit -> { broadcast_replace_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # Those three callbacks are equivalent to the following single line
  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
