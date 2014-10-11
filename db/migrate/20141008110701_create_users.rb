class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :name
      t.string   :email
      t.string   :password_digest
      t.integer  :type, :limit=>1
      t.boolean  :gender
      #t.datetime :born_date, :null => false, :default => Time.now
   	  #t.references :user_resources


      t.timestamps
    end
  end
end