
New-AzResourceGroup -Name MyResourceGroup -Location 'EastAsia'


New-AzStorageAccount -ResourceGroupName MyResourceGroup -AccountName sa8765456789876 -Location westus -SkuName Standard_GRS

New-AzStorageAccount -ResourceGroupName MyResourceGroup -AccountName sa000gytghjnhg -Location westus -SkuName Standard_GRS -Kind BlobStorage -AccessTier Hot

New-AzStorageAccount -ResourceGroupName MyResourceGroup -AccountName sa0005y6u7yjhgn -Location westus -SkuName Standard_GRS -Kind StorageV2 -AssignIdentity

