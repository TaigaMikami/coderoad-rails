class Tutorials::RanksController < TutorialsController
  before_action :set_default_rank_tutorials
  def pv
    @tutorials = @default_rank_tutorials.week_post.sort_by { |t| t.impressionist_count }.reverse
  end

  def iine
    @tutorials = @default_rank_tutorials.week_post.sort_by { |t| t.users.count }.reverse
  end

  def month_pv
    @tutorials = @default_rank_tutorials.month_post.sort_by { |t| t.impressionist_count }.reverse
  end

  def month_iine
    @tutorials = @default_rank_tutorials.month_post.sort_by { |t| t.users.count }.reverse
  end

  def all_period_pv
    @tutorials = @default_rank_tutorials.sort_by { |t| t.impressionist_count }.reverse
  end

  def all_period_iine
    @tutorials = @default_rank_tutorials.sort_by { |t| t.users.count }.reverse
  end

  private

  def set_default_rank_tutorials
    @default_rank_tutorials = Tutorial.includes(:users, :taggings).page
  end
end
