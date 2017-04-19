# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'    

csv_text = File.read("db/imports/Fake Trader Company sales - Sheet1.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  next if row[0].blank?
  good = Good.create title: row[0]
  csv.headers.each_with_index do |date, index|
    next if index.zero?
    Sale.create good: good,
                total: row[index].to_f,
                date: date.to_date
  end
end
