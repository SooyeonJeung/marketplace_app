require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      user: nil,
      name: "Name",
      category: "Category",
      description: "Text",
      quantity: 1,
      brand: "Brand",
      sold: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Brand/)
    expect(rendered).to match(/false/)
  end
end
