# Get Info for Inventar:

we use GREP to get INFO for:

* Hosts
* Screens
* Beamers

from dhcpd.conf

Get dhcpd.conf from github.com:

>> git clone https://github.com/edvapp/dhcp.git

>> cd dhcp

grep ... 


## List all hosts:

host - lines look like:
	host r003pc50 { hardware ethernet 44:37:E6:70:7E:DB; fixed-address 10.0.3.50; }  # Leno_M91pS-312002706817/Dell_P221HD-400001835182//Opto_WL350t-400000786037
so 

>>  grep  -E '^[[:space:]]+host r[[:digit:]]{3}pc[[:digit:]]{2}' dhcpd.conf

will list all host entries with: beginning spaces, host rDDDpcDD (with D = Digit) 

## List all Screens:

>> grep / dhcpd.conf

## List all Beamers:

>> grep // dhcpd.conf

