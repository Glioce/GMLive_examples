
//Mensajes al display      LCD  20 x 4    $ 210   Abril 2019 torres

// Conexiones del Modulo LCD
//#include<lcd420.c>
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// Fin de conexiones del modulo LCD
// definicion de conexiones del teclado
char keypadPort at PORTB;
// esta conectado al puerto B
char kp;
char Kp1;
unsigned NumKonDis=0;
short tkl1=0;
unsigned int wwP=0;
short contador=0;
short ip1=0;
unsigned jp1=0;   //mov del display de derecha a izquierda
bit dr1;
short k=0;
short EsElNm=0;
int L=100;

//0...64000
void PantallaINT(short rng,short col, unsigned msg1,char msgTx[8] )  //Pantalla para dato short
{ char numtx[7];    // El tamaño de la cadena debe de ser un caracter mayor al que tiene que almacenar con signo
  short ik=0;                  //shorttostr debe ser [5], inttostr    0-255
  //inttostr debe ser [7]
  inttostr(msg1,numtx);
  for  (ik=1; ik<16; ik++)       //Borra pos del numero mas los caracteres del aviso
  {Lcd_Out(rng,ik, " ");}// Borra la zona para escribir
  Lcd_Out(rng,col+8, numtx); // Escribe el dato en la posicion inicial
  Lcd_Out(rng,col,msgTx);  // Escribe el texto dentro del borrado del dato ojo
}

void LeeLt(short ss)    //El ss coloca el valor en kp o en kp1   void LeeLt(short ss,short psak)
{wwp=60000;//unsigned buk=6000;
  
  //if (Psak)buk=10;do
  {wwp--;//buk--;
    Tkl1 = Keypad_Key_Click() ;
    delay_ms(55);
    if (Tkl1==0) goto fintk3;//nulo
    if (Tkl1==1){tkl1=49;EsElNm=1; goto fintk3;}   //  1
    if (Tkl1==2){tkl1=50;EsElNm=2; goto fintk3;}   //  2
    if (Tkl1==3){tkl1=51;EsElNm=3; goto fintk3;}   //  3
    if (Tkl1==4){tkl1=65;EsElNm=10;goto fintk3;}   //  A
    if (Tkl1==5){tkl1=52;EsElNm=4; goto fintk3;}   //  4
    if (Tkl1==6){tkl1=53;EsElNm=5; goto fintk3;}   //  5
    if (Tkl1==7){tkl1=54;EsElNm=6; goto fintk3;}   //  6
    if (Tkl1==8){tkl1=66;EsElNm=11;goto fintk3;}   //  B
    if (Tkl1==9){tkl1=55;EsElNm=7; goto fintk3;}   //  7   PARA BORRAR TENS FTE USAR 15 7S SIETES    Kn1 ++;
    if (Tkl1==10){tkl1=56;EsElNm=8;goto fintk3;}   //  8
    if (Tkl1==11){tkl1=57;EsElNm=9;goto fintk3;}   //  9
    if (Tkl1==12){tkl1=67;EsElNm=12;goto fintk3;}  //  C
    if (Tkl1==13){tkl1=42;EsElNm=14;goto fintk3;}  //  *     if (!FrAtk) tkl1=42; else   0
    if (Tkl1==14){tkl1=48;EsElNm=0; goto fintk3;}  //  0
    if (Tkl1==15){tkl1=35;EsElNm=15;goto fintk3;}  //  #
    if (Tkl1==16){tkl1=68;EsElNm=13;goto fintk3;}  //  D
  }while((Tkl1>0)|(wwp>0));         //while((Tkl1>0)|(wwp>0)| (psak));
  fintk3:;
  if (!ss)kp= Tkl1; else Kp1=Tkl1;
}

/*
  void PantallaSHRT(short rng,short col, short msg1,char msgTx[3] )  //Pantalla para dato short
  { char numtx[19];    //5 El tamaño de la cadena debe de ser un caracter mayor al que tiene que almacenar con signo
  //shorttostr debe ser [5], inttostr    0-255
  //inttostr debe ser [7]
  shorttostr(msg1,numtx);
  Lcd_Out(rng,col, "       ");// Borra la zona para escribir
  Lcd_Out(rng,col+3, numtx); // Escribe el dato en la posicion inicial
  Lcd_Out(rng,col,msgTx);  // Escribe el texto dentro del borrado del dato ojo
  }
*/
//#include<lcd420.c>
void main(){
  ANSEL = 0; // Deshabilita entradas analogicas 0-7
  ANSELH = 0; // Deshabilita entradas analógicas 8-11
  Keypad_Init();              //Inicializa el teclado.
  Lcd_Init();                 //Inicializa el LCD.
  Lcd_Cmd(_LCD_CLEAR);        //Borra el display.
  //Lcd_Cmd(_LCD_CURSOR_OFF);   //Apaga el cursor.
  //Lcd_Out(1,1,"select una tecla MAGNETRONIX");
  //Lcd_Out(2,1,"A o C Superficie O Quimica ");
  
  kp=0;
  ip1=1;
  jp1=1;
  dr1=0;
  Lcd_cmd(_lcd_cursor_off);
  do                         //Espera por una tecla.
  { kp=Keypad_Key_Click();    //Lee el número de la tecla y lo guarda en kp.
    if (jp1>=250)
    {jp1=0;
      
      
      switch (ip1)
      {
        case 2:{Lcd_cmd(_LCD_return_home);
          Lcd_out(1,1,"     MAGNETRONIX  ");
          Lcd_out(2,1,"   Fibra de vidrio");
          Lcd_out(3,1,"Seleccione una tec");
          Lcd_out(4,1," A o C            ");
          //Lcd_cmd(_lcd_return_home);
          break;
        }
        case 1:{ Lcd_cmd(_LCD_CLEAR);/*
        //Lcd_out(1,1," ");*/
        //Lcd_cmd(_Lcd_First_row);
        // d_out(1,1," ");
        //Lcd_cmd(_Lcd_Second_row);
        // Lcd_out(1,1," ");              }
        //Lcd_out(1,1," ");
        //Lcd_cmd(_Lcd_third_row);
        //Lcd_cmd(_Lcd_Fourth_row);
        //Lcd_out(1,1,"A_Area, C_Gotas, pe\0");
        //Lcd_out(2,1,"A_Area, C_Gotas, pe\0");
        //Lcd_out(3,1,"A_Area, C_Gotas, pe\0");
        //Lcd_out(4,1,"A_Area, C_Gotas, pe\0");
        Lcd_out(2,1,"  kkkkkkkkk       ");
        Lcd_out(3,1,"  kkkkkkk        .");
        Lcd_out(4,1,"5_Config          ");
        lcd_out(1,1,"01234567890") ;
        break;
        }
      }
      
      
      
      ip1++;
      if (ip1>2) ip1=0;
      //if  (ip1<=8) Lcd_Cmd(_lcd_shift_left);else  Lcd_Cmd(_lcd_shift_right); ip1++;if (ip1>=16)ip1=0;
    }
    jp1++;
    delay_ms(10);
    if (!((kp==4)|(kp==12)))kp=0;
    delay_ms(100);
  }while(!kp);
  kp=0;
  Lcd_Cmd(_LCD_CLEAR);        //Borra el display.     LCD  20 x 4
  contador=0;
  PantallaINT(1,1,numkondis,"Area  ");   Lcd_Out(1,15,"" );// lcd_cmd(_lcd_blink_cursor_on);
  
  while(1)
  {
    LeeLt(0);
    if (kp>0){ kp=0;
      /*
        if (contador==5)contador=0;//NumKonDis =NumKonDis+(EsElNm*10);
        if (contador==4){ contador =5; NumKonDis =NumKonDis +(EsElNm*10000);goto fin1;}
        if (contador==3){ contador =4; NumKonDis =NumKonDis +(EsElNm*1000);goto fin1;}
        if (contador==2){ contador =3; NumKonDis =NumKonDis +(EsElNm*100);goto fin1; }
        if (contador==1){ contador =2; NumKonDis =NumKonDis +(EsElNm*10);goto fin1;}
        if (contador==0){ contador =1; NumKonDis = EsElNm;}//=2;kp;
      */
      if (contador==5)contador=0;//NumKonDis =NumKonDis+(EsElNm*10);
      if (contador==4){ contador =5; NumKonDis =(NumKonDis*10)+EsElNm;goto fin1;}
      if (contador==3){ contador =4; NumKonDis =(NumKonDis*10)+EsElNm;goto fin1;}
      if (contador==2){ contador =3; NumKonDis =(NumKonDis*10)+EsElNm;goto fin1; }
      if (contador==1){ contador =2; NumKonDis =(NumKonDis*10)+EsElNm;goto fin1;}
      if (contador==0){ contador =1; NumKonDis = EsElNm;}//=2;kp;
      
      fin1:;
      //PantallaINT(1,1,numkondis,"Area"); Lcd_Out(1,15,"" ); lcd_cmd(_lcd_blink_cursor_on);
      // Lcd_Out(1,1+17,"_" );
    }
  }
  
  
  
  
  
  
}