import mapboxgl from 'mapbox-gl';

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

    map.on('load', () => {

      // Add relief layer
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



      // Build geoJson format with sportSession markers dataset
      let sportSessions = JSON.parse(mapElement.dataset.markers);
      let features = []
      sportSessions.forEach(sportSession => {
        features.push({
          type: "Feature",
          properties: {
              "activity": sportSession.activity,
              "image_url": sportSession.image_url,
              "infoWindow": sportSession.infoWindow
              },
          "geometry": {
              "type": "Point",
              "coordinates": [sportSession.lng, sportSession.lat]
            }
          }
        );
      })

      let geoJson = {
        type: 'FeatureCollection',
        features: features
      }

      // Get all images URL and delete duplicates
      let allImagesUrl = [];
        geoJson.features.forEach((feature) => {
          allImagesUrl.push(feature.properties.image_url);
      })

      let images_url = [...new Set(allImagesUrl)];

      // load all images URL to the map
      images_url.forEach(image_url => {
        map.loadImage(
         image_url,
          function(error, image) {
          if (error) throw error;
          map.addImage(image_url, image);
        });
      })

      // load sportSessions infos
      map.addSource('sportSessions', {
        type: 'geojson',
        data: geoJson,
        cluster: true,
        clusterMaxZoom: 14, // Max zoom to cluster points on
        clusterRadius: 50 // Radius of each cluster when clustering points (defaults to 50)
      });

      // add cluster layer (when there are a lot of sessions at the same place)
      map.addLayer({
        id: 'clusters',
        type: 'circle',
        source: 'sportSessions',
        filter: ['has', 'point_count'],
        paint: {
          'circle-color': 'black',
          'circle-radius': 30,
          'circle-stroke-width': 1,
          'circle-stroke-color': '#ffffff'
          }
        });

      // add 'count' layer, to count sessions within a cluster
      map.addLayer({
        id: 'cluster-count',
        type: 'symbol',
        source: 'sportSessions',
        filter: ['has', 'point_count'],
        layout: {
          'text-field': '{point_count_abbreviated}',
          'text-font': ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
          'text-size': 16,
        },
        paint: {
          'text-color': 'white'
        }
      });

      // inspect a cluster on click
      map.on('click', 'clusters', (event) => {
        const features = map.queryRenderedFeatures(event.point, {
          layers: ['clusters']
        });

        const clusterId = features[0].properties.cluster_id;

        map.getSource('sportSessions').getClusterExpansionZoom(clusterId, (err, zoom) => {
          if (err) return;
          map.easeTo({
            center: features[0].geometry.coordinates,
            zoom: zoom
          });
        });
      });

      // Create sportsessions layer
      geoJson.features.forEach((feature) => {
        let symbol = feature.properties['image_url'];
        let layerID = feature.properties['activity'];

        // Add a layer for this symbol type if it hasn't been added already.
        if (!map.getLayer(layerID)) {
          map.addLayer({
            'id': layerID,
            'type': 'symbol',
            'source': 'sportSessions',
            layout: {
            'icon-image': symbol,
            'icon-size': 0.1,
            "icon-allow-overlap": true
            },
            'filter': ['==', 'activity', layerID]
          });
        };

        map.on('click', layerID, event => {

          // When clicked on a Sport Session, center the map on this sportSession
          map.flyTo({ center: event.features[0].geometry.coordinates });

          // Open a popup when clicked on a Sport Session
          let infoWindow = event.features[0].properties.infoWindow;
          console.log(infoWindow);
          let coordinates = event.features[0].geometry.coordinates.slice();
          new mapboxgl.Popup()
          .setLngLat(coordinates)
          .setHTML(infoWindow)
          .addTo(map);
        });


        // Change the cursor to a pointer when the it enters a feature in the sportSessions layer.
        map.on('mouseenter', layerID, function() {
          map.getCanvas().style.cursor = 'pointer';
        });

        // Change it back to a pointer when it leaves.
        map.on('mouseleave', layerID, function() {
          map.getCanvas().style.cursor = '';
        });

        // Change the cursor to a pointer when the it enters a feature in the clusters layer.
        map.on('mouseenter', 'clusters', function() {
          map.getCanvas().style.cursor = 'pointer';
        });

        // Change it back to a pointer when it leaves.
        map.on('mouseleave', 'clusters', function() {
          map.getCanvas().style.cursor = '';
        });
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
  };
};

export { initMapbox };
