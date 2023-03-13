class Document < ApplicationRecord
  DOC_TYPES = ["Marksheet", "Photo ID", "Address Proof", "Others"].freeze

  belongs_to :employee

  validates :name, :doc_type , :employee_id, presence: true
end
