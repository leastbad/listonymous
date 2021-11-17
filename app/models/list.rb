class List < ApplicationRecord
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories
  has_many :text_messages
end
