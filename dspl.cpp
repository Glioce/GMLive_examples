/***********************************
  DISPLAY CON ESP8266 Y NEOPIXELS
***********************************/

// Bibliotecas
#include <Adafruit_NeoPixel.h>
#include <Wire.h>
#include <RTClib.h>
#define  verde  0x00FF00
#define rojo  0xFF0000

// Habilitar o deshabilitar Serial
#define SERIAL_EN 1
// Habilitar o deshabilitar Wire
//#define WIRE_EN 0

// Esta configuración utiliza los pines disponibles en ESP-01
#define PIXPIN 1 //GPIO2
#define PIXNUM 30 //(4 digitos)*(7 segmentos) + (2 puntos)
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(PIXNUM, PIXPIN, NEO_GRB + NEO_KHZ800);

//#define SDA 1
//#define SCL 3
int contador = 1234;


void printDisplay(int cont)
{
  //delay(100);

  if(contador < 1260)
  {
    printDigit(cont / 1000, 0,  verde);
  printDigit((cont % 1000)/100, 7,  verde);
  printDigit(((cont % 1000)%100)/10, 16, verde);
  printDigit(((cont % 1000)%100)%10, 23, verde);
  }

  else
  {
     printDigit(cont / 1000, 0,  rojo);
  printDigit((cont % 1000)/100, 7,  rojo);
  printDigit(((cont % 1000)%100)/10, 16, rojo);
  printDigit(((cont % 1000)%100)%10, 23, rojo);
  }
  
  

  delay(100);
  pixels.show();
}



const byte digits[] = {
  B1110111,  // 0
  B1000100,  // 1
  B0111110,  // 2    11
  B1101110,  // 3   0  2
  B1001101,  // 4    33
  B1101011,  // 5   4  6
  B1111011,  // 6    55
  B1000110,  // 7
  B1111111,  // 8
  B1001111   // 9
};

//int cont

// Los digitos inician en los siguientes pixels de derecha a izquierda
// 0-6, 7-13, 16-22, 23-29
// Los dos puntos (:) usan los pixels 14 y 15

void printDigit(uint8_t n, uint8_t p, uint32_t c) {
  // n - numero o digito
  // p - posicion
  // c - color
  for (uint8_t i = 0; i < 7; i++) {
    if (digits[n] & (1 << i))
      pixels.setPixelColor(p + i, c);
    else
      pixels.setPixelColor(p + i, 0);
  }
}

//const char num[] = "1234";

void setup() {
  //Wire.begin(SDA, SCL);

#if SERIAL_EN
  Serial.begin(9600);
  Serial.print("\nDISPLAY CON ESP8266 Y NEOPIXELS\n\n");
#endif

  pixels.begin();
  delay(100);
  printDisplay(contador);
  
} //fin setup()

void loop() {
  printDisplay(contador);
  contador++;
  delay(1000);
  /*
  for (int i = 0; i < PIXNUM; i++) {
    pixels.setPixelColor(i, pixels.Color(0, 150, 0)); // Moderately bright green color.
    pixels.show(); // This sends the updated pixel color to the hardware.
    delay(500); // Delay for a period of time (in milliseconds).
  }*/
} //fin loop()



uint32_t mixColors(uint32_t c1, uint32_t c2, uint8_t pc) {
  // c1 - color 1
  // c2 - color 2
  // pc - percent 0 -> c1 only, 50 -> equal mix, 100 -> c2 only
  uint8_t pcinv = 100 - pc; //inverse
  
  uint32_t r1 = (c1 & 0xFF0000) * pcinv;
  uint32_t r2 = (c2 & 0xFF0000) * pc;
  uint32_t r3 = r1 + r2;

  uint32_t g1 = (c1 & 0xFF00) * pcinv;
  uint32_t g2 = (c2 & 0xFF00) * pc;
  uint32_t g3 = g1 + g2;

  uint32_t b1 = (c1 & 0xFF) * pcinv;
  uint32_t b2 = (c2 & 0xFF) * pc;
  uint32_t b3 = b1 + b2;

  return r3 + g3 + b3;
}
