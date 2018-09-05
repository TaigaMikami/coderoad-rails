class Tutorials::RanksController < ApplicationController
  def pv_rank
    @tutorial = Tutorial.seven_day_post.sort_by { |t| t.impressionist_count }.reverse
  end

  def iine_rank
    @tutorial = Tutorial.seven_day_post.sort_by { |t| t.users.count }.reverse
  end
end
