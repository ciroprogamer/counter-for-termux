#/!/bin/bash
clear 
echo "installing requirements" 
(yes|apt update -y && yes|apt upgrade -y && yes|apt install -y figlet) > /dev/null 2>&1 
sleep 1s
echo "all done,Lauching..."
sleep 5s
clear 
figlet COUNTER 
read -p "desde que numero deseas contar?: " inicial 
read -p "y hasta cual?: " final 
if [ $((final - inicial)) -gt 100 ]; then
	read -p "(y/n)me parece que eso es demasiado largo te recoiendo de que lo haas en un archivo y no mostrarlo en pantalla,seguiras mi consejo?DEFAULT:n: " largo
	if [[ $largo == y || $largo == Y || $largo == yes || $largo == Yes || $largo == YES || $largo == s || $largo == S ]]; then
		read -p "a que archivo lo quieres pasar?no incluyas la extension el el nombre: " archivo
		clear
		echo "" > "$archivo".txt
		echo creando archivo,esto puede tardar unos minutos...
		i=$(seq "$inicial" "$final")
		echo "$i" > "$archivo".txt
	else
		clear
		i=$(seq "$inicial" "$final")
		echo "$i"
	fi
else
	clear
	i=$(seq "$inicial" "$final")
	echo "$i"
fi
