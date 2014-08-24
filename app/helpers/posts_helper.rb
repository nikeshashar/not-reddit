module PostsHelper
  def comments_in_words(number)
    return 'no comments' if number < 1
    pluralize(number, 'comment')
  end

  def add_voting_colours(has_voted, original)
    has_voted ? original + ' selected' : original
  end
end
