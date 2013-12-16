$ ->
  makeSearch = ->
    val = $('.search-field').val()
    return if val.length < 2
    search_string = val.replace(/\s/g, '-')
    window.location = '/commands/search/' + search_string

  $('.search-field').focus()
  $('.search-submit').on 'click', makeSearch
  $('#search_form').keypress (event) ->
    if event.which == 13
      event.preventDefault()
      makeSearch()

  $("[rel=tooltip]").tooltip()

  copy_sel = $('.copy_to_clipboard_icon')
  copy_sel.on 'click', (event) -> event.preventDefault()

  copy_sel.clipboard({
    path: '/assets/jquery.clipboard.swf',
    copy: ->
      $(@).parent().find('code').text()
  })


