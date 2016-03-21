class RemoveAvatarFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :avatar, :string
  end
end
