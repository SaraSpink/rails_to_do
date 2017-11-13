require 'rails_helper'

describe "the task as done or not" do
  it "checks task for doneness" do
    list = List.create(:name => 'Home stuff')
    task = Task.create(:description => 'Wash the dishes', :list_id => list.id)
    visit list_path(list)
    expect(task.done).to eq(false)
   end
  end
