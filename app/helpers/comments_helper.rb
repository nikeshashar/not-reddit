module CommentsHelper
  def comment_delete_link is_owner, comment
    is_owner ? link_to('delete', comment_path(comment, post_id: comment.post.id), method: :delete, class: 'delete-comment pull-right') : ''
  end
end
