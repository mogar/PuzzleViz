/*
Locker Puzzle
Morgan Redfield
6 August 2010

From http://www.mathispretty.com/?p=314

One hundred students line up to walk by one hundred closed lockers. 
The first student walks by opening every locker that is closed. 
The second student then walks by and opens every second locker that is 
closed and closes every second locker that is open. The third student 
does the same for every third locker and the nth student does the same for every nth locker.

After all the students have walked by the lockers, how many lockers are open?
*/

boolean[] lockers = new boolean[50];

void setup() {
  for (int i = 0; i < lockers.length; i++) {
    lockers[i] = false;
  }
  
  size(15*lockers.length + 5, 25*lockers.length + 50);
  background(150);
}


int person = 1;
void draw() {
  //background(150);
  closeDoors(person);
  for (int i = 0; i < lockers.length; i++) {
  //for (int i = 0; i < person; i++) {
    if (lockers[i]) {
     fill(255); //white
    } else {
     fill(0);
    } 
    rect(i*10 + i * 5 + 5, 25 * person, 10, 10);
  }
  

  if (person > lockers.length - 1) {
    saveFrame("locker_puzzle-####.jpg");
    noLoop(); 
  }
  person++;
  delay(500);
}

void closeDoors(int skip_value) {
  for (int i = 0; i < lockers.length; i++) {
    if ((i+1) % skip_value == 0) {
      lockers[i] = !lockers[i];
    } 
  }
}
