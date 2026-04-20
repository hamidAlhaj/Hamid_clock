final float   Second_hand =200;

final int app_width = int (2 * Second_hand + 30 );

final int CENTER = app_width / 2 ;

final float diameter = app_width - 5 ;

final float   minute_hand = 7.0/8.0 * Second_hand ;

final float hour_hand = 2.7/4.0 * Second_hand ; 

void setup () { 
 size (440 , 440 );
  stroke(0);
  noFill();
}

PVector converAndTranslate (float theta , float r){
 theta -= HALF_PI ;  
  return new PVector (r * cos (theta) + CENTER ,
  r * sin(theta) + CENTER 
  ) ;
}
void draw () {
  background (255);
  strokeWeight(1);
  ellipse (CENTER,CENTER,diameter,diameter);
  
  stroke(0);
  for (int a = 0; a < 360; a += 30) {
    float angle = radians(a);
    float Offset, weight;
    if (a % 90 == 0) {  
      weight = 7;
      Offset = 18;
    } else {
      weight = 4;
      Offset = 12;  
    }
    strokeWeight(weight);
    float x1 = CENTER + cos(angle) * (Second_hand - Offset);
    float y1 = CENTER + sin(angle) * (Second_hand - Offset);
    float x2 = CENTER + cos(angle) * (Second_hand );
    float y2 = CENTER + sin(angle) * (Second_hand );
    line(x1, y1, x2, y2);
  }
  
  stroke(255, 0, 0);
  float theta =   TWO_PI * second() / 60 ; 
  PVector endPoint = converAndTranslate (theta , Second_hand);
  line(CENTER,CENTER,endPoint.x , endPoint.y);
  stroke(0);
  strokeWeight(2);
  theta =   TWO_PI * minute() / 60 ; 
  endPoint = converAndTranslate (theta , minute_hand);
  line(CENTER,CENTER,endPoint.x , endPoint.y);
   stroke(0);
   strokeWeight(5);
  theta =   TWO_PI *( (hour()%12 + minute() / 60.0) / 12.0)  ; 
  endPoint = converAndTranslate (theta , hour_hand);
  line(CENTER,CENTER,endPoint.x , endPoint.y);
   

}
