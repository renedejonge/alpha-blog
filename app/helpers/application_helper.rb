module ApplicationHelper
  def gravatar_for(user, options = { size: 100 })
    # defineer size als de optioneel opgegeven waarde, en anders als de standaardwaarde
    size = options[:size]
    # Voorbeeld emailadres: mashrur.hossain@gmail.com
    # De MD5 hash hiervan: fea2163c44d55e1bc9344051ecad93d1
    # Het url van het plaatje: https://secure.gravatar.com/avatar/fea2163c44d55e1bc9344051ecad93d1
    # Alternatief url voor andere grote van het plaatje: https://secure.gravatar.com/avatar/fea2163c44d55e1bc9344051ecad93d1?s=150
    # Weergeven: image_tag(https://secure.gravatar.com/avatar/fea2163c44d55e1bc9344051ecad93d1)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end
end
