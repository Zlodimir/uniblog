class PagesController < ApplicationController
	before_action :set_page, only: [:show]

	def index
		@main_page = Page.where(name: 'Главная').first
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
