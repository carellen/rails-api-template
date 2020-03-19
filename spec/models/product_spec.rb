require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryBot.build :product }
  subject { product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
end
