class PagesController < ApplicationController
	before_action :set_page, only: [:show]

	def index
		if Page.where(primary: :true).count != 0
			@main_page = Page.where(primary: :true).first
			redirect_to page_path(@main_page)
		else
			if Page.count != 0
				@main_page = Page.first
				redirect_to page_path(@main_page)
			else
				redirect_to root_path
			end
		end
	end

	def show
		@comment = @page.comments.build
	end

	private

	def set_page
		@page = Page.find(params[:id])
	end
end
