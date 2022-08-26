#This script takes the last log entry, extracts numeric values at fields 17 and 11, calculates ratio, compares the ratio to the border value and writes WARN or INFO line (with the time stamp) to a new log
#Initial log line example: [3/16/22 9:36:27:815 GMT-03:00] 00000901 SystemOut     O USO-SHORT selectPedidosConDetalleAsoc getPedidos. Resp: 7 MemSTART: 186,580,904 MemEnd: 187,498,416 Tiempo: 4.499
#Output written to a new log example:[WARN] 2022.08.26-08.43.39: 64.2714 
 
#!/bin/bash

current_time=$(date "+%Y.%m.%d-%H.%M.%S")
ratio=$(tail -1 <path to a log file with data> | awk '{print 100 * $17 / $11}')
alertBorderValue=50
result=$(echo "${ratio}>${alertBorderValue}" | bc)

if [ $result = 1 ]; then
	echo "[WARN]" $current_time": "$ratio >> <path to a new log file were ratio and WARN/INFO is written>
else
	echo "[INFO]" $current_time": "$ratio >> <path to a new log file were ratio and WARN/INFO is written>
fi
