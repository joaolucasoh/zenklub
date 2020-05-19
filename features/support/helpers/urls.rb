# frozen_string_literal: true

module URLRedirects
  BASEURI = 'https://zenklub.com.br'

  class URLBase
    $home_page = "#{BASEURI}/profile/sessions/"
    $vouchers_page = "#{BASEURI}/profile/vouchers/"
    $busca_page = "#{BASEURI}/busca"
    $subscriptions_page = "#{BASEURI}/profile/subscriptions/"
  end
end
World(URLRedirects)
