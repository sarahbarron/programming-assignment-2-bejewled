/*
 Name : Sarah Barron
 Student Number: 20013679
 
 HDIP Computer Science - WIT - March 2019
 Programming assignment 2.
 
 Timer class - creates a timer object.
 The time allowed for a game is based on the difficulty level 
 chosen by the user at the beginning the timer counts down from this
 time to zero once the timer goes below 0 the game ends */

class Timer {
  private float timer;


  // Constructor method to create a timer  
  Timer(float timer)
  {
    this.timer = timer;
  }


  /* Setter method sets the timer depending on the difficulty 
   level chosen  by the user */
  void setTimer(float setTime)
  {
    this.timer = setTime;
  }


  // Getter method to return the time
  public float getTimer()
  {
    return(timer);
  }


  /* countDownTimer method
   the frameRate is run x amount of times every second 
   this decreases the timer by 1/frameRate each time.
   It is run constantly in the draw method once it reaches 0 
   the game ends */
  public void countDownTimer()
  {
    timer -= 1/frameRate;
  }
}
