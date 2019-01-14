import processing.serial.*; //<>//
import processing.sound.*;
SoundFile file, file1, file2, file3;
button b1, b2, b3;
color bcolor;
Serial myPort;
String myString;
float val = 0;
float amp;


void setup() {
  fullScreen();
  rectMode(RADIUS);
  b1 = new button(0, color(0), color(120));  
  b2 = new button(width/4, color(0), color(204));
  b3 = new button(-(width/4), color(0), color(50));
  bcolor = color(104);
  // Load a soundfile from the /data folder of the sketch and play it back
  file1 = new SoundFile(this, "scape1.wav");
  file2 = new SoundFile(this, "scape2.wav");
  file3 = new SoundFile(this, "scape3.wav");
  file = file1;
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}      

void draw() {
  if (myPort.available() > 0) {
    myString = myPort.readStringUntil(' ');
    if (myString != null && !myString.equals("")) {
      myString = myString.replaceAll(" ","");
      if(Integer.parseInt(myString) < 300){
        val = Integer.parseInt(myString);
        println("val: " + val);
      }
    }
  }
  background(bcolor);
  b1.update();
  b1.drawButton();
  b2.update();
  b2.drawButton();
  b3.update();
  b3.drawButton();
  if(file.isPlaying()){
    if(val < 300){
     amp = val/300;
     file.amp(amp); 
     //println("amp: " + amp);
    }
  }
}

void mousePressed() {
  if(file.isPlaying()){
      file.stop();
    }
  if (b1.overButton()) {
    file = file1;
    file.loop();
  }
  if (b2.overButton()) {
    file = file2;
    file.loop();
  }
  if(b3.overButton()){
    file = file3;
    file.loop();
  }
}
