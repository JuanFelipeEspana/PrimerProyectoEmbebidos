//SE INCLUYEN LAS LIBRERÍAS BÁSICAS DE C
#include <stdio.h>
#include <stdlib.h>
//ADEMAS LA BCM QUE PERMITE UTILIZAR LOS GPIO
//DE LA RASPBERRY PI
#include <bcm2835.h>


int main(){
   //SE REVISA QUE INICIALICE BIEN EL PUERTO
   if(!bcm2835_init())
      return 1;
   //SE CONFIGURA EL GPIO COMO SALIDA
   bcm2835_gpio_fsel(18, BCM2835_GPIO_FSEL_OUTP);
   //LOOP QUE ALTERNA EL VALOR DE SALIDA DEL
   //GPIO
   while(1){
      bcm2835_gpio_write(18, HIGH);
      bcm2835_gpio_write(18, LOW);
   }
   //AL TERMINAR CERRAR EL MANEJO DEL PUERTO
   bcm2835_close();
   return 0;
}
