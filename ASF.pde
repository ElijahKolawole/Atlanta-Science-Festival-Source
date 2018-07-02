class ASF{
//These are variables in ASF class   
boolean gameOver;
  Boolean correct;
  Boolean checkIfCorrect ;
 PFont font1;
  float lastTimeCheck;
  float currentCount;
  double random;
  double randomNum; 
ASF(){

}
//*************Constructor******************************//

ASF( float lastTimeCheck,float currentCount, Boolean correct, Boolean checkIfCorrect){//Constructor 1:
 this.gameOver = false;
  this.correct = correct;
  this.checkIfCorrect = checkIfCorrect;
this.lastTimeCheck=lastTimeCheck;
this.currentCount=currentCount;
 }
//*************Write title on top of canvas******************************//
void writeTitle(String title, int xPos, int yPos){
  font1 = createFont("Arial Bold", 30); 
  fill(255);
 // textSize(250);
 textFont(font1);
text (title, xPos, yPos);
fill(0, 0,0);
text (title, xPos+1, yPos+2);
random = random(40, 95);
 randomNum = Math.floor(random);

}
//*************Timer and game events for the game******************************//

void printGameFunctions(float limit, float posX,float posY, PImage image, float imageXpos, float imageYpos){
   Boolean firstQuestion = false;
 gameOver = true;// game over status
 
checkIfCorrect = false;
 fill(255);
//  textSize(25);
  
  if(millis() > lastTimeCheck){

lastTimeCheck  = millis();
currentCount = ceil(lastTimeCheck/1000);

text("TIMER: " + currentCount, posX,posY);/// timer text
fill(0, 0,0);
text("TIMER: " + currentCount, posX+1,posY+2);
 if (currentCount == limit){
 fill(255, 255, 0);
noLoop();
textSize(70);
fill(0);
text("*****GAME OVER!*****", 280, 80);
text("*****GAME OVER!*****",280+4, 80+5);
gameOver = false;
print("Current Time:" +  currentCount);
}
 }
 //This is where you add the quations
 if (currentCount< 15){

    
    text("Unlock the Crime Scene by answering this query!", 100, 100);
    //textFont(f,24);
    //fill(0);
        text("QUESTION-SET 1", 350, 200);

    text("Who is the founder of bluetooth? (Please hover over your choice!!!)", 250, 250);
    text("(A) Ericson", 255, 300);
    text("(B) Steve Jobs", 260, 350);
    text("(C) Martin Cooper", 265, 400);  
    
 }

if ((mouseX >= 263 && mouseX<= 407)&& (mouseY >= 279 && mouseY<= 296)&& (currentCount < 15))
   {

    text("GOOD JOB!", 500, 350);
    firstQuestion = true;
    //delay(3000);
   } 
   
   if ((mouseX >= 263 && mouseX<= 461)&& (mouseY >= 332 && mouseY<= 349)&& (currentCount < 15))
   {

   text("OoooPPPPssss!!!", 500, 350);
    //delay(3000);
   }
   

   if ((mouseX >= 263 && mouseX<= 511)&& (mouseY >= 379 && mouseY<= 400)&& (currentCount < 15))
   {

   text("OoooPPPPssss!!!", 500, 350);
    //delay(3000);
   }

if (firstQuestion == true){
printSecondQustion(250, 480, randomNum);
}
   
if ((currentCount >15 && currentCount <19)){
 fill(0,255, 0);
 textSize(45);
text("ALERT: ALL YOUR INSTRUCTIONS APPEAR HERE ", posX-1000, posY + 50);
}
if (currentCount >15 && currentCount <=limit){
  image(image, imageXpos, imageYpos);
 fill(0,255, 0);
 textSize(45);
}

if (currentCount >19 &&  currentCount <= 21){
 fill(0,0,0);
 textSize(25);
 fill(0,255, 0);
text("Goal 1 : Carefully investigate what happened at this house." , posX-1000, posY+60);
}
if (currentCount >19 &&  currentCount <= 25){
 fill(0,255, 0);
 textSize(25);
text("But first, lets do a quick knowledge review!." ,( width/2)-150, posY+30 );
}

 
if (currentCount >21 &&  currentCount <= limit && validateCorrect() == false){
 fill(0,0,0);
 textSize(25);
text("QUESTION 1 : How many electronic devices can you identify. Click the correct number. " ,posX-1000, posY+60);
}
if (currentCount >=27 &&  currentCount <= limit){
checkResponse(( width/2)-150, posY+30, 12);
validateCorrect();
if ((validateCorrect() ==  true &&  currentCount <= limit) ){


    fill(0, 255, 0);
  text("CORRECT!!! Good job gamer.", ( width/2)-150, posY+30);
  fill(0,0,0);
 textSize(25);
text("QUESTION 2 :What is this device used for?. Click the option. " ,posX-1000, posY+60);
}
}



if (currentCount >=22 &&  currentCount <= limit){
printNumbers();

}



 }
 void printNumbers(){
image (number1, 300, 100, 100, 100);
image (number2, 500, 100, 100, 100);
image (number3, 700, 100, 100, 100);
image (number4, 900, 100, 100, 100);



 }
 void trackMouseLoc(){
 fill(255);
 stroke(255);
 ellipse(mouseX, mouseY, 10, 12);
 println("mouseX: "+ mouseX + "  mouseY: "+ mouseY); 
 }
 
 void printTextOnMouseP(String text, float posX, float posY){
   if( mouseX >= 87 && mouseX<= 117 && mouseY >= 192 && mouseY <= 232) {
 text(text, posX, posY);
 }
   
 }
 PShape drawRectangle(float xPos, float yPos, float width, float height, float opacity){
  PShape rectangle;
   fill(0, 0,0,opacity);//Transparency of the instruction rectangle
   noStroke();
   //rectMode(CENTER);
    rectangle = createShape(RECT, xPos,  yPos, width, height);
return rectangle;
 }
 
 void openingScene(float xPos, float yPos){
   background(0,128, 0);
   fill(0);
   textSize(20);
   text("shjvkdhsjhd",   xPos, yPos);
 }
 void closingScene(float xPos, float yPos){
   if (gameOver == false){
 background(0,128, 0, 10);
   fill(0);
   textSize(120);
   text("THE END",  xPos, yPos);
    textSize(50);
   text("Total Time: "+ currentCount + " Seconds", xPos-30, yPos + 80 );
   }
 }
 
 void goToNextRoom(float xPosDown, float xPosUp, float yPosDown, float yPosUp, PImage newImage  ){
if ((mousePressed == true)&&((mouseX >= xPosDown && mouseX<= xPosUp)&& (mouseY >= yPosDown && mouseY<= yPosUp))){
  background(newImage); //openingScene(0, 0); 
 }
 

 }
void checkResponse(float xPos, float yPos, float startTime){
  if ((mousePressed == true )&&((mouseX >= 900 && mouseX<= 1000)&& (mouseY >= 100 && mouseY<= 200))&& (currentCount >= startTime)){
   correct = true;
  //checkIfCorrect = true;
fill(0, 0, 0, 100);
    rect(890, 90, 120, 120);

   // rect ( 900, 100, 100, 100);

    fill(0, 255, 0);
  text("CORRECT!!! Good job gamer.", xPos, yPos);

  }
  
else if ((mousePressed == true)&&((mouseX >= 700 && mouseX<= 800)&& (mouseY >= 100 && mouseY<= 200))&& (currentCount >= startTime)){
  
  fill(0, 0, 0, 100);
    rect(690, 90, 120, 120);
  fill(0, 255, 0);

 text("WRONG, look carefully. You can do it!!!", xPos, yPos);
 correct = false;
  checkIfCorrect = false;


}
else if ((mousePressed == true)&&((mouseX >= 500 && mouseX<= 600)&& (mouseY >= 100 && mouseY<= 200))&& (currentCount >= startTime)){
  fill(0, 0, 0, 100);
    rect(490, 90, 120, 120);
  fill(0, 255, 0);

 text("WRONG, look carefully. You can do it!!!", xPos, yPos);
 correct = false;
   checkIfCorrect = false;


}
else if ((mousePressed == true)&&((mouseX >= 300 && mouseX<= 400)&& (mouseY >= 100 && mouseY<= 200))&& (currentCount >= startTime)){
  fill(0, 0, 0, 100);
    rect(290, 90, 120, 120); 
  fill(0, 255, 0);

 text("WRONG, look carefully. You can do it!!!", xPos, yPos);
 correct = false;
   checkIfCorrect = false;


}
 
 
 }
 Boolean validateCorrect(){
   Boolean  correct;
   if ((mousePressed == true)&&((mouseX >= 900 && mouseX<= 1000)&& (mouseY >= 100 && mouseY<= 200))){
   correct = true;
 }
 else 
 correct = false;
  return correct;
}

void printSecondQustion (float posX, float posY, double randomNum){// th
Boolean response = false;

  text("QUESTION-SET 2", 350, 450);
//The pass mark in algebra class is 75%
text("The pass mark in algebra class is 75%", posX , posY+30);
text("Anyone with 70% out of 100, has a C", posX , posY+60);
text("Anyone with 80% out of 100, has a B", posX , posY+90);
text("Anyone with 90% out of 100, has an A", posX , posY+120);

text("What is the grade of Sarah if her % score is: "+ randomNum  , posX , posY+150);
text("Did She Pass or Fail?: ", posX+100 , posY+180);
fill(255);
text("Yes she Passed  ||" , posX+50 , posY+210);
fill(255, 0, 0);
text("No she Failed " , posX+330 , posY+210);
//This will check if the answer is right or wrong
if (randomNum < 70){
  response = false;
  fill(255,0,0);
  text("No she failed  ||" , posX+50 , posY+250);

}
else{
response = true;
fill(255);
text("Yes she passed  ||" , posX+50 , posY+250);

}

print("Rand: " +  randomNum);
}
}