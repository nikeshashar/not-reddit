require 'rails_helper'

describe 'post tabs' do
  before do
    bob = create(:user)
    anna = create(:anna)

    first_post = create(:post, user: bob)
    second_post = create(:url_post, user: anna)
    third_post = create(:post, title: 'Pancakes', user: bob)

    create(:vote, post: second_post, user: bob)
    create(:vote, post: second_post, user: anna)
    create(:vote, post: third_post, user: anna)
    create(:down_vote, post: first_post, user: anna)
    visit posts_path
  end

  context 'hot' do
    it 'displays posts ordered by their reddit hot points' do
      expect(page).to have_selector("article:nth-child(2)", text: "Url Posting")
      expect(page).to have_selector("article:nth-child(3)", text: "Pancakes")
      expect(page).to have_selector("article:nth-child(4)", text: "Fail")
    end
  end

  context 'new' do
    it 'displays posts ordered by newest' do
      click_link 'New'
      expect(page).to have_selector("article:nth-child(2)", text: "Pancakes")
      expect(page).to have_selector("article:nth-child(3)", text: "Url Posting")
      expect(page).to have_selector("article:nth-child(4)", text: "Fail")
    end
  end

  context 'top' do
    it 'displays posts ordered by their voting score' do
      click_link 'Top'
      expect(page).to have_selector("article:nth-child(2)", text: "Url Posting")
      expect(page).to have_selector("article:nth-child(3)", text: "Pancakes")
      expect(page).to have_selector("article:nth-child(4)", text: "Fail")
    end
  end

  context 'controversial' do
    it 'displays posts ordered by their controversial score' do
      click_link 'Controversial'
      expect(page).to have_selector("article:nth-child(2)", text: "Pancakes")
      expect(page).to have_selector("article:nth-child(3)", text: "Url Posting")
      expect(page).to have_selector("article:nth-child(4)", text: "Fail")
    end
  end

  context 'rising' do
    it 'displays posts ordered by the number of up votes' do
      click_link 'Rising'
      expect(page).to have_selector("article:nth-child(2)", text: "Url Posting")
      expect(page).to have_selector("article:nth-child(3)", text: "Pancakes")
      expect(page).to have_selector("article:nth-child(4)", text: "Fail")
    end
  end
end