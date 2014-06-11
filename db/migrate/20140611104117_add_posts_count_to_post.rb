class AddPostsCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :posts_count, :integer, :default => 0
  end
end
