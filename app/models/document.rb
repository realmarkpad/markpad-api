class Document < ApplicationRecord
    self.table_name = :documents

    validates :name, presence: true, uniqueness: { case_sensitive: false }

    has_many   :children, class_name: "Document", foreign_key: :parent_document_id
    belongs_to :parent,   class_name: "Document", foreign_key: :parent_document_id, optional: true
end
