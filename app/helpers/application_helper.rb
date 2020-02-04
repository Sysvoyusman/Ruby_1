module ApplicationHelper
    def gravatar_for(user , options ={ size: 180})  #passing it a user object , but shouldnt it be @user ??
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase) #in ruby MD5 is assessible through Digest
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.username , class: "img-circle")   #img class: provided by the bootstrap                                                
    end    
end
