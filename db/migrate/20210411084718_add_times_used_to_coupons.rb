class AddTimesUsedToCoupons < ActiveRecord::Migration[6.1]
  def change
    add_column :coupons, :times_used, :string
  end
end
