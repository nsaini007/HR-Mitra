class Document < ApplicationRecord
  belongs_to :employee

  validates :name, :doc_type , :employee_id, presence: true
end
