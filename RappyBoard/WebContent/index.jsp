<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Soundboard</title>

	<link rel="stylesheet" type="text/css" href="stylesheets/index.css">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<link rel="icon" href="src/asapfavicon2.png">
	
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	
	<script src="https://apis.google.com/js/api:client.js"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/paper.js/0.10.3/paper-full.js"></script>
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/howler/2.0.3/howler.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<meta name="google-signin-client_id" content="698298527201-a0o531h7dlf98qjhdk0niv26thiq16ms.apps.googleusercontent.com">
	
	<!-- paper script script -->
	<script type="text/paperscript" canvas="interactive">
		var keyData = {
			q: {
				sound: new Howl({
	  			src: ['sounds/yeahtravis.mp3']
				}),
				id: 'travis',
				time: 2,
				num: 5
			},
			w: {
				sound: new Howl({
	  			src: ['sounds/1738.mp3']
				}),
				id: 'fetty',
				num: 2
			},
			e: {
				sound: new Howl({
	  				src: ['sounds/2chainzshort.mp3']
				}),
				id: '2chainz',
				num: 4
			},
			r: {
				sound: new Howl({
	  				src: ['sounds/alrightdrake.mp3']
				}),
				id: 'drake',
				num: 2
			},
			t: {
				sound: new Howl({
	  				src: ['sounds/ahhh.mp3']
				}),
				id: 'chance',
				num: 3
			},
			y: {
				sound: new Howl({
	  				src: ['sounds/anothaone.mp3']
				}),
				id: 'djkhaled',
				num: 3
			},
			u: {
				sound: new Howl({
	  				src: ['sounds/aybaby.mp3']
				}),
				id: 'hurricanechris',
				num: 1
			},
			i: {
				sound: new Howl({
	  				src: ['sounds/brrbrr.mp3']
				}),
				id: '2chainz',
				num: 4
			},
			o: {
				sound: new Howl({
					src: ['sounds/nickiuh.mp3']
				}),
				id: 'nickiuh',
				num: 3
			},
			p: {
				sound: new Howl({
	  				src: ['sounds/mr305.mp3']
				}),
				id: 'pitbull',
				num: 4
			},
			a: {
				sound: new Howl({
	  				src: ['sounds/mynameis.mp3']
				}),
				id: 'eminem',
				num: 2
			},
			s: {
				sound: new Howl({
	  				src: ['sounds/nickipurrrr.mp3']
				}),
				id: 'nicki',
				num: 3
			},	
			d: {
				sound: new Howl({
	  				src: ['sounds/woah.mp3']
				}),
				id: 'bigsean',
				num: 1
			},
			f: {
				sound: new Howl({
	  				src: ['sounds/liljon.mp3']
				}),
				id: 'liljon',
				num: 3
			},
			g: {
				sound: new Howl({
	  				src: ['sounds/jayz.mp3']
				}),
				id: 'jayz',
				num: 2
			},
			h: {
				sound: new Howl({
	  				src: ['sounds/panda.mp3']
				}),
				id: 'desiigner',
				num: 4
			},
			j: {
				sound: new Howl({
	  				src: ['sounds/frenchmontana.mp3']
				}),
				id: 'frenchmontana',
				num: 3
			},
			k: {
				sound: new Howl({
	  				src: ['sounds/drummaboy.mp3']
				}),
				id: 'drummaboy',
				num: 5
			},
			l: {
				sound: new Howl({
	  				src: ['sounds/schoolboyq.mp3']
				}),
				id: 'schoolboyq',
				num: 2
			},
			z: {
				sound: new Howl({
	  				src: ['sounds/djmustard.mp3']
				}),
				id: 'djmustard',
				num: 4
			},
			x: {
				sound: new Howl({
	  				src: ['sounds/souljaboy.mp3']
				}),
				id: 'souljaboy',
				num: 1
			},
			c: {
				sound: new Howl({
	  				src: ['sounds/nickiyoungmoney.mp3']
			}),
				id: 'nicki2',
				num: 2
			},
			v: {
				sound: new Howl({
	  				src: ['sounds/djkhaled.mp3']
				}),
				id: 'djkhaled2',
				num: 4
			},
			b: {
				sound: new Howl({
	  				src: ['sounds/souljaboy2.mp3']
				}),
				id: 'souljaboy',
				num: 2
			},
			n: {
				sound: new Howl({
					src: ['sounds/straightuptravis.mp3']
				}),
				id: 'travis2',
				num: 3
			},
			m: {
				sound: new Howl({
	  				src: ['sounds/ladiesandgentlemann.mp3']
				}),
				id: 'jazzyphae',
				num: 3
			}
		};

	var rasters = [];
	var time = 0;
	function showImage(id, num) {
		// Create a raster item using the image tag with id='mona'
		if(id == null) { id = 'asap'; }

		var raster = new Raster(id);

		var maxPoint = new Point(view.size.width, view.size.height);
		
		var randomPoint = Point.random();
		
		var point = maxPoint * randomPoint;

		if(point.x < 200 && !(point.x > view.size.width-500)) {
			point.x += 500;
		} else if(point.x > view.size.width-500 && !(point.x < 500)) {
			point.x -=500;
		}

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
		rasters.push({image: raster, time: 2, path: num});
	}

	function onKeyDown(event) {

		if(keyData[event.key]) {
			showImage(keyData[event.key].id, keyData[event.key].num);
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
					var sinus = Math.sin(event.time * 10 + i);
					rasters[i].image.position.x = sinus * 10 + 50;
					rasters[i].image.position.y -= 5;
					rasters[i].image.scale(0.99);
					break;
				case 2:
					rasters[i].image.rotate(-180 * event.delta);
					rasters[i].image.position.x -= 3;
					rasters[i].image.position.y -= 2;
					break;
				case 3:
					rasters[i].image.position.x += 1.001;
					rasters[i].image.position.y -= 5.0;
					break;
				case 4:
					rasters[i].image.position += 2;
					rasters[i].image.rotate(-180 * event.delta);
					break;
				case 5:
					var sinus = Math.sin(event.time * 10 + i);
					rasters[i].image.position.y = sinus * 100 + 550;
					rasters[i].image.position.x -= 5;
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
	
	var keyData = {
			q: {
				sound: new Howl({
	  			src: ['sounds/yeahtravis.mp3']
				}),
				id: 'travis',
				time: 2,
				num: 5
			},
			w: {
				sound: new Howl({
	  			src: ['sounds/1738.mp3']
				}),
				id: 'fetty',
				num: 2
			},
			e: {
				sound: new Howl({
	  				src: ['sounds/2chainzshort.mp3']
				}),
				id: '2chainz',
				num: 4
			},
			r: {
				sound: new Howl({
	  				src: ['sounds/alrightdrake.mp3']
				}),
				id: 'drake',
				num: 2
			},
			t: {
				sound: new Howl({
	  				src: ['sounds/ahhh.mp3']
				}),
				id: 'chance',
				num: 3
			},
			y: {
				sound: new Howl({
	  				src: ['sounds/anothaone.mp3']
				}),
				id: 'djkhaled',
				num: 3
			},
			u: {
				sound: new Howl({
	  				src: ['sounds/aybaby.mp3']
				}),
				id: 'hurricanechris',
				num: 1
			},
			i: {
				sound: new Howl({
	  				src: ['sounds/brrbrr.mp3']
				}),
				id: '2chainz',
				num: 4
			},
			o: {
				sound: new Howl({
					src: ['sounds/nickiuh.mp3']
				}),
				id: 'nickiuh',
				num: 3
			},
			p: {
				sound: new Howl({
	  				src: ['sounds/mr305.mp3']
				}),
				id: 'pitbull',
				num: 4
			},
			a: {
				sound: new Howl({
	  				src: ['sounds/mynameis.mp3']
				}),
				id: 'eminem',
				num: 2
			},
			s: {
				sound: new Howl({
	  				src: ['sounds/nickipurrrr.mp3']
				}),
				id: 'nicki',
				num: 3
			},	
			d: {
				sound: new Howl({
	  				src: ['sounds/woah.mp3']
				}),
				id: 'bigsean',
				num: 1
			},
			f: {
				sound: new Howl({
	  				src: ['sounds/liljon.mp3']
				}),
				id: 'liljon',
				num: 3
			},
			g: {
				sound: new Howl({
	  				src: ['sounds/jayz.mp3']
				}),
				id: 'jayz',
				num: 2
			},
			h: {
				sound: new Howl({
	  				src: ['sounds/panda.mp3']
				}),
				id: 'desiigner',
				num: 4
			},
			j: {
				sound: new Howl({
	  				src: ['sounds/frenchmontana.mp3']
				}),
				id: 'frenchmontana',
				num: 3
			},
			k: {
				sound: new Howl({
	  				src: ['sounds/drummaboy.mp3']
				}),
				id: 'drummaboy',
				num: 5
			},
			l: {
				sound: new Howl({
	  				src: ['sounds/schoolboyq.mp3']
				}),
				id: 'schoolboyq',
				num: 2
			},
			z: {
				sound: new Howl({
	  				src: ['sounds/djmustard.mp3']
				}),
				id: 'djmustard',
				num: 4
			},
			x: {
				sound: new Howl({
	  				src: ['sounds/souljaboy.mp3']
				}),
				id: 'souljaboy',
				num: 1
			},
			c: {
				sound: new Howl({
	  				src: ['sounds/nickiyoungmoney.mp3']
			}),
				id: 'nicki2',
				num: 2
			},
			v: {
				sound: new Howl({
	  				src: ['sounds/djkhaled.mp3']
				}),
				id: 'djkhaled2',
				num: 4
			},
			b: {
				sound: new Howl({
	  				src: ['sounds/souljaboy2.mp3']
				}),
				id: 'souljaboy',
				num: 2
			},
			n: {
				sound: new Howl({
					src: ['sounds/straightuptravis.mp3']
				}),
				id: 'travis2',
				num: 3
			},
			m: {
				sound: new Howl({
	  				src: ['sounds/ladiesandgentlemann.mp3']
				}),
				id: 'jazzyphae',
				num: 3
			}
		};
	
	// with webworker have it take in the song split it and then return the letter to be played
	// webworker will wait the correct amount of time and then when its done waiting send the letter
	// back so we can immediately play here
	function playback(song) {
		// create another thread
		if (typeof(Worker) !== "undefined") {
		    // worker
			w = new Worker("playback.js");
			w.postMessage(song);
		 	w.onmessage = function(event){
		 	keyData[event.data].sound.play()
			}; 
		} else {
			alert("You do not have web worker support!");
		}
	}
	
	// Variable to store waiting times between key presses
	var song = "";
	var recording = false;
	var waiting = false;
	
	// is working :)
	document.onkeydown = function ()
	{
		if(recording && !waiting) {
			var time = this._time;
			var timestamp = new Date().getTime();
			if(time)
			{
				if(song.length != 0) {
					song += " " + (timestamp-time) + " ";
				}
			}
			this._time = timestamp;
		}

	}
	
	document.onkeypress = function(evt) {
	    evt = evt || window.event;
	    var charCode = evt.keyCode || evt.which;
	    var charStr = String.fromCharCode(charCode);
	    if(recording) {
		    song += charStr;
	    }
	};

 	// Listenerz
 	$(document).ready(function() {
 		var pressedkey = false;
		
		// Sidebar functionz
		$("#showsidebar").on("mouseenter", function() {
		    $("#sidebar").hide().removeClass("d-none").fadeIn();
		});
		
		$("#sidebar").on("mouseleave", function() {
		    $("#sidebar").addClass("d-none");
		});
	});


 	// Listenerz
 	$(document).ready(function() {
 		 var pressedkey = false;
		
		// Instruction functionz
		$("body").keypress(function(e){
			// change to work on all browsers
			pressedKey = true;
			$("#instructions").addClass('d-none');

		});
		
		$("#logo").on("mouseenter", function() {
		    $("#instructions").removeClass('d-none');
		});
		
		$("#record").on("click", function() {
			if(!recording && !waiting) {
				$("#record").attr("src", "src/stop.png");
				recording = true;
			} else if(!waiting) {
				$("#record").attr("src", "src/play.png");
	    		var xhttp = new XMLHttpRequest();
		  	 	xhttp.open("POST", "songServlet", false);
		  	  	xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 	
		  	  	xhttp.send("field=song&song=" + song);
				waiting = true;
		  	  	recording = false;
			} else {
				// should play the song now!
		  	  	playback(song);
		  	  	song = "";
				$("#record").attr("src", "src/record.png");
				waiting = false;
			}
		});
		
	});


 	// Profile !!
		function getProfile() {

		 // JQUERY
		 $.ajax({
			 url: "LoginServlet",
			 data: {
				 field: "profile"						 
			 },
			 // callback function on success
			 success: function(result) {
 				 if(result.localeCompare("null") == 0) {
					 document.location.href = 'landing.jsp';
				 }
				 $("#screen-name").html(result);
			 }
		 });
	}


	</script>
</head>

<body onload="getProfile();">

<!-- main home page body -->
<div  class="container-fluid col-12" id="homepage">
	<canvas id="interactive" resize></canvas>
	
	<!-- visible logo -->
	<img src="src/asapfavicon2.png" id="logo">
	<img src="src/instructionslong.png" id="instructions">
	
	<!-- all of the loaded images hidden :) -->
	<img class="d-none" id="asap" src="src/asapdiorlogoblue.png">
	<img class="d-none" style="max-height: 200px" id="travis" src="src/travis.png">
	<img class="d-none" id="travis2" src="src/travis2.png">
	<img class="d-none" id="fetty" src="src/fettywap.png">
	<img class="d-none" id="2chainz" src="src/2chainz.png">
	<img class="d-none" id="djkhaled" src="src/djkhaled.png">
	<img class="d-none" id="djkhaled2" src="src/djkhaled2.png">
	<img class="d-none" id="drake" src="src/drake.png">
	<img class="d-none" id="eminem" src="src/eminem.png">
	<img class="d-none" id="pitbull" src="src/pitbull.png">
	<img class="d-none" id="nicki" src="src/nicki.png">
	<img class="d-none" id="chance" src="src/chance.png">
	<img class="d-none" id="bigsean" src="src/bigsean.png">
	<img class="d-none" id="drummaboy" src="src/drummaboy.png">
	<img class="d-none" id="desiigner" src="src/desiigner.png">
	<img class="d-none" id="djmustard" src="src/djmustard.png">
	<img class="d-none" id="frenchmontana" src="src/frenchmontana.png">
	<img class="d-none" id="hurricanechris" src="src/hurricanechris.png">
	<img class="d-none" id="jayz" src="src/jayz.png">
	<img class="d-none" id="liljon" src="src/liljon.png">
	<img class="d-none" id="nicki2" src="src/nicki2.png">
	<img class="d-none" id="schoolboyq" src="src/schoolboyq.png">
	<img class="d-none" id="souljaboy" src="src/souljaboy2.png">
	<img class="d-none" id="jazzyphae" src="src/jazzyphae.png">
	<img class="d-none" id="nickiuh" src="src/nicki3.png">
			
	<!-- sidebar text -->
	<img id="showsidebar" src="src/sidebarwhite.png">
	 <img src="src/record.png" id="record" style="position: fixed; max-height: 50px; left: 40px; bottom: 20px;">
	
	
</div>

<!-- sidebar: hover over lil asap and boxes slide out!! -->
<div class="col-2 d-none float-right" id="sidebar">

	<div class="row d-flex justify-content-center">
		<!-- image of most used rapper -->
		<div class='w-100 d-flex justify-content-center'>
				<img src="src/pitbull.png" id="mostusedrapper"> 
		</div>
		
		<!-- randomly generated screen name -->
		<div class="justify-content-center" id="screen-name">
			hello
		</div>
	</div>

	<!-- active users bar -->
	<div class="row justify-content-center" id="friends">	
		<!-- active users text -->		
 		<img src="src/activeusers.png" id="activeuserstext">
		
		<!-- active users table -->
		<div class="side w-100" id="activetable">
			<ul class="w-100">
				<li class="user w-100">
					<img src="src/offline2.png"> 
					<span class="ml-1 username"> username </span>
				</li>
				<li class="user">
					<img src="src/online.png"> 
					<span class="ml-1 username"> username </span>

				</li>
				<li class="user">
					<img src="src/offline2.png"> 
					<span class="ml-1 username"> username </span>

				</li>
				<li class="user w-100">
					<img src="src/offline2.png"> 
					<span class="ml-1 username"> username </span>
				</li>
				<li class="user">
					<img src="src/offline2.png"> 
					<span class="ml-1 username"> username </span>

				</li>
				<li class="user">
					<img src="src/offline2.png"> 
					<span class="ml-1 username"> username </span>

				</li>
				
				<li class="user w-100">
					<img src="src/offline2.png"> 
					<span class="ml-1 username"> username </span>
				</li>	
			</ul>
		</div>
	</div>
	
	<!-- logout text -->
	<div class="row justify-content-center">
	 	<input class="g-signin2" id="signOutButton" style="max-height: 100px; max-width: 150px;" type="image" src="src/logout.png" />
	</div>

	<!-- asap logout image -->
 	<img class="rounded-circle" id="lilasap" src="src/asapstanding.png">	
</div>

<script type="text/javascript">
   
   $(document).ready(function(){
	    $('#signOutButton').click(function(){
	       signOut();
	    });
	})
   
   function signOut() {
	    
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
			document.location.href = "landing.jsp";
	    });
	  }
</script>


</body>
</html>