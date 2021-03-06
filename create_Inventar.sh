#!/bin/bash

########################################
### HOWTO                            ###
########################################
#
# call script with COMMAND & OPTION
#
# e.g.: 
# ./create_Inventar.sh -c laptops
#
# counts all laptops
#
# ./create_Inventar.sh -csv hosts
#
# create a csv File with host - information in columns
#
#
# COMANDS: -l (list)
#          -csv (create csv - File)
#
#          -c (count)
#
# OPTIONS:
#          hosts
#          laptops
#          printers
#          wlans
#          screens
#          beamers
#
# additional OPTIONS: -c
#          hosts_for_pupils
#
########################################

## get options from command line
COMMAND=$1
OPTION=$2


case ${COMMAND} in

        -l)
                case ${OPTION} in
                        hosts)
                                ## List all host with beginning spaces, host rDDDpcDD (D = Digit)
                                grep -E '^[[:space:]]+host r[[:digit:]]{3}pc[[:digit:]]{2}' dhcpd.conf
                        ;;
                        laptops)
                                grep -E '^[[:space:]]+host r[[:digit:]]{3}lt[[:digit:]]{2}' dhcpd.conf
                        ;;
                        printers)
                                grep -E '^[[:space:]]+host r[[:digit:]]{3}pr[[:digit:]]{2}' dhcpd.conf
                        ;;
                        wlans)
                                grep -E '^[[:space:]]+host r[[:digit:]]{3}wl[[:digit:]]{2}' dhcpd.conf
                        ;;
                        screens)
                                grep / dhcpd.conf
                        ;;
                        beamers)
                                grep // dhcpd.conf
                        ;;

                esac
        ;;
        -csv)
                case ${OPTION} in
                        hosts)
                                grep -E '^[[:space:]]+host r[[:digit:]]{3}pc[[:digit:]]{2}' dhcpd.conf | awk '{ print $2 ";" $11 }' > hosts.csv
                                # replace / and // with ;
                                sed 's/\/\//;/' -i hosts.csv
                                sed 's/\//;/' -i hosts.csv
                        ;;
                        laptops)
                                grep -E '^[[:space:]]+host r[[:digit:]]{3}lt[[:digit:]]{2}' dhcpd.conf | awk '{ print $2 ";" $11 }' > laptops.csv
                                # replace / and // with ;
                                sed 's/\/\//;/' -i laptops.csv
                                sed 's/\//;/' -i laptops.csv
                        ;;
                        printers)
                                grep -E '^[[:space:]]+host r[[:digit:]]{3}pr[[:digit:]]{2}' dhcpd.conf | awk '{ print $2 ";" $11 }' > printers.csv
                        ;;
                        wlans)
                                grep -E '^[[:space:]]+host r[[:digit:]]{3}wl[[:digit:]]{2}' dhcpd.conf | awk '{ print $2 ";" $11 }' > wlans.csv
                        ;;
                        screens)
                                grep / dhcpd.conf | awk '{ print $2 ";" $11 }' > screens.csv
                                # replace / and // with ;
                                sed 's/\/\//;/' -i screens.csv
                                sed 's/\//;/' -i screens.csv

                        ;;
                        beamers)
                                grep // dhcpd.conf | awk '{ print $2 ";" $11 }' > beamers.csv
                                # replace / and // with ;
                                sed 's/\/\//;/' -i beamers.csv
                                sed 's/\//;/' -i beamers.csv

                        ;;
                esac
        ;;
        -c)
                case ${OPTION} in
                        hosts)
                                ## List all host with beginning spaces, host rDDDpcDD (D = Digit)
                                ALL_HOSTS=$(grep -c -E '^[[:space:]]+host r[[:digit:]]{3}pc[[:digit:]]{2}' dhcpd.conf)
                                echo "ALL HOSTS: ${ALL_HOSTS}"

                                DUMMY_HOSTS=$(grep -c dumm_yPCPC dhcpd.conf)
                                echo "DUMMY HOSTS: ${DUMMY_HOSTS}"

                                TEST_HOSTS=$(grep -c r09 dhcpd.conf)
                                echo "TEST HOSTS: ${TEST_HOSTS}"

                                RASPIS=$(grep -c -E '^[[:space:]]+host stupla[[:digit:]]{2}' dhcpd.conf)
                                echo "RASPIS: ${RASPIS}"

                                EXISTING_HOSTS=$((${ALL_HOSTS}-${DUMMY_HOSTS}-${TEST_HOSTS}+${RASPIS}))
                                echo "EXISTING_HOST = ALL_HOSTS - DUMMY_HOSTS - TEST_HOSTS + RASPIS"
                                echo "EXISTING_HOSTS : ${EXISTING_HOSTS}"
                        ;;
                        hosts_for_pupils)
                                ## List all host with beginning spaces, host rDDDpcDD (D = Digit)
                                ALL_HOSTS=$(grep -c -E '^[[:space:]]+host r[[:digit:]]{3}pc[[:digit:]]{2}' dhcpd.conf)
                                echo "ALL HOSTS: ${ALL_HOSTS}"

                                DUMMY_HOSTS=$(grep -c dumm_yPCPC dhcpd.conf)
                                echo "DUMMY HOSTS: ${DUMMY_HOSTS}"

                                TEST_HOSTS=$(grep -c r09 dhcpd.conf)
                                echo "TEST HOSTS: ${TEST_HOSTS}"

                                RASPIS=$(grep -c -E '^[[:space:]]+host stupla[[:digit:]]{2}' dhcpd.conf)
                                echo "RASPIS: ${RASPIS}"
                                
                                R002=$(grep -c r002pc dhcpd.conf)
                                echo "R002: ${R002}"
                                
                                KONFZI_BRG=$(grep -c r107pc dhcpd.conf)
                                echo "KONFZI_BRG: ${KONFZI_BRG}"
                                
                                KONFZI_GFB=$(grep -c r115pc dhcpd.conf)
                                echo "KONFZI_GFB: ${KONFZI_GFB}"
                                
                                GWK=$(grep -c r216pc dhcpd.conf)
                                echo "GWK: ${GWK}"

                                EXISTING_HOSTS=$((${ALL_HOSTS}-${DUMMY_HOSTS}-${TEST_HOSTS}-${RASPIS}-${R002}-${KONFZI_BRG}-${KONFZI_GFB}-${GWK}))
                                echo "EXISTING_HOST = ALL_HOSTS - DUMMY_HOSTS - TEST_HOSTS - RASPIS - R002 - KONFZI_BRG - KONFZI_GFB - GWK"
                                echo "EXISTING_HOSTS : ${EXISTING_HOSTS}"

                        ;;
                        laptops)
                                LAPTOPS=$(grep -c -E '^[[:space:]]+host r[[:digit:]]{3}lt[[:digit:]]{2}' dhcpd.conf)
                                echo "LAPTOPS: ${LAPTOPS}"
                        ;;
                        printers)
                                PRINTERS=$(grep -c -E '^[[:space:]]+host r[[:digit:]]{3}pr[[:digit:]]{2}' dhcpd.conf)
                                echo "PRINTERS: ${PRINTERS}"
                         ;;
                        wlans)
                                WLANS=$(grep -c -E '^[[:space:]]+host r[[:digit:]]{3}wl[[:digit:]]{2}' dhcpd.conf)
                                echo "WLANS: ${WLANS}"
                         ;;
                        screens)
                                SCREENS=$(grep -c / dhcpd.conf)
                                echo "SCREENS: ${SCREENS}"
                        ;;
                        beamers)
                                BEAMERS=$(grep -c // dhcpd.conf)
                                echo "BEAMERS: ${BEAMERS}"
                        ;;

                esac
        ;;
esac


