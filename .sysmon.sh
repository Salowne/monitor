#!/usr/bin/bash
#
# [Github] www.github.com/Xdwnff-04x
# [Telegram - Channel] t.me/joinchat/AAAAAEANZwsT9F2Y-aBVIQ
# 
# [License]
#   Licensed under the Apache License, Version 2.0 (the "License"); you may
#   not use this file except in compliance with the License. You may obtain
#   a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#   WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#   License for the specific language governing permissions and limitations
#   under the License.
author='Zwdeff'
version='0.1'

# Colores 
n0='\033[90m'
n1='\033[91m'
n2='\033[92m'
n3='\033[93m'
n4='\033[94m'
n5='\033[95m'
n6='\033[96m'
n7='\033[97m'

u1='\033[31m'
u2='\033[32m'
u3='\033[33m'
u4='\033[34m'
u5='\033[35m'
u6='\033[36m'
u0='\033[m'

# Banner
Banner(){
echo -e $n2'
   ___ _   _ ___ _ __ ___   ___  _ __
  / __| | | / __|  _   _ \ / _ \|  _ \
 _\__ \ |_| \__ \ | | | | | (_) | | | |
(_)___/\__  |___/_| |_| |_|\___/|_| |_|
       |___/'$u0
       }
Banner

# Casa
casa(){
echo -e $u2'Monitor_Do_Sistema _\n'$u0
echo -e $n2'Author:' $author $u0
echo -e $n2'Version:' $version $u0 '\n'
}
casa

OS=`uname -s`
REV=`uname -r`
MACH=`uname -m`

if [ $OS = 'SunOS' ]; then
   OS=Solaris
   ARCH=`uname -p`
   OSSTR="${OS} ${REV} (${ARCH} `uname -v`)"
fi
if [ $OS = 'AIX' ]; then
   OSSTR="${OS} `oslevel` (`oslevel -r`)"
fi
if [ $OS = 'Linux' ]; then
   KERNEL=`uname -r`
   if [ -f /etc/redhat-releas ]; then
      DIST='RedHat'
      PSUEDONAME=`cat /etc/redhat-release | sed s/.*\(// | sed s/\)//`
      REV=`cat /etc/redhat-release | sed s/.*release\ // | sed s/\ .*//`
   fi
   if [ -f /etc/SuSE-release ]; then
      DIST=`cat /etc/SuSE-release | tr "\n" ' '| sed s/VERSION.*//`
      REV=`cat /etc/SuSE-release | tr "\n" ' ' | sed s/.*=\ //`
   fi
   if [ -f /etc/mandrake-release ]; then
       DIST=`Mandrake`
       PSUEDONAME=`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`
       REV=`cat /etc/mandrake-release | sed s/.*release\ // | sed s/\ .*//`
   fi
   if [ -f /etc/os-release ]; then
      DIST=`awk -F "PRETTY_NAME=" '{print $2}' /etc/os-release | tr -d '\n"'`
   fi
   if [ -f /etc/debian_version ]; then
      DIST="Debian `cat /etc/debian_version`"
      REV=''
   fi
   if ${OSSTR} [ -f /etc/UnitedLinux-release ]; then
      DIST="${DIST}[`cat /etc/UnitedLinux-release | tr "\n" ' ' | sed s/VERSION.*//`]"
   fi
   OSSTR="${OS} ${DIST} ${REV}(${PSUEDONAME}${MACH})"
   echo -e $u2'Versao do OS:'$n2 $OSSTR $u0
fi
echo -e $u2'Modelo:'$n2 $(cat /proc/cpuinfo |grep "model name" |uniq |awk -F : {'print $2'}) $u0
if [ -f /etc/debian_version ]; then
   echo -e $u2'Versao Debian:'$n2 $(cat /etc/debian_version) $u0
fi
echo -e $u2'Arquitetura:'$n2 $(uname -m) $u0
echo -e $u2'Kernel:'$n2 $(uname -r) $u0
echo -e $u2'Servidor DNS:'$n2 $(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}') $u0
echo -e $u2'HostName:'$n2 $(hostname) $u0
echo -e $u2'IP Interno:'$n2 $(hostname -i) $u0
echo -e $u2'IP Externo:'$n2 $(hostname -I) $u0
echo -e $u2'Memoria Ram' $u0
echo -e $u2'Total:'$n2 $(free -h |grep -i mem |awk {'print $2'}) $u0
echo -e $u2'Usada:'$n2 $(free -h |grep -i mem |awk {'print $3'}) $u0
echo -e $u2'Livre:'$n2 $(free -h |grep -i mem |awk {'print $4'}) $u0
echo -e $u2'Swap ..' $u0
echo -e $u2'Total:'$n2 $(free -h |grep -i swap |awk {'print $2'}) $u0
echo -e $u2'Usada:'$n2 $(free -h |grep -i swap |awk {'print $3'}) $u0
echo -e $u2'Livre:'$n2 $(free -h |grep -i swap |awk {'print $4'}) $u0

carga=(`top -n 1 -b | grep 'load average:' | awk '{print $12 $13 $14}'`)
echo -e $u2'Carga Media:'$n2 $carga $u0
echo -e $u2'Tempo de Atividade:'$n2 $(uptime | awk '{print $3,$4}' | cut -f1 -d,) $u0