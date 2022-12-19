class StaticPagesController < ApplicationController

  skip_before_action :require_login
  
  def home
    puts "hello from home"
  end

  def help
  end
end
