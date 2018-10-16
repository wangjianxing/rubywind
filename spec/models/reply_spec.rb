require 'rails_helper'

RSpec.describe Reply, type: :model do
  it { should belong_to(:topic) }
  it { should validate_presence_of(:body) }
end