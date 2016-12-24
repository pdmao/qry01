#!/bin/bash

dt2=`date +%s`
dt1=$((dt2 - 3600 * $1))
u="<user>"
p="<pass>"
h="<host>"


case $2 in

 "cnt")
  cmd=" count(*) as cnt "
   ;;

  "avg")
  cmd=" avg(value) as avg "
    ;;

  "min")
  cmd=" min(value) as min "
    ;;

  "max")
  cmd=" max(value) as max "
    ;;

esac


qry="select client, measure, object, $cmd  from mqtt.temps where epoch between $dt1  and $dt2 group by client, measure, object"

# echo " dt1: $dt1"
# echo " dt2: $dt2"
# echo " qry: $qry"


mysql --host=$h --user=$u --password=$p -e "$qry" --xml   2>/dev/null





