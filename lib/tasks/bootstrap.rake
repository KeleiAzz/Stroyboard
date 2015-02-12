namespace :bootstrap do

  desc "Add the default developer"
  task :default_admin => :environment do
    Admin.create( :name => 'KeleiGong', :email => 'kgong@ncsu.edu', :password => '123456' )
    Admin.create( :name => 'zsp', :email => 'szhang29@ncsu.edu', :password => '123456' )
    Admin.create( :name => 'ashritha', :email => 'amohanr@ncsu.edu', :password => '123456' )
  end

  desc "Run all bootstrapping tasks"
  task :all => [:default_admin]
end