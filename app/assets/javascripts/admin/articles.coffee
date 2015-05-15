# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  return if $('.file-upload').length == 0

  humanFileSize = (size) ->
    i = Math.floor(Math.log(size) / Math.log(1024))
    size = ( size / Math.pow(1024, i) ).toFixed(1)
    letter = ['B', 'kB', 'MB', 'GB', 'TB'][i]
    "#{size} #{letter}"

  addTableRow = ($input) ->
    files = $('#files')
    fileinfo = $input[0].files[0]
    files.append('<tr>' +
      '<td>' + fileinfo.name + '</td>' +
      '<td>' + humanFileSize(fileinfo.size) + '</td>' +
      '<td><div class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i>&nbsp;Удалить</div></td>' +
      '<td></td>' +
      '</tr>')
    files.find('tr:last-child .btn-danger').on('click', deleteBtnHandler)
    $input.attr('name', 'article[attachments][attach][]')
    files.find('tr:last-child td:last-child').hide().append($input)

  addAttachBtn = () ->
    $('<input/>').attr('type', 'file').addClass('upload').on('change', selectFileHandler).appendTo('#button span .file-upload')

  deleteBtnHandler = () ->
    $(this).closest('tr').remove()

  @removeBtnHandler = (elem) ->
    # отмечаем файл на удаление с сервера
    $(elem).parent().find('input[type=checkbox]').prop('checked', true)
    # скрываем запись таблицы
    $(elem).parent().parent().hide()

  selectFileHandler = () ->
    # переносим input в таблицу
    $input = $(this)
    addTableRow($input)

    # создаем новый input для кнопки 'Добавить файл'
    addAttachBtn()

  $('.upload').on('change', selectFileHandler)
