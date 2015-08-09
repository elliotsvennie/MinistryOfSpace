$(document).ready(function () {
  L.mapbox.accessToken = 'pk.eyJ1Ijoic3VwZXJoaSIsImEiOiJkMTcyNzU0M2YzZDQ3YjNjNmQ2NmYwYjcwMmMzZGViMCJ9.RmlVJzqEJ1RqQSvQGL_Jkg';
  var mapId = "superhi.56f1a281";
  
  $('input').iCheck({
    checkboxClass: 'icheckbox_flat-blue',
    radioClass: 'iradio_flat-blue'
  });
  
  function createMarker(space) {
    
    var title = "";
    if (space.photos.length > 0) {
      title += "<div class=image><img src=\"" + space.photos[0].photo.url + "\" width=\"400\"></div>";
    }
    
    title += "<h3>" + space.name + "</h3>";
    
    console.log(title);
    
    var marker = L.marker(new L.LatLng(space.latitude, space.longitude), {
      icon: L.mapbox.marker.icon({
        'marker-symbol': 'building', 
        'marker-color': '1176d6'
      })
    });
    
    marker.bindPopup(title, {
      closeButton: false,
      minWidth: 200,
      maxWidth: 200,
      className: "popup"
    }).on('mouseover', function (e) {
      this.openPopup();
    }).on('mouseout', function (e) {
      this.closePopup();
    }).on("click", function () {
      window.open("/" + space.slug);
    });
    
    return marker;
  }
  
  if ($("#map").length > 0) {
    var map = L.mapbox.map('map')
              .setView([51.50722, -0.12750], 12)
              .addLayer(L.mapbox.tileLayer(mapId));
              
    var markers = new L.MarkerClusterGroup();
    
    for (var i = 0; i < spaces.length; i++) {
      var marker = createMarker(spaces[i]);      
      markers.addLayer(marker);
    }
    
    map.addLayer(markers);
  } 
  
  if ($("#map_detail").length > 0) {
    var lat = $("#map_detail").data("lat");
    var lng = $("#map_detail").data("lng");

    var map = L.mapbox.map('map_detail')
              .setView([lat, lng], 16)
              .addLayer(L.mapbox.tileLayer(mapId));
              
    var marker = L.marker(new L.LatLng(lat, lng), {
      icon: L.mapbox.marker.icon({
        'marker-symbol': 'building', 
        'marker-color': '1176d6'
      }),
      title: "hi"
    });
    
    map.addLayer(marker);

      
  }

  
  if ($("#slider").length > 0) {
    var slider = document.getElementById("slider");
    
    var minEl = $('input[name=min_price]');
    var maxEl = $('input[name=max_price]'); 
    var min = minEl.val() || 0;
    var max = maxEl.val() || 800;
    
    noUiSlider.create(slider, {
      start: [min, max],
      step: 1,
      margin: 100,
      connect: true,
      range: {
        'min': 0,
        'max': 800
      }//,
      // pips: {
		  //   mode: 'steps',
		  //   density: 12.5,
      //   filter: function () { return 2; },
      //   format: wNumb({
    	// 		decimals: 0,
    	// 		prefix: '£'
    	// 	})
	    // }
    });
    
    var tipHandles = slider.getElementsByClassName('noUi-handle'),
    tooltips = [];

    // Add divs to the slider handles.
    for ( var i = 0; i < tipHandles.length; i++ ){
    	tooltips[i] = document.createElement('div');
    	tipHandles[i].appendChild(tooltips[i]);
    }
        
    slider.noUiSlider.on('update', function(vals) {
      minEl.val(vals[0]);
      maxEl.val(vals[1]);
      tooltips[0].innerHTML = "£" + parseInt(vals[0], 10);
      tooltips[1].innerHTML = "£" + parseInt(vals[1], 10);
    });    
  }
  
  if ($("form .photos").length > 0) {
    
    $("form .photos .photo").slice(5).hide();
    $("form .photos").append("<span class=add>+ Add</span>");
    
    $("form .photos .add").on("click", function () {
      $("form .photos .photo:hidden").eq(0).show();
    })
    
  }
  
  $(".slideshow .large").slick({
    dots: true,
    arrows: false,
    customPaging: function (slider, i) {
      return "<div style='background-image: url(" + $(".slick-slide").eq(i).data("thumb") + ")'></div>";
    }
  });

});
