class AddBestAToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :best_a, :integer
  end
end
