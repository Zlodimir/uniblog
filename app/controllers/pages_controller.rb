class PagesController < ApplicationController
	before_action :set_page, only: [:show]

	def index
		if Page.where(primary: :true).count != 0
			@main_page = Page.where(primary: :true).first
		else
			@main_page = Page.first
		end
		redirect_to page_path(@main_page)
		#@pages = Page.all
	end

	def show
		@comment = @page.comments.build
	end

	private

	def set_page
		@page = Page.find(params[:id])
	end
end
