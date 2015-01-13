class AddParentIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :parent_id, :integer
  end
end
