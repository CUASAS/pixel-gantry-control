<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="11008008">
	<Property Name="CCSymbols" Type="Str"></Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Potting" Type="Folder"/>
		<Item Name="Shared Components" Type="Folder" URL="../Shared Components">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user.lib" Type="Folder">
				<Item Name="Aerotech.A3200.dll" Type="Document" URL="/&lt;userlib&gt;/aerotech/8.2/Bin/Aerotech.A3200.dll"/>
				<Item Name="Aerotech.A3200.LabVIEW.dll" Type="Document" URL="/&lt;userlib&gt;/aerotech/8.2/Bin/Aerotech.A3200.LabVIEW.dll"/>
				<Item Name="Connect.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Initialize/Connect.vi"/>
				<Item Name="Disconnect.vi" Type="VI" URL="/&lt;userlib&gt;/aerotech/8.2/Initialize/Disconnect.vi"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
