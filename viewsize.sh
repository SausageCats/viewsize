#!/bin/bash



kilo=1000
mega=1000000
giga=1000000000
size_total=0



cal_size () {
  size_b=$1
  size_k=$(($size_b/$kilo))
  size_m=$(($size_b/$mega))
  size_g=$(($size_b/$giga))
  str_b=$(printf '%16d' $size_b)
  [ $size_k -eq 0 ] && str_k='             ' || str_k=$(printf '%13d' $size_k)
  [ $size_m -eq 0 ] && str_m='          '    || str_m=$(printf '%10d' $size_m)
  [ $size_g -eq 0 ] && str_g='     '         || str_g=$(printf '%5d'  $size_g)
  size_total=$((size_total+size_b))
}



print_size () {
  echo -e "\e[${color_num}m$str_g $str_m $str_k $str_b   |   $name\e[m"
}



eachsize () {
  [ -e $1 ] || { echo -e "\e[31mErrName: $name\e[m"; return; }
  set -- $(du -sb $1)
  cal_size $1
  color_num=37 # white
  print_size
}



totalsize () {
  name=total
  cal_size $1
  color_num=31 # red
  print_size
}



#
# main
#
[ $# -eq 0 ] \
&& name_list=$(ls -1) \
|| name_list=$(for arg; do echo $arg; done)
name_list=$(echo "$name_list" | sed -e 's/\\/\\\\/g')

while read name; do
  eachsize $name
done < <(echo "$name_list")
totalsize $size_total



#
# test
#
#eachsize  1
#eachsize  123
#eachsize  12345
#eachsize  1234567
#eachsize  123456789
#eachsize  123456789123
#eachsize  1234567891234
#eachsize  12345678912345 # 12T
#totalsize $size_total
