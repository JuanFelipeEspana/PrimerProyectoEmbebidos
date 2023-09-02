#!/bin/bash
#CREA UN NOMBRE DE ARCHIVO CON LOS FECHA ACTUAL
fileNAME="$(date "+%Y-%m-%d")_TEMPERATURA.csv"
#GENERA LA RUTA ENTREGADA CON EL NOMBRE DEL ARCHIVO
fileRoute="$1/$fileNAME"
#¿EL ARCHIVO EXISTE?
if ! [ -f "$fileRoute" ]; then
    #SI NO EXISTE SE CREA Y SE ESCRIBE EL ENCABEZADO
    touch $fileRoute
    echo "Fecha,Temperatura" > $fileRoute
fi
#CON EL ARCHIVO YA DISPONIBLE
while [ 1 ]
do
    #VARIABLE QUE ALMACENA LA FECHA CON SEGUNDOS INCLUIDOS
    currentTime="$(date "+%Y-%m-%dT%H:%M:%S")"
    #TEMPERATURA LEIDA ACTUALMENTE POR EL SENSOR
    currentTemp=$(cat /sys/bus/w1/devices/28-d6531e1e64ff/temperature)
    #CONVERSION A GRADOS CENTIGRADOS
    realTemp=$(echo "scale=3; "$currentTemp" / 1000" | bc -l)
    echo "$realTemp"
    #ESCRITURA EN EL ARCHIVO INDICADO, SEPARADOS POR COMAS
    echo "$currentTime,$realTemp" >> $fileRoute
    #DORMIR POR 10s PARA LA PROXIMA ITERACION
    sleep 10
done
