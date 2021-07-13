# frozen_string_literal: true

helpers do
  def extract_tags
    file_content = File.read("#{settings.root}/app/views/webpack/webpack_tags.erb")
    link_tag = file_content.scan(/<link.+?>/)&.first
    style_tag = file_content.scan(%r{<script.+</script>})&.first
    { link_tag: link_tag, style_tag: style_tag }
  end

  def javascript_pack_tag
    if settings.development?
      '<script src="./dist/main.js"></script>'
    elsif settings.production?
      extract_tags[:style_tag]
    end
  end

  def stylesheet_pack_tag
    extract_tags[:link_tag] if settings.production?
  end
end
