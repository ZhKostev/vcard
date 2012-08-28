# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  hide_content_if_not_checked($('#article_has_russian_translation'), 'ru')
  hide_content_if_not_checked($('#article_has_english_translation'), 'en')

  $('#article_has_russian_translation').click ->
    hide_content_if_not_checked($(this), 'ru')

  $('#article_has_english_translation').click ->
    hide_content_if_not_checked($(this), 'en')

hide_content_if_not_checked = (elem, locale) ->
  if elem.attr('checked') == 'checked'
    elem.parent('div').siblings('.column_content').show()
    body_id = '#article_body_' + locale
    $(body_id).parent('div').show()
    short_desc_id = '#article_short_description_' + locale
    $(short_desc_id).parent('div').show()
  else
    elem.parent('div').siblings('.column_content').hide()
    body_id = '#article_body_' + locale
    $(body_id).parent('div').hide()
    short_desc_id = '#article_short_description_' + locale
    $(short_desc_id).parent('div').hide()
