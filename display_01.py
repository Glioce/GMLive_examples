import time
from neopixel import *

#Colores GRB
verde = 0xFF0000
rojo  = 0x00FF00
contador = 1234

# LED strip configuration:
LED_COUNT      = 30      # Number of LED pixels.
LED_PIN        = 18      # GPIO pin connected to the pixels (18 uses PWM!).
#LED_PIN        = 10      # GPIO pin connected to the pixels (10 uses SPI /dev/spidev0.0).
LED_FREQ_HZ    = 800000  # LED signal frequency in hertz (usually 800khz)
LED_DMA        = 10      # DMA channel to use for generating signal (try 10)
LED_BRIGHTNESS = 255     # Set to 0 for darkest and 255 for brightest
LED_INVERT     = False   # True to invert the signal (when using NPN transistor level shift)
LED_CHANNEL    = 0       # set to '1' for GPIOs 13, 19, 41, 45 or 53

# Create NeoPixel object with appropriate configuration.
pixels = Adafruit_NeoPixel(LED_COUNT, LED_PIN, LED_FREQ_HZ, LED_DMA, LED_INVERT, LED_BRIGHTNESS, LED_CHANNEL)
# Intialize the library (must be called once before other functions).
pixels.begin()

digits = [
  0B1110111,  # 0
  0B1000100,  # 1
  0B0111110,  # 2    11
  0B1101110,  # 3   0  2
  0B1001101,  # 4    33
  0B1101011,  # 5   4  6
  0B1111011,  # 6    55
  0B1000110,  # 7
  0B1111111,  # 8
  0B1001111   # 9
]

#--------------------------------------------
def printDigit(n, p, c):
  # n - numero o digito
  # p - posicion
  # c - color
  for i in range(7):
    if digits[n] & (1 << i):
      pixels.setPixelColor(p + i, c)
    else:
      pixels.setPixelColor(p + i, 0)

#-----------------------------------------------
def printDisplay(cont):
  #delay(100);

  if contador < 1260:
    printDigit(cont / 1000, 0,  verde)
    printDigit((cont % 1000)/100, 7,  verde)
    printDigit(((cont % 1000)%100)/10, 16, verde)
    printDigit(((cont % 1000)%100)%10, 23, verde)
  else:
    printDigit(cont / 1000, 0,  rojo)
    printDigit((cont % 1000)/100, 7,  rojo)
    printDigit(((cont % 1000)%100)/10, 16, rojo)
    printDigit(((cont % 1000)%100)%10, 23, rojo)
    
  #delay(100);
  #time.sleep(0.1)
  pixels.show();

print("DISPLAY")
print("Presiona Ctrl+C para cerrar el programa")

#------------------------------------------------
while True:
  printDisplay(contador)
  contador+=1
  time.sleep(1.0)
  
