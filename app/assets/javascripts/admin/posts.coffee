# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('div.form-group.post_content').append($('span#content_count'))
  text_max = 144
  $('textarea#post_content').keyup ->
    text_length = $('textarea#post_content').val().length
    text_remaining = text_max - text_length;

    $('span#content_count').html(text_remaining + ' characters remaining');