class ImgurController < ApplicationController

def upload
#  render :text => 'Hello World'
   filename = params[:project][:filename]
   filedata = filename.read
   render :text => filedata
end

end
