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
      $('.copied_to_clipboard').removeClass('copied_to_clipboard')
      parent = $(@).parent()
      parent.find('i').addClass('copied_to_clipboard')
      parent.find('code').text()
  })

  $('#create_an_example_button').click ->
    if $('#user_id').val() == ''
      $('#create_an_example').modal()
    else
      window.location = '/commands/new'

  $('.load-more-commands').on 'inview', (e, visible) ->
    return unless visible
    $.getScript $(this).attr('href')