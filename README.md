# bicep-demo
This Project stores Azure Bicep Demo Sample.

The following `az bicep` commands will help to demo.

### Hello World
az bicep build -f .\00-Hello-World\blank.bicep
az bicep build -f .\00-Hello-World\hello.bicep

### Basics
az bicep build -f .\01-Basics\demo.bicep
az deployment group create --template-file .\01-Basics\demo.bicep -g '[ResourceGroupName]'

### Master
az deployment sub create -f .\master.bicep -l '[Location]'

### Advance
az bicep decompile -f .\02-Advance\keyvault.json