module ApplicationHelper
	def get_page_num(url)
		return if url.blank?

		uri = URI.parse(url)
		params = CGI.parse(uri.query)
		params["page"].first.to_s.to_i
	end

	def next_page_num(curr_page)
		return if curr_page.blank?

		get_page_num(curr_page.links.next)
	end

	def prev_page_num(curr_page)
		return if curr_page.blank?

		get_page_num(curr_page.links.prev) 
	end
end
