require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "valid" do
    quote = Quote.new(name: 'a quote')
    assert quote.valid?
  end

  test "invalid without name" do
    quote = Quote.new
    assert quote.invalid?
  end
end
