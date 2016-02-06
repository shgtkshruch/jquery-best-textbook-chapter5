mapContainer = document.getElementById 'map-container'
marker = [35.6802361, 139.70130849999998]
mapStyles = [
  {
    featureType: 'all'
    elementType: 'all'
    stylers: [
      { visibility: 'on' }
      { hue: '#105ea7' }
      { saturation: -100 }
      { invert_lightness: true }
    ]
  },
  {
    elementType: 'labels.icon'
    stylers: [
      { visibility: 'off' }
    ]
  }]
mapOptions =
  center: new google.maps.LatLng marker[0], marker[1]
  disableDefaultUI: true
  panControl: true
  zoom: 16
  zoomControl: true
  zoomControlOptions:
    style: google.maps.ZoomControlStyle.SMALL
  styles: mapStyles

map = new google.maps.Map mapContainer, mapOptions

new google.maps.Marker
  position: new google.maps.LatLng marker[0], marker[1]
  map: map
