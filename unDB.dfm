object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 716
  Width = 1125
  object FDConnection: TFDConnection
    Params.Strings = (
      'StringFormat=Unicode'
      ''
      'DriverID=MSAcc'
      'Password=pTfd_:PaL')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDPhysMSAccessDriverLink: TFDPhysMSAccessDriverLink
    OnDriverCreated = FDPhysMSAccessDriverLinkDriverCreated
    Left = 104
    Top = 16
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 168
    Top = 16
  end
  object FDOperatorQuery: TFDQuery
    BeforeOpen = FDOperatorQueryBeforeOpen
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT tblAutomat.auto_id AS ID, tblAutomat.Auto_name AS '#1053#1072#1080#1084#1077#1085#1086 +
        #1074#1072#1085#1080#1077', tblSubReg.Sumtickets AS '#1054#1089#1090#1072#1090#1086#1082', tblAutomat.comment AS '#1050#1086 +
        #1084#1084#1077#1085#1090#1072#1088#1080#1081
      
        'FROM tblAutomat LEFT JOIN (SELECT tblRegister.auto_id, Sum(tblRe' +
        'gister.tickets) AS [Sumtickets]'
      'FROM tblRegister'
      'WHERE (((tblRegister.transaction_date)<=:DATE))'
      
        'GROUP BY tblRegister.auto_id)  AS tblSubReg ON tblAutomat.auto_i' +
        'd = tblSubReg.auto_id'
      'ORDER BY tblAutomat.auto_id;')
    Left = 72
    Top = 104
    ParamData = <
      item
        Name = 'DATE'
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDPlugQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'INSERT INTO tblRegister (auto_id, tickets, transaction_date, com' +
        'ment)'
      'VALUES (:auto_id, :tickets, :transaction_date, :comment)')
    Left = 272
    Top = 104
    ParamData = <
      item
        Name = 'auto_id'
        ParamType = ptInput
      end
      item
        Name = 'tickets'
        ParamType = ptInput
      end
      item
        Name = 'transaction_date'
        ParamType = ptInput
      end
      item
        Name = 'comment'
        ParamType = ptInput
      end>
  end
  object FDCounterQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'INSERT INTO tblCounter (auto_id, counter_date, "counter")'
      'VALUES (:auto_id, :date, :counter)')
    Left = 352
    Top = 104
    ParamData = <
      item
        Name = 'auto_id'
        ParamType = ptInput
      end
      item
        Name = 'DATE'
        ParamType = ptInput
      end
      item
        Name = 'COUNTER'
        ParamType = ptInput
      end>
  end
  object FDCounterSelect: TFDQuery
    BeforeOpen = FDOperatorQueryBeforeOpen
    Connection = FDConnection
    SQL.Strings = (
      'SELECT Last(tblCounter.counter), Last(tblCounter.counter_date)'
      'FROM tblCounter'
      'WHERE (tblCounter.auto_id)=:auto_id;')
    Left = 616
    Top = 104
    ParamData = <
      item
        Name = 'AUTO_ID'
        ParamType = ptInput
      end>
  end
  object FDAutomatsQuery: TFDQuery
    BeforeOpen = FDAutomatsQueryBeforeOpen
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT tblAutomat.auto_id AS ID, tblAutomat.Auto_name AS '#1053#1072#1080#1084#1077#1085#1086 +
        #1074#1072#1085#1080#1077', tblcount.LastCounter AS '#1057#1095#1077#1090#1095#1080#1082', tblcount.counter_date AS' +
        ' '#1044#1072#1090#1072', tblAutomat.comment AS '#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      
        'FROM tblAutomat LEFT JOIN (SELECT Last(tblCounter.counter) AS [L' +
        'astCounter], tblCounter.auto_id, Last(tblCounter.counter_date) A' +
        'S counter_date'
      'FROM tblCounter'
      'WHERE (((tblCounter.counter_date)<=:date))'
      
        'GROUP BY tblCounter.auto_id) tblcount ON tblAutomat.auto_id=tblc' +
        'ount.auto_id;')
    Left = 72
    Top = 232
    ParamData = <
      item
        Name = 'DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = 41779d
      end>
  end
  object FDAutoAddQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'INSERT INTO tblAutomat (Auto_name, comment) VALUES (:auto_name, ' +
        ':comment)')
    Left = 272
    Top = 232
    ParamData = <
      item
        Name = 'AUTO_NAME'
        ParamType = ptInput
      end
      item
        Name = 'COMMENT'
        ParamType = ptInput
      end>
  end
  object FDAutoCounter: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'INSERT INTO tblCounter (auto_id, counter_date, "counter") '
      'VALUES (@@identity, :date, :counter)')
    Left = 352
    Top = 232
    ParamData = <
      item
        Name = 'DATE'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'COUNTER'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object FDAutoUpdate: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'UPDATE tblAutomat SET Auto_name=:auto_name,comment=:comment'
      'WHERE tblAutomat.auto_id=:auto_id')
    Left = 432
    Top = 232
    ParamData = <
      item
        Name = 'AUTO_NAME'
        ParamType = ptInput
      end
      item
        Name = 'COMMENT'
        ParamType = ptInput
      end
      item
        Name = 'AUTO_ID'
        ParamType = ptInput
      end>
  end
  object FDAutoDelete: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'DELETE FROM tblAutomat WHERE tblAutomat.auto_id=:auto_id')
    Left = 512
    Top = 232
    ParamData = <
      item
        Name = 'AUTO_ID'
        ParamType = ptInput
      end>
  end
  object FDAdminQuery: TFDQuery
    BeforeOpen = FDAdminQueryBeforeOpen
    Connection = FDConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT a.auto_id AS ID, a.Auto_name AS '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077', CounterF.Co' +
        'unterF AS ['#1057#1095#1077#1090#1095#1080#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072'], p.SumP AS ['#1042#1089#1090#1072#1074#1083#1077#1085#1086' '#1079#1072' '#1087 +
        #1077#1088#1080#1086#1076'], n.SumN AS ['#1042#1099#1076#1072#1085#1086' '#1079#1072' '#1087#1077#1088#1080#1086#1076'], CounterL.CounterL AS ['#1057#1095#1077#1090 +
        #1095#1080#1082' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072'], b.SumB AS ['#1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072'], Take.SumTa' +
        'ke AS ['#1042#1099#1088#1091#1095#1082#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076'], (ROUND(Take.SumTake/n.SumN, 2)) AS ['#1062 +
        #1077#1085#1072' '#1079#1072' 1]'
      
        'FROM (((((tblAutomat AS a LEFT JOIN (SELECT tblRegister.auto_id,' +
        ' Sum(tblRegister.tickets) AS [SumB]'
      'FROM tblRegister'
      'WHERE tblRegister.transaction_date<=:EndDate'
      
        'GROUP BY tblRegister.auto_id)  AS b ON a.auto_id=b.auto_id) LEFT' +
        ' JOIN (SELECT AdminTemp.auto_id, Sum(AdminTemp.tickets) AS [SumP' +
        ']'
      'FROM AdminTemp'
      'WHERE (AdminTemp.tickets)>0'
      
        'GROUP BY AdminTemp.auto_id)  AS p ON a.auto_id=p.auto_id) LEFT J' +
        'OIN (SELECT AdminTemp.auto_id, -Sum(AdminTemp.tickets) AS [SumN]'
      'FROM AdminTemp'
      'WHERE (AdminTemp.tickets)<0'
      
        'GROUP BY AdminTemp.auto_id)  AS n ON a.auto_id=n.auto_id) LEFT J' +
        'OIN (SELECT tblCounter.auto_id, Last(tblCounter.counter) AS [Cou' +
        'nterF]'
      'FROM tblCounter'
      'WHERE (tblCounter.counter_date)<=:BeginDate'
      
        'GROUP BY tblCounter.auto_id)  AS CounterF ON a.auto_id=CounterF.' +
        'auto_id) LEFT JOIN (SELECT tblCounter.auto_id, Last(tblCounter.c' +
        'ounter) AS [CounterL]'
      'FROM tblCounter'
      'WHERE (tblCounter.counter_date)<=:EndDate'
      
        'GROUP BY tblCounter.auto_id)  AS CounterL ON a.auto_id=CounterL.' +
        'auto_id) LEFT JOIN (SELECT tblTake.Auto_id, Sum(tblTake.take) AS' +
        ' [SumTake]'
      'FROM tblTake'
      
        'WHERE (tblTake.date_of_take)>=:BeginDate And (tblTake.date_of_ta' +
        'ke)<=:EndDate'
      'GROUP BY tblTake.Auto_id)  AS Take ON a.auto_id=Take.auto_id'
      'UNION ALL'
      
        'SELECT NULL AS ID, '#39#1057#1088#1077#1076#1085#1103#1103' '#1094#1077#1085#1072' '#1073#1080#1083#1077#1090#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076#39' AS '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085 +
        #1080#1077', null AS ['#1057#1095#1077#1090#1095#1080#1082' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072'], (Select sum(tickets) Fr' +
        'om AdminTemp Where (tickets>0) AND (Auto_id <> 1)) AS ['#1042#1089#1090#1072#1074#1083#1077#1085#1086 +
        ' '#1079#1072' '#1087#1077#1088#1080#1086#1076'], null AS ['#1042#1099#1076#1072#1085#1086' '#1079#1072' '#1087#1077#1088#1080#1086#1076'], null AS ['#1057#1095#1077#1090#1095#1080#1082' '#1085#1072' '#1082#1086#1085 +
        #1077#1094' '#1087#1077#1088#1080#1086#1076#1072'], null AS ['#1050#1086#1085#1090#1088#1086#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072'], null AS ['#1042#1099#1088#1091#1095#1082#1072' '#1079#1072' '#1087#1077 +
        #1088#1080#1086#1076'], ROUND(a.take/b.tickets, 2) AS ['#1062#1077#1085#1072' '#1079#1072' 1]'
      'FROM (SELECT Sum(tblTake.take) AS [take]'
      'FROM tblTake'
      
        'WHERE (tblTake.date_of_take)>=:BeginDate And (tblTake.date_of_ta' +
        'ke)<=:EndDate) as A , (SELECT -Sum(AdminTemp.tickets) AS [ticket' +
        's]'
      'FROM AdminTemp'
      
        'WHERE (((AdminTemp.tickets)<0) AND ((AdminTemp.auto_id)<>1))) AS' +
        ' B;')
    Left = 72
    Top = 168
    ParamData = <
      item
        Name = 'ENDDATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BEGINDATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDAdminTemp: TFDQuery
    BeforeExecute = FDAdminTempBeforeExecute
    Connection = FDConnection
    SQL.Strings = (
      'INSERT INTO AdminTemp ( auto_id, tickets, transaction_date )'
      
        'SELECT tblRegister.[auto_id], tblRegister.[tickets], tblRegister' +
        '.[transaction_date]'
      'FROM tblRegister'
      
        'WHERE tblRegister.transaction_date>=:BeginDate AND tblRegister.t' +
        'ransaction_date<=:EndDate')
    Left = 616
    Top = 168
    ParamData = <
      item
        Name = 'BEGINDATE'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'ENDDATE'
        ParamType = ptInput
      end>
  end
  object FDTake: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'INSERT INTO tblTake ( Auto_id, date_of_take, take )'
      'VALUES (:auto_id, :date, :take)')
    Left = 272
    Top = 168
    ParamData = <
      item
        Name = 'AUTO_ID'
        ParamType = ptInput
      end
      item
        Name = 'DATE'
        ParamType = ptInput
      end
      item
        Name = 'TAKE'
        ParamType = ptInput
      end>
  end
  object FDUsersQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT tblUsers.user_id AS ID, tblUsers.user_name AS '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083 +
        #1100', tblUsers.reg_date AS ['#1044#1072#1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080'], tblUsers.rights_leve' +
        'l AS ['#1059#1088#1086#1074#1077#1085#1100' '#1076#1086#1089#1090#1091#1087#1072']'
      'FROM tblUsers;')
    Left = 72
    Top = 296
  end
  object fdChangePass: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'UPDATE tblUsers SET tblUsers.password=:pass'
      'WHERE tblUsers.user_id=:user_id;')
    Left = 432
    Top = 296
    ParamData = <
      item
        Name = 'PASS'
        ParamType = ptInput
      end
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end>
  end
  object FDAddUser: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'INSERT INTO tblUsers (user_name, reg_date, "password", rights_le' +
        'vel)'
      'VALUES (:name, :date, :pass, :level)')
    Left = 272
    Top = 296
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        Name = 'DATE'
        ParamType = ptInput
      end
      item
        Name = 'PASS'
        ParamType = ptInput
      end
      item
        Name = 'LEVEL'
        ParamType = ptInput
      end>
  end
  object FDUpdateUser: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'UPDATE tblUsers SET user_name=:name, rights_level=:level'
      'WHERE user_id=:user_id')
    Left = 352
    Top = 296
    ParamData = <
      item
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        Name = 'LEVEL'
        ParamType = ptInput
      end
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end>
  end
  object FDLoginQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT * FROM tblUsers'
      'WHERE tblUsers.rights_level > 0')
    Left = 272
    Top = 16
  end
  object FDUpdateLog: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'INSERT INTO tblLog (user_id, transaction_id, date_time_log)'
      'VALUES (:user_id, @@identity, :date)')
    Left = 512
    Top = 104
    ParamData = <
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end
      item
        Name = 'DATE'
        ParamType = ptInput
      end>
  end
  object FDLogQuery: TFDQuery
    BeforeOpen = FDLogQueryBeforeOpen
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT tblUsers.user_name AS '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100', tblAutomat.Auto_name ' +
        'AS '#1040#1074#1090#1086#1084#1072#1090', tblRegister.tickets AS '#1041#1080#1083#1077#1090#1099', tblRegister.transacti' +
        'on_date AS "'#1044#1072#1090#1072' '#1076#1074#1080#1078#1077#1085#1080#1103'", tblLog.date_time_log AS "'#1044#1072#1090#1072' '#1088#1077#1072#1083#1100#1085 +
        #1072#1103'", tblRegister.comment AS '#1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      
        'FROM tblAutomat INNER JOIN (tblUsers INNER JOIN (tblRegister INN' +
        'ER JOIN tblLog ON tblRegister.transaction_id = tblLog.transactio' +
        'n_id) ON tblUsers.user_id = tblLog.user_id) ON tblAutomat.auto_i' +
        'd = tblRegister.auto_id'
      
        'WHERE (((tblLog.date_time_log)>=:BeginDate And (tblLog.date_time' +
        '_log)<=:EndDate));')
    Left = 72
    Top = 360
    ParamData = <
      item
        Name = 'BEGINDATE'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end
      item
        Name = 'ENDDATE'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object FDSettings: TFDQuery
    Connection = FDConnection
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvUpdateMode]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    SQL.Strings = (
      'SELECT * FROM tblSettings;')
    Left = 72
    Top = 424
  end
  object FDFixCounter: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'UPDATE tblCounter '
      'SET "counter" = :counter'
      'WHERE (auto_id = :auto_id) AND counter_date = :date')
    Left = 432
    Top = 104
    ParamData = <
      item
        Name = 'COUNTER'
        ParamType = ptInput
      end
      item
        Name = 'auto_id'
        ParamType = ptInput
      end
      item
        Name = 'DATE'
        ParamType = ptInput
      end>
  end
end
