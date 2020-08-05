FactoryBot.define do
  factory :document do
    name { "Document Name" }
    content { "Document content" }
    parent_document_id { nil }
  end
end
