# frozen_string_literal: true

require_relative '../pages/base_page.rb'

class Signup < SitePrism::Page
  include Capybara::DSL
  include URLRedirects

  attr_reader :signup

  element :input_name, '#signup-form-name'
  element :input_email, '#signup-form-email'
  element :input_password, "[type='password']"
  element :input_phone, '#signup-form-phone'
  element :user_menu, '#user_menu'
  element :displayed_name, '.ng-touched.form-control'

  def create_account_redirect
    click_button('Crie sua conta grátis')
  end

  def lets_signup?
    click_button('CRIAR MINHA CONTA')
  end

  def alerts?
    within(all('app-zen-input')[0]) do
      find('.input-error', text: 'Favor preencher seu nome completo')
    end

    within(all('app-zen-input')[1]) do
      find('.input-error', text: 'Favor preencher um email válido')
    end

    within(all('app-zen-input')[2]) do
      find('.input-error', text: 'Favor preencher uma senha (mínimo de 6 caracteres')
    end
  end

  def create_account_successfully
    input_name.set(Faker::Name.name)
    @name = input_name.text
    input_email.set(Faker::Internet.email)
    input_password.set(Faker::Internet.password(min_length: 8))
    input_phone.set('(11) 4111-0900')
    lets_signup?
  end

  def account_created?
    within('.app-header-desktop') do
      user_menu.click if redirected_2_home?
    end
    within('.user-links') do
      click_on('Perfil')
      has_text?(@name)
    end
  end

  def redirected_2_home?
    Capybara.current_url == $home_page
  end
end
