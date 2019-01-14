public class button{
  int posX, posY;
  int rectW, rectH;
  color main, highlight;
  boolean over;
  button(int px, color cmain, color chigh){
    rectW = 100;
    rectH = 50;
    posY = height/2 - rectH/2;
    if(px < 0){
      posX = width/2 - rectW/2 + px;
    }
    else if(px == 0){
      posX = width/2;
    }
    else{
      posX = width/2 + rectW/2 + px;
    }
    main = cmain;
    highlight = chigh;
    over = false;
  }
  
  boolean overButton()  {
    return ((mouseX - posX >= -rectW) && (mouseX - posX <= rectW) &&
       (mouseY - posY >= -rectH) && (mouseY - posY <= rectH));
  }
 void update() {
    if (overButton()) {
      over = true;
    }
    else {
     over = false;
    }
  }
  
  void drawButton(){
    if(over) fill(highlight);
    else fill(main);
    stroke(255);
    rect(posX, posY, rectW, rectH, 7);
  }
}
