# frozen_string_literal: true

class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }
  broadcasts_to ->(_quote) { "quotes" }, inserts_by: :prepend
end
