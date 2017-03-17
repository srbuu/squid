#!/bin/bash
clear
echo ""
# Criando chave publica e privada

tput setaf 2 ; tput bold ; echo "	SQUID: COM AUTENTICAÇÃO - Script By @MajinBoo " ; tput sgr0

echo "$(tput bold) ESCOLHA SUA DISTRIBUIÇÃO: $(tput sgr0)"

echo ""

echo "1. Ubuntu 14 e Debian"

echo "2. Ubuntu 16"

echo "3. CentOs 5, 6, 7"

echo "4. Sair do Script"

echo ""

echo -n "Qual a opção desejada? "

read opcao

case $opcao in

1)
clear
echo "" 

IP=$(wget -qO- ipv4.icanhazip.com) 
read -p "Confirme o IP do servidor: " -e -i $IP 


sleep 2
echo "$(tput bold) INSTALANDO E ATUALIZANDO PACOTES $(tput sgr0)" 
apt-get update -y 1>/dev/null 2>/dev/null 
apt-get install squid3 -y 1>/dev/null 2>/dev/null 
apt-get remove apache2 -y 1>/dev/null 2>/dev/null 
apt-get install apache2-utils -y 1>/dev/null 2>/dev/null 

mkdir /root/tmp 1>/dev/null 2>/dev/null 

rm -rf /etc/squid3/squid.conf 1>/dev/null 2>/dev/null 
rm -rf /etc/squid3/bdns 1>/dev/null 2>/dev/null 
rm -rf /etc/squid3/host 1>/dev/null 2>/dev/null 
sleep 2
echo "$(tput bold) CONFIGURANDO SQUID $(tput sgr0)" 

echo "" 
 
echo "Qual o nome para o Squid ?"
read nome

echo "#IP DA MAQUINA E NOME SQUID " >> /root/tmp/ip.conf
echo "acl ip dstdomain -i $IP" >> /root/tmp/ip.conf
echo "http_access allow ip" >> /root/tmp/ip.conf
echo "visible_hostname $nome" >> /root/tmp/ip.conf

wget -O /root/tmp/auth raw.githubusercontent.com/srbuu/squid/master/authdu 1>/dev/null 2>/dev/null 
wget -O /root/tmp/squid.conf raw.githubusercontent.com/srbuu/squid/master/acls 1>/dev/null 2>/dev/null 
wget -O /root/tmp/host raw.githubusercontent.com/srbuu/squid/master/host 1>/dev/null 2>/dev/null 

cat /root/tmp/ip.conf >> /etc/squid3/squid.conf
cat /root/tmp/auth >> /etc/squid3/squid.conf
cat /root/tmp/squid.conf >> /etc/squid3/squid.conf
cat /root/tmp/host >> /etc/squid3/host

rm -rf /root/tmp 1>/dev/null 2>/dev/null 

service squid3 start 1>/dev/null 2>/dev/null 

echo "" 
 
echo "Qual o nome do usuario do Squid com Autenticaçao?"
read nomesquid

htpasswd -c /etc/squid3/passwd $nomesquid

service squid3 restart 1>/dev/null 2>/dev/null 
service squid3 start 1>/dev/null 2>/dev/null 

echo "$(tput bold) USUARIO E SENHA SALVO COM SUCESSO $(tput sgr0)" 

sleep 2

echo "$(tput bold) SQUID CONFIGURADO COM SUCESSO. Script By @MajinBoo $(tput sgr0)"

;;

2)
clear
echo "" 

IP=$(wget -qO- ipv4.icanhazip.com) 
read -p "Confirme o IP do servidor: " -e -i $IP 


sleep 2
echo "$(tput bold) INSTALANDO E ATUALIZANDO PACOTES $(tput sgr0)" 
apt-get update -y 1>/dev/null 2>/dev/null 
apt-get install squid -y 1>/dev/null 2>/dev/null 
apt-get remove apache2 -y 1>/dev/null 2>/dev/null 
apt-get install apache2-utils -y 1>/dev/null 2>/dev/null 

mkdir /root/tmp 1>/dev/null 2>/dev/null 

rm -rf /etc/squid/squid.conf 1>/dev/null 2>/dev/null 
rm -rf /etc/squid/bdns 1>/dev/null 2>/dev/null 
rm -rf /etc/squid/host 1>/dev/null 2>/dev/null 

sleep 2
echo "$(tput bold) CONFIGURANDO SQUID $(tput sgr0)" 

echo "" 
 
echo "Qual o nome para o Squid ?"
read nome

echo "#IP DA MAQUINA E NOME SQUID " >> /root/tmp/ip.conf
echo "acl ip dstdomain -i $IP" >> /root/tmp/ip.conf
echo "http_access allow ip" >> /root/tmp/ip.conf
echo "visible_hostname $nome" >> /root/tmp/ip.conf

wget -O /root/tmp/auth raw.githubusercontent.com/srbuu/squid/master/authu 1>/dev/null 2>/dev/null 
wget -O /root/tmp/squid.conf raw.githubusercontent.com/srbuu/squid/master/acls 1>/dev/null 2>/dev/null 
wget -O /root/tmp/host raw.githubusercontent.com/srbuu/squid/master/host 1>/dev/null 2>/dev/null 

cat /root/tmp/ip.conf >> /etc/squid/squid.conf
cat /root/tmp/auth >> /etc/squid/squid.conf
cat /root/tmp/squid.conf >> /etc/squid/squid.conf
cat /root/tmp/host >> /etc/squid/squid.conf

rm -rf /root/tmp 1>/dev/null 2>/dev/null 

service squid start 1>/dev/null 2>/dev/null 

echo "" 
 
echo "Qual o nome do usuario do Squid com Autenticaçao?"
read nomesquid

htpasswd -c /etc/squid/passwd $nomesquid

service squid restart 1>/dev/null 2>/dev/null 
service squid start 1>/dev/null 2>/dev/null 

echo "$(tput bold) USUARIO E SENHA SALVO COM SUCESSO $(tput sgr0)" 

sleep 2

echo "$(tput bold) SQUID CONFIGURADO COM SUCESSO. Script By @MajinBoo $(tput sgr0)"

;;

3)
clear
echo "" 

IP=$(wget -qO- ipv4.icanhazip.com) 
read -p "Confirme o IP do servidor: " -e -i $IP 


sleep 2
echo "$(tput bold) INSTALANDO E ATUALIZANDO PACOTES $(tput sgr0)" 
yum update -y 1>/dev/null 2>/dev/null 
yum install squid -y 1>/dev/null 2>/dev/null 
yum install httpd-tools -y 1>/dev/null 2>/dev/null 

mkdir /root/tmp 1>/dev/null 2>/dev/null 

rm -rf /etc/squid/squid.conf 1>/dev/null 2>/dev/null 
rm -rf /etc/squid/bdns 1>/dev/null 2>/dev/null 
rm -rf /etc/squid/host 1>/dev/null 2>/dev/null 

sleep 2
echo "$(tput bold) CONFIGURANDO SQUID $(tput sgr0)" 

echo "" 
 
echo "Qual o nome para o Squid ?"
read nome

echo "#IP DA MAQUINA E NOME SQUID " >> /root/tmp/ip.conf
echo "acl ip dstdomain -i $IP" >> /root/tmp/ip.conf
echo "http_access allow ip" >> /root/tmp/ip.conf
echo "visible_hostname $nome" >> /root/tmp/ip.conf

wget -O /root/tmp/auth raw.githubusercontent.com/srbuu/squid/master/auth 1>/dev/null 2>/dev/null 
wget -O /root/tmp/squid.conf raw.githubusercontent.com/srbuu/squid/master/acls 1>/dev/null 2>/dev/null 
wget -O /root/tmp/host raw.githubusercontent.com/srbuu/squid/master/host 1>/dev/null 2>/dev/null 

cat /root/tmp/ip.conf >> /etc/squid/squid.conf
cat /root/tmp/auth >> /etc/squid/squid.conf
cat /root/tmp/squid.conf >> /etc/squid/squid.conf
cat /root/tmp/host >> /etc/squid/squid.conf

rm -rf /root/tmp 1>/dev/null 2>/dev/null 

systemctl enable squid.service 1>/dev/null 2>/dev/null 
systemctl start squid.service 1>/dev/null 2>/dev/null 

echo "" 
 
echo "Qual o nome do usuario do Squid com Autenticaçao?"
read nomesquid

htpasswd -c /etc/squid/passwd $nomesquid

systemctl restart squid.service 1>/dev/null 2>/dev/null 
systemctl start squid.service 1>/dev/null 2>/dev/null 

echo "$(tput bold) USUARIO E SENHA SALVO COM SUCESSO $(tput sgr0)" 

sleep 2

echo "$(tput bold) SQUID CONFIGURADO COM SUCESSO. Script By @MajinBoo $(tput sgr0)"


;;
4)
echo " Saindo do script..."
exit
;;
esac