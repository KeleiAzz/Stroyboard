namespace :bootstrap do
  desc "Add the default developer"
  task :default_admin => :environment do
    Admin.create( :name => 'KeleiGong', :email => 'kgong@ncsu.edu', :password => 'qwert' )
    Admin.create( :name => 'zsp', :email => 'szhang29@ncsu.edu', :password => 'qwert' )
  end

  desc "Create the default stage"
  task :default_stage => :environment do
    Stage.create( :name => 'Analysis' )
    Stage.create( :name => 'Ready For Dev' )
    Stage.create( :name => 'InDev' )
    Stage.create( :name => 'Dev Complete' )
    Stage.create( :name => 'In Test' )
    Stage.create( :name => 'Complete' )
  end

  desc "Run all bootstrapping tasks"
  task :all => [:default_stage]
end