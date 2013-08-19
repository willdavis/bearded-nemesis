$ ->
  if $('#minerals-show').length != 0
    $('#mineral-id').ready(
      if $('#mineral-id').length
        type_id = $('#mineral-id').text()
        $.get(
          "http://evedata.herokuapp.com/items/#{type_id}"
          (data) ->
            console.log("the value you selected: " + data[0].name)
            console.log("icon URL is: " + data[0].images.thumb)
            $('#mineral-icon').prepend("<img src='#{data[0].images.thumb}' />")
        )
    )
    
    $('.mineral').each(
      (index) ->
        obj = $($('.mineral').get(index))
        id = obj.text()
        $.get(
          "http://evedata.herokuapp.com/items/#{id}"
          (data) ->
            obj.empty()
            obj.append("<img src='#{data[0].images.small}' />")
        )
    )
