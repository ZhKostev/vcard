require 'coderay'

module ApplicationHelper
  def prepare_text(text)
    result = coderay_wrapper(text)

    result.html_safe
  end


  def coderay_wrapper(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      content_tag("notextile", CodeRay.scan($3, $2).div(:css => :class).html_safe)
    end
  end
end
