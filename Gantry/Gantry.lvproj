<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="11008008">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="IOScan.Faults" Type="Str"></Property>
		<Property Name="IOScan.NetVarPeriod" Type="UInt">100</Property>
		<Property Name="IOScan.NetWatchdogEnabled" Type="Bool">false</Property>
		<Property Name="IOScan.Period" Type="UInt">10000</Property>
		<Property Name="IOScan.PowerupMode" Type="UInt">0</Property>
		<Property Name="IOScan.Priority" Type="UInt">9</Property>
		<Property Name="IOScan.ReportModeConflict" Type="Bool">true</Property>
		<Property Name="IOScan.StartEngineOnDeploy" Type="Bool">false</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Commissioning Helpers" Type="Folder">
			<Item Name="Camera Identification.vi" Type="VI" URL="../Commissioning Helpers/Camera Identification.vi"/>
			<Item Name="Fiducial Parameters Finder From File.vi" Type="VI" URL="../Commissioning Helpers/Fiducial Parameters Finder From File.vi"/>
			<Item Name="Fiducical Parameters Finder.vi" Type="VI" URL="../Commissioning Helpers/Fiducical Parameters Finder.vi"/>
			<Item Name="HDI Pad Group Deviation.vi" Type="VI" URL="../Commissioning Helpers/HDI Pad Group Deviation.vi"/>
			<Item Name="HDI Pad Group Imaging.vi" Type="VI" URL="../Commissioning Helpers/HDI Pad Group Imaging.vi"/>
			<Item Name="HDI Start Position Acquire.vi" Type="VI" URL="../Commissioning Helpers/HDI Start Position Acquire.vi"/>
			<Item Name="HDI Start Position Verify.vi" Type="VI" URL="../Commissioning Helpers/HDI Start Position Verify.vi"/>
			<Item Name="Pot Single Line.vi" Type="VI" URL="../Commissioning Helpers/Pot Single Line.vi"/>
		</Item>
		<Item Name="Shared Components" Type="Folder">
			<Item Name="CameraTool Class" Type="Folder">
				<Item Name="Tests" Type="Folder">
					<Item Name="Test CameraTool Focus.vi" Type="VI" URL="../Shared Components/CameraTool Class/Tests/Test CameraTool Focus.vi"/>
					<Item Name="Test CameraTool Get Fiducial Manual.vi" Type="VI" URL="../Shared Components/CameraTool Class/Tests/Test CameraTool Get Fiducial Manual.vi"/>
					<Item Name="Test CameraTool Get Fiducial.vi" Type="VI" URL="../Shared Components/CameraTool Class/Tests/Test CameraTool Get Fiducial.vi"/>
					<Item Name="Test Read HDI Fiducials.vi" Type="VI" URL="../Shared Components/CameraTool Class/Tests/Test Read HDI Fiducials.vi"/>
				</Item>
				<Item Name="CameraTool Class Sandbox.vi" Type="VI" URL="../Shared Components/CameraTool Class/CameraTool Class Sandbox.vi"/>
				<Item Name="CameraTool Class.lvclass" Type="LVClass" URL="../Shared Components/CameraTool Class/CameraTool Class.lvclass"/>
			</Item>
			<Item Name="Gantry Class" Type="Folder">
				<Item Name="MPG Scripts" Type="Folder">
					<Item Name="MPG.OGM" Type="Document" URL="../Shared Components/Gantry Class/MPG Scripts/MPG.OGM"/>
					<Item Name="MPG.pgm" Type="Document" URL="../Shared Components/Gantry Class/MPG Scripts/MPG.pgm"/>
					<Item Name="MPGInclude.pgm" Type="Document" URL="../Shared Components/Gantry Class/MPG Scripts/MPGInclude.pgm"/>
					<Item Name="MPGMultipleAxisInclude.pgm" Type="Document" URL="../Shared Components/Gantry Class/MPG Scripts/MPGMultipleAxisInclude.pgm"/>
				</Item>
				<Item Name="Tests" Type="Folder">
					<Item Name="Test Gantry Camera.vi" Type="VI" URL="../Shared Components/Gantry Class/Tests/Test Gantry Camera.vi"/>
					<Item Name="Test Gantry Dispenser.vi" Type="VI" URL="../Shared Components/Gantry Class/Tests/Test Gantry Dispenser.vi"/>
					<Item Name="Test Gantry Manifold.vi" Type="VI" URL="../Shared Components/Gantry Class/Tests/Test Gantry Manifold.vi"/>
					<Item Name="Test Gantry MPG.vi" Type="VI" URL="../Shared Components/Gantry Class/Tests/Test Gantry MPG.vi"/>
					<Item Name="Test Move To Name.vi" Type="VI" URL="../Shared Components/Gantry Class/Tests/Test Move To Name.vi"/>
				</Item>
				<Item Name="Type Definitions" Type="Folder">
					<Item Name="Gantry_Camera.ctl" Type="VI" URL="../Shared Components/Gantry Class/Type Definitions/Gantry_Camera.ctl"/>
				</Item>
				<Item Name="Gantry Class.lvclass" Type="LVClass" URL="../Shared Components/Gantry Class/Gantry Class.lvclass"/>
			</Item>
			<Item Name="GrabberTool Class" Type="Folder">
				<Item Name="Tests" Type="Folder">
					<Item Name="Test Grabber Tool Load.vi" Type="VI" URL="../Shared Components/GrabberTool Class/Tests/Test Grabber Tool Load.vi"/>
				</Item>
				<Item Name="GrabberTool Class Sandbox.vi" Type="VI" URL="../Shared Components/GrabberTool Class/GrabberTool Class Sandbox.vi"/>
				<Item Name="GrabberTool Class.lvclass" Type="LVClass" URL="../Shared Components/GrabberTool Class/GrabberTool Class.lvclass"/>
			</Item>
			<Item Name="gVision API" Type="Folder">
				<Item Name="gVision" Type="Folder">
					<Item Name="gVision.lvlib" Type="Library" URL="../Shared Components/gVision API/gVision/gVision.lvlib"/>
				</Item>
				<Item Name="gVisionBin" Type="Folder">
					<Item Name="gVision.dll" Type="Document" URL="../Shared Components/gVision API/gVisionBin/gVision.dll"/>
					<Item Name="opencv_core300.dll" Type="Document" URL="../Shared Components/gVision API/gVisionBin/opencv_core300.dll"/>
					<Item Name="opencv_highgui300.dll" Type="Document" URL="../Shared Components/gVision API/gVisionBin/opencv_highgui300.dll"/>
					<Item Name="opencv_imgcodecs300.dll" Type="Document" URL="../Shared Components/gVision API/gVisionBin/opencv_imgcodecs300.dll"/>
					<Item Name="opencv_imgproc300.dll" Type="Document" URL="../Shared Components/gVision API/gVisionBin/opencv_imgproc300.dll"/>
					<Item Name="opencv_videoio300.dll" Type="Document" URL="../Shared Components/gVision API/gVisionBin/opencv_videoio300.dll"/>
					<Item Name="README.txt" Type="Document" URL="../Shared Components/gVision API/gVisionBin/README.txt"/>
				</Item>
			</Item>
			<Item Name="Orient3d Class" Type="Folder">
				<Item Name="Tests" Type="Folder">
					<Item Name="Test Create and Compose.vi" Type="VI" URL="../Shared Components/Orient3d Class/Tests/Test Create and Compose.vi"/>
				</Item>
				<Item Name="Type Definitions" Type="Folder">
					<Item Name="Quaternion.ctl" Type="VI" URL="../Shared Components/Orient3d Class/Type Definitions/Quaternion.ctl"/>
				</Item>
				<Item Name="Orient3d Class.lvclass" Type="LVClass" URL="../Shared Components/Orient3d Class/Orient3d Class.lvclass"/>
			</Item>
			<Item Name="PickupTool Class" Type="Folder">
				<Item Name="Tests" Type="Folder">
					<Item Name="Test Pickup Tool Load.vi" Type="VI" URL="../Shared Components/PickupTool Class/Tests/Test Pickup Tool Load.vi"/>
				</Item>
				<Item Name="PickupTool Class.lvclass" Type="LVClass" URL="../Shared Components/PickupTool Class/PickupTool Class.lvclass"/>
			</Item>
			<Item Name="SyringeTool Class" Type="Folder">
				<Item Name="SyringeTool Class.lvclass" Type="LVClass" URL="../Shared Components/SyringeTool Class/SyringeTool Class.lvclass"/>
			</Item>
			<Item Name="Utils" Type="Folder">
				<Property Name="NI.SortType" Type="Int">0</Property>
				<Item Name="Geometry Utils" Type="Folder">
					<Item Name="Calculate Position Orientation.vi" Type="VI" URL="../Shared Components/Utils/Geometry Utils/Calculate Position Orientation.vi"/>
					<Item Name="Centroid.vi" Type="VI" URL="../Shared Components/Utils/Geometry Utils/Centroid.vi"/>
					<Item Name="Gantry Camera to Physical Coordinates.vi" Type="VI" URL="../Shared Components/Utils/Geometry Utils/Gantry Camera to Physical Coordinates.vi"/>
					<Item Name="Get HDI Pad Local Coordinates.vi" Type="VI" URL="../Shared Components/Utils/Geometry Utils/Get HDI Pad Local Coordinates.vi"/>
					<Item Name="Get Net Phi.vi" Type="VI" URL="../Shared Components/Utils/Geometry Utils/Get Net Phi.vi"/>
					<Item Name="Principle Eigenpair.vi" Type="VI" URL="../Shared Components/Utils/Geometry Utils/Principle Eigenpair.vi"/>
					<Item Name="To Global Coordinates.vi" Type="VI" URL="../Shared Components/Utils/Geometry Utils/To Global Coordinates.vi"/>
					<Item Name="To Local Coordinates.vi" Type="VI" URL="../Shared Components/Utils/Geometry Utils/To Local Coordinates.vi"/>
				</Item>
				<Item Name="Tests" Type="Folder">
					<Item Name="Test Geometry Location Fitting.vi" Type="VI" URL="../Shared Components/Utils/Tests/Test Geometry Location Fitting.vi"/>
					<Item Name="Test Stitch Together Images.vi" Type="VI" URL="../Shared Components/Utils/Tests/Test Stitch Together Images.vi"/>
				</Item>
				<Item Name="Type Definitions" Type="Folder">
					<Item Name="Physical Image.ctl" Type="VI" URL="../Shared Components/Utils/Type Definitions/Physical Image.ctl"/>
					<Item Name="Position_Orientation.ctl" Type="VI" URL="../Shared Components/Utils/Type Definitions/Position_Orientation.ctl"/>
				</Item>
				<Item Name="Vision Utils" Type="Folder">
					<Item Name="Calculate Pixel Size.vi" Type="VI" URL="../Shared Components/Utils/Vision Utils/Calculate Pixel Size.vi"/>
					<Item Name="Stitch Together Images.vi" Type="VI" URL="../Shared Components/Utils/Vision Utils/Stitch Together Images.vi"/>
				</Item>
				<Item Name="Extract Fiducial Definitions.vi" Type="VI" URL="../Shared Components/Utils/Extract Fiducial Definitions.vi"/>
				<Item Name="Parse CSV Line.vi" Type="VI" URL="../Shared Components/Utils/Parse CSV Line.vi"/>
				<Item Name="Read Camera Name.vi" Type="VI" URL="../Shared Components/Utils/Read Camera Name.vi"/>
				<Item Name="Read Center Orientation.vi" Type="VI" URL="../Shared Components/Utils/Read Center Orientation.vi"/>
				<Item Name="Read Geometry Definition.vi" Type="VI" URL="../Shared Components/Utils/Read Geometry Definition.vi"/>
				<Item Name="Read Offset.vi" Type="VI" URL="../Shared Components/Utils/Read Offset.vi"/>
				<Item Name="Read Speed.vi" Type="VI" URL="../Shared Components/Utils/Read Speed.vi"/>
				<Item Name="Select Fiducial From Set.vi" Type="VI" URL="../Shared Components/Utils/Select Fiducial From Set.vi"/>
				<Item Name="Superimpose Crosshairs.vi" Type="VI" URL="../Shared Components/Utils/Superimpose Crosshairs.vi"/>
			</Item>
			<Item Name="Vec3d Class" Type="Folder">
				<Item Name="Tests" Type="Folder">
					<Item Name="Test Rotate.vi" Type="VI" URL="../Shared Components/Vec3d Class/Tests/Test Rotate.vi"/>
				</Item>
				<Item Name="Vec3d Class.lvclass" Type="LVClass" URL="../Shared Components/Vec3d Class/Vec3d Class.lvclass"/>
			</Item>
			<Item Name="WorkTable Class" Type="Folder">
				<Item Name="Tests" Type="Folder">
					<Item Name="Test Update Current Tool.vi" Type="VI" URL="../Shared Components/WorkTable Class/Tests/Test Update Current Tool.vi"/>
				</Item>
				<Item Name="Type Definitions" Type="Folder">
					<Item Name="Worktable_BBM Slot.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_BBM Slot.ctl"/>
					<Item Name="Worktable_Dispenser.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_Dispenser.ctl"/>
					<Item Name="Worktable_Gantry Head.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_Gantry Head.ctl"/>
					<Item Name="Worktable_Glue Reservoir.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_Glue Reservoir.ctl"/>
					<Item Name="Worktable_HDI Slot.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_HDI Slot.ctl"/>
					<Item Name="Worktable_Manifold Channel.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_Manifold Channel.ctl"/>
					<Item Name="Worktable_Offsets.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_Offsets.ctl"/>
					<Item Name="Worktable_Stamps.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_Stamps.ctl"/>
					<Item Name="Worktable_Syringe.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_Syringe.ctl"/>
					<Item Name="Worktable_Tool Rack.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_Tool Rack.ctl"/>
					<Item Name="Worktable_Weights.ctl" Type="VI" URL="../Shared Components/WorkTable Class/Type Definitions/Worktable_Weights.ctl"/>
				</Item>
				<Item Name="WorkTable Class.lvclass" Type="LVClass" URL="../Shared Components/WorkTable Class/WorkTable Class.lvclass"/>
				<Item Name="WorkTable Sandbox.vi" Type="VI" URL="../Shared Components/WorkTable Class/WorkTable Sandbox.vi"/>
			</Item>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user.lib" Type="Folder">
				<Item Name="AcknowledgeAll.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Commands/AcknowledgeAll.vi"/>
				<Item Name="Aerotech.A3200.dll" Type="Document" URL="/&lt;userlib&gt;/aerotech/8.2/Bin/Aerotech.A3200.dll"/>
				<Item Name="Aerotech.A3200.LabVIEW.dll" Type="Document" URL="/&lt;userlib&gt;/aerotech/8.2/Bin/Aerotech.A3200.LabVIEW.dll"/>
				<Item Name="AxisDiagPacket.ctl" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Status/AxisDiagPacket.ctl"/>
				<Item Name="Connect.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Initialize/Connect.vi"/>
				<Item Name="ControllerDiagPacket.ctl" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Status/ControllerDiagPacket.ctl"/>
				<Item Name="ConvertDiagPacket.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Status/ConvertDiagPacket.vi"/>
				<Item Name="Disable.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/Disable.vi"/>
				<Item Name="DisableMultiple.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/DisableMultiple.vi"/>
				<Item Name="DisableSingle.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/DisableSingle.vi"/>
				<Item Name="Disconnect.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Initialize/Disconnect.vi"/>
				<Item Name="EnableMultiple.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/EnableMultiple.vi"/>
				<Item Name="ExecuteProgram.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Commands/ExecuteProgram.vi"/>
				<Item Name="GetAxisIndex.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Utility/GetAxisIndex.vi"/>
				<Item Name="HomeSingle.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/HomeSingle.vi"/>
				<Item Name="MoveAbsMultiple.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/MoveAbsMultiple.vi"/>
				<Item Name="MoveAbsSingle.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/MoveAbsSingle.vi"/>
				<Item Name="MoveIncMultiple.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/MoveIncMultiple.vi"/>
				<Item Name="MoveIncSingle.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/MoveIncSingle.vi"/>
				<Item Name="RetrieveDiagPacket.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Status/RetrieveDiagPacket.vi"/>
				<Item Name="StopProgram.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Commands/StopProgram.vi"/>
				<Item Name="WaitMultiple.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/WaitMultiple.vi"/>
				<Item Name="WaitSingle.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Motion/WaitSingle.vi"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Color (U64)" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Color (U64)"/>
				<Item Name="Color to RGB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/Color to RGB.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="DAQmx Clear Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Clear Task.vi"/>
				<Item Name="DAQmx Create AI Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create AI Channel (sub).vi"/>
				<Item Name="DAQmx Create AI Channel TEDS(sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create AI Channel TEDS(sub).vi"/>
				<Item Name="DAQmx Create AO Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create AO Channel (sub).vi"/>
				<Item Name="DAQmx Create Channel (AI-Acceleration-Accelerometer).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Acceleration-Accelerometer).vi"/>
				<Item Name="DAQmx Create Channel (AI-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (AI-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Current-Basic).vi"/>
				<Item Name="DAQmx Create Channel (AI-Current-RMS).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Current-RMS).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-Bridge-Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-Bridge-Polynomial).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-Bridge-Table).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-Bridge-Table).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-Bridge-Two-Point-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-Bridge-Two-Point-Linear).vi"/>
				<Item Name="DAQmx Create Channel (AI-Force-IEPE Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Force-IEPE Sensor).vi"/>
				<Item Name="DAQmx Create Channel (AI-Frequency-Voltage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Frequency-Voltage).vi"/>
				<Item Name="DAQmx Create Channel (AI-Position-EddyCurrentProxProbe).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Position-EddyCurrentProxProbe).vi"/>
				<Item Name="DAQmx Create Channel (AI-Position-LVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Position-LVDT).vi"/>
				<Item Name="DAQmx Create Channel (AI-Position-RVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Position-RVDT).vi"/>
				<Item Name="DAQmx Create Channel (AI-Pressure-Bridge-Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Pressure-Bridge-Polynomial).vi"/>
				<Item Name="DAQmx Create Channel (AI-Pressure-Bridge-Table).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Pressure-Bridge-Table).vi"/>
				<Item Name="DAQmx Create Channel (AI-Pressure-Bridge-Two-Point-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Pressure-Bridge-Two-Point-Linear).vi"/>
				<Item Name="DAQmx Create Channel (AI-Resistance).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Resistance).vi"/>
				<Item Name="DAQmx Create Channel (AI-Sound Pressure-Microphone).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Sound Pressure-Microphone).vi"/>
				<Item Name="DAQmx Create Channel (AI-Strain-Strain Gage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Strain-Strain Gage).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Built-in Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Built-in Sensor).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-RTD).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-RTD).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Thermistor-Iex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Thermistor-Iex).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Thermistor-Vex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Thermistor-Vex).vi"/>
				<Item Name="DAQmx Create Channel (AI-Temperature-Thermocouple).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Temperature-Thermocouple).vi"/>
				<Item Name="DAQmx Create Channel (AI-Torque-Bridge-Polynomial).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Torque-Bridge-Polynomial).vi"/>
				<Item Name="DAQmx Create Channel (AI-Torque-Bridge-Table).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Torque-Bridge-Table).vi"/>
				<Item Name="DAQmx Create Channel (AI-Torque-Bridge-Two-Point-Linear).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Torque-Bridge-Two-Point-Linear).vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-Custom with Excitation).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-Custom with Excitation).vi"/>
				<Item Name="DAQmx Create Channel (AI-Voltage-RMS).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AI-Voltage-RMS).vi"/>
				<Item Name="DAQmx Create Channel (AO-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AO-Current-Basic).vi"/>
				<Item Name="DAQmx Create Channel (AO-FuncGen).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AO-FuncGen).vi"/>
				<Item Name="DAQmx Create Channel (AO-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (AO-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Channel (CI-Count Edges).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Count Edges).vi"/>
				<Item Name="DAQmx Create Channel (CI-Frequency).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Frequency).vi"/>
				<Item Name="DAQmx Create Channel (CI-GPS Timestamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-GPS Timestamp).vi"/>
				<Item Name="DAQmx Create Channel (CI-Period).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Period).vi"/>
				<Item Name="DAQmx Create Channel (CI-Position-Angular Encoder).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Position-Angular Encoder).vi"/>
				<Item Name="DAQmx Create Channel (CI-Position-Linear Encoder).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Position-Linear Encoder).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Freq).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Freq).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Ticks).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Ticks).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Time).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Time).vi"/>
				<Item Name="DAQmx Create Channel (CI-Pulse Width).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Pulse Width).vi"/>
				<Item Name="DAQmx Create Channel (CI-Semi Period).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Semi Period).vi"/>
				<Item Name="DAQmx Create Channel (CI-Two Edge Separation).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CI-Two Edge Separation).vi"/>
				<Item Name="DAQmx Create Channel (CO-Pulse Generation-Frequency).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CO-Pulse Generation-Frequency).vi"/>
				<Item Name="DAQmx Create Channel (CO-Pulse Generation-Ticks).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CO-Pulse Generation-Ticks).vi"/>
				<Item Name="DAQmx Create Channel (CO-Pulse Generation-Time).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (CO-Pulse Generation-Time).vi"/>
				<Item Name="DAQmx Create Channel (DI-Digital Input).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (DI-Digital Input).vi"/>
				<Item Name="DAQmx Create Channel (DO-Digital Output).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (DO-Digital Output).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Acceleration-Accelerometer).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Acceleration-Accelerometer).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Current-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Current-Basic).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Force-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Force-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Force-IEPE Sensor).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Force-IEPE Sensor).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Position-LVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Position-LVDT).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Position-RVDT).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Position-RVDT).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Pressure-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Pressure-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Resistance).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Resistance).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Sound Pressure-Microphone).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Sound Pressure-Microphone).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Strain-Strain Gage).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Strain-Strain Gage).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-RTD).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-RTD).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Iex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Iex).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Vex).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-Thermistor-Vex).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Temperature-Thermocouple).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Temperature-Thermocouple).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Torque-Bridge).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Torque-Bridge).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Voltage-Basic).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Voltage-Basic).vi"/>
				<Item Name="DAQmx Create Channel (TEDS-AI-Voltage-Custom with Excitation).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Channel (TEDS-AI-Voltage-Custom with Excitation).vi"/>
				<Item Name="DAQmx Create CI Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create CI Channel (sub).vi"/>
				<Item Name="DAQmx Create CO Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create CO Channel (sub).vi"/>
				<Item Name="DAQmx Create DI Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create DI Channel (sub).vi"/>
				<Item Name="DAQmx Create DO Channel (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create DO Channel (sub).vi"/>
				<Item Name="DAQmx Create Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/task.llb/DAQmx Create Task.vi"/>
				<Item Name="DAQmx Create Virtual Channel.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Create Virtual Channel.vi"/>
				<Item Name="DAQmx Fill In Error Info.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/miscellaneous.llb/DAQmx Fill In Error Info.vi"/>
				<Item Name="DAQmx Flatten Channel String.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/miscellaneous.llb/DAQmx Flatten Channel String.vi"/>
				<Item Name="DAQmx Rollback Channel If Error.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Rollback Channel If Error.vi"/>
				<Item Name="DAQmx Set CJC Parameters (sub).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/create/channels.llb/DAQmx Set CJC Parameters (sub).vi"/>
				<Item Name="DAQmx Start Task.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/configure/task.llb/DAQmx Start Task.vi"/>
				<Item Name="DAQmx Write (Analog 1D DBL 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D DBL 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 1D DBL NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D DBL NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 2D DBL NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D DBL NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 2D I16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D I16 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 2D I32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D I32 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Analog DBL 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog DBL 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Analog Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Analog Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Frequency 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Frequency 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Frequency NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Frequency NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Ticks 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Ticks 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Time 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Time 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Counter 1D Time NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1D Time NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter 1DTicks NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter 1DTicks NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter Frequency 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Frequency 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter Ticks 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Ticks 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Counter Time 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Counter Time 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Bool 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Bool 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Bool NChan 1Samp 1Line).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Bool NChan 1Samp 1Line).vi"/>
				<Item Name="DAQmx Write (Digital 1D U8 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U8 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U8 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U8 NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U16 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U16 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U16 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U16 NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U32 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U32 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 1D U32 NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D U32 NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Wfm NChan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Wfm NChan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital 1D Wfm NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 1D Wfm NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 2D Bool NChan 1Samp NLine).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D Bool NChan 1Samp NLine).vi"/>
				<Item Name="DAQmx Write (Digital 2D U8 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U8 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 2D U16 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U16 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital 2D U32 NChan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital 2D U32 NChan NSamp).vi"/>
				<Item Name="DAQmx Write (Digital Bool 1Line 1Point).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Bool 1Line 1Point).vi"/>
				<Item Name="DAQmx Write (Digital U8 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U8 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital U16 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U16 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital U32 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital U32 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital Wfm 1Chan 1Samp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Wfm 1Chan 1Samp).vi"/>
				<Item Name="DAQmx Write (Digital Wfm 1Chan NSamp).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Digital Wfm 1Chan NSamp).vi"/>
				<Item Name="DAQmx Write (Raw 1D I8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I8).vi"/>
				<Item Name="DAQmx Write (Raw 1D I16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I16).vi"/>
				<Item Name="DAQmx Write (Raw 1D I32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D I32).vi"/>
				<Item Name="DAQmx Write (Raw 1D U8).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U8).vi"/>
				<Item Name="DAQmx Write (Raw 1D U16).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U16).vi"/>
				<Item Name="DAQmx Write (Raw 1D U32).vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write (Raw 1D U32).vi"/>
				<Item Name="DAQmx Write.vi" Type="VI" URL="/&lt;vilib&gt;/DAQmx/write.llb/DAQmx Write.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="Dflt Data Dir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Dflt Data Dir.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="DTbl Digital Size.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Digital Size.vi"/>
				<Item Name="DTbl Uncompress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DTblOps.llb/DTbl Uncompress Digital.vi"/>
				<Item Name="DWDT Uncompress Digital.vi" Type="VI" URL="/&lt;vilib&gt;/Waveform/DWDTOps.llb/DWDT Uncompress Digital.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Image Type" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Image Type"/>
				<Item Name="IMAQ Clear Overlay" Type="VI" URL="/&lt;vilib&gt;/vision/Overlay.llb/IMAQ Clear Overlay"/>
				<Item Name="IMAQ Copy" Type="VI" URL="/&lt;vilib&gt;/vision/Management.llb/IMAQ Copy"/>
				<Item Name="IMAQ Create" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Create"/>
				<Item Name="IMAQ Dispose" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Dispose"/>
				<Item Name="IMAQ GetImagePixelPtr" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ GetImagePixelPtr"/>
				<Item Name="IMAQ GetImageSize" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ GetImageSize"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="IMAQ Overlay Line" Type="VI" URL="/&lt;vilib&gt;/vision/Overlay.llb/IMAQ Overlay Line"/>
				<Item Name="IMAQ Overlay Oval" Type="VI" URL="/&lt;vilib&gt;/vision/Overlay.llb/IMAQ Overlay Oval"/>
				<Item Name="IMAQ ReadFile" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ ReadFile"/>
				<Item Name="IMAQ SetImageSize" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ SetImageSize"/>
				<Item Name="IMAQ Write BMP File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write BMP File 2"/>
				<Item Name="IMAQ Write File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write File 2"/>
				<Item Name="IMAQ Write Image And Vision Info File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write Image And Vision Info File 2"/>
				<Item Name="IMAQ Write JPEG File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write JPEG File 2"/>
				<Item Name="IMAQ Write JPEG2000 File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write JPEG2000 File 2"/>
				<Item Name="IMAQ Write PNG File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write PNG File 2"/>
				<Item Name="IMAQ Write TIFF File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write TIFF File 2"/>
				<Item Name="IMAQdx.ctl" Type="VI" URL="/&lt;vilib&gt;/userdefined/High Color/IMAQdx.ctl"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_Gmath.lvlib" Type="Library" URL="/&lt;vilib&gt;/gmath/NI_Gmath.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_Matrix.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/Matrix/NI_Matrix.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_Vision_Acquisition_Software.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/driver/NI_Vision_Acquisition_Software.lvlib"/>
				<Item Name="NI_Vision_Development_Module.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/NI_Vision_Development_Module.lvlib"/>
				<Item Name="NIMS_And Generic Elements.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_And Generic Elements.vi"/>
				<Item Name="NIMS_Check Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_Check Index.vi"/>
				<Item Name="NIMS_Get Dims.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Get Dims.vi"/>
				<Item Name="NIMS_Get Elements - RV(_).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - RV(_).vi"/>
				<Item Name="NIMS_Get Elements - SorM(_,_).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - SorM(_,_).vi"/>
				<Item Name="NIMS_SorM Check Column Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_SorM Check Column Index.vi"/>
				<Item Name="NIMS_SorM Check Row Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_SorM Check Row Index.vi"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="subTimeDelay.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/TimeDelayBlock.llb/subTimeDelay.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="Create Error.vi" Type="VI" URL="/&lt;vilib&gt;/imathl/engines/lvmath/Functions/Error Handling/Create Error.vi"/>
			<Item Name="Display _Struct.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath/Plug In/_Struct/display/Display _Struct.vi"/>
			<Item Name="Display_StructField_Data.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath/Plug In/_Struct/display/Display_StructField_Data.vi"/>
			<Item Name="error.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath/Functions/Error Handling/error.ctl"/>
			<Item Name="GetRunTimeEnginePath.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/Utility/GetRunTimeEnginePath.vi"/>
			<Item Name="IM_msg.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/common/IM_msg.ctl"/>
			<Item Name="IM_refnum_cluster.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/common/IM_refnum_cluster.ctl"/>
			<Item Name="lvanlys.dll" Type="Document" URL="../../../../../../Program Files (x86)/National Instruments/LabVIEW 2011/resource/lvanlys.dll"/>
			<Item Name="MC_Align_Complex_Data.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/DisplayManager/MC_Align_Complex_Data.vi"/>
			<Item Name="MC_Align_Real_Data.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/DisplayManager/MC_Align_Real_Data.vi"/>
			<Item Name="MC_Close_All_Registered_SubVI.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalRegistration/MC_Close_All_Registered_SubVI.vi"/>
			<Item Name="MC_Display_1D_Array_Complex.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/DisplayManager/MC_Display_1D_Array_Complex.vi"/>
			<Item Name="MC_Display_1D_Array_Real.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/DisplayManager/MC_Display_1D_Array_Real.vi"/>
			<Item Name="MC_Display_1D_Array_String.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/DisplayManager/MC_Display_1D_Array_String.vi"/>
			<Item Name="MC_Display_Data.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/DisplayManager/MC_Display_Data.vi"/>
			<Item Name="MC_DisplayManager.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/DisplayManager/MC_DisplayManager.vi"/>
			<Item Name="MC_DisplayManager_Actions.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/DisplayManager/MC_DisplayManager_Actions.ctl"/>
			<Item Name="MC_Equal_within_epsilon.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/RangeToken/MC_Equal_within_epsilon.vi"/>
			<Item Name="MC_Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath/Functions/Error Handling/MC_Error Cluster From Error Code.vi"/>
			<Item Name="MC_Get_Notification_Event.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalRegistration/MC_Get_Notification_Event.vi"/>
			<Item Name="MC_GetPlugInDisplayVI.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/PlugInManager/MC_GetPlugInDisplayVI.vi"/>
			<Item Name="MC_Global_Global.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Constants/MC_Global_Global.vi"/>
			<Item Name="MC_Global_NamesAndDefaultValues.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Constants/MC_Global_NamesAndDefaultValues.vi"/>
			<Item Name="MC_GlobalManager.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalManager/MC_GlobalManager.vi"/>
			<Item Name="MC_GlobalManager_Actions.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalManager/MC_GlobalManager_Actions.ctl"/>
			<Item Name="MC_LocalVariableDefStatement_Display.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/LocalVariableDefStatement/MC_LocalVariableDefStatement_Display.vi"/>
			<Item Name="MC_ManageDisplayBuffers.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/DisplayManager/MC_ManageDisplayBuffers.vi"/>
			<Item Name="MC_PlugInDisplayVIType.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/PlugInManager/MC_PlugInDisplayVIType.ctl"/>
			<Item Name="MC_PlugInFolderPath.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/PlugInManager/MC_PlugInFolderPath.vi"/>
			<Item Name="MC_Range_Check_Step_Iter.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/RangeToken/MC_Range_Check_Step_Iter.vi"/>
			<Item Name="MC_Register_Notification_Command.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalRegistration/MC_Register_Notification_Command.ctl"/>
			<Item Name="MC_Register_Notification_Type.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalRegistration/MC_Register_Notification_Type.ctl"/>
			<Item Name="MC_Register_VI_In_Memory.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalRegistration/MC_Register_VI_In_Memory.vi"/>
			<Item Name="MC_Registered_VIs.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalRegistration/MC_Registered_VIs.vi"/>
			<Item Name="MC_Registered_VIs_Global.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalRegistration/MC_Registered_VIs_Global.vi"/>
			<Item Name="MC_Registration_Global.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/GlobalRegistration/MC_Registration_Global.vi"/>
			<Item Name="MC_UIManager.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/UIManager/MC_UIManager.vi"/>
			<Item Name="MC_UIManager_Actions.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/UIManager/MC_UIManager_Actions.ctl"/>
			<Item Name="niimaqdx.dll" Type="Document" URL="niimaqdx.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nilvaiu.dll" Type="Document" URL="nilvaiu.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="NIMS_Already Translated.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/ErrorHandling/NIMS_Already Translated.vi"/>
			<Item Name="NIMS_And Array Elements.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_And Array Elements.vi"/>
			<Item Name="NIMS_And Array Elements_631861BECDC54B97B1BA31611A562819_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_And Array Elements_631861BECDC54B97B1BA31611A562819.lvgen/NIMS_And Array Elements_631861BECDC54B97B1BA31611A562819_000.vi"/>
			<Item Name="NIMS_And Array Elements_631861BECDC54B97B1BA31611A562819_001.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_And Array Elements_631861BECDC54B97B1BA31611A562819.lvgen/NIMS_And Array Elements_631861BECDC54B97B1BA31611A562819_001.vi"/>
			<Item Name="NIMS_And Scalar Element.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_And Scalar Element.vi"/>
			<Item Name="NIMS_CH_Character 2D to String 2D.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath/Plug In/_Char/NIMS_CH_Character 2D to String 2D.vi"/>
			<Item Name="NIMS_CH_character datatype.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath/Plug In/_Char/NIMS_CH_character datatype.ctl"/>
			<Item Name="NIMS_Complex Is Real.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Complex Is Real.vi"/>
			<Item Name="NIMS_Complex Is Real_74F5AD630892492CBEF7DE017B557C63_001.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Complex Is Real_74F5AD630892492CBEF7DE017B557C63.lvgen/NIMS_Complex Is Real_74F5AD630892492CBEF7DE017B557C63_001.vi"/>
			<Item Name="NIMS_Create Error From Enums.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/ErrorHandling/NIMS_Create Error From Enums.vi"/>
			<Item Name="NIMS_Error From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/ErrorHandling/NIMS_Error From Error Code.vi"/>
			<Item Name="NIMS_Finalize Error.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/ErrorHandling/NIMS_Finalize Error.vi"/>
			<Item Name="NIMS_Get Column Vector - Matrix.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Get Column Vector - Matrix.vi"/>
			<Item Name="NIMS_Get Column Vector - Matrix_9A41694D383F4F97A368BCDCEE24DC60_002.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Column Vector - Matrix_9A41694D383F4F97A368BCDCEE24DC60.lvgen/NIMS_Get Column Vector - Matrix_9A41694D383F4F97A368BCDCEE24DC60_002.vi"/>
			<Item Name="NIMS_Get Dims (Matrix).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Get Dims (Matrix).vi"/>
			<Item Name="NIMS_Get Dims (Matrix)_BC29225E7A664B16ACDE05B1E08C63D6_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Dims (Matrix)_BC29225E7A664B16ACDE05B1E08C63D6.lvgen/NIMS_Get Dims (Matrix)_BC29225E7A664B16ACDE05B1E08C63D6_000.vi"/>
			<Item Name="NIMS_Get Dims (Matrix)_BC29225E7A664B16ACDE05B1E08C63D6_001.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Dims (Matrix)_BC29225E7A664B16ACDE05B1E08C63D6.lvgen/NIMS_Get Dims (Matrix)_BC29225E7A664B16ACDE05B1E08C63D6_001.vi"/>
			<Item Name="NIMS_Get Dims (Scalar).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Get Dims (Scalar).vi"/>
			<Item Name="NIMS_Get Dims (Scalar)_05BAC1FCB4284FBD8A0509A59B5F6578_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Dims (Scalar)_05BAC1FCB4284FBD8A0509A59B5F6578.lvgen/NIMS_Get Dims (Scalar)_05BAC1FCB4284FBD8A0509A59B5F6578_000.vi"/>
			<Item Name="NIMS_Get Dims (Vector).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Get Dims (Vector).vi"/>
			<Item Name="NIMS_Get Dims (Vector)_A2EDA302BA1D47449C1BA3CB58D8106E_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Dims (Vector)_A2EDA302BA1D47449C1BA3CB58D8106E.lvgen/NIMS_Get Dims (Vector)_A2EDA302BA1D47449C1BA3CB58D8106E_000.vi"/>
			<Item Name="NIMS_Get Elements - M(M,M).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(M,M).vi"/>
			<Item Name="NIMS_Get Elements - M(M,M)_22D1B2C88F4941C69CF6FBCE77F8CD84_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(M,M)_22D1B2C88F4941C69CF6FBCE77F8CD84.lvgen/NIMS_Get Elements - M(M,M)_22D1B2C88F4941C69CF6FBCE77F8CD84_000.vi"/>
			<Item Name="NIMS_Get Elements - M(M,R2).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(M,R2).vi"/>
			<Item Name="NIMS_Get Elements - M(M,R2)_83252A01ED7A41EF81AC85BB2E993862_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(M,R2)_83252A01ED7A41EF81AC85BB2E993862.lvgen/NIMS_Get Elements - M(M,R2)_83252A01ED7A41EF81AC85BB2E993862_000.vi"/>
			<Item Name="NIMS_Get Elements - M(M,S).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(M,S).vi"/>
			<Item Name="NIMS_Get Elements - M(M,S)_FA983203862941E5A02CBF066CC95C75_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(M,S)_FA983203862941E5A02CBF066CC95C75.lvgen/NIMS_Get Elements - M(M,S)_FA983203862941E5A02CBF066CC95C75_000.vi"/>
			<Item Name="NIMS_Get Elements - M(M,V).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(M,V).vi"/>
			<Item Name="NIMS_Get Elements - M(M,V)_8A3BD58A43054E7B9DA671FA493642DF_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(M,V)_8A3BD58A43054E7B9DA671FA493642DF.lvgen/NIMS_Get Elements - M(M,V)_8A3BD58A43054E7B9DA671FA493642DF_000.vi"/>
			<Item Name="NIMS_Get Elements - M(R2,M).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(R2,M).vi"/>
			<Item Name="NIMS_Get Elements - M(R2,M)_13E30CDF9BC34FEC8C13711054E5027C_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(R2,M)_13E30CDF9BC34FEC8C13711054E5027C.lvgen/NIMS_Get Elements - M(R2,M)_13E30CDF9BC34FEC8C13711054E5027C_000.vi"/>
			<Item Name="NIMS_Get Elements - M(R2,R2).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(R2,R2).vi"/>
			<Item Name="NIMS_Get Elements - M(R2,R2)_E3341FE4A33A42ABB5B563595A256BEE_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(R2,R2)_E3341FE4A33A42ABB5B563595A256BEE.lvgen/NIMS_Get Elements - M(R2,R2)_E3341FE4A33A42ABB5B563595A256BEE_000.vi"/>
			<Item Name="NIMS_Get Elements - M(R2,S).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(R2,S).vi"/>
			<Item Name="NIMS_Get Elements - M(R2,S)_8837CC554F89456BA2037A6BA43BDE77_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(R2,S)_8837CC554F89456BA2037A6BA43BDE77.lvgen/NIMS_Get Elements - M(R2,S)_8837CC554F89456BA2037A6BA43BDE77_000.vi"/>
			<Item Name="NIMS_Get Elements - M(R2,V).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(R2,V).vi"/>
			<Item Name="NIMS_Get Elements - M(R2,V)_525EB89CE3E74FBCB869CB93A659E14F_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(R2,V)_525EB89CE3E74FBCB869CB93A659E14F.lvgen/NIMS_Get Elements - M(R2,V)_525EB89CE3E74FBCB869CB93A659E14F_000.vi"/>
			<Item Name="NIMS_Get Elements - M(S,M).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(S,M).vi"/>
			<Item Name="NIMS_Get Elements - M(S,M)_47A181666803433BA063D9C389FE312F_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(S,M)_47A181666803433BA063D9C389FE312F.lvgen/NIMS_Get Elements - M(S,M)_47A181666803433BA063D9C389FE312F_000.vi"/>
			<Item Name="NIMS_Get Elements - M(S,R2).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(S,R2).vi"/>
			<Item Name="NIMS_Get Elements - M(S,R2)_326D139C766F49DAB9AE15EDDD34738D_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(S,R2)_326D139C766F49DAB9AE15EDDD34738D.lvgen/NIMS_Get Elements - M(S,R2)_326D139C766F49DAB9AE15EDDD34738D_000.vi"/>
			<Item Name="NIMS_Get Elements - M(S,S).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(S,S).vi"/>
			<Item Name="NIMS_Get Elements - M(S,S)_A6785D6F4E594A63BF2782DE1C928839_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(S,S)_A6785D6F4E594A63BF2782DE1C928839.lvgen/NIMS_Get Elements - M(S,S)_A6785D6F4E594A63BF2782DE1C928839_000.vi"/>
			<Item Name="NIMS_Get Elements - M(S,V).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(S,V).vi"/>
			<Item Name="NIMS_Get Elements - M(S,V)_EBEE2414B40F4E9D8B768000AF8FC0C4_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(S,V)_EBEE2414B40F4E9D8B768000AF8FC0C4.lvgen/NIMS_Get Elements - M(S,V)_EBEE2414B40F4E9D8B768000AF8FC0C4_000.vi"/>
			<Item Name="NIMS_Get Elements - M(V,M).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(V,M).vi"/>
			<Item Name="NIMS_Get Elements - M(V,M)_E74BB225CDA645AEA4F7A1DF238E0579_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(V,M)_E74BB225CDA645AEA4F7A1DF238E0579.lvgen/NIMS_Get Elements - M(V,M)_E74BB225CDA645AEA4F7A1DF238E0579_000.vi"/>
			<Item Name="NIMS_Get Elements - M(V,R2).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(V,R2).vi"/>
			<Item Name="NIMS_Get Elements - M(V,R2)_37474464CC6B45EA92336BF82BA7CC87_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(V,R2)_37474464CC6B45EA92336BF82BA7CC87.lvgen/NIMS_Get Elements - M(V,R2)_37474464CC6B45EA92336BF82BA7CC87_000.vi"/>
			<Item Name="NIMS_Get Elements - M(V,S).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(V,S).vi"/>
			<Item Name="NIMS_Get Elements - M(V,S)_ACA556FBEB93449FA1B253DB3D5BCF09_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(V,S)_ACA556FBEB93449FA1B253DB3D5BCF09.lvgen/NIMS_Get Elements - M(V,S)_ACA556FBEB93449FA1B253DB3D5BCF09_000.vi"/>
			<Item Name="NIMS_Get Elements - M(V,V).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - M(V,V).vi"/>
			<Item Name="NIMS_Get Elements - M(V,V)_77CA5255B0374447B1CC269005D3A4A9_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - M(V,V)_77CA5255B0374447B1CC269005D3A4A9.lvgen/NIMS_Get Elements - M(V,V)_77CA5255B0374447B1CC269005D3A4A9_000.vi"/>
			<Item Name="NIMS_Get Elements - RV(_) - Check.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - RV(_) - Check.vi"/>
			<Item Name="NIMS_Get Elements - RV(_) - Check_B511B9D8E05044FE80F9F088FE24B20C_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - RV(_) - Check_B511B9D8E05044FE80F9F088FE24B20C.lvgen/NIMS_Get Elements - RV(_) - Check_B511B9D8E05044FE80F9F088FE24B20C_000.vi"/>
			<Item Name="NIMS_Get Elements - RV(M).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - RV(M).vi"/>
			<Item Name="NIMS_Get Elements - RV(M)_26B0FF57CBD149438820B5A2EA9835D0_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - RV(M)_26B0FF57CBD149438820B5A2EA9835D0.lvgen/NIMS_Get Elements - RV(M)_26B0FF57CBD149438820B5A2EA9835D0_000.vi"/>
			<Item Name="NIMS_Get Elements - S(M,M).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(M,M).vi"/>
			<Item Name="NIMS_Get Elements - S(M,M)_3FC6EE2763014DB78272EE0FD0EBE646_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(M,M)_3FC6EE2763014DB78272EE0FD0EBE646.lvgen/NIMS_Get Elements - S(M,M)_3FC6EE2763014DB78272EE0FD0EBE646_000.vi"/>
			<Item Name="NIMS_Get Elements - S(M,R2).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(M,R2).vi"/>
			<Item Name="NIMS_Get Elements - S(M,R2)_8810507F6E23409683FAB523310A8479_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(M,R2)_8810507F6E23409683FAB523310A8479.lvgen/NIMS_Get Elements - S(M,R2)_8810507F6E23409683FAB523310A8479_000.vi"/>
			<Item Name="NIMS_Get Elements - S(M,S).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(M,S).vi"/>
			<Item Name="NIMS_Get Elements - S(M,S)_476D4BD22C2440D3A0FD0A63E855AC79_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(M,S)_476D4BD22C2440D3A0FD0A63E855AC79.lvgen/NIMS_Get Elements - S(M,S)_476D4BD22C2440D3A0FD0A63E855AC79_000.vi"/>
			<Item Name="NIMS_Get Elements - S(M,V).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(M,V).vi"/>
			<Item Name="NIMS_Get Elements - S(M,V)_3B972261996A44FF93C165C92C23BBC0_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(M,V)_3B972261996A44FF93C165C92C23BBC0.lvgen/NIMS_Get Elements - S(M,V)_3B972261996A44FF93C165C92C23BBC0_000.vi"/>
			<Item Name="NIMS_Get Elements - S(R2,M).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(R2,M).vi"/>
			<Item Name="NIMS_Get Elements - S(R2,M)_54CBC12C244F43829D03E83F3049AF4F_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(R2,M)_54CBC12C244F43829D03E83F3049AF4F.lvgen/NIMS_Get Elements - S(R2,M)_54CBC12C244F43829D03E83F3049AF4F_000.vi"/>
			<Item Name="NIMS_Get Elements - S(R2,R2).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(R2,R2).vi"/>
			<Item Name="NIMS_Get Elements - S(R2,R2)_014C66BBCBD4468CAE88624CC090A082_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(R2,R2)_014C66BBCBD4468CAE88624CC090A082.lvgen/NIMS_Get Elements - S(R2,R2)_014C66BBCBD4468CAE88624CC090A082_000.vi"/>
			<Item Name="NIMS_Get Elements - S(R2,S).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(R2,S).vi"/>
			<Item Name="NIMS_Get Elements - S(R2,S)_5527BF9D25BC4F7CBE9B431FC5D93FD2_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(R2,S)_5527BF9D25BC4F7CBE9B431FC5D93FD2.lvgen/NIMS_Get Elements - S(R2,S)_5527BF9D25BC4F7CBE9B431FC5D93FD2_000.vi"/>
			<Item Name="NIMS_Get Elements - S(R2,V).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(R2,V).vi"/>
			<Item Name="NIMS_Get Elements - S(R2,V)_F90D1841A51A403081249F80F9C25D04_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(R2,V)_F90D1841A51A403081249F80F9C25D04.lvgen/NIMS_Get Elements - S(R2,V)_F90D1841A51A403081249F80F9C25D04_000.vi"/>
			<Item Name="NIMS_Get Elements - S(S,M).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(S,M).vi"/>
			<Item Name="NIMS_Get Elements - S(S,M)_3BF7D92E475F4B4BAC2556BBAC4D9C88_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(S,M)_3BF7D92E475F4B4BAC2556BBAC4D9C88.lvgen/NIMS_Get Elements - S(S,M)_3BF7D92E475F4B4BAC2556BBAC4D9C88_000.vi"/>
			<Item Name="NIMS_Get Elements - S(S,R2).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(S,R2).vi"/>
			<Item Name="NIMS_Get Elements - S(S,R2)_B9ECADC840CA4578A583627B5E3C6A39_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(S,R2)_B9ECADC840CA4578A583627B5E3C6A39.lvgen/NIMS_Get Elements - S(S,R2)_B9ECADC840CA4578A583627B5E3C6A39_000.vi"/>
			<Item Name="NIMS_Get Elements - S(S,S).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(S,S).vi"/>
			<Item Name="NIMS_Get Elements - S(S,S)_36BDFCB0C10241B69DF10488800F69ED_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(S,S)_36BDFCB0C10241B69DF10488800F69ED.lvgen/NIMS_Get Elements - S(S,S)_36BDFCB0C10241B69DF10488800F69ED_000.vi"/>
			<Item Name="NIMS_Get Elements - S(S,V).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(S,V).vi"/>
			<Item Name="NIMS_Get Elements - S(S,V)_3020A20F24724341B328D86A1669BD1B_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(S,V)_3020A20F24724341B328D86A1669BD1B.lvgen/NIMS_Get Elements - S(S,V)_3020A20F24724341B328D86A1669BD1B_000.vi"/>
			<Item Name="NIMS_Get Elements - S(V,M).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(V,M).vi"/>
			<Item Name="NIMS_Get Elements - S(V,M)_FFEBE24928974C11B196CD8C7D6A2E10_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(V,M)_FFEBE24928974C11B196CD8C7D6A2E10.lvgen/NIMS_Get Elements - S(V,M)_FFEBE24928974C11B196CD8C7D6A2E10_000.vi"/>
			<Item Name="NIMS_Get Elements - S(V,R2).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(V,R2).vi"/>
			<Item Name="NIMS_Get Elements - S(V,R2)_E982A74BE2674D21AABA4A5FD490B483_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(V,R2)_E982A74BE2674D21AABA4A5FD490B483.lvgen/NIMS_Get Elements - S(V,R2)_E982A74BE2674D21AABA4A5FD490B483_000.vi"/>
			<Item Name="NIMS_Get Elements - S(V,S).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(V,S).vi"/>
			<Item Name="NIMS_Get Elements - S(V,S)_BE46FCD278AE4095992154E89D6BAAE5_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(V,S)_BE46FCD278AE4095992154E89D6BAAE5.lvgen/NIMS_Get Elements - S(V,S)_BE46FCD278AE4095992154E89D6BAAE5_000.vi"/>
			<Item Name="NIMS_Get Elements - S(V,V).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - S(V,V).vi"/>
			<Item Name="NIMS_Get Elements - S(V,V)_49AFBA2BC6714D389BB3D344453F21BE_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - S(V,V)_49AFBA2BC6714D389BB3D344453F21BE.lvgen/NIMS_Get Elements - S(V,V)_49AFBA2BC6714D389BB3D344453F21BE_000.vi"/>
			<Item Name="NIMS_Get Elements - SorM(_,_) - Check - Check.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - SorM(_,_) - Check - Check.vi"/>
			<Item Name="NIMS_Get Elements - SorM(_,_) - Check - Check_DA1E252EAB634D989357E7C72E8137F5_001.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - SorM(_,_) - Check - Check_DA1E252EAB634D989357E7C72E8137F5.lvgen/NIMS_Get Elements - SorM(_,_) - Check - Check_DA1E252EAB634D989357E7C72E8137F5_001.vi"/>
			<Item Name="NIMS_Get Elements - V(R2).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - V(R2).vi"/>
			<Item Name="NIMS_Get Elements - V(R2)_6908C3CBC145405FBDD78690B7F1945D_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - V(R2)_6908C3CBC145405FBDD78690B7F1945D.lvgen/NIMS_Get Elements - V(R2)_6908C3CBC145405FBDD78690B7F1945D_000.vi"/>
			<Item Name="NIMS_Get Elements - V(S).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - V(S).vi"/>
			<Item Name="NIMS_Get Elements - V(S)_C99A26467DB24FA3A79619D034B25FD8_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - V(S)_C99A26467DB24FA3A79619D034B25FD8.lvgen/NIMS_Get Elements - V(S)_C99A26467DB24FA3A79619D034B25FD8_000.vi"/>
			<Item Name="NIMS_Get Elements - V(V).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Read/NIMS_Get Elements - V(V).vi"/>
			<Item Name="NIMS_Get Elements - V(V)_D802331D13C1477FBB264FA67E6BC4E8_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Elements - V(V)_D802331D13C1477FBB264FA67E6BC4E8.lvgen/NIMS_Get Elements - V(V)_D802331D13C1477FBB264FA67E6BC4E8_000.vi"/>
			<Item Name="NIMS_Get Row Vector - Matrix.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Get Row Vector - Matrix.vi"/>
			<Item Name="NIMS_Get Row Vector - Matrix_73C62E6A23B74A87BA790FCBD9952466_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Row Vector - Matrix_73C62E6A23B74A87BA790FCBD9952466.lvgen/NIMS_Get Row Vector - Matrix_73C62E6A23B74A87BA790FCBD9952466_000.vi"/>
			<Item Name="NIMS_Get Scalar - Matrix.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Get Scalar - Matrix.vi"/>
			<Item Name="NIMS_Get Scalar - Matrix_1E430E5CAF9140B2A906F03FDAFA275A_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Get Scalar - Matrix_1E430E5CAF9140B2A906F03FDAFA275A.lvgen/NIMS_Get Scalar - Matrix_1E430E5CAF9140B2A906F03FDAFA275A_000.vi"/>
			<Item Name="NIMS_Is Row or Col Vector - Matrix.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Is Row or Col Vector - Matrix.vi"/>
			<Item Name="NIMS_Is Row or Col Vector - Matrix_5BC98D2AF6734204A65B136C70091A2D_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Is Row or Col Vector - Matrix_5BC98D2AF6734204A65B136C70091A2D.lvgen/NIMS_Is Row or Col Vector - Matrix_5BC98D2AF6734204A65B136C70091A2D_000.vi"/>
			<Item Name="NIMS_Is Scalar.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_Is Scalar.vi"/>
			<Item Name="NIMS_Is Scalar_DA956500F7F242D79DE74848BD916B19_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Is Scalar_DA956500F7F242D79DE74848BD916B19.lvgen/NIMS_Is Scalar_DA956500F7F242D79DE74848BD916B19_000.vi"/>
			<Item Name="NIMS_M_Check_R2_Column Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_R2_Column Index.vi"/>
			<Item Name="NIMS_M_Check_R2_Column Index_DCF1DDBDEFFC4E2E9FB3D2F90F78DD53_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_R2_Column Index_DCF1DDBDEFFC4E2E9FB3D2F90F78DD53.lvgen/NIMS_M_Check_R2_Column Index_DCF1DDBDEFFC4E2E9FB3D2F90F78DD53_000.vi"/>
			<Item Name="NIMS_M_Check_R2_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_R2_Index.vi"/>
			<Item Name="NIMS_M_Check_R2_Index_4F50C6156E644CDAAF3D4321BAB499B1_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_R2_Index_4F50C6156E644CDAAF3D4321BAB499B1.lvgen/NIMS_M_Check_R2_Index_4F50C6156E644CDAAF3D4321BAB499B1_000.vi"/>
			<Item Name="NIMS_M_Check_R2_Row Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_R2_Row Index.vi"/>
			<Item Name="NIMS_M_Check_R2_Row Index_F5337CC0CBE74993B7B798C569CAC9C6_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_R2_Row Index_F5337CC0CBE74993B7B798C569CAC9C6.lvgen/NIMS_M_Check_R2_Row Index_F5337CC0CBE74993B7B798C569CAC9C6_000.vi"/>
			<Item Name="NIMS_M_Check_R3_Column Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_R3_Column Index.vi"/>
			<Item Name="NIMS_M_Check_R3_Column Index_85E4D126850447BE95F62C046A1F7E7C_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_R3_Column Index_85E4D126850447BE95F62C046A1F7E7C.lvgen/NIMS_M_Check_R3_Column Index_85E4D126850447BE95F62C046A1F7E7C_000.vi"/>
			<Item Name="NIMS_M_Check_R3_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_R3_Index.vi"/>
			<Item Name="NIMS_M_Check_R3_Index_A69257B762C34FE1A7BF4A3697853E30_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_R3_Index_A69257B762C34FE1A7BF4A3697853E30.lvgen/NIMS_M_Check_R3_Index_A69257B762C34FE1A7BF4A3697853E30_000.vi"/>
			<Item Name="NIMS_M_Check_R3_Row Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_R3_Row Index.vi"/>
			<Item Name="NIMS_M_Check_R3_Row Index_B0BC7188B2EB4589B0DBB7EB5AFC236B_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_R3_Row Index_B0BC7188B2EB4589B0DBB7EB5AFC236B.lvgen/NIMS_M_Check_R3_Row Index_B0BC7188B2EB4589B0DBB7EB5AFC236B_000.vi"/>
			<Item Name="NIMS_M_Check_S_Column Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_S_Column Index.vi"/>
			<Item Name="NIMS_M_Check_S_Column Index_0CD85E126578453485B0999C19F9C519_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_S_Column Index_0CD85E126578453485B0999C19F9C519.lvgen/NIMS_M_Check_S_Column Index_0CD85E126578453485B0999C19F9C519_000.vi"/>
			<Item Name="NIMS_M_Check_S_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_S_Index.vi"/>
			<Item Name="NIMS_M_Check_S_Index_2F3202F6EAB2424AB009C5EE78F94954_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_S_Index_2F3202F6EAB2424AB009C5EE78F94954.lvgen/NIMS_M_Check_S_Index_2F3202F6EAB2424AB009C5EE78F94954_000.vi"/>
			<Item Name="NIMS_M_Check_S_Row Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_S_Row Index.vi"/>
			<Item Name="NIMS_M_Check_S_Row Index_856F2CFCFD4F4258BED6489E5A155F8A_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_S_Row Index_856F2CFCFD4F4258BED6489E5A155F8A.lvgen/NIMS_M_Check_S_Row Index_856F2CFCFD4F4258BED6489E5A155F8A_000.vi"/>
			<Item Name="NIMS_M_Check_VorM_Column Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_VorM_Column Index.vi"/>
			<Item Name="NIMS_M_Check_VorM_Column Index_A55AF5EADCCC4DE6AAA30F1D89175BB8_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_VorM_Column Index_A55AF5EADCCC4DE6AAA30F1D89175BB8.lvgen/NIMS_M_Check_VorM_Column Index_A55AF5EADCCC4DE6AAA30F1D89175BB8_000.vi"/>
			<Item Name="NIMS_M_Check_VorM_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_VorM_Index.vi"/>
			<Item Name="NIMS_M_Check_VorM_Index_A716CCDDC37F426BBDFD06282205974F_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_VorM_Index_A716CCDDC37F426BBDFD06282205974F.lvgen/NIMS_M_Check_VorM_Index_A716CCDDC37F426BBDFD06282205974F_000.vi"/>
			<Item Name="NIMS_M_Check_VorM_Row Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_M_Check_VorM_Row Index.vi"/>
			<Item Name="NIMS_M_Check_VorM_Row Index_6C57EC95B0804B5AA57D4D07538586F1_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_M_Check_VorM_Row Index_6C57EC95B0804B5AA57D4D07538586F1.lvgen/NIMS_M_Check_VorM_Row Index_6C57EC95B0804B5AA57D4D07538586F1_000.vi"/>
			<Item Name="NIMS_NodeEndStatement_Output.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/NodeEndStatement/NIMS_NodeEndStatement_Output.vi"/>
			<Item Name="NIMS_NodeEndStatement_Output_53EC0D466D134D7ABD903AC30B43404B_002.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_NodeEndStatement_Output_53EC0D466D134D7ABD903AC30B43404B.lvgen/NIMS_NodeEndStatement_Output_53EC0D466D134D7ABD903AC30B43404B_002.vi"/>
			<Item Name="NIMS_NodeEndStatement_Output_53EC0D466D134D7ABD903AC30B43404B_005.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_NodeEndStatement_Output_53EC0D466D134D7ABD903AC30B43404B.lvgen/NIMS_NodeEndStatement_Output_53EC0D466D134D7ABD903AC30B43404B_005.vi"/>
			<Item Name="NIMS_Range.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/RangeToken/NIMS_Range.vi"/>
			<Item Name="NIMS_Range_0B7635FB69F84E19AA68E7FF959DF37C_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Range_0B7635FB69F84E19AA68E7FF959DF37C.lvgen/NIMS_Range_0B7635FB69F84E19AA68E7FF959DF37C_000.vi"/>
			<Item Name="NIMS_Range_Compute_Iterations.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/RangeToken/NIMS_Range_Compute_Iterations.vi"/>
			<Item Name="NIMS_Range_Compute_Iterations_E8D80E2E2826472C92413183A93F3170_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_Range_Compute_Iterations_E8D80E2E2826472C92413183A93F3170.lvgen/NIMS_Range_Compute_Iterations_E8D80E2E2826472C92413183A93F3170_000.vi"/>
			<Item Name="NIMS_Range_R2 To Vector.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/RangeToken/NIMS_Range_R2 To Vector.vi"/>
			<Item Name="NIMS_Replace - Range2.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/RangeToken/NIMS_Replace - Range2.ctl"/>
			<Item Name="NIMS_Replace - Range3.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/RangeToken/NIMS_Replace - Range3.ctl"/>
			<Item Name="NIMS_RunTimeType_From StrictType (excl LVString).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/RunTimeType/NIMS_RunTimeType_From StrictType (excl LVString).vi"/>
			<Item Name="NIMS_RunTimeType_From StrictType (excl LVString)_46AE8B54A11948F0BCCEB8091EE7AA4C_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_RunTimeType_From StrictType (excl LVString)_46AE8B54A11948F0BCCEB8091EE7AA4C.lvgen/NIMS_RunTimeType_From StrictType (excl LVString)_46AE8B54A11948F0BCCEB8091EE7AA4C_000.vi"/>
			<Item Name="NIMS_RunTimeType_Get Plug-In Name.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/RunTimeType/NIMS_RunTimeType_Get Plug-In Name.vi"/>
			<Item Name="NIMS_S_Check_R2_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_S_Check_R2_Index.vi"/>
			<Item Name="NIMS_S_Check_R2_Index_3373A92811C94C86922B7BDAE9C0C894_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_S_Check_R2_Index_3373A92811C94C86922B7BDAE9C0C894.lvgen/NIMS_S_Check_R2_Index_3373A92811C94C86922B7BDAE9C0C894_000.vi"/>
			<Item Name="NIMS_S_Check_R3_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_S_Check_R3_Index.vi"/>
			<Item Name="NIMS_S_Check_R3_Index_CDAA2726868B4F74B026AB469EBF2863_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_S_Check_R3_Index_CDAA2726868B4F74B026AB469EBF2863.lvgen/NIMS_S_Check_R3_Index_CDAA2726868B4F74B026AB469EBF2863_000.vi"/>
			<Item Name="NIMS_S_Check_S_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_S_Check_S_Index.vi"/>
			<Item Name="NIMS_S_Check_S_Index_A2EA0F13C1594DACA8AFF954727F1EDB_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_S_Check_S_Index_A2EA0F13C1594DACA8AFF954727F1EDB.lvgen/NIMS_S_Check_S_Index_A2EA0F13C1594DACA8AFF954727F1EDB_000.vi"/>
			<Item Name="NIMS_S_Check_VorM_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_S_Check_VorM_Index.vi"/>
			<Item Name="NIMS_S_Check_VorM_Index_BFE53EB7F2DB406DA10F362C66ED537D_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_S_Check_VorM_Index_BFE53EB7F2DB406DA10F362C66ED537D.lvgen/NIMS_S_Check_VorM_Index_BFE53EB7F2DB406DA10F362C66ED537D_000.vi"/>
			<Item Name="NIMS_string_Convert Decimal Symbol.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Convert Decimal Symbol.vi"/>
			<Item Name="NIMS_string_Convert Exp String.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Convert Exp String.vi"/>
			<Item Name="NIMS_string_Convert Specifier String.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Convert Specifier String.vi"/>
			<Item Name="NIMS_string_Extract Conversion Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Extract Conversion Specifier.vi"/>
			<Item Name="NIMS_string_Format Into String (1D-DBL).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Into String (1D-DBL).vi"/>
			<Item Name="NIMS_string_Format Under Char Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Under Char Specifier.vi"/>
			<Item Name="NIMS_string_Format Under Decimal Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Under Decimal Specifier.vi"/>
			<Item Name="NIMS_string_Format Under Exp Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Under Exp Specifier.vi"/>
			<Item Name="NIMS_string_Format Under G Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Under G Specifier.vi"/>
			<Item Name="NIMS_string_Format Under Hex Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Under Hex Specifier.vi"/>
			<Item Name="NIMS_string_Format Under No Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Under No Specifier.vi"/>
			<Item Name="NIMS_string_Format Under Octal Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Under Octal Specifier.vi"/>
			<Item Name="NIMS_string_Format Under String Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Under String Specifier.vi"/>
			<Item Name="NIMS_string_Format Under Unsigned Specifier.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Format Under Unsigned Specifier.vi"/>
			<Item Name="NIMS_string_Pad Decimal Point.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Pad Decimal Point.vi"/>
			<Item Name="NIMS_string_Pad Zero Ahead Under Precision.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Pad Zero Ahead Under Precision.vi"/>
			<Item Name="NIMS_string_Pad Zero Ahead Under Sharp Flag.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Pad Zero Ahead Under Sharp Flag.vi"/>
			<Item Name="NIMS_string_Split Format String.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Split Format String.vi"/>
			<Item Name="NIMS_string_Truncate String to Fit Width.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Truncate String to Fit Width.vi"/>
			<Item Name="NIMS_string_Validate Specifier String.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Validate Specifier String.vi"/>
			<Item Name="NIMS_string_Write Formatted Data to String (1D-DBL).vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/BuiltInFunctionSupport/string/NIMS_string_Write Formatted Data to String (1D-DBL).vi"/>
			<Item Name="NIMS_Struct_GetFieldNames.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Struct/NIMS_Struct_GetFieldNames.vi"/>
			<Item Name="NIMS_Struct_Global.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Struct/NIMS_Struct_Global.vi"/>
			<Item Name="NIMS_StructGetField.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Struct/NIMS_StructGetField.vi"/>
			<Item Name="NIMS_ThrowDWarn.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/NIMS_ThrowDWarn.vi"/>
			<Item Name="NIMS_V_Check_R2_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_V_Check_R2_Index.vi"/>
			<Item Name="NIMS_V_Check_R2_Index_1353A0FD6D51450C94F01964EB12A18D_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_V_Check_R2_Index_1353A0FD6D51450C94F01964EB12A18D.lvgen/NIMS_V_Check_R2_Index_1353A0FD6D51450C94F01964EB12A18D_000.vi"/>
			<Item Name="NIMS_V_Check_R3_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_V_Check_R3_Index.vi"/>
			<Item Name="NIMS_V_Check_R3_Index_4457740214EB4AD7A61A19C775A13C7D_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_V_Check_R3_Index_4457740214EB4AD7A61A19C775A13C7D.lvgen/NIMS_V_Check_R3_Index_4457740214EB4AD7A61A19C775A13C7D_000.vi"/>
			<Item Name="NIMS_V_Check_S_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_V_Check_S_Index.vi"/>
			<Item Name="NIMS_V_Check_S_Index_8603F0447AD2431085623D267539913D_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_V_Check_S_Index_8603F0447AD2431085623D267539913D.lvgen/NIMS_V_Check_S_Index_8603F0447AD2431085623D267539913D_000.vi"/>
			<Item Name="NIMS_V_Check_VorM_Index.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/VariableToken/Support/NIMS_V_Check_VorM_Index.vi"/>
			<Item Name="NIMS_V_Check_VorM_Index_56BF977C2B6F4627BAECD475811179CC_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_V_Check_VorM_Index_56BF977C2B6F4627BAECD475811179CC.lvgen/NIMS_V_Check_VorM_Index_56BF977C2B6F4627BAECD475811179CC_000.vi"/>
			<Item Name="NIMS_VariantHashTable_Insert.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/StdLib/HashTable/VariantBased/NIMS_VariantHashTable_Insert.vi"/>
			<Item Name="NIMS_VariantHashTable_Replace.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/StdLib/HashTable/VariantBased/NIMS_VariantHashTable_Replace.vi"/>
			<Item Name="NIMS_VariantTo2DData.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeSupport/NIMS_VariantTo2DData.vi"/>
			<Item Name="NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88_000.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88.lvgen/NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88_000.vi"/>
			<Item Name="NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88_001.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88.lvgen/NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88_001.vi"/>
			<Item Name="NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88_002.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88.lvgen/NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88_002.vi"/>
			<Item Name="NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88_003.vi" Type="VI" URL="/&lt;instcachedir&gt;/0/NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88.lvgen/NIMS_VariantTo2DData_BFC1EF87B5484A19BD438C2855441A88_003.vi"/>
			<Item Name="NIMS_WorkSpace.lvlib" Type="Library" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/SymbolTable/NIMS_WorkSpace.lvlib"/>
			<Item Name="nivision.dll" Type="Document" URL="nivision.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivissvc.dll" Type="Document" URL="nivissvc.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="RunTimeEnginePaths.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/Utility/RunTimeEnginePaths.ctl"/>
			<Item Name="Translate Error.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath/Functions/Error Handling/Translate Error.vi"/>
			<Item Name="UID Generator.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/WorkSpace/UID Generator.vi"/>
			<Item Name="Untranslate Error.vi" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath/Functions/Error Handling/Untranslate Error.vi"/>
			<Item Name="VariableType.ctl" Type="VI" URL="/&lt;vilib&gt;/imath/engines/lvmath2/RunTimeEngine/Managers/SymbolTable/VariableType.ctl"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
