$ ->
  window.star_ids = {}
  
  $('#moon_location_name').typeahead(
    source: (query, process) ->
      $.get(
        'http://evedata.herokuapp.com/solar_systems'
        { limit: 5, name: query }
        (data) ->
          console.log "==========================="
          names = []
          $.each(data, (key, val) ->
            names.push(data[key].name)
            star_ids[data[key].name] = data[key].id
            console.log "ID: #{data[key].id}, NAME: #{data[key].name}"
          )
          process(names)
      )
    updater: (item) ->
      $('#moon_location_id').val(star_ids[item])
      console.log("'" + item + "' selected.")
      console.log("moon_location_id set to: "+star_ids[item])
      return item
            
    minLength: 3
    items: 5
  )
  
$ ->
  $('#moon_location_name').change(
    () ->
      $('#moon_celestial_id').empty()
      
      location = $('#moon_location_name').val()
      $.get(
        'http://evedata.herokuapp.com/celestials'
        { solar_system: location, group_id: 8, limit: 100 }
        (data) ->
          $.each(data, (key, val) ->
            $('#moon_celestial_id').append("<option value='#{data[key].id}'>#{data[key].name}</option>")
          )
      )
  )
  
$ ->
  $('#moon_celestial_id').change(
    () ->
      selectedValue = $(this).find(":selected").val()
      
      $.get(
        "http://evedata.herokuapp.com/celestials/#{selectedValue}"
        (data) ->
          console.log("the value you selected: " + data[0].name)
          $('#moon_moon_name').val(data[0].name)
      )
  )
