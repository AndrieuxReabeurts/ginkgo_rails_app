class SpreadsheetController < ApplicationController

	def index
		@book_sheet = Spreadsheet.random_book
	end

	def import 
		Spreadsheet.import
		redirect_to spreadsheet_index_path
	end

end
