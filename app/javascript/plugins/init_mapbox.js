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

      let sportSessions = JSON.parse(mapElement.dataset.markers);
        const arr = [];
        sportSessions.forEach(sportSession => {
          arr.push(
            {
            "type": "Feature",
            "properties": {
                "id": sportSession.id,
                "activity": sportSession.activity,
                "image_url": sportSession.image_url
                },
            "geometry":
              {
                "type": "Point",
                "coordinates": [sportSession.lng, sportSession.lat]
              }
            }
            );
          });

        let geoJson = {
        features: arr
        }


        geoJson.features.forEach((feature) => {
            map.loadImage(
                 feature.properties.image_url,
                  function(error, image) {
                  if (error) throw error;
                  map.addImage(`icon-${feature.properties.activity}`, image);
            });
            console.log(`${feature.properties.activity}`);
        })


      map.addSource('sportSessions', {
        type: 'geojson',
        data: geoJson,
        cluster: true,
        clusterMaxZoom: 14, // Max zoom to cluster points on
        clusterRadius: 50 // Radius of each cluster when clustering points (defaults to 50)
      });

      map.addLayer({
        id: 'clusters',
        type: 'circle',
        source: 'sportSessions',
        filter: ['has', 'point_count'],
        paint: {
            'circle-color': 'red',
            'circle-radius': 30,
            'circle-stroke-width': 1,
            'circle-stroke-color': '#fff'
          }
        });

      map.addLayer({
      id: 'cluster-count',
      type: 'symbol',
      source: 'sportSessions',
      filter: ['has', 'point_count'],
      layout: {
      'text-field': '{point_count_abbreviated}',
      'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
      'text-size': 12
      }
      });

      map.addLayer({
      id: `unclustered-point-ski`,
      type: 'symbol',
      source: 'sportSessions',
      filter: ['!', ['has', 'point_count']],
        'layout': {
        'icon-image': `cats`,
        'icon-size': 0.15
        }
      });


      // inspect a cluster on click
      map.on('click', 'clusters', (event) => {
      var features = map.queryRenderedFeatures(event.point, {
      layers: ['clusters']
      });
      var clusterId = features[0].properties.cluster_id;
      map.getSource('sportSessions').getClusterExpansionZoom(
      clusterId,
      function(err, zoom) {
      if (err) return;
      map.easeTo({
      center: features[0].geometry.coordinates,
      zoom: zoom
      });
      }
      );
      });

    });


    const query = document.getElementById('query').value;

    // Generate a Marker according to location query

    fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${query}.json?access_token=${mapElement.dataset.mapboxApiKey}`)
    .then(response => response.json())
    .then((data) => {
      const longitude = data.features[0].geometry.coordinates[0];
      const latitude = data.features[0].geometry.coordinates[1];

      const superMarker = new mapboxgl.Marker()
        .setLngLat([ longitude, latitude ])
        .addTo(map);

      const bounds = new mapboxgl.LngLatBounds();
      bounds.extend([ longitude, latitude ]);
      map.fitBounds(bounds, { padding: 20, maxZoom: 10, duration: 0 });
    });


    // Generate Markers according to sport sessions

    // let markers = JSON.parse(mapElement.dataset.markers);

    // markers.forEach((marker) => {
    //   const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    //   const element = document.createElement('div');
    //   element.className = 'marker';
    //   element.dataset.lat = marker.lat;
    //   element.dataset.lng = marker.lng;
    //   element.style.backgroundImage = `url('${marker.image_url}')`;
    //   element.style.backgroundSize = 'contain';
    //   element.style.width = '80px';
    //   element.style.height = '80px';
    //   element.style.cursor = 'pointer';

    //   new mapboxgl.Marker(element)
    //     .setLngLat([ marker.lng, marker.lat ])
    //     .setPopup(popup)
    //     .addTo(map);

    // });


    // center map on marker when click on it

    const markersDiv = document.querySelectorAll('.marker');

    markersDiv.forEach((markerDiv) => {
      markerDiv.addEventListener('click', (event) => {
        map.flyTo({
          center: [ event.currentTarget.dataset.lng, event.currentTarget.dataset.lat
          ],
          essential: true // this animation is considered essential with respect to prefers-reduced-motion
        });
      })
    });
  };
};

export { initMapbox };
