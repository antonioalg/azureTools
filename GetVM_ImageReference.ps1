### First, you need to do "az login" to be authenticated

### Read subscriptions from Azure.
$subscriptions = az account list | ConvertFrom-Json
foreach($subscription in $subscriptions){
    $groups = az group list --subscription $subscription.id | ConvertFrom-Json
    foreach($group in $groups){
        $vms = az vm list --resource-group $group.name --subscription $subscription | ConvertFrom-Json
        foreach($vm in $vms){
            az vm show --resource-group $group.name --name $vm.name --subscription $subscription --query '{id:id,resourceGroup:resourceGroup,name:name,imageReference:storageProfile.imageReference}' --output json | Out-File -Append -FilePath VM_imageReference_export.txt
        }
    }
}

### Read subscriptions from subscriptions.txt file.
# foreach($subscription in Get-Content .\subscriptions.txt){
#     $groups = az group list --subscription $subscription | ConvertFrom-Json
#     foreach($group in $groups){
#         $vms = az vm list --resource-group $group.name --subscription $subscription | ConvertFrom-Json
#         foreach($vm in $vms){
#             az vm show --resource-group $group.name --name $vm.name --subscription $subscription --query '{id:id,resourceGroup:resourceGroup,name:name,imageReference:storageProfile.imageReference}' --output json | Out-File -Append -FilePath VM_imageReference_export.txt
#         }
#     }
# }
