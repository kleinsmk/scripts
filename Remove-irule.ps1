$rule = Get-iRule -Name /Common/WSA_https

#split into lines for grepping
$def = $rule.Definition -split "`n"

#grep the url matching line by using the virtual server name
$removalSet = $def | select-string "virtual genisis20"

#cuts text based on regex match
#$rule.Definition -replace "`"genisis20.boozallencsn.com`" { virtual genisis20_https }" -replace

#remove each string in list
$removalSet | foreach { $def = $def -replace $_ }


#add ina new irule the last line of the irule
$def -replace "}`n}", "`t`"somewebsite.com`" { virtual virtulName }`n`t}`n}"

#rejoin as single string for uploading might not be needed.
 $single =$def -join "`n"