class List < ApplicationRecord
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories
  has_many :text_messages

  def self.search(search)
    if search && search != ''
      res = self.where("title LIKE ?", "%#{search}%")
    else 
      List.all
    end
  end
end
