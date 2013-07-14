$ ->
  type_id = $('#mineral-id').text()
  $.get(
    "http://evedata.herokuapp.com/items/#{type_id}"
    (data) ->
      console.log("the value you selected: " + data[0].name)
      console.log("icon URL is: " + data[0].images.thumb)
      $('#mineral-icon').prepend("<img src='#{data[0].images.thumb}' />")
  )

