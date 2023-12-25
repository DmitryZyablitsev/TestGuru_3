document.addEventListener('turbolinks:load', function() {
  window.timerEl = document.querySelector('.timer')

  if (timerEl) {
    const controlTime = timerEl.getAttribute("data-time");
    let time_now = Math.floor(Date.now() / 1000) ;
    window.remaining_time = controlTime - time_now
    setInterval(updateCountdown, 1000)
  }
})

function updateCountdown() { 
  let minutes = Math.floor( remaining_time / 60);
  minutes = minutes < 10 ? "0" + minutes : minutes;
  let seconds = remaining_time % 60;
  seconds = seconds < 10 ? "0" + seconds : seconds;
  timerEl.innerHTML = `${minutes}: ${seconds}`;
  remaining_time--;
  if (remaining_time <= 0) {
    timeOver()
  } 
}

function timeOver() {
  const buttonNext = document.getElementById('btn-next')
  buttonNext.click()
}
