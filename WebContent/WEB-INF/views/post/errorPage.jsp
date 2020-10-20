<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <!DOCTYPE html>
<html>
  <head>
    <title>Place Autocomplete Restricted to Multiple Countries</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBUJm5KOvPlz1HQvmwvA3lFbDKw7ze4D0w&libraries=places&callback=initAutocomplete" async defer></script>
   
    </head>
    <body>
    <div>
    <input id="autocomplete" type="text">
    </div>
    <script>
    function initAutocomplete() {
    	autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'), {
    		types: ['geocode']
    	});
    	autocomplete.addListener('place_changed', fillInAddress);
    }
    
    
    
    function fillInAddress() {
    	var place = autocomplete.getPlace();
        alert(place.geometry.location.lat());
        alert(place.geometry.location.lng());
        
        map.setCenter(place.geometry.location);
    	searchMarker = new google.maps.Marker({
    		map: map,
    		position: place.geometry.location
    	});
    }
    </script>
    
  </body>
</html>
