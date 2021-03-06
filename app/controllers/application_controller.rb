
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.



def httppartymetodo 


if ((params['tag']).nil? || (params['access_token']).nil?) 
	render json: " ", :status => 400


else
tag_stats = HTTParty.get('https://api.instagram.com/v1/tags/'+params['tag']+'/media/recent?access_token='+params['access_token']+'&count=20')

media_count = HTTParty.get('https://api.instagram.com/v1/tags/'+params['tag']+'?access_token='+params['access_token'])

imagesArreglo=Array.new
@tagsArreglo=Array.new



tag_stats["data"].each do |contador| 

if (contador["images"]["standard_resolution"]!= nil)
	imagesArreglo=contador["images"]["standard_resolution"]
elsif contador["images"]["low_resolution"]!= nil
	imagesArreglo=contador["images"]["low_resolution"]
else
	imagesArreglo=contador["images"]["thumbnail"]
end

@tagsArreglo << {tags: contador["tags"], username: contador["user"]["username"], likes: contador["likes"]["count"], url: imagesArreglo["url"], caption: contador["caption"]["text"]}

end


render json: {metadata: {total: media_count["data"]["media_count"]}, posts: @tagsArreglo, version: '1.1.3'}


end
## end de partymetodo



end


end


