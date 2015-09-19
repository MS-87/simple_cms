module SubjectsHelper


end

#we replace
#      <td class="center"><%= subject.visible ? 'Yes' : 'No' %></td>
# from index.html.erb with the above helper

#this will output HTML code in our app
# <span class="status true"></span>
#we can form it conditionally with CSS
#best practice to move this module to ApplicationHelper so ALL controllers have access to it
