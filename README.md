Script to to place Authentication by User and Password in the Squid distribution. 

apt-get install dos2unix -y

yum install dos2unix -y

wget -O /bin/squidauth http://raw.githubusercontent.com/srbuu/squid/master/squidauth

chmod +x /bin/squidauth

dos2unix /bin/squidauth

squidauth
