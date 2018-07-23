module ApplicationHelper
  # css,jsなどを存在確認してから読み込むための、ファイル有無判定
  def asset_exist?(asset_path)
    !Dir.glob("#{Rails.root}/app/assets/#{asset_path}*").empty?
  end
end
