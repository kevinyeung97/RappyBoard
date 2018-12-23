<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

	<link rel="stylesheet" type="text/css" href="stylesheets/index.css">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<link rel="icon" href="src/asapfavicon2.png">
	
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
	
  	<script src="https://apis.google.com/js/api:client.js"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/paper.js/0.10.3/paper-full.js"></script>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/howler/2.0.3/howler.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- paper script script -->
	<script type="text/paperscript" canvas="interactive">

		var keyData = {
			w: {
				sound: new Howl({
	  			src: ['sounds/yeahtravis.mp3']
				}),
				id: 'travis',
				time: 2,
				path: 1
			},
			a: {
				sound: new Howl({
	  			src: ['sounds/1738.mp3']
				}),
				id: 'fetty',
				time: 2,
				path: 2
			},
			s: {
				sound: new Howl({
	  				src: ['sounds/2chainzshort.mp3']
				}),
				id: '2chainz',
				time: 3,
				path: 3
			},
			d: {
				sound: new Howl({
	  				src: ['sounds/alrightdrake.mp3']
				}),
				id: 'drake',
				time: 2,
				path: 4
			}
		};

	var rasters = [];
	var time = 0;
	function showImage(id, num, t) {
		// Create a raster item using the image tag with id='mona'
		if(id == null) { id = 'asap'; }

		var raster = new Raster(id);

		var maxPoint = new Point(view.size.width, view.size.height);
		
		var randomPoint = Point.random();
		
		var point = maxPoint * randomPoint;

		// Resize x
		if(point.x < 200 && !(point.x > view.size.width-500)) {
			point.x += 500;
		} else if(point.x > view.size.width-500 && !(point.x < 500)) {
			point.x -=500;
		}

		// Resize y
		if(point.y < 200 && !(point.y > view.size.width-300)) {
			point.y += 300;
		} else if(point.y > view.size.width-300 && !(point.y < 500)) {
			point.y -= 300;
		}

		// Move the raster to the center of the view
		raster.position = point;

		// Scale the raster by 50%
		raster.scale(0.25);

		// Rotate the raster by 45 degrees:
		raster.rotate(0);

		// set paths !!!
		rasters.push({image: raster, time: t, path: num});
	}

	function onKeyDown(event) {

		if(keyData[event.key]) {
			showImage(keyData[event.key].id, keyData[event.key].path, keyData[event.key].time);
			keyData[event.key].sound.play();
		}

	}

	// Animation frames
	function onFrame(event) {
		
		for(var i=0; i < rasters.length; i++) {
			
			// If image time is up, destroy
			rasters[i].time -= event.delta;
			if(rasters[i].time < 0) {
				rasters[i].image.remove();
				rasters.splice(i, 1);
				continue;
			}

			// define paths !!!!
			switch(rasters[i].path) {
				case 1:
					rasters[i].image.position.x += 1.001;
					break;
				case 2:
					rasters[i].image.rotate(-180 * event.delta);
					break;
				case 3:
					var sinus = Math.sin(event.time * 5);
					var cosine = Math.cos(event.time * 5);
					rasters[i].image.position.x = sinus * 100 + 500;
					rasters[i].image.position.y = sinus * 50 + 350;
					break;
				case 3:
					rasters[i].image.position += 2;
					break;
				default:
					rasters[i].image.position.x += 1;
					rasters[i].image.scale(0.99);
					break;	
			}
		}
	}

	</script>
	
	<!-- javascript script -->
	<script>

 	// Listenerz
 	$(document).ready(function() {
 		var pressedkey = false;
		
		// Instruction functionz
		$("body").keypress(function(e){
			// change to work on all browsers
			if(e.key=='w' || e.key=='s' || e.key=='a'|| e.key=='d'
			|| e.key=='W' || e.key=='S' || e.key=='A'|| e.key=='D') {
				pressedKey = true;
				$("#instructions").addClass('d-none');
				
			}
		});
		
		$("#logo").on("mouseenter", function() {
		    $("#instructions").removeClass('d-none');
		});
	});

	</script>
</head>

<body>

<!-- main homepage body -->
<div  class="container-fluid" id="homepage">
	<canvas id="interactive" resize></canvas>
	<!-- visible logo -->
	<img src="src/asapfavicon2.png" id="logo">
	<img src="src/instructions.png" id="instructions">
	
	<!-- All of the loaded images hidden :) -->
	<img class="d-none" id="asap" src="src/asapdiorlogoblue.png">
	<img class="d-none" id="travis" src="src/travis.png">
	<img class="d-none" id="fetty" src="src/fettywap.png">
	<img class="d-none" id="2chainz" src="src/2chainz.png">
	<img class="d-none" id="drake" src="src/drake.png">
		
	<!-- visible logo -->
	<div id="gSignInWrapper">
    	<div id="customBtn" class="customGPlusSignIn">
      		<span><img src="src/login.png" id="login"></img></span>
    	</div>
 	</div>
	
</div>

<script type="text/javascript">
var googleUser = {};
var startApp = function() {
  gapi.load('auth2', function(){
    auth2 = gapi.auth2.init({
      client_id: '698298527201-a0o531h7dlf98qjhdk0niv26thiq16ms.apps.googleusercontent.com',
      cookiepolicy: 'single_host_origin',
      scope: 'https://www.googleapis.com/auth/calendar',
    });
    attachSignin(document.getElementById('customBtn'));
  });
};

function attachSignin(element) {
  console.log(element.id);
  auth2.attachClickHandler(element, {},
      function(googleUser) {
	  	var profile = googleUser.getBasicProfile();
      	var fullName = profile.getName();
        var email = profile.getEmail();
        var xhttp = new XMLHttpRequest();
    	xhttp.open("GET", "LoginServlet?full_name=" + fullName + "&email=" + email, true);
   	  	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhttp.onreadystatechange = function() {
      		document.location.href = 'index.jsp';
      	};
        xhttp.send();
      }, function(error) {
         console.log(JSON.stringify(error, undefined, 2));
      });
}
startApp();
</script>


</body>
</html>