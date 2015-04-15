class PagesController < ApplicationController
	def index
		@items_cnt = Item.count
		@items_short = Item.order("created_at ASC").limit(10)
	end
end
