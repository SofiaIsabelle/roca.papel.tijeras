# frozen_string_literal: true

module ApplicationHelper
  # Dynamically renders appropriate image for given shape
  # Otherwise, render the default one
  def shape_image(shape, options)
    if FileTest.exist?("#{Rails.root}/app/assets/images/#{shape}.png")
      image_tag shape, options
    else
      image_tag 'default.png', options
    end
  end
end
