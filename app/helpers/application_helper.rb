module ApplicationHelper
    def flash_message
        messages = ""
        [:notice, :info, :warning, :error].each {|type|
          if flash[type]
            messages += "<p class=\"#{type}\">#{flash[type]}</p>"
          end
        }
    
        messages.html_safe
    end

    def render_article_options
      { Público: 'public', Privado: 'private', Arquivado: 'archived' }
    end
end
