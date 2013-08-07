class AddUrgencyToTasks < ActiveRecord::Migration
  def up
    add_column :tasks, :urgency, :integer
  end

  def down
  	remove_column :tasks, :urgency
  end

end
