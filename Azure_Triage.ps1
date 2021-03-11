Write-Host 'TRIAJE MICROSOFT AZURE:'
Write-Host '1) Export Azure Resource Timeline'
Write-Host '2) Export Azure VM Image Reference'
Write-Host '3) Export Azure VM Status'
Write-Host '4) Export Azure IP address'
Write-Host '0) Exit'

$option = Read-Host 'Option: '
switch ( $option )
{
    0 {
        Exit
    }

    1 {
        foreach($subscription in Get-Content .\Subscriptions.txt){
               az resource list --subscription $subscription --output tsv --query '[].[id, location, resourceGroup, name, type, provisioningState, changedTime, createdTime]' | Out-File -Append -FilePath .\AZ_Resource_Timeline.tsv
            }
    }

    2 {
        foreach($subscription in Get-Content .\Subscriptions.txt){
            $groups = az group list --subscription $subscription.id | ConvertFrom-Json
            foreach($group in $groups){
                $vms = az vm list --resource-group $group.name --subscription $subscription | ConvertFrom-Json
                foreach($vm in $vms){
                    az vm show --resource-group $group.name --name $vm.name --subscription $subscription --query '{id:id,resourceGroup:resourceGroup,name:name,imageReference:storageProfile.imageReference}' --output tsv | Out-File -Append -FilePath AZ_VM_ImageReference.tsv
                }
            }
        }
    }

    3 {
        foreach($subscription in Get-Content .\Subscriptions.txt){
            az vm list --subscription $subscription --query '[].[id, resourceGroup, name, powerState]' --show-details --output tsv | Out-File -Append -FilePath AZ_VM_Status.tsv
        }
    }

    4 {
        foreach($subscription in Get-Content .\Subscriptions.txt){
            az network public-ip list --subscription $subscription --output table --output tsv | Out-File -Append -FilePath AZ_IP_Address.tsv
        }
    }

    default {
        Write-Host 'Not valid option selected.'
    }
}