# frozen_string_literal: true

helpers do
  def meta_title
    DEFAULT_META['meta_title']
  end

  def meta_description
    DEFAULT_META['meta_description']
  end

  def twitter_account
    DEFAULT_META['twitter_account']
  end

  def meta_image
    base_url + DEFAULT_META['meta_image']
  end
end
