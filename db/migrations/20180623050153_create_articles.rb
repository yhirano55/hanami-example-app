Hanami::Model.migration do
  change do
    create_table :articles do
      primary_key :id

      column :subject, String, null: false
      column :content, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
