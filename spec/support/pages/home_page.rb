class HomePage < SitePrism::Page
  element :flash, "div.flash"

  def flash_message
    flash.text
  end
end