class RemoveUsedFromCoupons < ActiveRecord::Migration[6.1]
  def change
    remove_column :coupons, :used, :boolean
  end
end
