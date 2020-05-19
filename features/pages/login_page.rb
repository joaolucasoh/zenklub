# frozen_string_literal: true

require_relative '../pages/base_page.rb'

class Login < SitePrism::Page
  include URLRedirects
  attr_reader :login

  element :input_email, '#login-form-email'
  element :input_pwd, '#login-form-password'

  def with(email, pwd)
    input_email.set(email)
    input_pwd.set(pwd)
    click_button('ENTRAR')
  end

  def logged?
    has_button?('Agendar Sessão') && Capybara.current_url == $home_page
  end

  def not_sessions?(msg)
    find('.h5 span', text: msg, exact_text: true)
  end
end
