Hanami::Model.migration do
  change do
    set_column_type :articles, :content, String, text: true
  end
end
