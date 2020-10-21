# set the number of second to sleep between each try
$sleep_sec = 5

# set the maximum number of tries
$max_try = 100

$cur_try_num = 0

do{
	write-host "Try number: $cur_try_num"
	
	$res = # Copy the web request in here, use devloper tools (copy as poweshell)
	
	# Request example
	# $(Invoke-WebRequest 
	#	-Uri "https://govforms.gov.il/MW/Process/Data/" 
	#	-Method "POST" 
	#	-Headers @{
	#		"Accept"="application/json, text/javascript, */*; q=0.01"; 
	#		"Sec-Fetch-Dest"="empty"; "X-Requested-With"="XMLHttpRequest"; 
	#		"User-Agent"="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36"; 
	#		"Origin"="https://govforms.gov.il"; 
	#		"Sec-Fetch-Site"="same-origin"; "Sec-Fetch-Mode"="cors"; 
	#		"Referer"="https://govforms.gov.il/mw/forms/JobRegistration@taasuka.gov.il"; 
	#		"Accept-Encoding"="gzip, deflate, br"; "Accept-Language"="en-US,en;q=0.9"; 
	#		"Cookie"="Cookie data was removed because it contains personal details..."
	#	} -ContentType "application/json" -Body ([System.Text.Encoding]::UTF8.GetBytes("Personal data goes in here..."))).statuscode

	write-host "Response code: $res"
	
	if($res -eq 200){
		write-host "Success :)"
		break
	}
	else {
		write-host "Retry in $sleep_sec sec..."
		sleep $sleep_sec
		$cur_try_num++ 
	}
}
while ($cur_try_num -le $max_try)