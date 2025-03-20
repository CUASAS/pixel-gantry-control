Set-PSDebug -Trace 1
$lvproj = $PSScriptRoot + "\Gantry\Gantry.lvproj"

function Set-Gantry-Driver {
	param( [string]$driverName, [string]$projectPath)

	$xml = [xml](Get-Content -Path $projectPath)
	$node = $xml.SelectSingleNode("/Project/Property[@Name='CCSymbols']")
	$node.'#text' = 'GANTRY_DRIVER,' + $driverName + ';'

	$xml.Save($projectPath)
}

# Build the driver-agnostic parts first
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Camera Helper"
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Path Visualizer"
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Pattern Recognition Tuner"

#Build the A3200 Distribution
Set-Gantry-Driver -DriverName "A3200" -ProjectPath $lvproj
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Interpreter"
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript - A3200"

#Build the AUTOMATION1 Distribution
Set-Gantry-Driver -DriverName "AUTOMATION1" -ProjectPath $lvproj
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Interpreter"
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript - AUTOMATION1"