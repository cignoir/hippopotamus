require 'csv'

CSV.table('db/fixtures/csv/workshops.csv').each do |row|
  Workshop.seed do |s|
    s.id = row[:id].to_i
    s.name = row[:name]
  end
end

