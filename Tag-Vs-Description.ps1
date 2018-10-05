#taggs the pool description field to the description field of the parrent Virtual server

$vs = Get-VirtualServer

$vs | foreach {
        
        #check each VS for attached pools
        if ([string]::IsNullOrEmpty($_.pool)) {
           
        }

        else{
                $pool = Get-Pool -Name $_.pool 

                #make sure pool isn't deleted
                if ([string]::IsNullOrEmpty($pool)) {
                    Write-Host "No Pool Found for VS $($_.name)"
                }

                #Warn if pool description is empty
                else{
                   if ([string]::IsNullOrEmpty($pool.description)) {
                    Write-Host "Pool description is blank for pool $($pool.name)"
                     
                    } 
                    #set the pool name as the desc on the Virtual Server
                    else{ Write-host "setting $($pool.description) on $($_.name)"; Set-VirtualServer -Name $_.name -Description $pool.description }
                
                }
        }
}