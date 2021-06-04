#!/bin/bash
#
# GNU/Linux - ©WHITE HACKS
# GPL - General Public License
# Open Source - Software Libre
#
# ┌═════════┐  ┌════════════┐
# █ DarkSMS █=>█ 03/06/2021 █
# └═════════┘  └════════════┘
#
# ===============================================
#                   VARIABLES
# ===============================================
PWD=$(pwd)
SYSTEM=$(uname -o)
# ===============================================
#               COLORES RESALTADOS
# ===============================================
negro="\e[1;30m"
azul="\e[1;34m"
verde="\e[1;32m"
cian="\e[1;36m"
rojo="\e[1;31m"
purpura="\e[1;35m"
amarillo="\e[1;33m"
blanco="\e[1;37m"
# ===============================================
#                 COLORES BAJOS
# ===============================================
black="\e[0;30m"
blue="\e[0;34m"
green="\e[0;32m"
cyan="\e[0;36m"
red="\e[0;31m"
purple="\e[0;35m"
yellow="\e[0;33m"
white="\e[0;37m"
# ===============================================
#            VERIFICANDO DEPENDENCIAS
# ===============================================
Requirements(){
	if [ "${SYSTEM}" == "Android" ]; then
		APT="pkg"
		BIN="/data/data/com.termux/files/usr/bin"
	else
		APT="apt-get"
		BIN="/bin"
	fi
	if [ ! -x ${BIN}/curl ]; then
		${APT} install curl -y
	fi
	if [ ! -x ${BIN}/darksms ]; then
		echo "#!/bin/bash" >> ${BIN}/darksms
		echo "DarkSMS='${PWD}'" >> ${BIN}/darksms
		echo 'cd ${DarkSMS}' >> ${BIN}/darksms
		echo 'exec bash "${DarkSMS}/darksms.sh" "$@"' >> ${BIN}/darksms
		chmod 777 ${BIN}/darksms
	fi
}
# ===============================================
#             BANNER DE TEXTO DARKSMS
# ===============================================
DarkSMS(){
	sleep 0.5
	clear
echo -e "${negro}
██████╗  █████╗ ██████╗ ██╗  ██╗${verde}███████╗███╗   ███╗███████╗${negro}
██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝${verde}██╔════╝████╗ ████║██╔════╝${negro}
██║  ██║███████║██████╔╝█████╔╝ ${verde}███████╗██╔████╔██║███████╗${negro}
██║  ██║██╔══██║██╔══██╗██╔═██╗ ${verde}╚════██║██║╚██╔╝██║╚════██║${negro}
██████╔╝██║  ██║██║  ██║██║  ██╗${verde}███████║██║ ╚═╝ ██║███████║${negro}
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝${verde}╚══════╝╚═╝     ╚═╝╚══════╝"${blanco}
}
# ===============================================
#          SOLICITANDO DATOS AL USUARIO
# ===============================================
InputData(){
	DarkSMS
echo -e -n "${negro}
┌═══════════════════┐
█ ${blanco}NÚMERO TELEFÓNICO ${negro}█
└═══════════════════┘
┃
└═>>> "${verde}
	read -r NUMBER
	sleep 0.5
echo -e -n "${negro}
┌══════════════════┐
█ ${blanco}MENSAJE A ENVIAR ${negro}█
└══════════════════┘
┃
└═>>> "${verde}
	read -r SMS
	curl -X POST https://textbelt.com/text --data-urlencode phone="${NUMBER}" --data-urlencode message="${SMS}" -d key=textbelt > /dev/null 2>&1
	if [[ $(echo $?) == "0" ]]; then
echo -e "${negro}
┌═════════════════┐
█ ${verde}MENSAJE ENVIADO ${negro}█
└═════════════════┘
"${blanco}
	else
echo -e "${negro}
┌════════════════════┐
█ ${rojo}MENSAJE NO ENVIADO ${negro}█
└════════════════════┘
"${blanco}
	fi
}
# ===============================================
#              DECLARANDO FUNCIONES
# ===============================================
Requirements
InputData
# ===============================================
#     Creado por Darkmux - WHITE HACKS ©2021
# ===============================================
