require 'csv'

CSV.table('db/fixtures/csv/products.csv').each do |row|
  Product.seed do |s|
    s.id = row[:id].to_i
    s.name = row[:name]
    s.workshop_id = row[:workshop_id].to_i
    s.sec = row[:sec].to_i
    s.required_level = row[:required_level].to_i
    s.amount = row[:amount].to_i
  end
end