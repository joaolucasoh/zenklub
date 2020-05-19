# frozen_string_literal: true

require_relative 'login_page'
require_relative 'specialist_page'

class ZenklubPages
  attr_accessor :login, :specialist, :signup

  def initialize
    @login = Login.new
    @signup = Signup.new
    @specialist = Specialist.new
  end
end
