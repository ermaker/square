require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :title => "Title"
      ),
      Item.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
