class Task < ActiveRecord::Base
  belongs_to :list
  validates :description, :presence => true


  scope(:is_done, -> do
    where({:done => true})
  end)





  # def task_not_done
  #   self.done = false
  # end
end
