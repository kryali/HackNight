class IndexController < ApplicationController

layout 'application'

def index
  @sponsors = Sponsor.all
end

def about
  render :about
end

end
