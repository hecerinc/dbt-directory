#!/bin/bash

for i in $(seq 200) # there's 60 pages when I did this, but I didn't know that beforehand
do
	pageindex=$(printf "%02d" $i)
	echo "Fetching page $pageindex"
	curl -s -o "page_$pageindex.html" -L "https://behavioraltech.org/resources/find-a-therapist-app/page/$i/"  \
	 -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0'  \
	 -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8'  \
	 -H 'Accept-Language: en-US,en;q=0.5'  \
	 -H 'Accept-Encoding: gzip, deflate, br'  \
	 -H 'DNT: 1'  \
	 -H 'Connection: keep-alive'  \
	 -H 'Cookie: yourcookie'  \
	 -H 'Upgrade-Insecure-Requests: 1'  \
	 -H 'Sec-Fetch-Dest: document'  \
	 -H 'Sec-Fetch-Mode: navigate'  \
	 -H 'Sec-Fetch-Site: cross-site'  \
	 -H 'Sec-GPC: 1'  \
	 -H 'Pragma: no-cache'  \
	 -H 'Cache-Control: no-cache' --compressed
 size=$(wc -c < "page_$pageindex.html")
 echo $size # this is so I can know when to Ctrl+C out of it
 sleep 1 # be polite
done
