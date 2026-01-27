#!/usr/bin/env bash
reg=$(ioreg -a -l -w 0 -r -c AppleSmartBattery)
max=$(echo $reg | plutil -extract 0.MaxCapacity raw -)
now=$(echo $reg | plutil -extract 0.CurrentCapacity raw -)
percent=$((now * 100 / max))
if [ "$percent" -le 10 ]; then
	color="#000000,bg=#bc4343"
elif [ "$percent" -le 30 ]; then
	color="#a87474"
elif [ "$percent" -le 60 ]; then
	color="#a89074"
else
	color="#85a874"
fi
echo "#[fg=$color]"$percent"%"
