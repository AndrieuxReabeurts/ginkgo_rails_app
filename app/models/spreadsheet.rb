

class Spreadsheet < ActiveRecord::Base
  attr_accessible :title, 
  								:author, 
  								:description, 
  								:edition, 
  								:copyright_year,
  								:list_price

require 'roo'

  def self.import
  	spreadsheet = open_sheet
  	keys = spreadsheet.row(1)
  	keys.each do |each_key|
  		each_key = each_key.downcase!
  	end
  	(2..spreadsheet.last_row).each do |each_row|
  		row = Hash[[keys, spreadsheet.row(each_row)].transpose]
  		new_book = Spreadsheet.new
  		new_book.attributes = row.to_hash.slice(*accessible_attributes)
  		new_book.save
  	end
  end

  def self.open_sheet
  	new_sheet = Roo::Excelx.new("BookData.xlsx")
  end

  def self.random_book
  	Spreadsheet.find(rand(1..Spreadsheet.last.id))
  end
end
