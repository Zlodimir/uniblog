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
    files.find('tr:last-child td:last-child').hide().append($input)

  addAttachBtn = (count) ->
    $('<input/>').attr('type', 'file').addClass('upload').attr('name', 'article[attachments_attributes]['+count+'][attach]').on('change', selectFileHandler).appendTo('#button span .file-upload')

  deleteBtnHandler = () ->
    $(@).closest('tr').remove()

  removeBtnHandler = () ->
    # отмечаем файл на удаление с сервера
    $(@).parent().find('input[type=checkbox]').prop('checked', true)
    # скрываем запись таблицы
    $(@).closest('tr').hide()

  selectFileHandler = () ->
    # переносим input в таблицу
    $input = $(@)
    addTableRow($input)

    # получаем номер текущий записи из текущего имени и используем
    # его инкремент для создания новой кнопки выбора файлов
    # например: article[attachments_attributes][3][attach]  ->  3
    count = $input.attr('name').match(/\d/)[0]
    count++

    # создаем новый input для кнопки 'Добавить файл'
    addAttachBtn( count )

  # Обработчик для кнопки 'Добавить файл'
  $('.upload').on('change', selectFileHandler)

  # Обработчики для всех кнопок 'Удалить' из списка аттачей
  $('#files .btn-danger').each ->
    $(@).on('click', removeBtnHandler)
