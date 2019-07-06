void setup(){
  size(1280, 780);
  noLoop();
}

void draw(){
  int ccX = width / 2;
  int ccY = ((height-60) / 2) + 60;
  int cDiam = height - 120;
  float cRadius = cDiam / 2;
  //float cCircumf = 2 * PI * cRadius;
  background(255);
  
  fill(#AFBC85);
  rect(0,0,width,60);
  fill(#4B5233);
  textSize(36);
  textAlign(CENTER,CENTER);
  text("Pythagoras Pie Puzzle: who gets the biggest piece?",width/2,60/2);
  
  stroke(#0F6C0B); 
  strokeWeight(3);
  //noFill();
  fill(#B6CBB5);
  circle(ccX,ccY,cDiam);
  line(ccX,ccY,ccX + cRadius, ccY);
  
  textSize(12);
  fill(#A52131);
  float pieLeftover = 360.0;
  //text('0',ccX + cRadius + 10, ccY);
  
  stroke(#2145A5); 
  strokeWeight(1);
  float slicePercentage = 0;
  for(float i=1.0; i<=30.0; i++){

    float slice = (i / 100) * pieLeftover;
    slicePercentage = slice / 360.0;

    float sliceX = cos(radians(pieLeftover-slice)) * cRadius;
    float sliceY = sin(radians(pieLeftover-slice)) * cRadius;
    float textX = cos(radians(pieLeftover-slice)) * (cRadius+10);
    float textY = sin(radians(pieLeftover-slice)) * (cRadius+10);
    stroke(#2145A5);
    line(ccX,ccY,ccX+sliceX,ccY-sliceY);
    fill(#A52131);
    text((int)i, ccX+textX,ccY-textY);
    
    //let's try to color in the slice of pie...
    //float fillColor = slicePercentage * 255;
    float fillColor = (int)(map(slicePercentage, (float)0.0, (float)TAU, (int)0, (int)255)*100);
    //fill((int)fillColor);
    noFill();
    stroke(#00FFFF);
    //arc(ccX,ccY,cDiam,cDiam,radians(TWO_PI-pieLeftover-slice),radians(TWO_PI-pieLeftover),PIE);
    //arc(ccX,ccY,cDiam,cDiam,QUARTER_PI,TWO_PI,PIE);
    println("i = "+i+", pieLeftover = "+pieLeftover+", slice = "+slice+", slice "+(int)i+" is "+(slicePercentage*100)+"% of the full pie, fillColor is "+(int)fillColor+", radians TWO_PI - radians pieLeftover = "+(radians(TWO_PI)-radians(pieLeftover))+", radians two_pi - radians pieleftover + radians slice = "+(radians(TWO_PI)-radians(pieLeftover)+radians(slice)));

    pieLeftover = pieLeftover - slice;
  }
}
