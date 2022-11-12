<#How to find SKU:

- A Marketplace image in Azure has the following attributes:
    > Publisher
    > Offer
    > SKU
    > version

    WindowsServer / MicrosoftWindowsServer / uksouth / SKU = 2019-Datacenter / Version = 2019.0.20181107
#>

Get-AzVMImagePublisher -Location "UK South"

Get-AzVMImageOffer -Location "UK South" -PublisherName "MicrosoftWindowsServer"

Get-AzVMImageSku -Location "UK South" -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer"

Get-AzVMImage -Location "UK South" -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Sku "2019-Datacenter"
