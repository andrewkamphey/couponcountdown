class AddUsedTimesToCoupons < ActiveRecord::Migration[6.1]
  def change
    add_column :coupons, :used_times, :string
  end
end
