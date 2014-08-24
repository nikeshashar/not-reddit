$ ->
  $('.votes').on('click', 'a', (event) ->
    event.preventDefault()
    selection = $(this)
    selection.siblings().removeClass('selected')
    post_score = $(this).siblings('.vote-score')
    $.post(this.href, (response) ->
      post_score.text(response.post_score)
      selection.addClass('selected')
      ).fail((response) ->
        document.location.href = "/users/sign_in"
      )
    )