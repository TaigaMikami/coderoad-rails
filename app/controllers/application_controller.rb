class ApplicationController < ActionController::Base

  # コントローラー名・アクション名などから、jsやcssなどのファイル名を決定してセットしておく
  def set_individual_assets
    @individual_assets = "#{controller_name}/application"
  end
end
