# Controllers provide the “glue” between models and views.
# In Rails, controllers are responsible for processing the
# incoming requests from the web browser, interrogating
# the models for data, and passing that data on to the
# views for presentation.

class StaticPagesController < ApplicationController
  def home
    if signed_in?
        @micropost  = current_user.microposts.build
        @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
