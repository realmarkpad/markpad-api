class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name, null: false, index: true, unique: true
      t.text :content
      t.references :parent_document, null: true

      t.timestamps
    end

    add_foreign_key :documents, :documents, column: :parent_document_id, on_delete: :cascade
  end
end
