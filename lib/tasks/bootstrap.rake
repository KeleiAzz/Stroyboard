namespace :bootstrap do

  desc "Add the default admin"
  task :default_admin => :environment do
    Admin.create( :name => 'Kelei', :email => 'kgong@ncsu.edu', :password => 'qwerty')
  end

  desc "set finish time"
  task :set_finishtime => :environment do
    Story.where("stage = ?", "Complete").each do |story|
      story.finishTime=Random.rand(10)
      story.save
    end
  end
  desc "Run all bootstrapping tasks"
  task :all => [:default_admin]
end