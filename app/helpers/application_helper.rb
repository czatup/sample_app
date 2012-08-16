module ApplicationHelper
	def full_title(page_title)
		base_title = 'Ruby on Rails Tutorial Sample App'
		if page_title.empty?
			base_title
		else 
			"#{base_title} | #{page_title}"
		end
		#{}"#{base_title} | #{page_title}" unless page_title.empty { base_title }
	end
end
