class AddDefaultToTutorials < ActiveRecord::Migration[5.2]
  def change
    change_column :tutorials, :ogp_url, :string, :default => 'no-ogp-image.jpg'
  end
end
