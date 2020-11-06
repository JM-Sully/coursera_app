class GreeterController < ApplicationController
  def hello
    random_names = ["Jess", "Cody", "Martha"]
    @name = random_names.sample
    @time = Time.now
  end
  def goodbye
  end
end
