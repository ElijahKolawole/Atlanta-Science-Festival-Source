PImage main;
//PImage vase;
PImage number1;
PImage number2;
PImage number3;
PImage number4;
ASF object1;


void setup() {
    size(1350, 800);

  surface.setResizable(true);
  object1 = new ASF();
  smooth();
  main = loadImage("office.jpg");
  //vase = loadImage("brokenVase.png");
    number1 = loadImage("data/number1.jpg");

  number2 = loadImage("data/number2.jpg");
  number3 = loadImage("data/number3.png");
  number4 = loadImage("data/number4.png");
 main.resize(1200, 450);
 //vase.resize(1300, 1000);


}
void draw() {
object1.openingScene(0,0);

//background(0,128, 0, 40);

 //image (main, 0, 200);
 
//image(vase, 50, 175);


object1.writeTitle("GGC ATLANTA SCIENCE FESTIVAL", 10, 30);
object1.printGameFunctions(60, 1140, 30, main, 0, 200);//If you want more second . simply change the 5 to how ever many econds you want
 
   
//shape(object1.drawRectangle(05,250,55,340, 100));// Rectangle for next Rooms
fill(255);

//object1.goToNextRoom(10,55,257, 592 , vase);
object1.trackMouseLoc();
//object1.printTextOnMouseP("knocked over!!!", 100, 950);
fill(50, 50, 50, 20);
//shape(object1.drawRectangle(0,0,1350,120, 20));//Rectangle for instruction
  object1.closingScene(400,height/2);
}