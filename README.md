# azureTools
Tools and scripts for Azure

**Azure_Triage.ps1**

Instructions: You need to do "az login" to be authenticated from PowerShell window and then execute script there. You need a Subscriptions.txt file on execution folder with a list of ID subscriptions.

Output:
AZ_Resource_Timeline.tsv. A TSV file with the list of resources id, location, resourceGroup, name, type, provisioningState, changedTime and createdTime.
AZ_VM_ImageReference.tsv. A TSV file with the list of id, resourceGroup, name and storageProfile.imageReference.
AZ_VM_Status.tsv. A TSV file with the list of VM and power state.
AZ_IP_Address.tsv. A TSV file with the list of IP address and type.

**GetVM_ImageReference.ps1**

Script that queries for each subscription that the user can view and for each resource group within those subscriptions, the storageProfile.imageReference property of each VM.

Instructions: You need to do "az login" to be authenticated from PowerShell window and then execute script there. 

Output: VM_imageReference_export.txt file on directory where script is executed.
