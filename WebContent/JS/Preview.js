/* Preview.js */
var preview = document.getElementById("preview");
var time1 = document.getElementById("time1");
var time2 = document.getElementById("time2");
var curtime = 0;
var pretime = 0;
var counter;
var timer;
					
function play() {
	if(preview.paused) {
		counter = setInterval("update()", 1000);
		timer = setTimeout("stop()", pretime * 1000);
	}
        preview.play();
}
					
function stop() {
	preview.pause();
	clearInterval(counter);
	clearTimeout(timer);
	preview.currentTime = 0;
	curtime = 0;
	time1.innerHTML = "0:00";
}

function update() {
	curtime++;
	if(curtime < 10) {
		time1.innerHTML = "0:0" + curtime;
	}
	else {
		time1.innerHTML = "0:" + curtime;
	}
}

window.onload = function() {
	pretime = preview.duration;
	if(pretime > 120) {
		pretime = 120;
	}
	pretime = Math.floor(pretime / 2);
	if(pretime == 60) {
		time2.innerHTML = " / 1:00";
	}
	else {
		if(pretime < 10) {
			time2.innerHTML = " / 0:0" + pretime;
		}
		else {
			time2.innerHTML = " / 0:" + pretime;
		}
	}
};