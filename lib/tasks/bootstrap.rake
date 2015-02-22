namespace :bootstrap do

  desc "Add the default admin"
  task :default_admin => :environment do
    Admin.create( :name => 'Kelei', :email => 'kgong@ncsu.edu', :password => 'qwerty')
  end



  desc "Run all bootstrapping tasks"
  task :all => [:default_admin]
end