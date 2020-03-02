import mapboxgl from 'mapbox-gl';


  // Create a HTML element for your custom marker

const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 20, maxZoom: 10, duration: 0 });
};

const initMapbox = () => {

  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/cjaudgl840gn32rnrepcb9b9g', //mapbox://styles/mapbox/cjaudgl840gn32rnrepcb9b9g',
      pitch: 30, // pitch in degrees
      bearing: 20, // bearing in degrees
      zoom: 9
    });
    map.addControl(new mapboxgl.NavigationControl());

    map.on('load', function() {
      map.addSource('dem', {
          'type': 'raster-dem',
          'url': 'mapbox://mapbox.terrain-rgb'
      });
      map.addLayer(
          {
              'id': 'hillshading',
              'source': 'dem',
              'type': 'hillshade'
              // insert below waterway-river-canal-shadow;
              // where hillshading sits in the Mapbox Outdoors style
          },
          'waterway-river-canal-shadow'
      );
    });


    let markers = JSON.parse(mapElement.dataset.markers);



      const query = document.getElementById('query').value;
       fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${query}.json?access_token=${mapElement.dataset.mapboxApiKey}`)
      .then(response => response.json())
      .then((data) => {
        const longitude = data.features[0].geometry.coordinates[0];
        const latitude = data.features[0].geometry.coordinates[1];
      console.log(longitude);

        const superMarker = new mapboxgl.Marker()
          .setLngLat([ longitude, latitude ])
          .addTo(map);
      const bounds = new mapboxgl.LngLatBounds();
      bounds.extend([ longitude, latitude ]);
      map.fitBounds(bounds, { padding: 20, maxZoom: 10, duration: 0 });
        });


    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '80px';
        element.style.height = '80px';
        element.style.cursor = 'pointer';

        new mapboxgl.Marker(element)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
        });


    markers.forEach((marker) => {
      if (markers.length > 0) {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '80px';
        element.style.height = '80px';
        element.style.cursor = 'pointer';

        new mapboxgl.Marker(element)
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
        // fitMapToMarkers(map, markers);
      };
    });
  };
};

export { initMapbox };
