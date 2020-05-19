# frozen_string_literal: true

require_relative '../pages/base_page.rb'

class Specialist
  include Capybara::DSL
  attr_reader :specialist

  def goto
    within('.app-header') do
      all("[href='/busca']")[0].click
    end
  end

  def choose_specialist
    within(all('.professional-container')[0]) do
      spec_data
      @button = find('.btn-outline')
      @button.click
    end
  end

  def spec_data
    @spec_name = find('h2').text
    @spec_crp = find('.crp').text
    @spec_city = find('.city').text
    @spec_summary = find('.professional-summary').text
  end

  def spec_page?
    has_text?(@spec_name)
    has_text?(@spec_crp)
    has_text?(@spec_city)
    has_text?(@spec_summary)

    spec_perfil
  end

  def spec_perfil
    within('.professional_user_perfil') do
      has_text?('Perfil')
      has_text?('EXPERIÊNCIA')
      has_text?('ESPECIALIDADES')
      has_text?('FORMAÇÃO')
      has_text?('DESCRIÇÃO PESSOAL')
      has_text?('POLÍTICA DE REMARCAÇÃO')
    end
  end
end
