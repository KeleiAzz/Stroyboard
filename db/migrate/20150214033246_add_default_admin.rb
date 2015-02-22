class AddDefaultAdmin < ActiveRecord::Migration
  def self.up
    admin = Admin.create!(:name => 'Kelei', :email => 'kgong@ncsu.edu', :password => 'qwerty')
  end

  def self.down
    admin = Admin.find_by_name('Kelei')
    admin.destroy
  end
end
