module ApplicationHelper
		def status_tag(boolean, options={})
		#this will return text based on whether boolean is true or false
		#returns a :span tag
		options[:true_text]  ||= '' #default value nothing
		options[:false_text] ||= ''

		if boolean
			content_tag(:span, options[:true_text], :class => 'status true')
		else
			content_tag(:span, options[:false_text], :class => 'status false')
		end
	end

end

#we replace
#      <td class="center"><%= subject.visible ? 'Yes' : 'No' %></td>
# from index.html.erb with the above helper

#this will output HTML code in our app
# <span class="status true"></span>
#we can form it conditionally with CSS
#best practice to move this module to ApplicationHelper so ALL controllers have access to it
