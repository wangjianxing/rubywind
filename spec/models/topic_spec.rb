require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should have_many(:replies) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end