class Tutorials::RanksController < TutorialsController
  def pv
    @tutorials = Tutorial.week_post.sort_by { |t| t.impressionist_count }.reverse
  end

  def iine
    @tutorials = Tutorial.week_post.sort_by { |t| t.users.count }.reverse
  end

  def all_period_pv
    @tutorials = Tutorial.all.sort_by { |t| t.impressionist_count }.reverse
  end

  def all_period_iine
    @tutorials = Tutorial.all.sort_by { |t| t.users.count }.reverse
  end
end
