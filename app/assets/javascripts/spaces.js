$(document).ready(function () {
  L.mapbox.accessToken = 'pk.eyJ1Ijoic3VwZXJoaSIsImEiOiJkMTcyNzU0M2YzZDQ3YjNjNmQ2NmYwYjcwMmMzZGViMCJ9.RmlVJzqEJ1RqQSvQGL_Jkg';
  var mapId = "superhi.56f1a281";
  
  $('input').iCheck({
    checkboxClass: 'icheckbox_flat-blue',
    radioClass: 'iradio_flat-blue'
  });
  
  function createMarker(space) {
    var marker = L.marker(new L.LatLng(space.latitude, space.longitude), {
      icon: L.mapbox.marker.icon({
        'marker-symbol': 'building', 
        'marker-color': '1176d6'
      }),
      title: space.name
    });
    
    marker.bindPopup(space.name, {
      closeButton: false
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
      step: 100,
      margin: 100,
      connect: true,
      range: {
        'min': 0,
        'max': 800
      },
      pips: {
		    mode: 'steps',
		    density: 12.5,
        filter: function () { return 2; },
        format: wNumb({
    			decimals: 0,
    			prefix: '£'
    		})
	    }
    });
        
    slider.noUiSlider.on('set', function(vals) {
      minEl.val(vals[0]);
      maxEl.val(vals[1]);
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
