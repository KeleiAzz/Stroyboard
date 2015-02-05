namespace :bootstrap do
  desc "Add the default user"
  task :default_admin => :environment do
    Admin.create( :email => 'default', :password => 'password' )
  end

  desc "Create the default comment"
  task :default_stage => :environment do
    Stage.create( :name => 'Analysis' )
    Stage.create( :name => 'Ready For Dev' )
    Stage.create( :name => 'InDev' )
    Stage.create( :name => 'Dev Complete' )
    Stage.create( :name => 'In Test' )
    Stage.create( :name => 'Complete' )
  end

  desc "Run all bootstrapping tasks"
  task :all => [:default_admin, :default_stage]
end