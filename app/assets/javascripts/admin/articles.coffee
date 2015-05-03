# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  if $('.articles.edit').length > 0

    #
    # Возвращает размер файла в удобочитаемом формате
    #
    humanFileSize = (size) ->
      i = Math.floor( Math.log(size) / Math.log(1024) );
      ( size / Math.pow(1024, i) ).toFixed(2) * 1 + ' ' + ['B', 'kB', 'MB', 'GB', 'TB'][i];

    #
    # Добавляет запись в таблицу с файлами
    #
    addTableRow = (input) ->
      files = $('#files');
      fileinfo = $(input)[0].files[0];
      files.append('<tr>' +
        '<td>'+fileinfo.name+'</td>' +
        '<td>'+humanFileSize(fileinfo.size)+'</td>' +
        '<td><div class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i>&nbsp;Удалить</div></td>' +
        '<td></td>' +
        '</tr>');
      files.find('tr:last-child .btn-danger').on('click', deleteBtnHandler);
      input.attr('name', 'article[attachments][attach][]');
      files.find('tr:last-child td:last-child').hide().append(input);

    #
    # Добавляет кнопку для выбора нового файла
    #
    addAttachBtn = () ->
      $('<input/>').attr('type', 'file').addClass('upload').on('change', selectFileHandler).appendTo('#button div');

    #
    # Обработчик вызыватеся при нажатии на кнопку удаления выбранного файла
    # удаляет только локальную запись - после отправки данных формы файл
    # не будет залит
    #
    deleteBtnHandler = () ->
      $(this).parent().parent().remove();

    #
    # Обработчик вызывается при нажатии на кнопку удаления выбранного файла
    # помечает файл на удаление - после отправки данных флормы файл
    # будет удален с сервера
    #
    @removeBtnHandler = (elem) ->
      # отмечаем файл на удаление с сервера
      $(elem).parent().find('input[type=checkbox]').prop('checked', true);
      # скрываем запись таблицы
      $(elem).parent().parent().hide();

    #
    # Обработчик события выбора файла
    #
    selectFileHandler = () ->
      # переносим input в таблицу
      input = $(this);
      addTableRow(input);

      # создаем новый input для кнопки 'Добавить файл'
      addAttachBtn();

    $('.upload').on('change', selectFileHandler);


$(document).ready(ready)
$(document).on('page:load', ready)
