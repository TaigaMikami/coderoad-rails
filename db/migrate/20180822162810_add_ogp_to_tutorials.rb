class AddOgpToTutorials < ActiveRecord::Migration[5.2]
  def change
    add_column :tutorials, :ogp_url, :string, after: :url
    add_column :tutorials, :ogp_description, :text, after: :ogp_url
  end
end
