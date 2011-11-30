module PhonosHelper

  def build_switch(phono)

    html = ''
    html +="<p class='field switch'>"
    html +="<div id='phono_#{phono.id}' id='phono_switch_#{phono.id}' data_type='phono' data_active='#{phono.in?}' data_hostname='#{phono.hostname}'>"

    html +="<input type='radio' id='active_phono_#{phono.id}' name='field' />"
    html +="<input type='radio' id='inactive_phono_#{phono.id}' name='field'/>"
    html +="<label for='active_phono_#{phono.id}' class='phono-enable #{'selected' if phono.in?}'><span>Active</span></label>"
    html +="<label for='inactive_phono_#{phono.id}' class='phono-disable #{'selected' if phono.out?}'><span>Inactive</span></label>"
    html +="</div>"

    html +="</p>"
    html.html_safe
  end


  def build_site_switch(site)

    html = ''
    html +="<p class='field switch'>"
    html +="<div id='site_#{site.id}' id='site_switch_#{site.id}' data_type='site' data_active='#{site.in?}' data_hostname='#{site.name}'>"
    html +="<input type='radio' id='active_site_#{site.id}' name='field' />"
    html +="<label for='active_site_#{site.id}' class='site-enable #{'selected' if site.in?}'><span>Active</span></label>"
    html +="</div>"
    html +="</p>"
    html.html_safe
  end

end
