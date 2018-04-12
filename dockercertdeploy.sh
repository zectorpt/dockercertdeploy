#!/bin/bash
RED='\033[0;41;30m'
STD='\033[0;0;39m'

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
        echo "Certificate found on:"
        ssh prdlpcd181 hostname
        ssh prdlpcd181 docker exec BP_RCAPI_181_7021 keytool -v -list -keystore /usr/local/appli/config/cacerts -storepass changeit -alias digicertglobalrootg2|grep "Nom d'alias"
        ssh prdlpcd182 hostname
        ssh prdlpcd182 docker exec BP_RCAPI_182_7021 keytool -v -list -keystore /usr/local/appli/config/cacerts -storepass changeit -alias digicertglobalrootg2|grep "Nom d'alias"
        ssh prdlpcd183 hostname
        ssh prdlpcd183 docker exec BP_RCAPI_183_7021 keytool -v -list -keystore /usr/local/appli/config/cacerts -storepass changeit -alias digicertglobalrootg2|grep "Nom d'alias"
        ssh prdlpcd184 hostname
        ssh prdlpcd184 docker exec BP_RCAPI_184_7021 keytool -v -list -keystore /usr/local/appli/config/cacerts -storepass changeit -alias digicertglobalrootg2|grep "Nom d'alias"
        ssh prdlpcd185 hostname
        ssh prdlpcd185 docker exec BP_RCAPI_185_7021 keytool -v -list -keystore /usr/local/appli/config/cacerts -storepass changeit -alias digicertglobalrootg2|grep "Nom d'alias"
        ssh prdlpcd186 hostname
        ssh prdlpcd186 docker exec BP_RCAPI_186_7021 keytool -v -list -keystore /usr/local/appli/config/cacerts -storepass changeit -alias digicertglobalrootg2|grep "Nom d'alias"
        pause
}

two(){
        echo "Copying DigiCertGlobalRootG2.crt to BP_RCAPI on:"
        ssh prdlpcd181 hostname
        ssh prdlpcd181 docker cp /tmp/DigiCertGlobalRootG2.crt BP_RCAPI_181_7021:/tmp/
        sleep 1
        ssh prdlpcd181 docker exec -u root BP_RCAPI_181_7021 keytool -import -trustcacerts -keystore /usr/local/appli/config/cacerts -storepass changeit -noprompt -alias digicertglobalrootg2 -file /tmp/DigiCertGlobalRootG2.crt

        ssh prdlpcd182 hostname
        ssh prdlpcd182 docker cp /tmp/DigiCertGlobalRootG2.crt BP_RCAPI_182_7021:/tmp/
        sleep 1
        ssh prdlpcd182 docker exec -u root BP_RCAPI_182_7021 keytool -import -trustcacerts -keystore /usr/local/appli/config/cacerts -storepass changeit -noprompt -alias digicertglobalrootg2 -file /tmp/DigiCertGlobalRootG2.crt


        ssh prdlpcd183 hostname
        ssh prdlpcd183 docker cp /tmp/DigiCertGlobalRootG2.crt BP_RCAPI_183_7021:/tmp/
        sleep 1
        ssh prdlpcd183 docker exec -u root BP_RCAPI_183_7021 keytool -import -trustcacerts -keystore /usr/local/appli/config/cacerts -storepass changeit -noprompt -alias digicertglobalrootg2 -file /tmp/DigiCertGlobalRootG2.crt


        ssh prdlpcd184 hostname
        ssh prdlpcd184 docker cp /tmp/DigiCertGlobalRootG2.crt BP_RCAPI_184_7021:/tmp/
        sleep 1
        ssh prdlpcd184 docker exec -u root BP_RCAPI_184_7021 keytool -import -trustcacerts -keystore /usr/local/appli/config/cacerts -storepass changeit -noprompt -alias digicertglobalrootg2 -file /tmp/DigiCertGlobalRootG2.crt


        ssh prdlpcd185 hostname
        ssh prdlpcd185 docker cp /tmp/DigiCertGlobalRootG2.crt BP_RCAPI_185_7021:/tmp/
        sleep 1
        ssh prdlpcd185 docker exec -u root BP_RCAPI_185_7021 keytool -import -trustcacerts -keystore /usr/local/appli/config/cacerts -storepass changeit -noprompt -alias digicertglobalrootg2 -file /tmp/DigiCertGlobalRootG2.crt


        ssh prdlpcd186 hostname
        ssh prdlpcd186 docker cp /tmp/DigiCertGlobalRootG2.crt BP_RCAPI_186_7021:/tmp/
        sleep 1
        ssh prdlpcd186 docker exec -u root BP_RCAPI_186_7021 keytool -import -trustcacerts -keystore /usr/local/appli/config/cacerts -storepass changeit -noprompt -alias digicertglobalrootg2 -file /tmp/DigiCertGlobalRootG2.crt

        pause
}

show_menus() {
        clear
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo " BLANCHEPORTE Cert Deployer"
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo "1. Show Certificate"
        echo "2. Copy and Deploy Certificate"
        echo "3. Restart BP_RCAPI_181_7021"
        echo "4. Restart BP_RCAPI_182_7021"
        echo "5. Restart BP_RCAPI_183_7021"
        echo "6. Restart BP_RCAPI_184_7021"
        echo "7. Restart BP_RCAPI_185_7021"
        echo "8. Restart BP_RCAPI_186_7021"
        echo "9. Show Docker container status"
        echo -e "10. Exit\n"
}

read_options(){
        local choice
        read -p "Enter choice [ 1 - 10] " choice
        case $choice in
                1) one ;;
                2) two ;;
                3) three ;;
                4) four ;;
                5) five ;;
                6) six ;;
                7) seven ;;
                8) eight ;;
                9) nine ;;
                10) exit 0;;
                *) echo -e "${RED}Error...${STD}" && sleep 2
        esac
}

three(){
        echo "Restarting Container BP_RCAPI_181_7021..."
        ssh prdlpcd181 docker stop BP_RCAPI_181_7021
        sleep 2
        ssh prdlpcd181 docker start BP_RCAPI_181_7021
        pause
}

four(){
        echo "Restarting Container BP_RCAPI_182_7021..."
        ssh prdlpcd182 docker stop BP_RCAPI_182_7021
        sleep 2
        ssh prdlpcd182 docker start BP_RCAPI_182_7021
        pause
}

five(){
        echo "Restarting Container BP_RCAPI_183_7021..."
        ssh prdlpcd183 docker stop BP_RCAPI_183_7021
        sleep 2
        ssh prdlpcd183 docker start BP_RCAPI_183_7021
        pause
}

six(){
        echo "Restarting Container BP_RCAPI_184_7021..."
        ssh prdlpcd184 docker stop BP_RCAPI_184_7021
        sleep 2
        ssh prdlpcd184 docker start BP_RCAPI_184_7021
        pause
}

seven(){
        echo "Restarting Container BP_RCAPI_185_7021..."
        ssh prdlpcd185 docker stop BP_RCAPI_185_7021
        sleep 2
        ssh prdlpcd185 docker start BP_RCAPI_185_7021
        pause
}

eight(){
        echo "Restarting Container BP_RCAPI_186_7021..."
        ssh prdlpcd186 docker stop BP_RCAPI_186_7021
        sleep 2
        ssh prdlpcd186 docker start BP_RCAPI_186_7021
        pause
}

nine(){
        echo "Docker container status..."
        ssh prdlpcd181 docker ps|grep BP_RCAPI_181_7021
        ssh prdlpcd182 docker ps|grep BP_RCAPI_182_7021
        ssh prdlpcd183 docker ps|grep BP_RCAPI_183_7021
        ssh prdlpcd184 docker ps|grep BP_RCAPI_184_7021
        ssh prdlpcd185 docker ps|grep BP_RCAPI_185_7021
        ssh prdlpcd186 docker ps|grep BP_RCAPI_186_7021
        pause
}



while true
do

        show_menus
        read_options
done

# josemedeirosdealmeida@gmail.com
# Jose Almeida
