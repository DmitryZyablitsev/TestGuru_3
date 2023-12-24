document.addEventListener('turbolinks:load', function() {
  window.timerEl = document.querySelector('.timer')

  if (timerEl) {
    const startTime = timerEl.getAttribute("data-time");
    window.time = startTime;
    setInterval(updateCountdown, 1000)
  }
})

function updateCountdown() { 
  let minutes = Math.floor( time / 60);
  minutes = minutes < 10 ? "0" + minutes : minutes;
  let seconds = time % 60;
  seconds = seconds < 10 ? "0" + seconds : seconds;
  timerEl.innerHTML = `${minutes}: ${seconds}`;
  time--;
  if (time == 0) {
    timeOver()
  } 
}

function timeOver() {
  
}
