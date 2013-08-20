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
    
    window.star_ids = {}
    
    $('#location_name').typeahead(
      source: (query, process) ->
        $.get(
          'http://evedata.herokuapp.com/solar_systems'
          { limit: 5, name: query }
          (data) ->
            names = []
            $.each(data, (key, val) ->
              names.push(data[key].name)
              star_ids[data[key].name] = data[key].id
            )
            process(names)
        )
      updater: (item) ->
        $('#location_id').val(star_ids[item])
        console.log("'#{item}' selected with ID: #{star_ids[item]}")
        return item
              
      minLength: 3
      items: 5
    )
