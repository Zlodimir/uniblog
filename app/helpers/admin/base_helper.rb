module Admin::BaseHelper
	def page_sort
		hash = {}
		(1..10).each do | n  |
			hash[n] = n
		end
		hash
	end
end
