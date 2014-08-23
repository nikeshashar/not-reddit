module PostsHelper
  def comments_in_words(number)
    return 'no comments' if number < 1
    pluralize(number, 'comment')
  end
end
