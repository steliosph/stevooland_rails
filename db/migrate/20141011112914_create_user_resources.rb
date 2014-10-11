class CreateUserResources < ActiveRecord::Migration
  def change
    create_table :user_resources do |t|
	  t.references :user
      t.integer :gold, :default => 500, :limit => 5
	  t.integer :metals, :default => 500, :limit => 4
      t.integer :gems, :default => 500, :limit => 4
      t.integer :pvp_mana, :default => 5, :limit => 1
    end
  end
end
