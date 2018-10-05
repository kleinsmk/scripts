<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>





Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#region begin GUI{ 

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '757,394'
$Form.text                       = "Core Services VCD Deploy"
$Form.TopMost                    = $false

$Panel1                          = New-Object system.Windows.Forms.Panel
$Panel1.height                   = 250
$Panel1.width                    = 691
$Panel1.location                 = New-Object System.Drawing.Point(23,7)

$lbldns                          = New-Object system.Windows.Forms.Label
$lbldns.text                     = "DNS:"
$lbldns.AutoSize                 = $true
$lbldns.width                    = 25
$lbldns.height                   = 10
$lbldns.location                 = New-Object System.Drawing.Point(38,22)
$lbldns.Font                     = 'Microsoft Sans Serif,10,style=Bold'
$lbldns.ForeColor                = "#000000"

$lblnodeip                       = New-Object system.Windows.Forms.Label
$lblnodeip.text                  = "Node IP:"
$lblnodeip.AutoSize              = $true
$lblnodeip.width                 = 25
$lblnodeip.height                = 10
$lblnodeip.location              = New-Object System.Drawing.Point(30,74)
$lblnodeip.Font                  = 'Microsoft Sans Serif,10,style=Bold'

$lblport                         = New-Object system.Windows.Forms.Label
$lblport.text                    = "Node Port:"
$lblport.AutoSize                = $true
$lblport.width                   = 25
$lblport.height                  = 10
$lblport.location                = New-Object System.Drawing.Point(231,72)
$lblport.Font                    = 'Microsoft Sans Serif,10,style=Bold'

$lblvsport                       = New-Object system.Windows.Forms.Label
$lblvsport.text                  = "Virtual Server Port:"
$lblvsport.AutoSize              = $true
$lblvsport.width                 = 25
$lblvsport.height                = 10
$lblvsport.location              = New-Object System.Drawing.Point(280,119)
$lblvsport.Font                  = 'Microsoft Sans Serif,10,style=Bold'

$lblvsip                         = New-Object system.Windows.Forms.Label
$lblvsip.text                    = "Virtual Server IP:"
$lblvsip.AutoSize                = $true
$lblvsip.width                   = 25
$lblvsip.height                  = 10
$lblvsip.location                = New-Object System.Drawing.Point(31,121)
$lblvsip.Font                    = 'Microsoft Sans Serif,10,style=Bold'

$chckSSL                         = New-Object system.Windows.Forms.CheckBox
$chckSSL.text                    = "SSL"
$chckSSL.AutoSize                = $false
$chckSSL.width                   = 95
$chckSSL.height                  = 20
$chckSSL.location                = New-Object System.Drawing.Point(580,121)
$chckSSL.Font                    = 'Microsoft Sans Serif,10,style=Bold'
$chckSSL.TabIndex                = 5

$txtdns                          = New-Object system.Windows.Forms.TextBox
$txtdns.multiline                = $false
$txtdns.width                    = 252
$txtdns.height                   = 20
$txtdns.location                 = New-Object System.Drawing.Point(93,20)
$txtdns.Font                     = 'Microsoft Sans Serif,10'
$txtdns.TabIndex                 = 0

$txtnodeip                       = New-Object system.Windows.Forms.TextBox
$txtnodeip.multiline             = $false
$txtnodeip.width                 = 100
$txtnodeip.height                = 20
$txtnodeip.location              = New-Object System.Drawing.Point(115,73)
$txtnodeip.Font                  = 'Microsoft Sans Serif,10'
$txtnodeip.TabIndex              = 1

$txtnodeport                     = New-Object system.Windows.Forms.TextBox
$txtnodeport.multiline           = $false
$txtnodeport.width               = 100
$txtnodeport.height              = 20
$txtnodeport.location            = New-Object System.Drawing.Point(326,73)
$txtnodeport.Font                = 'Microsoft Sans Serif,10'
$txtnodeport.TabIndex            = 2

$txtvsip                         = New-Object system.Windows.Forms.TextBox
$txtvsip.multiline               = $false
$txtvsip.width                   = 100
$txtvsip.height                  = 20
$txtvsip.location                = New-Object System.Drawing.Point(153,116)
$txtvsip.Font                    = 'Microsoft Sans Serif,10'
$txtvsip.TabIndex                = 3

$txtvsport                       = New-Object system.Windows.Forms.TextBox
$txtvsport.multiline             = $false
$txtvsport.width                 = 100
$txtvsport.height                = 20
$txtvsport.location              = New-Object System.Drawing.Point(420,115)
$txtvsport.Font                  = 'Microsoft Sans Serif,10'
$txtvsport.TabIndex              = 4

$btnconnect                      = New-Object system.Windows.Forms.Button
$btnconnect.text                 = "Connect"
$btnconnect.width                = 132
$btnconnect.height               = 38
$btnconnect.location             = New-Object System.Drawing.Point(23,180)
$btnconnect.Font                 = 'Microsoft Sans Serif,10'
$btnconnect.TabIndex             = 6

$btndeploy                       = New-Object system.Windows.Forms.Button
$btndeploy.text                  = "Deploy"
$btndeploy.width                 = 132
$btndeploy.height                = 36
$btndeploy.location              = New-Object System.Drawing.Point(164,179)
$btndeploy.Font                  = 'Microsoft Sans Serif,10'
$btnconnect.TabIndex             = 7

$txtoutput                       = New-Object system.Windows.Forms.TextBox
$txtoutput.multiline             = $true
$txtoutput.width                 = 686
$txtoutput.height                = 111
$txtoutput.location              = New-Object System.Drawing.Point(25,272)
$txtoutput.Font                  = 'Microsoft Sans Serif,10'
$txtoutput.ScrollBars            = "Vertical"

$lblconnect                      = New-Object system.Windows.Forms.Label
$lblconnect.text                 = "Connection Status: Not Connected!"
$lblconnect.AutoSize             = $true
$lblconnect.width                = 25
$lblconnect.height               = 10
$lblconnect.location             = New-Object System.Drawing.Point(26,230)
$lblconnect.Font                 = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($Panel1,$txtoutput))
$Panel1.controls.AddRange(@($lbldns,$lblnodeip,$lblport,$lblvsport,$lblvsip,$chckSSL,$txtdns,$txtnodeip,$txtvsport,$txtvsip,$txtnodeport,$btnconnect,$btndeploy,$lblconnect))

#region function declarations

function connect {

    try {

         Connect-F5 -ip 10.219.1.183 -ErrorAction Stop
         $lblconnect.text = "Connection Status: Connected."
    }

    catch {
        
        $txtoutput.Lines = $txtoutput.Lines + $_.Exception.Message  
        $lblconnect.text = "Connection Status: There was an Error while Connecting!"
    }

    
    
}

function deploy {

    $dns = $txtdns.Text
    $nodeip = $txtnodeip.text
    $nodeport =  $txtnodeport.text
    $vsip = $txtvsip.text
    $vsport = $txtnodeport.text
    
    if ($chckSSL.CheckState -eq "Checked"){

        $ssl = "true"
        $asa = "AWS_WSA_vs"
    }

    else{
        $ssl = "false"
        $asa = "AWS_WSA_redirect_vs"
    }

    try {
            
            New-VCD -dns $dns -nodeIP $nodeip -nodePort $nodeport -vsPort $vsport -vsIP $vsip -ssl $ssl -wsa AWS_WSA_vs 3>&1 | Out-String -Stream | foreach-object {
                            $txtoutput.lines = $txtoutput.lines + $_
                            $txtoutput.Select($txtoutput.Text.Length, 0)
                            $txtoutput.ScrollToCaret()
                            $form.Update()}
    }

    catch {
        Write-Host "catc"
        $_.exception
    }

}




#region gui events {
$btnconnect.Add_Click({ connect })
$btndeploy.Add_Click({ deploy })
#endregion events }

#endregion GUI }


#Write your logic code here

[void]$Form.ShowDialog()

