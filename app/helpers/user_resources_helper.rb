module UserResourcesHelper

	def display_user_resources
		base_title = "<div class=\"col-lg-12\">Statistics</div>"
		base_title += '<div class="col-lg-12">ID:' + current_user.id.to_s + '</div>'
		base_title += '<div class="col-lg-12">resources</div>'
		base_title += '<div class="col-lg-12">Gold:' + current_user.user_resources.gold.to_s + '</div>'
		base_title += '<div class="col-lg-12">Metals:' + current_user.user_resources.metals.to_s + '</div>'
		base_title += '<div class="col-lg-12">Gems:' + current_user.user_resources.gems.to_s + '</div>'
		base_title += '<div class="col-lg-12">characters</div>'
		base_title.html_safe
	end
end
