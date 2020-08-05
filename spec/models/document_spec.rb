require "rails_helper"

RSpec.describe Document, type: :model do
  describe "Columns" do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:content) }
    it { is_expected.to respond_to(:parent_document_id) }
  end

  describe "Associations" do
    it { is_expected.to have_many(:children).
         with_foreign_key(:parent_document_id).
         class_name("Document")
        }
    it { is_expected.to belong_to(:parent).
         with_foreign_key(:parent_document_id).
         class_name("Document").optional
        }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }

    subject { build(:document) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end

  describe "Factory" do
    it { expect(build :document).to be_a Document }
    it { expect(build :document).to be_valid }
  end
end
