#!/bin/sh
mute=`amixer get Master | grep "Front Left:" | awk '{print $6}'`
if [ $mute = "[on]" ]
then
  vol=`amixer get Master | grep "Front Left:" | awk '{print $5}' | tr -d '[]'`
  if [ $vol = "0%" ]
  then
    echo "Mute"
  else
    echo $vol
  fi
else
  echo "Mute"
fi
