class Tutorials::RanksController < TutorialsController
  def pv_rank
    @tutorials = Tutorial.seven_day_post.sort_by { |t| t.impressionist_count }.reverse
  end

  def iine_rank
    @tutorials = Tutorial.seven_day_post.sort_by { |t| t.users.count }.reverse
  end
end
