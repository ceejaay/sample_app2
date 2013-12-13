module UsersHelper
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}.png"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def reverse_name(user)
    user.name.reverse
  end
  
  def kitten
    alt = ["Meow", "Who me?", "Kittez", "moar kittez"]
    image_tag("http://placekitten.com/100/#{rand(100..300)}",
    title: alt.sample)
  end
end
