(function () {
    var audio = document.getElementById('podcast-audio');
    var playBtn = document.getElementById('podcast-play-btn');
    var playIcon = document.getElementById('podcast-play-icon');
    var pauseIcon = document.getElementById('podcast-pause-icon');
    var seekBar = document.getElementById('podcast-seek');
    var currentEl = document.getElementById('podcast-current');
    var totalEl = document.getElementById('podcast-total');
    var thumb = document.getElementById('podcast-thumb');
    var player = document.getElementById('podcast-player');

    function fmt(s) {
        var m = Math.floor(s / 60);
        var sec = Math.floor(s % 60);
        return m + ':' + (sec < 10 ? '0' : '') + sec;
    }

    function updateSeekFill() {
        var pct = seekBar.max > 0 ? (seekBar.value / seekBar.max) * 100 : 0;
        seekBar.style.background = 'linear-gradient(to right, #4acaa8 ' + pct + '%, #444 ' + pct + '%)';
    }

    function setDuration() {
        if (audio.duration && isFinite(audio.duration)) {
            seekBar.max = audio.duration;
            totalEl.textContent = fmt(audio.duration);
        }
    }

    audio.addEventListener('loadedmetadata', setDuration);
    audio.addEventListener('durationchange', setDuration);

    // In case metadata already loaded before the script ran
    if (audio.readyState >= 1) setDuration();

    audio.addEventListener('loadedmetadata', function () {
        seekBar.max = audio.duration;
        totalEl.textContent = fmt(audio.duration);
    });

    audio.addEventListener('timeupdate', function () {
        seekBar.value = audio.currentTime;
        currentEl.textContent = fmt(audio.currentTime);
        updateSeekFill();
    });

    audio.addEventListener('ended', function () {
        playIcon.style.display = '';
        pauseIcon.style.display = 'none';
        seekBar.value = 0;
        updateSeekFill();
    });

    playBtn.addEventListener('click', function () {
        if (audio.paused) {
            audio.play();
            playIcon.style.display = 'none';
            pauseIcon.style.display = '';
        } else {
            audio.pause();
            playIcon.style.display = '';
            pauseIcon.style.display = 'none';
        }
    });

    seekBar.addEventListener('input', function () {
        audio.currentTime = seekBar.value;
        updateSeekFill();
    });
})();