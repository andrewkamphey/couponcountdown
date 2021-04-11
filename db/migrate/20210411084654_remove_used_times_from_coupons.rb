class RemoveUsedTimesFromCoupons < ActiveRecord::Migration[6.1]
  def change
    remove_column :coupons, :used_times, :string
  end
end
