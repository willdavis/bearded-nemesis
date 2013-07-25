$ ->
  $('.star').ready(
    star_id = $('.star').attr("id")
    if star_id
      $.get(
        "http://evedata.herokuapp.com/celestials/#{star_id}"
        (data) ->
          console.log("selected solar system: " + data[0].name)
          
          $('.star-name').prepend("<b>#{data[0].name}</b>&nbsp;")
          $('.star-security').append("#{data[0].security}")
          $('.star-constellation').append("#{data[0].constellation.name}")
          $('.star-region').append("#{data[0].region.name}")
          
          $('#add-moon').append("<a href='/moons/new?location_id=#{data[0].id}&location_name=#{data[0].name}' class='btn btn-mini btn-primary'>New Moon for #{data[0].name}</a>")
      )
  )
  
  $('#star-moons').ready(
    star_id = $('.star').attr("id")
    if star_id
      $.get(
        "http://evedata.herokuapp.com/celestials"
        { solar_system_id: star_id, limit: 100, group_id: 8 }
        (data) ->
          $.each(data, (key, val) ->
            if $('#star-moons').text().match(data[key].name)
              console.log "#{data[key].name} is already present"
            else
              $('#star-moons').append("<tr><td id='#{data[key].id}'>#{data[key].name}</td></tr>")
          )
      )
      
      $('.mineral').each(
        (index) ->
          obj = $($('.mineral').get(index))
          id = obj.text()
          $.get(
            "http://evedata.herokuapp.com/items/#{id}"
            (data) ->
              console.log data[0].images.small
              obj.empty()
              obj.append("<img src='#{data[0].images.small}' />")
          )
      )
  )
  
  $('.solarsystems').ready(
    $('.solarsystem').each(
      (index) ->
        id = $('.solarsystem').get(index).id
        $.get(
          "http://evedata.herokuapp.com/solar_systems/#{id}"
          (data) ->
            $($('.solarsystem').get(index)).prepend("<a href='solar_systems/#{id}'>#{data[0].name}</a>&nbsp;")
        )
    )
  )
