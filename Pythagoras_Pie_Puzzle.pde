void setup(){
  size(1400, 780);
  noLoop();
}

void draw(){
  int ccX = (width / 2) - 340;
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
  
  float plotChartX = width/2+100;
  float plotChartY = 120; //(y position of top)
  float plotChartW = width-plotChartX-50;
  float plotChartH = height-170;
  float plotChartB = plotChartY+plotChartH; //(y position of bottom)
  float plotChartR = plotChartX+plotChartW; //(x position of far right edge)
  float plotChartVT = plotChartW / 100.0; //distance between vertical lines, dividing the plot chart width into 100 segments (divide by 98 since we already have the two side walls)
  float plotChartHZ = plotChartH / 7.0; //distance between horizontal lines, dividing the plot chart height into 7 segments (divide by 5 since we already have the top and bottom walls)
  stroke(#000000);
  strokeWeight(2);
  fill(#F2FFC9);
  rect(plotChartX,plotChartY,plotChartW,plotChartH);

  fill(#000000);
  textSize(12);
  strokeWeight(1);
  text("7%",plotChartX-50,plotChartY);
  text("0%",plotChartX-50,plotChartB);
  text("Person 1",plotChartX,plotChartY-50);
  line(plotChartX+plotChartVT,plotChartY-40,plotChartX+plotChartVT,plotChartY-5);
  text("Person 100",plotChartR,plotChartY-50);
  line(plotChartR,plotChartY-40,plotChartR,plotChartY-5);

  //DRAW 99 VERTICAL LINES within the plot chart area
  for(float v=1;v<100;v++){
    float plotChartLX = plotChartX+(plotChartVT*v);
    stroke(#4444FF);
    line(plotChartLX,plotChartY,plotChartLX,plotChartB);
    if(v%5==0){
      stroke(#000000);
      text((int)v,plotChartLX,plotChartY-30);
      line(plotChartLX,plotChartY-20,plotChartLX,plotChartY-5);
    }
  }
  //DRAW 6 HORIZONTAL LINES within the plot chart area
  for(float h=1;h<7;h++){
    float plotChartLY = plotChartY+(plotChartHZ*h);
    stroke(#4444FF);
    line(plotChartX,plotChartLY,plotChartR,plotChartLY);
    text((7-(int)h)+"%",plotChartX-50,plotChartLY);
  }
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
  //float slicePercentageLastIteration = 0;
  float percentHLastIteration = 0;
  for(float i=1.0; i<=50.0; i++){

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
    
    //noFill();
    //bezier();
    stroke(#990000);
    float percentH = map(slicePercentage,0.0,7.0,0,100);
    line(plotChartX+((i-1.0)*plotChartVT),plotChartB-(plotChartH*percentHLastIteration),plotChartX+(i*plotChartVT),plotChartB-(plotChartH*percentH));

    if(i==10){
      stroke(#FF0000);
      fill(#990000);
      text((slicePercentage*100)+"%",plotChartX-50,plotChartB-(plotChartH*percentH));
      line(plotChartX-10,plotChartB-(plotChartH*percentH),plotChartX+(i*plotChartVT)-5,plotChartB-(plotChartH*percentH));
      strokeWeight(3);
    }
    else if(i==11){noStroke();strokeWeight(1);}
    else{stroke(#00FFFF);}

    //let's try to color in the slice of pie...
    //float fillColor = slicePercentage * 255;
    float fillColor = (int)(map(slicePercentage, (float)0.0, (float)TAU, (int)0, (int)255)*100);
    fill((int)fillColor);
    arc(ccX,ccY,cDiam,cDiam,radians(360-pieLeftover),radians(360-pieLeftover+slice),PIE);
    println("i = "+i+", pieLeftover = "+pieLeftover+", slice = "+slice+", slice "+(int)i+" is "+(slicePercentage*100)+"% of the full pie, fillColor is "+(int)fillColor+", radians TWO_PI - radians pieLeftover = "+(radians(TWO_PI)-radians(pieLeftover))+", radians two_pi - radians pieleftover + radians slice = "+(radians(TWO_PI)-radians(pieLeftover)+radians(slice)));
    pieLeftover = pieLeftover - slice;
    //slicePercentageLastIteration = slicePercentage;
    percentHLastIteration = percentH;
  }
}
