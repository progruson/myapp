$ ->
  cleanErrors = ->
    $('.error-helper').remove()
    $('.has-error').removeClass('has-error')

  $('#new_comment').on("ajax:success", (e, data, status, xhr) ->
    $("#comments").append "<div class='form-group'>
    <strong>Сообщение:</strong>
        <p>#{data.message}</p>
    </div>"

    cleanErrors()
    $(@)[0].reset()

  ).on "ajax:error", (e, xhr, status, error) ->
    cleanErrors()

    for field, errors of xhr.responseJSON
      for error in errors
        $control = $(@).find("[name='comment[#{field}]']")
        $control.addClass('has-error')

        $("<div class='alert alert-danger'>#{error}</div>").insertBefore($control)

      $("#new_article").append "<p>ERROR</p>"