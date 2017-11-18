$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$testadmin = $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
if ($testadmin -eq $false) {
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
exit $LASTEXITCODE
}

  Write-Host ""
             Write-Host "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
             Write-Host ""
             Write-Host "                      Connect-Monitor                         "
             Write-Host "                          @Anis.A                             "
             Write-Host ""
             Write-Host "-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-"
             Write-Host ""
             Write-Host ""


        
            
            
                        $pTitle = ""
                        Write-Host ""
                        Write-Host "What type of connection do you want to display?"
                        Write-Host ""  
                        Write-Host "             1. Established  "
                        Write-Host "             2. Listening    "
                        Write-Host ""
                        $pMsg = ""
                       

                        $p1 = New-Object System.Management.Automation.Host.ChoiceDescription "&1", `
                              "Displays Established connections"

                        $p2 = New-Object System.Management.Automation.Host.ChoiceDescription "&2", `
                              "Displays Listening connections"

                        $pOptions = [System.Management.Automation.Host.ChoiceDescription[]]($p1, $p2)

                        $pResult = $host.ui.PromptForChoice($pTitle, $pMsg, $pOptions, 0) 
                        
                         
                        switch ($pResult){
                                      
                                       
                               0 {     # Established Connections
                                                   #$estaPort=0

                                       do{   ""
                                              "Do you want to display all Established connections or in a specified Port?"
                                                Write-Host ""
                                                #cls
                                                ""
                                                Write-Host "1. Displays all Established connections"
                                                ""
                                                Write-Host "2. Displays all Established connections on a specified port"
                                                ""
                                                Write-Host "x. Exit (press x to exit)"
                                                ""
                                                $estaPort = Read-Host "->"
                                                                 
                                                 switch ($estaPort){
                                                            
                                                             1 {
                                                                   netstat -aon |findstr "ESTABLISHED"
                                                                   ""
                                                                   "Columns : Proto / Local Address / Foreign Address / State / PID"
                                                                   ""
                                                                   pause
                                                               }

                                                             2 {        
                                                                  $numPort =1  
                                                                      
                                                                  Do {   
                                                                          $numPort = Read-Host "Enter the Port Number"
                                                                          netstat -aon |findstr "ESTABLISHED" |findstr ":$numPort"
                                                                          ""
                                                                          "Columns : Proto / Local Address / Foreign Address / State / PID"
                                                                        
                                                                          ""
                                                                          "Enter x to cancel"
                                                                          ""
                                                                          
                                                                      } While ($numPort -ne "x")             
                                                               } #end of inner 2 
                                                       
                                                   } #end of switch 

                                           } while ($estaPort -ne "x") #end of do          
                                      
                                   } #end of outer 0             
                                                    

                                                    
                                 1 {     # Listening Connections


                                         do{
                                               ""  
                                               "Do you want to display all Listening connections or in a specified Port?"
                                                Write-Host ""
                                                Write-Host "1. Displays all Listening connections"
                                                ""
                                                Write-Host "2. Displays all Listening connections on a specified port"
                                                ""
                                                Write-Host "x. Exit (press x to exit)"
                                                ""
                                                $listPort = Read-Host "->"
                                                                 
                                                 switch ($listPort){
                                                    
                                                         1 {
                                                           
                                                              netstat -aon |findstr "LISTENING"
                                                              ""
                                                              "Columns : Proto / Local Address / Foreign Address / State / PID"
                                                              ""
                                                              pause
                                                           }

                                                         2 {
                                                              $numPort =0
                                                             
                                                              Do {   
                                                                     $numPort = Read-Host "Enter the Port Number"
                                                                     netstat -aon |findstr "LISTENING" |findstr ":$numPort"
                                                                     ""
                                                                     "Columns : Proto / Local Address / Foreign Address / State / PID"
                                                                     ""
                                                                     "Enter X to cancel"
                                                                      ""
                                                                  } While ($numPort -ne "x") 
                                                            }#end of inner 2
                                                       
                                                  }# end of switch

                                             } while ($listPort -ne "x")
        
                                    }# end of outer 1
                                               
                         }# end of global switch

                         pause
