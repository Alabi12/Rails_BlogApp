require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'Hello Bob') }

  before { subject.save }

  it 'should contain some text' do
    subject.text = ''
    expect(subject).to_not be_valid
  end
end
