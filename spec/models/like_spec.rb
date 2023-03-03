require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new }

  before { subject.save }

  it 'should be linked to comment and user' do
    expect(subject).to_not be_valid
  end
end
