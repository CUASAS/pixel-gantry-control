# Set-PSDebug -Trace 1
$lvproj = $PSScriptRoot + "\Gantry\Gantry.lvproj"

$version = Read-Host "Enter the version specifier (e.g., 1.0.0)"
$version = $version.Replace(".", "p")

function Set-Gantry-Driver {
	param( [string]$driverName, [string]$projectPath)

	$xml = [xml](Get-Content -Path $projectPath)
	$node = $xml.SelectSingleNode("/Project/Property[@Name='CCSymbols']")
	$node.'#text' = 'GANTRY_DRIVER,' + $driverName + ';'

	$xml.Save($projectPath)
}

function Compress-Distribution {
	param([string]$distName)
	
	$zipFile = "gScript_${version}_${distName}.zip"
	if (Test-Path -Path $zipFile) {
		Remove-Item -Path $zipFile -Force
	}
	$sourceFolder = "builds\gScript - $distName\gScript\Volume\"
	Compress-Archive -Path $sourceFolder -DestinationPath $zipFile
}


# Build the driver-agnostic parts first
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Camera Helper"
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Path Visualizer"
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Pattern Recognition Tuner"

#Build the A3200 Distribution
Set-Gantry-Driver -DriverName "A3200" -ProjectPath $lvproj
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Interpreter"
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript - A3200"
Compress-Distribution -DistName A3200

#Build the AUTOMATION1 Distribution
Set-Gantry-Driver -DriverName "AUTOMATION1" -ProjectPath $lvproj
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript Interpreter"
LabVIEWCLI.exe -OperationName ExecuteBuildSpec -ProjectPath $lvproj -BuildSpecName "gScript - AUTOMATION1"
Compress-Distribution -DistName AUTOMATION1

Write-Host "Press any key to continue..."
Read-Host
