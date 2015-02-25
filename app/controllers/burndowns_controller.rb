class BurndownsController < ApplicationController

  def show
    @dataArray = [10] * 10

    @stories = Story.all.select{|s| s.project_id == params[:id].to_i && s.finishTime != nil}
    @stories.each do |story|
      for i in 1..story.finishTime do
        @dataArray[i-1] += story.point_value
      end
    end
  end

end