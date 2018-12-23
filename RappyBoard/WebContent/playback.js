/**
 * 
 */

var songdata;
var count;
self.addEventListener("message", function(e) {
	songdata = e.data.split(" ");
	count = 0;
	songWait();
}, false);


function songWait() {
	if(count < songdata.length) {
		postMessage(songdata[count++]);
		setTimeout("songWait()", songdata[count++]);
	} 
}
