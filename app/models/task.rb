class Task < ActiveRecord::Base
  belongs_to :list
  validates :description, :presence => true


  scope :is_done, -> {where(:done => true)}

  scope :today, -> {where("created_at >=?", Time.now.beginning_of_day)}




  # def task_not_done
  #   self.done = false
  # end
end
