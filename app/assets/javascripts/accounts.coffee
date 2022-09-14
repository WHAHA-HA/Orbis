# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('ul.choose-social li').click ->
    thisObj = $(this)
    if !$(this).hasClass('active') && thisObj.data('clicked_count') == undefined
      thisObj.data('clicked_count', 1)
    if !$(this).hasClass('active') && thisObj.data('clicked_count') < 3
      $.ajax
        url: "/set_default_profile"
        type: "POST"
        dataType: 'json'
        data: { avatar_index: $(this).data('avatar-index') }
        success: (data) ->
          thisObj.data('clicked_count', (thisObj.data('clicked_count') + 1))
          console.log(data)
      $('ul.choose-social li').removeClass('active')
      $(this).addClass('active')
      $('input#user_default_avatar').val $(this).data('avatar-index')
      $('div.profile-avatar img').attr('src', ($(this).find('img').attr('src')))

  $.magnificPopup.open
    items: { src: '#popup-login' }
    type: 'inline'