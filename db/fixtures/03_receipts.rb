require 'csv'

CSV.table('db/fixtures/csv/receipts.csv').each do |row|
  Receipt.seed do |s|
    s.id = row[:id].to_i
    s.product_id = row[:product_id].to_i
    s.material_id = row[:material_id].to_i
    s.quantity = row[:quantity].to_i
  end
end