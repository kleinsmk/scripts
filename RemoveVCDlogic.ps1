$pools = get-pool
$pools = $pools | where {$_.description -eq "AWS_188318455225"}
$pools | foreach {Remove-VirtualServer -Name $_.name}
$pools | foreach {Remove-Pool -Name $_.name}
$node | where {$_.name -like "*geni*"} | Remove-Node