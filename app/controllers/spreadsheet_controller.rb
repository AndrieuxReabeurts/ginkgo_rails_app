class SpreadsheetController < ApplicationController

	def index
		if Spreadsheet.first
			@book_sheet = Spreadsheet.random_book
		end
	end

	def import
		if Spreadsheet.first == nil
			Spreadsheet.import
		end
		redirect_to root_url
	end

end
