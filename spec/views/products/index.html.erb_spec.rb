require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        user_id: current_user.id,
        name: "Name",
        category: "Category",
        description: "Text",
        quantity: 1,
        price: 100,
        brand: "Brand",
        sold: false,
      ),
      Product.create!(
        user_id: current_user.id,
        name: "Name",
        category: "Category",
        description: "Text",
        quantity: 1,
        price: 100,
        brand: "Brand",
        sold: false,
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: current_user.id.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Category".to_s, count: 2
    assert_select "tr>td", text: "Text".to_s, count: 2
    assert_select "tr>td", text: 1.to_s, count: 2
    assert_select "tr>td", text: 100.to_s, count: 2
    assert_select "tr>td", text: "Brand".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end

