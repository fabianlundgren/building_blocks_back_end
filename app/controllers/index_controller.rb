class IndexController < ApplicationController
  def index
    @help_requests = HelpRequest.where(urgent: true).last(10)
    @news = News.last(5)
  end
end
