

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
  	keys = format_header(spreadsheet.row(1))
  	(2..spreadsheet.last_row).each do |each_row|
  		row = Hash[[keys, spreadsheet.row(each_row)].transpose]
  		new_book = Spreadsheet.new
  		new_book.attributes = row
  		new_book.save
  	end
  end

  def self.open_sheet
  	new_sheet = Roo::Excelx.new("BookData.xlsx")
  end

  def self.format_header(header_array)
  	header_array.each do |each_header|
  		each_header = each_header.downcase!
  		if each_header.include?(" ")
  			each_header.sub!(" ", "_")
  		end
		end
  end

  def self.random_book
  	if Spreadsheet.first
  		Spreadsheet.find(rand(1..Spreadsheet.last.id))
  	end
  end
end
