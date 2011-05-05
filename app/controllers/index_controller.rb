class IndexController < ApplicationController

layout 'application'

def index
  @sponsors = Sponsor.all
  @hacker_pic = @hacker_graph.get_picture("me")
end

def about
  render :about
end

end
