require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(author_id: 14, title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
  end

  before { subject.save }

  context 'when title is blank' do
    before { subject.title = '' }

    it 'is not valid' do
      expect(subject).to_not be_valid
    end
  end

  it 'CommentsCounter must be an integer greater than or equal to zero.' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero.' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero.' do
    subject.likes_counter = 1
    expect(subject).to be_valid
  end

  it 'Title must not exceed 250 characters' do
    expect(subject.title.length).to be <= 250
  end
end
