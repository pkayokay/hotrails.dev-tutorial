class Quote < ApplicationRecord
  validates :name, presence: true
  scope :ordered, -> { order(id: :desc) }

  after_create_commit -> { broadcast_prepend_to "quote_stream", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
end
