# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :company

  scope :ordered, -> { order(id: :desc) }
  broadcasts_to ->(_quote) { "quotes" }, inserts_by: :prepend

  validates :name, presence: true
end
