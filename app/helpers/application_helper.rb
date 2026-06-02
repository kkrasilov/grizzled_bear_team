module ApplicationHelper
  def flash_type(name)
    case name
    when 'notice' then 'info'
    when 'alert' then 'error'
    else name
    end
  end

  def nav_link_to(name = nil, path = nil, **options, &block)
    options[:class] ||= ''
    active_class = current_page?(path) ? 'bg-gray-100' : ''
    options[:class] += " #{active_class}"
    link_to(name, path, **options, &block)
  end

  def cloud_image_path(image_path)
    "#{CLOUD_STORAGE_URL}/#{image_path}"
  end

  def cloud_image_tag(image_path, **options)
    image_tag cloud_image_path(image_path), **options
  end
end
