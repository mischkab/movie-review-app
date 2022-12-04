class ChangeOverviewToBeTextInMovie < ActiveRecord::Migration[6.1]
  def change
    change_column(:movies, :overview, :text)
    change_column(:reviews, :comment, :text)
  end
end
