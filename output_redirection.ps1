
#redirect error and console to one and output



Connect-F5 -ip 10.219.1.183 2>&1 | Out-String -Stream | foreach-object {
            $txtoutput.lines = $txtoutput.lines + $_
            $txtoutput.Select($txtoutput.Text.Length, 0)
            $txtoutput.ScrollToCaret()
            $form.Update()}