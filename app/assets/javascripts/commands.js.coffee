$ ->
  $('.search-submit').on 'click', ->
    window.location = '/commands/search/' + $('.search-field').val()
