# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
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