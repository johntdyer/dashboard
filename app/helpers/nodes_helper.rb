module NodesHelper
  def get_button(status)
    html=""
    if status
      html+='<img src="assets/thumbs-up.png" height="32px" width="32px" alt="out" />'
    else
      html+='<img src="assets/thumbs-down.png" height="32px" width="32px" alt="out" />'
    end
    html.html_safe
  end
end
