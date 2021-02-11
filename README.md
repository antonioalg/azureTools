# azureTools
Tools and scripts for Azure

**GetVM_ImageReference.ps1**

Script that queries for each subscription that the user can view and for each resource group within those subscriptions, the storageProfile.imageReference property of each VM.

Instructions: You need to do "az login" to be authenticated from PowerShell window and then execute script there. 

Output: VM_imageReference_export.txt file on directory where script is executed.
