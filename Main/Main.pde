


ArrayList<Move> Moves = new ArrayList<Move>();
Move M;
 
import peasy.*;
PeasyCam cam;

//Posizione traslazione base
float xBaseTrasl = 0.0;
float yBaseTrasl = 0.0;
float zBaseTrasl = -100.0;

// Raggio e altezza dei pali A,B e C
float raggioP=15.0;
float altezzaP=100.0;

//Coordinate Palo A (Default: quello a sinistra)
float posPaloAx=-100.0;
float posPaloAy= 0.0;
float posPaloAz= 0.0;

//Coordinate Palo B (Default: quello al centro)
float posPaloBx= 0.0;
float posPaloBy= 0.0;
float posPaloBz= 0.0;

//Coordinate Palo C (Default: quello a destra)
float posPaloCx= 100.0;
float posPaloCy= 0.0;
float posPaloCz= 0.0;

//Larghezza, altezza e profondità della Base
float XBASE=300.0;
float YBASE=20.0;
float ZBASE=100.0;

TorreDiHanoi Torre= new TorreDiHanoi(XBASE,YBASE,ZBASE);

//Altezza, raggio interno dischi e lunghezza linguetta
float HeightDisc=20.0;
float RintDisc=15.0;

//Parametri linguetta (Il primo è quello che definisce quanto si sporge la linguetta dal disco)
float Linguetta=60.0;
float hLing=2.0;
float LargLing=10.0;

//Disco UNO (grande)
float RestDiscUNO=40.0; //Raggio esterno
  disco UNO =  new disco(RintDisc,RestDiscUNO,HeightDisc,Linguetta);

//Coordinate iniziali disco UNO (grande)
  float UNOx = -100.0;
  float UNOy = -YBASE/2-HeightDisc/2;
  float UNOz = zBaseTrasl;

  //Coordinate iniziali punto presa della linguetta
  float PosLingUNOx=-100.0;;
  float PosLingUNOy=-YBASE/2-HeightDisc/2;
  float PosLingUNOz=(RestDiscUNO/2)+Linguetta;

//Disco DUE (medio)
float RestDiscDUE=30.0; //Raggio esterno
  disco DUE =  new disco(RintDisc,RestDiscDUE,HeightDisc,Linguetta);
  
//Coordinate iniziali disco DUE (medio)
  float DUEx=-100.0;
  float DUEy=-YBASE/2-(3*HeightDisc)/2;
  float DUEz= zBaseTrasl;

  //Coordinate iniziali punto presa della linguetta
  float PosLingDUEx=-100.0;;
  float PosLingDUEy=-YBASE/2-(3*HeightDisc)/2;
  float PosLingDUEz=(RestDiscDUE/2)+Linguetta;
  
//Disco TRE (piccolo) 
float RestDiscTRE=20.0; //Raggio esterno
  disco TRE =  new disco(RintDisc,RestDiscTRE,HeightDisc,Linguetta);
  
//Coordinate iniziali disco TRE (piccolo)
  float TREx=-100.0;
  float TREy=-YBASE/2-(5*HeightDisc)/2;
  float TREz= zBaseTrasl ;
  
  //Coordinate iniziali punto presa della linguetta
  float PosLingTREx=-100.0;;
  float PosLingTREy=-YBASE/2-(5*HeightDisc)/2;
  float PosLingTREz=(RestDiscTRE/2)+Linguetta;
  
//Coordinate Livello Palo A (Ordinate dal più basso al più alto)
Float LvAx=posPaloAx + xBaseTrasl;   Float Lv1Ay=-YBASE/2-HeightDisc/2 + yBaseTrasl;       Float LvAz=posPaloAz + zBaseTrasl;
                                     Float Lv2Ay=-YBASE/2-(3*HeightDisc)/2 + yBaseTrasl; 
                                     Float Lv3Ay=-YBASE/2-(5*HeightDisc)/2 + yBaseTrasl; 

//Coordinate Livello Palo B (Ordinate dal più basso al più alto)
Float LvBx=posPaloBx + xBaseTrasl;   Float Lv1By=-YBASE/2-HeightDisc/2 + yBaseTrasl;       Float LvBz=posPaloBz + zBaseTrasl;
                                     Float Lv2By=-YBASE/2-(3*HeightDisc)/2 + yBaseTrasl; 
                                     Float Lv3By=-YBASE/2-(5*HeightDisc)/2 + yBaseTrasl; 

//Coordinate Livello Palo C (Ordinate dal più basso al più alto)
Float LvCx=posPaloCx + xBaseTrasl;   Float Lv1Cy=-YBASE/2-HeightDisc/2 + yBaseTrasl;       Float LvCz=posPaloCz + zBaseTrasl;
                                     Float Lv2Cy=-YBASE/2-(3*HeightDisc)/2 + yBaseTrasl; 
                                     float Lv3Cy=-YBASE/2-(5*HeightDisc)/2 + yBaseTrasl; 

// posizioni della mossa
float[] posi;
float[] distt;
float[] CurrentPosition;
//offset di altezza

float hOff = 30;

float i = 0.0;

int j = 0;
void setup(){
  size(1300,750,P3D);
  cam = new PeasyCam(this, 500);
  background(#979CF5);
  directionalLight(126,126,126,0,0,0.7);
  smooth(8);
  HanoiSolution(3);

}

void draw(){
  background(#979CF5);
  fill(#C99951);
  push();
  UNO.DrawDisco(UNOx,UNOy,UNOz);
  pop();
  push();
  DUE.DrawDisco(DUEx,DUEy,DUEz);
  pop();
  push();
  TRE.DrawDisco(TREx,TREy,TREz);
  pop();
  push();
  Torre.DrawTh(xBaseTrasl,yBaseTrasl,zBaseTrasl);
  pop();
  push();
  strokeWeight(3);
  push();
  fill(255,0,0);
  stroke(255,0,0);
  line(0,0,0,200,0,0);
  pop();
  push();
  fill(0,255,0);
  stroke(0,255,0);
  line(0,0,0,0,200,0);
  pop();
  push();
  fill(0,0,255);
  stroke(0,0,255);
  line(0,0,0,0,0,200);
  pop();
  pop();
  
  M = Moves.get(j);
  posi = startAndFinal(M);
  
  print("\n\n\n\n\n\n",posi[0],posi[1],posi[2],posi[3],posi[4],posi[5],"\n\n\n\n\n\n");
  distt = distance(posi);
  print(distt[0],distt[1],distt[2],distt[3],distt[4]);
  drawTraiettoria(distt, posi);
  i = i+ 0.01;
  if(i >= 1){
    i = 0.0;
     j++;
    if(j == 7){
      j = 0;
    }
   
  }
    CurrentPosition = traiettoria(i, distt, posi);
    drawCurrentPosition( CurrentPosition);
  
  
}
