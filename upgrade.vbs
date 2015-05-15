Dim connStr, objConn, getNames
'''''''''''''''''''''''''''''''''''''
'Define the driver and data source
'Access 2007, 2010, 2013 ACCDB:
'Provider=Microsoft.ACE.OLEDB.12.0
'Access 2000, 2002-2003 MDB:
'Provider=Microsoft.Jet.OLEDB.4.0
''''''''''''''''''''''''''''''''''''''
Set objArgs = WScript.Arguments 
For I = 0 to objArgs.Count - 1 
   FileName = objArgs(I) 
Next

connStr = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" & FileName  &_
"; Jet OLEDB:Database Password=pTfd_:PaL"
 
'Define object type
Set objConn = CreateObject("ADODB.Connection")
 
'Open Connection
objConn.open connStr
 
'Define recordset and SQL query
Set rs = objConn.execute("ALTER TABLE tblSettings ADD last_alert DATE")
 WScript.Echo "База обновлена" 

