var map;
var marker;
var center ={
  lat: 35.681236,
  lng: 139.767125 
};

function initMap(){
  var opts = {
    zoom: 15,
    center: center
  };
  map = new google.maps.Map(document.getElementById("map"), opts);
  marker = new google.maps.Marker({ // マーカーの追加
      position: center, // マーカーを立てる位置を指定
    map: map // マーカーを立てる地図を指定
  });
}