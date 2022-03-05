class CommunitiesController < ApplicationController
  def index
    @community1 = Community.find_by_id(1)
    @community2 = Community.find_by_id(2)
    @community3 = Community.find_by_id(3)
    
  end
end
