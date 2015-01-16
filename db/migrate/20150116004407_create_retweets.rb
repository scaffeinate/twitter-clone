class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.integer :retweeter_id
      t.integer :retweet_id

      t.timestamps
    end
    add_index :retweets, [:retweet_id, :retweeter_id]
  end
end
