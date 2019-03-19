class Timer{
 private float timer;
 
 // constructor with the time allowed for the timer  
 Timer(float timer)
 {
   this.timer = timer;
 }
 
// set the timer for easy, medium, hard time levels
 void setTimer(float setTime)
 {
   this.timer = setTime;
 }
 
 // get the current time
 public float getTimer()
 {
   return(timer);
 }
 
 // updates the count down timer
 public void countDownTimer()
 {
   timer -= 1/frameRate;
 }
}
