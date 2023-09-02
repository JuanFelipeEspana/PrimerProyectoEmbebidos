#!/bin/bash
#LEEMOS LA TERMINAL PARA SABER QUE PIN CONFIGURAR
GPIO=$1
#CREAMOS UNA VARIABLE HACIA LA RUTA DE ESE GPIO
fileGPIO="/sys/class/gpio/gpio$GPIO"
#VERIFICAMOS SI YA EXISTE
if ! [ -L "$fileGPIO" ]; then
   #SI NO EXISTE SE CREA MEDIANTE FUNCION EXPORT
   echo "$GPIO" > /sys/class/gpio/export
else
   #SI EXISTE SE AVISA POR CONSOLA
   echo "El GPIO ya está configurado"
fi
#VAMOS A LA RUTA DEL PIN HABILITADO
cd "$fileGPIO"
#LO CONFIGURAMOS COMO SALIDA
echo "out" > direction
#CREAMOS UN LOOP DONDE ALTERNAMOS SU VALOR A LA
#MAXIMA VELOCIDAD
while [ 1 ]
do
   echo "1" > value
   echo "0" > value
done
 
