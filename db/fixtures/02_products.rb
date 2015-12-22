require 'csv'

CSV.table('db/fixtures/csv/products.csv').each do |row|
  Product.seed do |s|
    s.id = row[:id].to_i
    s.name = row[:name]
    s.workshop_id = row[:workshop_id]
    s.duration = row[:duration]
    s.required_level = row[:required_level]
  end
end