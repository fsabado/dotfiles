# DDClient for Google Domains on CentOS7

# Installation

sudo yum -y install ddclient perl-IO-Socket-SSL

/etc/ddclient.conf
```bash
daemon=3600				# check every 1 hour
ssl=yes					# use ssl-support.  Works with
##
## Google Domains (www.google.com/domains)
##
protocol=googledomains,
login=<LOGIN>
password=<PASSWORD>
# Use web to get the external ip, not the router IP
use=web,web=checkip.dyndns.com
#my.domain.tld, otherhost.domain.tld
<DOMAIN>
```

Instructions:
* protocol is set by your dynamic DNS provider. For namecheap the value is "namecheap"
* server is the hostname of the dynamic DNS server. The dynamic DNS servers used by namecheap are located at "dynamicdns.park-your-domain.com"
* login is your domain name
* password is the string we obtained earlier from the namecheap web interface. Leave the single quotation marks around the string.
* The last line is the subdomain to be modified. In my case this was backup, for backup.samhobbs.co.uk.
If you wanted to update your root domain, you would put an @ symbol on this line instead


# Debugging/Checking

```bash
# Check WAN IP
sudo ddclient -query

# Check if connection works
sudo ddclient -debug -verbose -noquiet
# SUCCESS:  updating backup: good: IP address set to 1.2.3.4
# CONNECT:  dynamicdns.park-your-domain.com
# CONNECTED:  using SSL
```


#Run daemon and update every 1 hour
/etc/default/ddclient
```bash
run_ipup="false"
run_daemon="true"
daemon_interval="3600"

sudo systemctl enable ddclient && sudo systemctl start ddclient && sudo systemctl status ddclient

```

Force update every 1 hour and append to the log
```bash
#log in as root
sudo su -
crontab -e
# ddclient update
# Place in /etc/cron.d or copy the command using crontab -e for normal users
# Run update every hour
* 1 * * * /usr/sbin/ddclient -verbose -force >> /var/log/ddclient_updates.out 2>&1

#OR
sudo su -
cp ./ddclient.cron /etc/cron.d
```

# Check Google Domains such that the ip is updated on synthetic records


# References
* https://blog.toloughlin.com/?p=478
* https://samhobbs.co.uk/2015/01/dynamic-dns-ddclient-raspberry-pi-and-ubuntu
* https://github.com/rharmonson/richtech/wiki/Dynamic-DNS-Client-using-ddclient-on-CentOS-7
