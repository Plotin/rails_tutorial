module ApplicationHelper
  def title
    base_title = "Blah blubb"
    if @title.nil?
      base_title
    else
      @title
    end
  end
  
  def gravatar_for(user, options = { :size => 50 } ) 
    gravatar_image_tag(user.email.downcase, :alt => user.name,
                                            :class => "gravatar",
                                            :gravatar => options)
  end
end
