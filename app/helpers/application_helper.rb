# frozen_string_literal: true

require 'net/http'
module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Basket Reader App'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
