# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#license_category a').click (e) ->
    e.preventDefault();
    store_category_data($(this), 'license')

  $('#product_category a').click (e) ->
    e.preventDefault();
    store_category_data($(this), 'product')

  $('#carrier_category a').click (e) ->
    e.preventDefault();
    store_category_data($(this), 'carrier')

  $('#news_category a').click (e) ->
    e.preventDefault();
    store_category_data($(this), 'news')

  $('input#other_license').keypress (e) ->
    key = e.which
    if key == 13
      store_other_category('license', $(this).val())
      $(this).val ''
      false
  $('input#other_news').keypress (e) ->
    key = e.which
    if key == 13
      store_other_category('news', $(this).val())
      $(this).val ''
      false
  $('input#other_carrier').keypress (e) ->
    key = e.which
    if key == 13
      store_other_category('carrier', $(this).val())
      $(this).val ''
      false
  $('input#other_product').keypress (e) ->
    key = e.which
    if key == 13
      store_other_category('product', $(this).val())
      $(this).val ''
      false

  $('#lets_go').click (e) ->
    e.preventDefault()
    yourMessage = $('#your_message').val()
    if yourMessage
      store_your_message yourMessage, (err, data) ->
        if !err
          location.href = '/account'
    else
      location.href = '/account'

store_your_message = (yourMessage, cb) ->
  $.ajax
    url: "/users/store_other_category"
    type: "POST"
    dataType: "json"
    data:
      type: "message"
      data: yourMessage
    success: (data) ->
      cb null, data
    error: (handler, textStatus, errThrown) ->
      cb errThrown

store_other_category = (type, data) ->
  if data != ''
    $.ajax
      url: "/users/store_other_category"
      type: "POST"
      dataType: 'json'
      data:
        type: type
        data: data
      success: (data) ->
        console.log(data)

store_category_data = (thisObj, category) ->
  if thisObj.data('clicked_count') == undefined
    thisObj.data('clicked_count', 1)

  if thisObj.data('clicked_count') < 3
    user_category_id = thisObj.data('uc-id')
    thisObj.attr('disabled','disabled');
    $.ajax
      url: "/users/set_user_category"
      type: "POST"
      dataType: 'json'
      data:
        category_id: thisObj.data('id')
        user_category_id: user_category_id
        category: category
      success: (data) ->
        thisObj.removeAttr('disabled');
        thisObj.data('clicked_count', (thisObj.data('clicked_count') + 1))
        console.log(data)
        thisObj.data('uc-id', data.result)
    thisObj.toggleClass('active')
