# Controllers provide the “glue” between models and views.
# In Rails, controllers are responsible for processing the
# incoming requests from the web browser, interrogating
# the models for data, and passing that data on to the
# views for presentation.

class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

end
