import mapboxgl from 'mapbox-gl';


  // Create a HTML element for your custom marker


const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

  let marker = JSON.parse(mapElement.dataset.marker);

  const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('${marker.image_url}')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '40px';
  element.style.height = '40px';
  // Pass the element as an argument to the new marker

  marker = new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(map);

  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ marker._lngLat.lng, marker._lngLat.lat ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });

  };
};

export { initMapbox };
