object DMModifyDatabase: TDMModifyDatabase
  OnCreate = DataModuleCreate
  Height = 1235
  Width = 4376
  object SQLQuery1: TFDQuery
    Connection = FDConnection1
    Left = 24
    Top = 592
  end
  object Directory_PrescriberCreate: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TABLE [dbo].[Directory_Prescriber]('
      #9'[SPI] [nchar](13) NULL,'
      #9'[DEA] [nchar](25) NULL,'
      #9'[StateLicenseNumber] [nchar](25) NULL,'
      #9'[SpecialtyCodePrimary] [nchar](3) NULL,'
      #9'[PrefixName] [nchar](10) NULL,'
      #9'[LastName] [nchar](35) NULL,'
      #9'[FirstName] [nchar](35) NULL,'
      #9'[MiddleName] [nchar](35) NULL,'
      #9'[SuffixName] [nchar](10) NULL,'
      #9'[ClinicName] [nchar](35) NULL,'
      #9'[AddressLine1] [nchar](35) NULL,'
      #9'[AddressLine2] [nchar](35) NULL,'
      #9'[City] [nchar](35) NULL,'
      #9'[State] [nchar](2) NULL,'
      #9'[Zip] [nchar](11) NULL,'
      #9'[PhonePrimary] [nchar](25) NULL,'
      #9'[Fax] [nchar](25) NULL,'
      #9'[Email] [nchar](80) NULL,'
      #9'[PhoneAlt1] [nchar](25) NULL,'
      #9'[PhoneAlt1Qualifier] [nchar](3) NULL,'
      #9'[PhoneAlt2] [nchar](25) NULL,'
      #9'[PhoneAlt2Qualifier] [nchar](3) NULL,'
      #9'[PhoneAlt3] [nchar](25) NULL,'
      #9'[PhoneAlt3Qualifier] [nchar](3) NULL,'
      #9'[PhoneAlt4] [nchar](25) NULL,'
      #9'[PhoneAlt4Qualifier] [nchar](3) NULL,'
      #9'[PhoneAlt5] [nchar](25) NULL,'
      #9'[PhoneAlt5Qualifier] [nchar](3) NULL,'
      #9'[ActiveStartTime] [nchar](22) NULL,'
      #9'[ActiveEndTime] [nchar](22) NULL,'
      #9'[ServiceLevel] [nchar](5) NULL,'
      #9'[PartnerAccount] [nchar](35) NULL,'
      #9'[LastModifiedDate] [nchar](22) NULL,'
      #9'[RecordChange] [nchar](1) NULL,'
      #9'[OldServiceLevel] [nchar](5) NULL,'
      #9'[TextServiceLevel] [nchar](100) NULL,'
      #9'[TextServiceLevelChange] [nchar](100) NULL,'
      #9'[Version] [nchar](5) NULL,'
      #9'[NPI] [nchar](10) NULL,'
      #9'[NPILocation] [nchar](13) NULL,'
      #9'[SpecialtyType1] [nchar](35) NULL,'
      #9'[SpecialtyType2] [nchar](35) NULL,'
      #9'[SpecialtyType3] [nchar](35) NULL,'
      #9'[SpecialtyType4] [nchar](35) NULL,'
      #9'[FileID] [nchar](35) NULL,'
      #9'[MedicareNumber] [nchar](35) NULL,'
      #9'[MedicaidNumber] [nchar](35) NULL,'
      #9'[DentistLicenseNumber] [nchar](35) NULL,'
      #9'[UPIN] [nchar](35) NULL,'
      #9'[PPONumber] [nchar](35) NULL,'
      #9'[SocialSecurity] [nchar](35) NULL,'
      #9'[PriorAuthorization] [nchar](35) NULL,'
      #9'[MutuallyDefined] [nchar](35) NULL,'
      #9'[InStoreNCPDPID] [nchar](7) NULL,'
      #9'[NO_PRESCRIBER] [int] IDENTITY(1,1) NOT NULL,'
      ' CONSTRAINT [PK_Directory_Prescriber] PRIMARY KEY CLUSTERED '
      '('
      #9'[NO_PRESCRIBER] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY]')
    Left = 88
    Top = 168
  end
  object CAMBIARACASH: TFDQuery
    AfterExecute = CAMBIARACASHAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[CAMBIARACASH]'
      #9'@PrecioV  Float,'
      #9'@Qty Float,'
      #9'@OTCNUMBER INT,'
      #9'@NORX bigint,'
      #9'@ATENDIDAPOR CHAR(3),'
      #9'@PHARMACIST CHAR(3),'
      #9'@CLAIMEDFROM CHAR(30)'
      'AS'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      #9'Update OTC set GUID = '#39#39', '
      #9'PLAN_MEDICO = '#39'CAS'#39', Terminada = 1,  TOTAL = @PrecioV, '
      
        #9'QTY = @Qty,Imprimir = 1, NUMERO_AUTORIZACION = '#39'N/A'#39', CLAIM_STA' +
        'TUS = 0'
      #9'where NUMERORECETA = @NORX;'
      
        #9'Update Surescripts set Rx_Status = 1 where RxReferenceNumber = ' +
        '@NORX;'
      
        #9'EXECUTE INSERT_LOG @CLAIMEDFROM, '#39'M'#39', '#39#39', @ATENDIDAPOR,  @PHARM' +
        'ACIST, @NORX, @OTCNUMBER,0,0,0,0,0,0,'#39'R'#39','#39#39',0,1;'
      '  commit'
      'end;')
    Left = 656
    Top = 625
  end
  object cdsPriceTable: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPriceTable'
    AfterPost = cdsPriceTableAfterPost
    BeforeDelete = cdsPriceTableAfterPost
    Left = 280
    Top = 656
    object cdsPriceTableCODE_RANGE: TWideStringField
      FieldName = 'CODE_RANGE'
      Origin = 'CODE_RANGE'
      FixedChar = True
      Size = 5
    end
    object cdsPriceTableDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object cdsPriceTableRANGEFROM: TFloatField
      FieldName = 'RANGEFROM'
      Origin = 'RANGEFROM'
      DisplayFormat = '#.00'
    end
    object cdsPriceTableRANGETO: TFloatField
      FieldName = 'RANGETO'
      Origin = 'RANGETO'
      DisplayFormat = '#.00'
    end
    object cdsPriceTableDISPFEEADDON: TFloatField
      FieldName = 'DISPFEEADDON'
      Origin = 'DISPFEEADDON'
      DisplayFormat = '#.00'
    end
    object cdsPriceTableDISPFEEMULTIPLIER: TFloatField
      FieldName = 'DISPFEEMULTIPLIER'
      Origin = 'DISPFEEMULTIPLIER'
      DisplayFormat = '#.00'
    end
    object cdsPriceTableCOSTADDON: TFloatField
      FieldName = 'COSTADDON'
      Origin = 'COSTADDON'
      DisplayFormat = '#.00'
    end
    object cdsPriceTableCOSTMULTIPLIER: TFloatField
      FieldName = 'COSTMULTIPLIER'
      Origin = 'COSTMULTIPLIER'
      DisplayFormat = '#.00'
    end
    object cdsPriceTablePRICE_TABLE_ID: TIntegerField
      FieldName = 'PRICE_TABLE_ID'
      Origin = 'PRICE_TABLE_ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object cdsPriceTableCOST_BASES: TWideStringField
      FieldName = 'COST_BASES'
      Origin = 'COST_BASES'
      FixedChar = True
      Size = 2
    end
    object cdsPriceTableDEFAULT_PRICE: TBooleanField
      DisplayLabel = 'Defaut Price'
      FieldName = 'DEFAULT_PRICE'
      Origin = 'DEFAULT_PRICE'
    end
    object cdsPriceTableDEFAULT_CASH_PRICE: TBooleanField
      FieldName = 'DEFAULT_CASH_PRICE'
      Origin = 'DEFAULT_CASH_PRICE'
    end
  end
  object dspPriceTable: TDataSetProvider
    DataSet = sqlPriceTable_FD
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 136
    Top = 656
  end
  object dsPriceTable: TDataSource
    DataSet = cdsPriceTable
    Left = 208
    Top = 656
  end
  object sqlPriceTable_FD: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from PRICE_TABLE')
    Left = 48
    Top = 656
  end
  object BACKUPDATABASE: TFDQuery
    AfterExecute = BACKUPDATABASEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[BACKUPDATABASE]'
      '@NewDatabaseName varchar(100),'
      '@database varchar(100),'
      '@backupDir varchar(500),'
      '@backupDate char(6)'
      'AS'
      'IF RIGHT(@backupDir, 1) = '#39'\'#39
      'SET @backupDir = @backupDir + @NewDatabaseName + '#39'.bak'#39
      'ELSE'
      'SET @backupDir = @backupDir + '#39'\'#39' + @NewDatabaseName + '#39'.bak'#39
      'BACKUP DATABASE @database'
      'TO DISK = @backupDir'
      'WITH STATS = 10'
      
        'EXECUTE INSERT_LOG '#39'Farmatec Backup'#39', '#39'B'#39', '#39#39', '#39#39', '#39#39', 0, 0,0,0,' +
        '0,0,0,0,'#39'R'#39','#39#39',0,1;')
    Left = 488
    Top = 56
  end
  object CALC_HEAD_TOTALS: TFDQuery
    AfterExecute = CALC_HEAD_TOTALSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[CALC_HEAD_TOTALS] (@INTRANS INTEGER)'
      'AS'
      '  SET NOCOUNT ON'
      #9'DECLARE @TAX_SERVICIO Float;'
      #9'DECLARE @TAXABLE_QTY_Servicio Float;'
      #9'DECLARE @INTotal Float;'
      #9'DECLARE @INRTotal Float;'
      #9'DECLARE @INFTotal Float;'
      #9'DECLARE @INItems Integer;'
      #9'DECLARE @INTax Float;'
      #9'DECLARE @TAXAMOUNT Float;'
      #9'DECLARE @TAXABLE_QTY_MUNICIPAL Float;'
      #9'DECLARE @TAXABLE_QTY_Estatal Float;'
      #9'DECLARE @InTotal_Estatal Float;'
      #9'DECLARE @TotalFinal Float;'
      #9'DECLARE @Estatal Float;'
      #9'DECLARE @Municipal Float;'
      #9'DECLARE @TAX_FOOD_MUNICIPAL_QTY Float;'
      #9'DECLARE @TAX_FOOD_ESTATAL_QTY Float;'
      #9'DECLARE @TMUNICIPAL_FOOD Float;'
      #9'DECLARE @TESTATAL_FOOD Float;'
      #9'DECLARE @FOOD VARCHAR(1);'
      #9'DECLARE @TOTAL_DISCOUNT FLOAT;'
      #9'DECLARE @TAXRATE_Estatal float;'
      #9'DECLARE @TAXRATE_Municipal float;'
      #9'DECLARE @TAXFROM float;'
      #9'DECLARE @SUBTOTAL FLOAT;'
      #9'DECLARE @NO_RECORDS INT;'
      'begin'
      #9'begin transaction'
      
        #9#9'Select @NO_RECORDS = COUNT(*) from TRANSACTIONDETAIL_TEMP wher' +
        'e TRANSACTIONNUMBER = @INTrans;'
      #9#9'if @NO_RECORDS > 0'
      #9#9'begin'
      
        #9#9#9'SELECT @TAXRATE_Estatal = TAX_RATE_ESTATAL, @TAXRATE_Municipa' +
        'l = TAX_RATE, @TAXFROM = TAX_RATE_FROM FROM CREDITDEBITSETUP; '
      #9#9#9'select @TAXABLE_QTY_Estatal = ISNULL(sum(total), 0) from'
      
        #9#9#9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and' +
        ' Tax_Estatal = '#39'T'#39';'
      #9#9#9'/* Cantidad que se cobrara Tax Municipal*/'
      #9#9#9'select @TAXABLE_QTY_MUNICIPAL = ISNULL(sum(total), 0) from'
      
        #9#9#9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and' +
        ' Tax_Municipal = '#39'T'#39';'
      ''
      #9#9#9'select @TAX_FOOD_MUNICIPAL_QTY = ISNULL(sum(total), 0) from'
      
        #9#9#9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and' +
        ' Tax_Municipal = '#39'T'#39' and Food = '#39'F'#39';'
      #9#9#9'select @TAX_FOOD_ESTATAL_QTY = ISNULL(sum(total), 0) from'
      
        #9#9#9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and' +
        ' Tax_Estatal = '#39'T'#39' and Food = '#39'F'#39';'
      ''
      ''
      #9#9#9'/* Tax por servicios */'
      #9#9#9'select @TAXABLE_QTY_Servicio = ISNULL(sum(total), 0) from'
      
        #9#9#9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and' +
        ' TAX_SERVICIO = 1;'
      #9#9#9'if @TAXABLE_QTY_Servicio <> 0'
      #9#9#9'begin'
      
        #9#9#9'select @TAX_SERVICIO = Round(ISNULL(@TAXABLE_QTY_Servicio,0) ' +
        '* .04, 2);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'select @TAX_SERVICIO = 0; '
      ''
      #9#9#9'/*  */'
      ''
      
        #9#9#9'select @InRTotal = sum(regtotal), @InItems = sum(qty), @TOTAL' +
        '_DISCOUNT = sum(DISCOUNT) from'
      
        #9#9#9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans AND' +
        ' PRODDEPARTMENT <> '#39'CASB'#39';'
      
        #9#9#9'select @InFTotal = sum(total) from TRANSACTIONDETAIL_TEMP whe' +
        're'
      #9#9#9'transactionnumber = @INTrans AND PRODDEPARTMENT <> '#39'CASB'#39';'
      ''
      #9#9#9'/* CALCULAR TAX */'
      #9#9#9'if (@TAXABLE_QTY_Estatal <> 0) and (@TAXFROM > 0)'
      #9#9#9'begin'
      
        #9#9#9'select @Estatal = Round(ISNULL(@TAXABLE_QTY_Estatal,0) * @TAX' +
        'RATE_Estatal, 2);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'Select @Estatal = 0;'
      ''
      ''
      #9#9#9'if (@TAXABLE_QTY_MUNICIPAL <> 0) and (@TAXFROM > 0)'
      #9#9#9'begin'
      
        #9#9#9'select @MUNICIPAL = Round(ISNULL(@TAXABLE_QTY_MUNICIPAL,0) * ' +
        '@TAXRATE_Municipal, 2);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'select @MUNICIPAL = 0;'
      #9#9#9'/*********************/'
      ' '
      #9#9#9'/*********************/'
      ''
      #9#9#9'/* CALCULAR TAX FOOD */'
      #9#9#9'if (@TAX_FOOD_ESTATAL_QTY > 0)'
      #9#9#9'begin'
      
        #9#9#9'select @TESTATAL_FOOD = Round(ISNULL(@TAX_FOOD_ESTATAL_QTY,0)' +
        ' * @TAXRATE_Estatal, 2);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'Select @TESTATAL_FOOD = 0;'
      ''
      #9#9#9'if (@TAX_FOOD_MUNICIPAL_QTY > 0)'
      #9#9#9'begin'
      
        #9#9#9'select @TMUNICIPAL_FOOD = Round(ISNULL(@TAX_FOOD_MUNICIPAL_QT' +
        'Y,0) * @TAXRATE_Municipal, 2);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'select @TMUNICIPAL_FOOD = 0;'
      #9#9#9'/************************/'
      #9#9#9'Select @SUBTOTAL = @InFTotal;'
      
        #9#9#9'Select @TotalFinal = @InFTotal + @MUNICIPAL + @ESTATAL + @TAX' +
        '_SERVICIO;'
      #9#9#9'update transactionheader_temp'
      
        #9#9#9'set Total = Round(@TotalFinal,2), RegTotal = @INRTotal, FoodT' +
        'otal = @InFTotal, numberitems = @InItems,'
      #9#9#9'SUBTOTAL = @SUBTOTAL,  '
      
        #9#9#9'TOTAL_TAX = Round(@MUNICIPAL + @ESTATAL,2),  TAX_ESTATAL = Ro' +
        'und(@ESTATAL, 2), TAX_SERVICIO = Round(@TAX_SERVICIO, 2),'
      
        #9#9#9'TAX = Round(@MUNICIPAL, 2), TAX_FOOD_ESTATAL = Round(@TESTATA' +
        'L_FOOD,2), TAX_FOOD_MUNICIPAL ='
      
        #9#9#9'Round(@TMUNICIPAL_FOOD,2), TOTAL_DISCOUNT = @TOTAL_DISCOUNT  ' +
        'where transactionnumber = @InTrans'
      
        #9#9#9'update TABS_DETAIL SET BALANCE = Round(@TotalFinal,2) where T' +
        'RANSACTIONNUMBER = @INTRANS;'
      #9#9'end;'#9#9
      #9'commit'
      'END;')
    Left = 1976
    Top = 624
  end
  object CALC_ORDER_TOTAL: TFDQuery
    AfterExecute = CALC_ORDER_TOTALAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[CALC_ORDER_TOTAL] (@INORDERID INTEGER)'
      'AS'
      '  SET NOCOUNT ON'
      '  declare @RTOTAL Float;'
      'begin'
      '  begin transaction '
      
        '  select @RTOTAL = sum(qtyreceived * costreceived / tamano / pac' +
        'kagesize)'
      '  from order_detail'
      '  where orderid = @INORDERID;'
      
        '  update order_header set Received = @RTotal where orderid = @IN' +
        'ORDERID;'
      '  commit'
      'end')
    Left = 496
    Top = 248
  end
  object CALCRXDISPONIBLE: TFDQuery
    AfterExecute = CALCRXDISPONIBLEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[CALCRXDISPONIBLE] @NO_RX BIGINT, @TOTALD' +
        'ISPONIBLE FLOAT OUTPUT'
      'AS'
      '  SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        '  Select  @TOTALDISPONIBLE = sum(CANTIDAD_DISPONIBLE) from Presc' +
        'riptions where NumeroReceta = @NO_RX;'
      '  commit'
      'end')
    Left = 656
    Top = 440
  end
  object CALCULARAUSPICIO: TFDQuery
    AfterExecute = CALCULARAUSPICIOAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[CALCULARAUSPICIO]'
      '@StrAuspicio float,'
      '@NoCliente Integer'
      'AS'
      'SET NOCOUNT ON'
      'BEGIN'
      '  begin transaction'
      
        '  Update pacientes set Auspicio = @StrAuspicio where NumeroClien' +
        'te = @NoCliente;'
      '  commit'
      'END')
    Left = 648
    Top = 536
  end
  object DELETE_PRINT_QUERIES: TFDQuery
    AfterExecute = DELETE_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[DELETE_PRINT_QUERIES] @ID INTEGER'
      'AS'
      'set NOCOUNT ON'
      'BEGIN'
      '  begin transaction'
      '    DELETE FROM PRINT_QUERIES WHERE ID = @ID'
      '  commit'
      'END')
    Left = 336
    Top = 816
  end
  object DELETE_SCANED_Q: TFDQuery
    AfterExecute = DELETE_SCANED_QAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE  PROCEDURE [dbo].[DELETE_SCANED_Q] @SCANED_RX_LINK INTEGE' +
        'R'
      'AS'
      'SET NOCOUNT ON'
      'DECLARE @TYPIST CHAR(3)'
      'DECLARE @NODOCTOR INT'
      'DECLARE @NOPAT INT'
      'DECLARE @NORX BIGINT'
      'DECLARE @OTCNUMBER INT'
      'DECLARE @PRODUCT_ID INT'
      'DECLARE @CONTROLADO CHAR(4)'
      'DECLARE @ISCONTROLLED BIT'
      'BEGIN'
      #9'begin transaction'#9#9' '
      
        #9#9'SELECT @TYPIST = ISNULL(TYPIST,'#39'NON'#39'), @NORX = RX_NUMBER FROM ' +
        'SCANED_QUEUE WHERE SCANED_RX_LINK = @SCANED_RX_LINK; '
      
        #9#9'UPDATE PRESCRIPTIONS SET SCANED_RX_LINK = @SCANED_RX_LINK wher' +
        'e NumeroReceta = @NORX;'
      
        #9#9'Select @NODOCTOR = NUMERODOCTOR, @NOPAT = NUMEROCLIENTE from P' +
        'RESCRIPTIONS where NumeroReceta = @NORX;'
      
        #9#9'Select @OTCNUMBER = MAX(OTCNUMBER) FROM OTC WHERE NUMERORECETA' +
        ' = @NORX;'
      
        #9#9'SELECT  @CONTROLADO = CONTROLADO, @PRODUCT_ID = PRODUCT_ID FRO' +
        'M OTC WHERE OTCNUMBER = @OTCNUMBER;'
      
        #9#9'IF RTRIM(@CONTROLADO) = '#39'RX'#39' SET @ISCONTROLLED = 0 ELSE SET @I' +
        'SCONTROLLED = 1;'
      
        #9#9'DELETE FROM SCANED_QUEUE WHERE SCANED_RX_LINK = @SCANED_RX_LIN' +
        'K; '
      
        #9#9'EXECUTE INSERT_LOG '#39'Scanned Rx'#39', '#39'A'#39', '#39#39', @TYPIST, '#39#39', @NORX, ' +
        '@OTCNUMBER, @NODOCTOR, @NOPAT,0,0,0 ,@PRODUCT_ID,'#39'R'#39','#39'Scanned pr' +
        'escriptions!'#39',@ISCONTROLLED,1;'
      #9'commit'
      'END')
    Left = 840
    Top = 376
  end
  object DEUDA: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[DEUDA] (@FECHA_DESDE  CHAR(10), @NO_CLIE' +
        'NTE INTEGER, @BALANCE FLOAT OUTPUT)'
      'AS'
      ' SET NOCOUNT ON'
      ' DECLARE @BALANCE_CREDITO FLOAT'
      ' DECLARE @BALANCE_DEBITO FLOAT'
      'BEGIN'
      '  begin transaction'
      
        '  SELECT @BALANCE_CREDITO = ISNULL(SUM(AMOUNT), 0) FROM CLIENTTR' +
        'ANSACTIONS WHERE DATEOFTRANS < @FECHA_DESDE AND CODE = '#39'CR'#39' AND ' +
        'CLIENTNO = @NO_CLIENTE;'
      
        '  SELECT @BALANCE_DEBITO =  ISNULL(SUM(AMOUNT), 0) FROM CLIENTTR' +
        'ANSACTIONS WHERE DATEOFTRANS < @FECHA_DESDE AND CODE = '#39'DB'#39' AND ' +
        'CLIENTNO = @NO_CLIENTE;'
      '  SELECT @BALANCE = (@BALANCE_DEBITO - @BALANCE_CREDITO);'
      '  commit'
      'END')
    Left = 848
    Top = 456
  end
  object EM_UPDATEINV: TFDQuery
    AfterExecute = EM_UPDATEINVAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[EM_UPDATEINV] ('
      '    @STRRBP DECIMAL(18,2),'
      '    @STRQTYINV DECIMAL(18,2),'
      '    @STRFECHAEXPI date,'
      '    @STRESPECIAL DECIMAL(18,2),'
      '    @STRCOMESPECIAL DATETIME,'
      '    @STRTERMESP DATETIME,'
      '    @STRPRICE DECIMAL(18,2),'
      '    @STRPRICE2 DECIMAL(18,2),'
      '    @STRCOST DECIMAL(18,2),'
      '    @STRLOTE CHAR (12),'
      '    @STRRECETARIO CHAR (1),'
      '    @PRODUCTNO INTEGER,'
      '    @NO_SUPLIDOR INTEGER,'
      '    @STRAWP FLOAT,'
      '    @TRANSFERED CHAR (1),'
      '    @PO CHAR (15),'
      '    @STRBC CHAR (14),'
      #9'@ATENDIDAPOR CHAR(3),'
      #9'@ORDER_ID INT)'
      'AS'
      'DECLARE @SUPPLIER_NAME CHAR(28)'
      'DECLARE @BALANCE DECIMAL(18,2)'
      'DECLARE @DRUG NCHAR(30)'
      'DECLARE @NDC NCHAR(11)'
      'DECLARE @CONTROLADO NCHAR(4)'
      'DECLARE @PISO_RECETARIO CHAR(1)'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        '    SELECT @SUPPLIER_NAME = SUPLIDOR FROM SUPLIDORES WHERE NUMER' +
        'OSUPLIDOR = @NO_SUPLIDOR;'
      #9'IF (@TRANSFERED = '#39'F'#39')'
      #9'begin'
      
        #9'  Update InventarioPiso set QTYINVENTARIO = QTYINVENTARIO + @st' +
        'rQtyInv,'
      
        #9'  FECHA_EXPIRACION = @strFechaExpi, ESPECIAL = @strEspecial, CO' +
        'MESPECIAL = @strComEspecial,'
      
        #9'  TERMINAESPECIAL = @strTermEsp, PRECIO = @strPrice, COSTO = @s' +
        'trCost, LOTE = @strLote,'
      
        #9'  NUMEROSUPLIDOR = @NO_SUPLIDOR, RBP = @STRAWP, PO = @PO, PRECI' +
        'OVENTA2 = @STRPRICE2,'
      #9'  STATUS = '#39'A'#39' where Productno = @PRODUCTNO;'
      #9'end'
      #9'else'
      #9'begin'
      
        #9'  Update InventarioPiso set QTYINVENTARIO = QTYINVENTARIO + @st' +
        'rQtyInv,'
      
        #9'  FECHA_EXPIRACION = @strFechaExpi, ESPECIAL = @strEspecial, CO' +
        'MESPECIAL = @strComEspecial,'
      
        #9'  TERMINAESPECIAL = @strTermEsp, PRECIO = @strPrice, COSTO = @s' +
        'trCost, LOTE = @strLote,'
      
        #9'  NUMEROSUPLIDOR = @NO_SUPLIDOR, RBP = @STRAWP, PO = @PO, PRECI' +
        'OVENTA2 = @STRPRICE2,'
      #9'  STATUS = '#39'A'#39' where CODIGOBARRA = @STRBC;'
      #9'end'
      
        #9'Select @BALANCE = QTYINVENTARIO, @DRUG = DESCRIPCION, @NDC = ND' +
        'C, @CONTROLADO = CONTROLADO, @PISO_RECETARIO = RECETARIO from IN' +
        'VENTARIOPISO where PRODUCTNO = @PRODUCTNO;'
      #9'if (@CONTROLADO <> '#39'RX'#39') AND (@PISO_RECETARIO = '#39'R'#39')'
      #9'begin'
      
        #9#9'exec ADD_EDIT_CONTROLED_LOG @ORDER_ID,  @SUPPLIER_NAME, '#39#39', '#39#39 +
        ', @strLote, @strFechaExpi, @BALANCE, @DRUG, @NDC, @ATENDIDAPOR, ' +
        '@CONTROLADO, 0, 0, 0, 0, @NO_SUPLIDOR, 0, @STRQTYINV,0;'
      #9'end;'
      '  commit'
      'end')
    Left = 848
    Top = 536
  end
  object FIXGROUP: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[FIXGROUP] @PNO   INTEGER,'
      '         @PRICE FLOAT,'
      '         @COST  FLOAT'
      'AS'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        '  UPDATE INVENTARIOPISO SET PRECIO = @PRICE, COSTO = @COST WHERE' +
        ' PRODUCTNO = @PNO;'
      '  commit'
      'end')
    Left = 848
    Top = 712
  end
  object GROUP_PROD_POS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[GROUP_PROD_POS] ('
      '    @PRECIOPAR FLOAT,'
      '    @COSTOPAR FLOAT,'
      '    @DEPTPAR INTEGER,'
      '    @SUBDPT INTEGER,'
      '    @GPNO INTEGER)'
      'AS'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      '  IF (@GPNo > 0)'
      
        '  Update InventarioPiso set Precio = @PrecioPar, Costo = @CostoP' +
        'ar, Departamento = @DeptPar, Sub_Departamento = @SubDpt'
      '  Where Group_ProductNo = @GPNo;'
      '  commit'
      'end')
    Left = 520
    Top = 816
  end
  object INSERT_ESIGNATURE: TFDQuery
    AfterExecute = INSERT_ESIGNATUREAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_ESIGNATURE]'
      '('
      '@ENCRIPPTED_SIGNATURE TEXT,'
      '@SIGNATURE_DATE DATE,'
      '@SIGNATURE_USER NCHAR(3),'
      '@PICKEDUP_BY_RELATION SMALLINT,'
      '@PICKEDUP_ID NCHAR(20),'
      '@NUMEROCLIENTE INT,'
      '@SAVE_PAT_SIGNATURE BIT,'
      '@PICKEDUP_BY NCHAR(45),'
      '@NORX BIGINT,'
      '@OTCNUMBER INT,'
      '@INSTANCIA INT,'
      '@SIGNATURE_LINK INT'
      ')'
      'AS'
      'DECLARE @TOKEN NCHAR(30)'
      'declare @Existingdate datetime'
      ''
      'SET NOCOUNT ON'
      'BEGIN '
      '  begin transaction'
      '    INSERT INTO [dbo].[PRESCRIPTION_ESIGNATURE]'
      '           ([ENCRIPPTED_SIGNATURE]'
      '           ,[SIGNATURE_DATE]'
      '           ,[SIGNATURE_USER]'
      '           ,[SIGNATURE_LINK]'
      '           ,[PICKEDUP_BY_RELATION]'
      '           ,[PICKEDUP_ID]'
      #9'   ,PICKEDUP_BY)'
      '     VALUES'
      '           (@ENCRIPPTED_SIGNATURE,'
      '           @SIGNATURE_DATE,'
      '           @SIGNATURE_USER,'
      '           @SIGNATURE_LINK,'
      '           @PICKEDUP_BY_RELATION,'
      '           @PICKEDUP_ID,'
      '           @PICKEDUP_BY)'
      ''
      #9'IF @SAVE_PAT_SIGNATURE = 1 '
      #9'begin'
      
        #9#9'UPDATE PACIENTES SET SIGNATURE_RX_LINK = @SIGNATURE_LINK WHERE' +
        ' NUMEROCLIENTE = @NUMEROCLIENTE AND SIGNATURE_RX_LINK IS NULL;'
      #9'end;'
      #9'Set @Existingdate=GETDATE()'#9#9
      #9'select FORMAT(@Existingdate,'#39'MM/dd/yyyy hh:mm:s tt'#39')'
      #9'SELECT @TOKEN = CONCAT(@SIGNATURE_USER, '#39' '#39', @Existingdate);'#9#9' '
      
        #9'DECLARE MyCursor CURSOR FOR SELECT NUMERORECETA, OTCNUMBER from' +
        ' PICK_UP where Instancia = @INSTANCIA;'
      #9'OPEN MyCursor'
      #9'FETCH NEXT FROM MyCursor'
      #9'INTO @NORX, @OTCNumber '
      #9'WHILE @@FETCH_STATUS = 0'
      #9'BEGIN'
      
        #9#9'Update OTC set Signature_link = @SIGNATURE_LINK, WF_SIGNATURE ' +
        '= @TOKEN where OTCNumber = @OTCNumber;'
      
        #9#9'EXECUTE INSERT_LOG '#39'PATIENT SIGNATURE CAPTURED'#39', '#39'A'#39', '#39#39', @SIG' +
        'NATURE_USER, '#39#39', @NORX, @OTCNUMBER,0,0,0,0,0,0,'#39'R'#39','#39#39',0,1;'
      #9#9'FETCH NEXT FROM MyCursor'
      #9#9'INTO @NORX, @OTCNumber'
      #9'END'
      #9'CLOSE MyCursor'
      #9'DEALLOCATE MyCursor    '
      #9'Delete from Pick_up where Instancia = @Instancia;'
      #9'Delete from Pick_up where Fecha < GETDATE()-1;'
      '  commit;'
      'END;')
    Left = 832
    Top = 80
  end
  object INSERT_PRINT_Q: TFDQuery
    AfterExecute = INSERT_PRINT_QAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[INSERT_PRINT_Q] @RX_ID BIGINT, @COPIES I' +
        'NT, @RX_OTC NCHAR(3), '
      
        '@LABEL_NAME NCHAR(50), @TYPIST nchar(4), @PRINTTOSCREEN BIT, @PA' +
        'TIENT NCHAR(45), @INDICATIONS NCHAR(296),'
      
        '@PRINTER_ID NCHAR(1), @PRINT_TYPE INT, @TRANS_NO INT, @TRANS_TYP' +
        'E NCHAR(4), @FINAL_RECEIPT BIT, @EMAIL NCHAR(80),'
      
        '@MOBILE_PHONE NCHAR(10), @CUSTOMER_NUMBER INT, @DELIVERY BIT, @Q' +
        'UOTE BIT, @PRINT_PAT_EDU BIT, @PRINTER_IP NCHAR(15)'
      'AS'
      'DECLARE @USER CHAR(3)'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      '    SELECT @USER = SUBSTRING(@TYPIST,1,3);'
      '    INSERT INTO [dbo].[PRINT_QUERIES]'
      #9#9'([RX_ID]'
      #9#9',[COPIES]'
      #9#9',[RX_OTC]'
      #9#9',[LABEL_NAME]'
      #9#9',[TYPIST]'
      #9#9',[PRINTTOSCREEN]'
      #9#9',[PATIENT]'
      #9#9',[INDICATIONS]'
      #9#9',[PRINTER_ID]'
      #9#9',[PRINT_TYPE]'
      #9#9',[TRANSACTION_NUMBER]'
      #9#9',[TRANS_TYPE]'
      #9#9',[FINAL_RECEIPT]'
      #9#9',[EMAIL]'
      #9#9',[MOBILE_PHONE]'
      #9#9',[CUSTOMER_NUMBER]'
      #9#9',[DELIVERY]'
      #9#9',[QUOTE]'
      #9#9',[PRINT_PATIENT_EDUCATION]'
      #9#9',[PRINTER_IP])'
      '     VALUES'
      
        '        (@RX_ID,@COPIES,@RX_OTC,@LABEL_NAME,@TYPIST, @PRINTTOSCR' +
        'EEN, @PATIENT, @INDICATIONS, @PRINTER_ID, '
      
        #9#9'@PRINT_TYPE, @TRANS_NO, @TRANS_TYPE, @FINAL_RECEIPT, @EMAIL, @' +
        'MOBILE_PHONE, @CUSTOMER_NUMBER, '
      #9#9'@DELIVERY, @QUOTE, @PRINT_PAT_EDU, @PRINTER_IP);'
      '  commit;'
      'end;')
    Left = 704
    Top = 288
  end
  object INSERT_TRANS: TFDQuery
    AfterExecute = INSERT_TRANSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[INSERT_TRANS](@TRANSACTIONNUMBER int,@UP' +
        'C char(14),@QTY real,@TOTAL real,'
      
        '@VOIDED int,@SUBDETAIL char(10),@PRODDESCRIPTION char(30),@PRODD' +
        'EPARTMENT char(20),'
      
        '@REGTOTAL real,@FOOD char(1),@PRICE DECIMAL(18,2), @REGPRICE rea' +
        'l,@MODIFIED smallint,@DISCOUNT real,'
      
        '@COSTO real,@FECHAVENTA CHAR(10),@SUPLIDOR int,@TOTAL_VALUE real' +
        ',@AWP real,@ID int,'
      
        '@PRODUCTNO int,@TAX_ESTATAL char(1),@TAX_MUNICIPAL varchar(1),@G' +
        'ROUP_PROD varchar(1),'
      
        '@REGISTER SMALLINT, @SUPER CHAR(3),@PATROCINIO SMALLINT, @SUBDPT' +
        ' SMALLINT,'
      
        '@BARCODEALTERNO1 nchar(20), @BARCODEALTERNO2 nchar(20), @BAG_NUM' +
        'BER INT, @OTC_NUMBER INT, @UTILIDAD BIT, @TAX_SERVICIO BIT,'
      
        '@NOTE NCHAR(30), @INSERT_NEW_PRODUCT BIT, @KITCHEN BIT, @MAIN_CO' +
        'URSE_ID INT, @MAIN_COURSE BIT, @INVCONTROL_RECIPE BIT,'
      '@TAX_PROCESSED_FOOD BIT, '
      
        '@BUTTON_QTY INT, @TRIPLES_PRODUCT BIT, @PSEUDO BIT, @PEP_SPRAY B' +
        'IT, @ALWDISC BIT, @FSA bit, @OTCCard bit, @DISCOUNT_PERCENTAGE D' +
        'ecimal(18,2),'
      
        '@SALES_PROMO bit, @DBName nchar(20), @Current_Identity INT OUTPU' +
        'T) '
      'AS'
      'DECLARE @PRODUCT_COUNT FLOAT'
      'DECLARE @SQL NVARCHAR(500);'
      'DECLARE @ID_ONFILE INT'
      'DECLARE @TAX_RATE FLOAT;'
      'DECLARE @PREV_PRICE DECIMAL(18,2)'
      'DECLARE @SALESMAN NCHAR(3)'
      'DECLARE @COMMISSION1 DECIMAL(18,2)'
      'DECLARE @COMMISSION2 DECIMAL(18,2)'
      'DECLARE @COMMISSION3 DECIMAL(18,2)'
      'DECLARE @PRICE1 DECIMAL(18,2)'
      'DECLARE @PRICE2 DECIMAL(18,2)'
      'DECLARE @PRICE3 DECIMAL(18,2)'
      'DECLARE @COMMISSION_VALUE FLOAT'
      'DECLARE @IS_COMMISSION_ACTIVE BIT'
      'DECLARE @RX_STATUS NCHAR(1)'
      'DECLARE @NO_RX BIGINT'
      'SET NOCOUNT ON'
      'BEGIN'
      #9'begin transaction'
      
        #9'Select @IS_COMMISSION_ACTIVE = ACTIVE_COMMISSIONS from CREDITDE' +
        'BITSETUP;'
      #9'IF @IS_COMMISSION_ACTIVE = 1 '
      #9'begin'
      
        #9#9'Exec @COMMISSION_VALUE = dbo.CALC_COMMISSION @PRODUCTNO, @PRIC' +
        'E, @QTY;'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'Select @COMMISSION_VALUE = 0; '
      #9'end; '
      #9'if rtrim(@UPC) = '#39'99999999994'#39' '
      #9'begin'
      
        #9'  Update TRANSACTIONHEADER_TEMP set UT_PAYMENT = @PRICE where T' +
        'RANSACTIONNUMBER = @TRANSACTIONNUMBER;'
      #9'end;'
      ''
      #9'/*'
      
        #9'SELECT @ID_ONFILE = IDNUMBER, @PREV_PRICE = PRICE, @Current_Ide' +
        'ntity = IDNUMBER FROM TRANSACTIONDETAIL_TEMP WHERE PRODUCTNO = @' +
        'PRODUCTNO AND TRANSACTIONNUMBER = @TRANSACTIONNUMBER;'
      
        #9'SELECT @PRODUCT_COUNT = SUM(QTY) + 1 FROM TRANSACTIONDETAIL_TEM' +
        'P WHERE PRODUCTNO = @PRODUCTNO AND TRANSACTIONNUMBER = @TRANSACT' +
        'IONNUMBER and PRICE = @PREV_PRICE;'
      
        #9'IF (@PRODUCT_COUNT > 0) AND (@INSERT_NEW_PRODUCT = 0) AND (@PRI' +
        'CE = @PREV_PRICE)  AND (@BAG_NUMBER = 0)'
      #9'begin'
      
        #9#9'Execute TRANSACTIONDETAIL_UPDATEPRICE @ID_ONFILE, @TRANSACTION' +
        'NUMBER, @PRODUCTNO,  @PRICE, @PRODUCT_COUNT, @TAX_RATE, @SUPER, ' +
        '0'
      #9'end'
      #9'else*/'
      #9'begin'
      #9#9'IF @OTC_NUMBER > 0'
      #9#9'BEGIN'
      
        #9#9#9'-- 1) Get RX_STATUS and NUMERORECETA for this specific OTCNUM' +
        'BER'
      #9#9#9'SET @SQL = N'#39
      #9#9#9#9'SELECT '
      #9#9#9#9#9'@RX_STATUS = RX_STATUS,'
      #9#9#9#9#9'@NO_RX     = NUMERORECETA'
      #9#9#9#9'FROM '#39' + QUOTENAME(@DBName) + N'#39'.dbo.OTC'
      #9#9#9#9'WHERE OTCNUMBER = @OTC_NUMBER;'
      #9#9#9#39';'
      ''
      #9#9#9'EXEC sp_executesql '
      #9#9#9#9'@SQL,'
      #9#9#9#9'N'#39'@RX_STATUS nchar(1) OUTPUT,'
      #9#9#9#9'  @NO_RX     bigint   OUTPUT,'
      #9#9#9#9'  @OTC_NUMBER int'#39','
      #9#9#9#9'@RX_STATUS  = @RX_STATUS  OUTPUT,'
      #9#9#9#9'@NO_RX      = @NO_RX      OUTPUT,'
      #9#9#9#9'@OTC_NUMBER = @OTC_NUMBER;'
      ''
      
        #9#9#9'-- 2) Only when this row is the '#39'C'#39' record, adjust the other ' +
        'one'
      #9#9#9'IF @RX_STATUS = '#39'C'#39
      #9#9#9'BEGIN'
      #9#9#9#9'-- Zero TOTAL only for the *other* record:'
      #9#9#9#9'--   same UPC (via @NO_RX in UPC pattern),'
      #9#9#9#9'--   RX_STATUS <> '#39'C'#39','
      #9#9#9#9'--   and OTCNUMBER <> @OTC_NUMBER'
      #9#9#9#9'SET @SQL = N'#39
      #9#9#9#9#9'UPDATE t'
      #9#9#9#9#9'SET t.TOTAL = 0'
      #9#9#9#9#9'FROM '#39' + N'#39'.dbo.TRANSACTIONDETAIL_TEMP t'
      #9#9#9#9#9'INNER JOIN '#39' + QUOTENAME(@DBName) + N'#39'.dbo.OTC o'
      #9#9#9#9#9#9'ON o.OTCNUMBER = t.OTC_NUMBER'
      
        #9#9#9#9#9'WHERE t.UPC LIKE '#39#39'%'#39#39' + CAST(@NO_RX AS varchar(50)) + '#39#39'%'#39 +
        #39
      #9#9#9#9#9'  AND o.RX_STATUS <> '#39#39'C'#39#39
      #9#9#9#9#9'  AND o.OTCNUMBER <> @OTC_NUMBER;'
      #9#9#9#9#39';'
      ''
      #9#9#9#9'EXEC sp_executesql '
      #9#9#9#9#9'@SQL,'
      #9#9#9#9#9'N'#39'@NO_RX bigint, @OTC_NUMBER int'#39','
      #9#9#9#9#9'@NO_RX      = @NO_RX,'
      #9#9#9#9#9'@OTC_NUMBER = @OTC_NUMBER;'
      ''
      #9#9#9'END;'
      #9#9#9'-- Optionally mark this C record as charged'
      #9#9#9'SET @SQL = N'#39
      #9#9#9#9'UPDATE '#39' + QUOTENAME(@DBName) + N'#39'.dbo.OTC'
      #9#9#9#9'SET COBRADO = @COBRADO'
      #9#9#9#9'WHERE OTCNUMBER = @OTC_NUMBER;'
      #9#9#9#39';'
      ''
      #9#9#9'EXEC sp_executesql'
      #9#9#9#9'@SQL,'
      #9#9#9#9'N'#39'@COBRADO char(1), @OTC_NUMBER int'#39','
      #9#9#9#9'@COBRADO   = '#39'T'#39','
      #9#9#9#9'@OTC_NUMBER = @OTC_NUMBER;'
      #9#9#9
      #9#9'END;'
      ''
      ''
      ''
      
        #9#9'Insert into TRANSACTIONDETAIL_TEMP(TRANSACTIONNUMBER, UPC, QTY' +
        ', TOTAL,VOIDED,SUBDETAIL,'
      
        #9#9'PRODDESCRIPTION, PRODDEPARTMENT, REGTOTAL, FOOD, PRICE, REGPRI' +
        'CE,MODIFIED, DISCOUNT, COSTO,'
      
        #9#9'FECHAVENTA, SUPLIDOR, TOTAL_VALUE, AWP, ID, PRODUCTNO, TAX_EST' +
        'ATAL,TAX_MUNICIPAL, OPENED,'
      
        #9#9'GROUP_PROD, REGISTER, SUPERVISOR, PATROCINIO, SUBDEPARTAMENTO,' +
        ' BARCODEALTERNO1, BARCODEALTERNO2,BAG_NUMBER,'
      
        #9#9'OTC_NUMBER, UTILIDAD, TAX_SERVICIO, NOTE, KITCHEN, MAIN_COURSE' +
        '_ID, MAIN_COURSE, INVCONTROL_RECIPE, BUTTON_QTY,'
      
        #9#9'COMMISSION, TAX_PROCESSED_FOOD, TRIPLES_PRODUCT, TRIPLES_COVER' +
        'ED, pseudo, pep_spray, ALWDISC, FSA, OTCCard, DISCOUNT_PERCENTAG' +
        'E, SALES_PROMO) '
      
        #9#9'Values (@TRANSACTIONNUMBER, @UPC, @QTY, @TOTAL, @VOIDED, @SUBD' +
        'ETAIL,'
      
        #9#9'@PRODDESCRIPTION, @PRODDEPARTMENT, @REGTOTAL, @FOOD, @PRICE,@R' +
        'EGPRICE, @MODIFIED,'
      
        #9#9'@DISCOUNT,@COSTO, @FECHAVENTA, @SUPLIDOR, @TOTAL_VALUE, @AWP, ' +
        '@ID, @PRODUCTNO,'
      
        #9#9'@TAX_ESTATAL, @TAX_MUNICIPAL, '#39'T'#39', @GROUP_PROD, @REGISTER, @SU' +
        'PER, @PATROCINIO, @SUBDPT, '
      
        #9#9'@BARCODEALTERNO1, @BARCODEALTERNO2, @BAG_NUMBER, @OTC_NUMBER, ' +
        '@UTILIDAD, @TAX_SERVICIO, @NOTE, @KITCHEN, @MAIN_COURSE_ID, @MAI' +
        'N_COURSE, @INVCONTROL_RECIPE, @BUTTON_QTY,'
      
        #9#9'@COMMISSION_VALUE, @TAX_PROCESSED_FOOD, @TRIPLES_PRODUCT, @TRI' +
        'PLES_PRODUCT, @PSEUDO, @PEP_SPRAY, @ALWDISC, @FSA, @OTCCard, @DI' +
        'SCOUNT_PERCENTAGE, @SALES_PROMO);'
      #9#9'SET @Current_Identity = SCOPE_IDENTITY()'
      #9'end;'
      #9'commit;'
      'END; ')
    Left = 1008
    Top = 472
  end
  object INSERT_TRANS_TEMP: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_TRANS_TEMP]'
      '(@TRANSACTIONNUMBER int,@UPC char(13),'
      '@QTY int, @TOTAL real, @REGTOTAL real,'
      '@FOOD char(1),@TAX_ESTATAL char(1),'
      '@TAX_MUNICIPAL varchar(1), @PRICE real,'
      '@IDNUMBER INT, @REGISTER SMALLINT)'
      'AS'
      'SET NOCOUNT ON'
      'BEGIN'
      'begin transaction'
      '  Insert into TRANSACTIONDETAIL_TEMP'
      '  (TRANSACTIONNUMBER, UPC, QTY,TOTAL, REGTOTAL,'
      '  FOOD, TAX_ESTATAL, TAX_MUNICIPAL,PRICE, IDNUMBER,'
      '  REGISTER)'
      '  VALUES'
      '  (@TRANSACTIONNUMBER, @UPC, @QTY, @TOTAL,@REGTOTAL,'
      '  @FOOD, @TAX_ESTATAL, @TAX_MUNICIPAL, @PRICE,'
      '  @IDNUMBER, @REGISTER);'
      '  commit'
      'END')
    Left = 1000
    Top = 552
  end
  object INSERT_TRANSACTION_CREDITO: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE  PROCEDURE [dbo].[INSERT_TRANSACTION_CREDITO]'
      ' (@CODE char(2), @AMOUNT float,  @ATTENDEDBY char(3),'
      '  @CLIENTNO Integer, @TRANSNO Integer)'
      ''
      'AS'
      'DECLARE @PERC_PATROCINIO FLOAT'
      'SET NOCOUNT ON'
      'BEGIN'
      #9'Begin Transaction'
      #9'if @CODE = '#39'PC'#39' '
      #9'begin'
      
        #9#9'Select @PERC_PATROCINIO = isNull(PORCIENTO_PATROCINIO,0) FROM ' +
        'CREDITDEBITSETUP;'
      
        #9#9'Select @AMOUNT = sum(Total) FROM TRANSACTIONDETAIL_TEMP where ' +
        'PATROCINIO <> 1 and TransactionNumber = @TRANSNO; '
      #9'if @AMOUNT > 0'
      #9'begin'
      #9#9'Select @AMOUNT = (@AMOUNT * @PERC_PATROCINIO);'
      #9'end;'
      #9'end;'
      #9'IF @AMOUNT > 0'
      #9'BEGIN'
      #9#9'Insert Into ClientTransactions'
      #9#9'(CODE, AMOUNT, DATEOFTRANS, ATTENDEDBY,'
      #9#9'CLIENTNO, TRANSNO, PAIDAMOUNT, BALANCE)'
      #9#9'Values'
      #9#9'(@CODE, @AMOUNT, GETDATE(), @ATTENDEDBY,'
      #9#9'@CLIENTNO, @TRANSNO, 0, 0);'
      #9'END'
      #9'Commit;'
      'END')
    Left = 1008
    Top = 632
  end
  object INSERTDIRECTORY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERTDIRECTORY]           '
      #9#9'   @SPI nchar(13),'
      '           @DEA nchar(25),'
      '           @StateLicenseNumber nchar(25),'
      '           @SpecialtyCodePrimary nchar(3),'
      '           @PrefixName nchar(10),'
      '           @LastName nchar(35),'
      '           @FirstName nchar(35),'
      '           @MiddleName nchar(35),'
      '           @SuffixName nchar(10),'
      '           @ClinicName nchar(35),'
      '           @AddressLine1 nchar(35),'
      '           @AddressLine2 nchar(35),'
      '           @City nchar(35),'
      '           @State nchar(2),'
      '           @Zip nchar(11),'
      '           @PhonePrimary nchar(25),'
      '           @Fax nchar(25),'
      '           @Email nchar(80),'
      '           @PhoneAlt1 nchar(25),'
      '           @PhoneAlt1Qualifier nchar(3),'
      '           @PhoneAlt2 nchar(25),'
      '           @PhoneAlt2Qualifier nchar(3),'
      '           @PhoneAlt3 nchar(25),'
      '           @PhoneAlt3Qualifier nchar(3),'
      '           @PhoneAlt4 nchar(25),'
      '           @PhoneAlt4Qualifier nchar(3),'
      '           @PhoneAlt5 nchar(25),'
      '           @PhoneAlt5Qualifier nchar(3),'
      '           @ActiveStartTime nchar(22),'
      '           @ActiveEndTime nchar(22),'
      '           @ServiceLevel nchar(5),'
      '           @PartnerAccount nchar(35),'
      '           @LastModifiedDate nchar(22),'
      '           @RecordChange nchar(1),'
      '           @OldServiceLevel nchar(5),'
      '           @TextServiceLevel nchar(100),'
      '           @TextServiceLevelChange nchar(100),'
      '           @Version nchar(5),'
      '           @NPI nchar(10),'
      '           @NPILocation nchar(13),'
      '           @SpecialtyType1 nchar(35),'
      '           @SpecialtyType2 nchar(35),'
      '           @SpecialtyType3 nchar(35),'
      '           @SpecialtyType4 nchar(35),'
      '           @FileID nchar(35),'
      '           @MedicareNumber nchar(35),'
      '           @MedicaidNumber nchar(35),'
      '           @DentistLicenseNumber nchar(35),'
      '           @UPIN nchar(35),'
      '           @PPONumber nchar(35),'
      '           @SocialSecurity nchar(35),'
      '           @PriorAuthorization nchar(35),'
      '           @MutuallyDefined nchar(35),'
      '           @InStoreNCPDPID nchar(7)'
      'AS'
      'SET NOCOUNT ON'
      'INSERT INTO [dbo].[Directory_Prescriber]'
      '           ([SPI]'
      '           ,[DEA]'
      '           ,[StateLicenseNumber]'
      '           ,[SpecialtyCodePrimary]'
      '           ,[PrefixName]'
      '           ,[LastName]'
      '           ,[FirstName]'
      '           ,[MiddleName]'
      '           ,[SuffixName]'
      '           ,[ClinicName]'
      '           ,[AddressLine1]'
      '           ,[AddressLine2]'
      '           ,[City]'
      '           ,[State]'
      '           ,[Zip]'
      '           ,[PhonePrimary]'
      '           ,[Fax]'
      '           ,[Email]'
      '           ,[PhoneAlt1]'
      '           ,[PhoneAlt1Qualifier]'
      '           ,[PhoneAlt2]'
      '           ,[PhoneAlt2Qualifier]'
      '           ,[PhoneAlt3]'
      '           ,[PhoneAlt3Qualifier]'
      '           ,[PhoneAlt4]'
      '           ,[PhoneAlt4Qualifier]'
      '           ,[PhoneAlt5]'
      '           ,[PhoneAlt5Qualifier]'
      '           ,[ActiveStartTime]'
      '           ,[ActiveEndTime]'
      '           ,[ServiceLevel]'
      '           ,[PartnerAccount]'
      '           ,[LastModifiedDate]'
      '           ,[RecordChange]'
      '           ,[OldServiceLevel]'
      '           ,[TextServiceLevel]'
      '           ,[TextServiceLevelChange]'
      '           ,[Version]'
      '           ,[NPI]'
      '           ,[NPILocation]'
      '           ,[SpecialtyType1]'
      '           ,[SpecialtyType2]'
      '           ,[SpecialtyType3]'
      '           ,[SpecialtyType4]'
      '           ,[FileID]'
      '           ,[MedicareNumber]'
      '           ,[MedicaidNumber]'
      '           ,[DentistLicenseNumber]'
      '           ,[UPIN]'
      '           ,[PPONumber]'
      '           ,[SocialSecurity]'
      '           ,[PriorAuthorization]'
      '           ,[MutuallyDefined]'
      '           ,[InStoreNCPDPID])'
      '     VALUES'
      '           (@SPI,'
      '           @DEA,'
      '           @StateLicenseNumber,'
      '           @SpecialtyCodePrimary,'
      '           @PrefixName,'
      '           @LastName,'
      '           @FirstName,'
      '           @MiddleName,'
      '           @SuffixName,'
      '           @ClinicName,'
      '           @AddressLine1,'
      '           @AddressLine2,'
      '           @City, '
      '           @State,'
      '           @Zip,'
      '           @PhonePrimary, '
      '           @Fax,'
      '           @Email, '
      '           @PhoneAlt1,'
      '           @PhoneAlt1Qualifier,'
      '           @PhoneAlt2,'
      '           @PhoneAlt2Qualifier,'
      '           @PhoneAlt3,'
      '           @PhoneAlt3Qualifier,'
      '           @PhoneAlt4,'
      '           @PhoneAlt4Qualifier,'
      '           @PhoneAlt5,'
      '           @PhoneAlt5Qualifier,'
      '           @ActiveStartTime,'
      '           @ActiveEndTime,'
      '           @ServiceLevel,'
      '           @PartnerAccount,'
      '           @LastModifiedDate,'
      '           @RecordChange,'
      '           @OldServiceLevel,'
      '           @TextServiceLevel,'
      '           @TextServiceLevelChange,'
      '           @Version,'
      '           @NPI,'
      '           @NPILocation,'
      '           @SpecialtyType1,'
      '           @SpecialtyType2,'
      '           @SpecialtyType3,'
      '           @SpecialtyType4,'
      '           @FileID,'
      '           @MedicareNumber,'
      '           @MedicaidNumber,'
      '           @DentistLicenseNumber,'
      '           @UPIN, '
      '           @PPONumber,'
      '           @SocialSecurity, '
      '           @PriorAuthorization,'
      '           @MutuallyDefined,'
      '           @InStoreNCPDPID)')
    Left = 1016
    Top = 712
  end
  object INSERTINVENTORY: TFDQuery
    AfterExecute = INSERTINVENTORYAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERTINVENTORY]'
      '   @TIPO char(3),'
      '   @CODIGO char(1),'
      '   @COSTO FLOAT,'
      '   @RBP FLOAT,'
      '   @ESPECIAL FLOAT,'
      '   @DEPARTAMENTO int,'
      '   @LOTE char(12),'
      '   @PRECIO FLOAT,'
      '   @PORCIENTODESCUENTO char(1),'
      '   @ULTIMOCAMBIO char(30),'
      '   @QTYINVENTARIO FLOAT,'
      '   @CMAXINVENTARIO FLOAT,'
      '   @CMININVENTARIO FLOAT,'
      '   @NDC char(11),'
      '   @CODIGOBARRA char(14),'
      '   @FOODITEM int,'
      '   @NONEBC int,'
      '   @NUMEROSUPLIDOR int,'
      '   @EDITAR_PRECIO char(5),'
      '   @SUB_DEPARTAMENTO int,'
      '   @DESCRIPCION char(35),'
      '   @CASA_FARMACEUTICA char(35),'
      '   @ROUTEOFADMINISTRATION char(16),'
      '   @CONTROLADO char(4),'
      '   @STRENGTH char(25),'
      '   @INFOADICIONAL char(25),'
      '   @METRICSIZE FLOAT,'
      '   @CAUTION1 int,'
      '   @CAUTION2 int,'
      '   @CAUTION3 int,'
      '   @GENERICNAME char(60),'
      '   @TXR char(8),'
      '   @BRAND char(1),'
      '   @GROUP_PRODUCTNO int,'
      '   @RECETARIO char(1),'
      '   @GROUP_QTY int,'
      '   @PRECIO_CAJA FLOAT,'
      '   @QTY_CAJA FLOAT,'
      '   @DESCUENTO char(1),'
      '   @IMAGE_CODE char(9),'
      '   @PACKAGESIZE int,'
      '   @TXR_EXTENSION char(14),'
      '   @STATUS char(1),'
      '   @TAXABLE char(1),'
      '   @FECHA_EXPIRACION CHAR(10),'
      '   @COMESPECIAL char(10),'
      '   @TERMINAESPECIAL char(10)'
      'AS'
      'SET NOCOUNT ON'
      'begin'
      #9'begin transaction'
      #9'INSERT INTO INVENTARIOPISO'
      
        #9'  (TIPO, CODIGO,COSTO,RBP,ESPECIAL,DEPARTAMENTO,LOTE,PRECIO,POR' +
        'CIENTODESCUENTO,ULTIMOCAMBIO,QTYINVENTARIO,CMAXINVENTARIO,CMININ' +
        'VENTARIO,NDC,CODIGOBARRA,NUMEROSUPLIDOR,EDITAR_PRECIO,SUB_DEPART' +
        'AMENTO,GROUP_QTY,CASA_FARMACEUTICA,ROUTEOFADMINISTRATION,CONTROL' +
        'ADO,STRENGTH,INFOADICIONAL,METRICSIZE,PRECIO_CAJA,DESCUENTO,CAUT' +
        'ION1,CAUTION2,CAUTION3,QTY_CAJA,GENERICNAME,TXR,BRAND,GROUP_PROD' +
        'UCTNO,RECETARIO,DESCRIPCION,PACKAGESIZE,FOODITEM,NONEBC,IMAGE_CO' +
        'DE,TXR_EXTENSION,STATUS,TAXABLE, FECHA_EXPIRACION, TERMINAESPECI' +
        'AL, COMESPECIAL)'
      #9'VALUES'
      
        #9'  (@TIPO, @CODIGO,@COSTO,@RBP,@ESPECIAL,@DEPARTAMENTO,@LOTE,@PR' +
        'ECIO,@PORCIENTODESCUENTO,@ULTIMOCAMBIO,@QTYINVENTARIO,@CMAXINVEN' +
        'TARIO,@CMININVENTARIO,@NDC,@CODIGOBARRA,@NUMEROSUPLIDOR,@EDITAR_' +
        'PRECIO,@SUB_DEPARTAMENTO,@GROUP_QTY,@CASA_FARMACEUTICA,@ROUTEOFA' +
        'DMINISTRATION,@CONTROLADO,@STRENGTH,@INFOADICIONAL,@METRICSIZE,@' +
        'PRECIO_CAJA,@DESCUENTO,@CAUTION1,@CAUTION2,@CAUTION3,@QTY_CAJA,@' +
        'GENERICNAME,@TXR,@BRAND,@GROUP_PRODUCTNO,@RECETARIO,@DESCRIPCION' +
        ',@PACKAGESIZE,@FOODITEM,@NONEBC,@IMAGE_CODE,@TXR_EXTENSION,@STAT' +
        'US,@TAXABLE, @FECHA_EXPIRACION, @TERMINAESPECIAL, @COMESPECIAL)'
      #9'commit;'
      'end;')
    Left = 688
    Top = 832
  end
  object INSERTPACIENTE: TFDQuery
    AfterExecute = INSERTPACIENTEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE  Procedure [dbo].[INSERTPACIENTE]'
      '  @NOMBRE char(12),'
      '  @CARDHOLDERID char(18),'
      '  @SEXO int,'
      '  @DIRECCION1 char(30),'
      '  @DIRECCION2 char(30),'
      '  @DEUDA real,'
      '  @LIMITECREDITO real,'
      '  @INTERES char(1),'
      '  @DIRECCIONFISICA char(50),'
      '  @APELLIDOPATERNO char(15),'
      '  @APELLIDOMATERNO char(15),'
      '  @TELEFONO char(13),'
      '  @CODIGOPOSTAL char(12),'
      '  @FAX char(13),'
      '  @CELULAR char(13),'
      '  @EMAIL char(40),'
      '  @LAWAY real,'
      '  @ESTADO char(2),'
      '  @AUSPICIO real,'
      '  @SOCIO varchar(12),'
      '  @ORIENTACION char(5),'
      '  @IDENTIFICACION char(20),'
      '  @SMOKER char(1),'
      '  @LOCATION char(2),'
      '  @EMPLOYER_ID char(15),'
      '  @PATIENT_ID_QUAL char(2),'
      '  @PREGNANCY_IDICATOR char(1),'
      '  @DEUDA_WEB real,'
      '  @LANGUAGE char(7),'
      '  @INFOADICIONAL varchar(100),'
      '  @CONSULTA varchar(100),'
      '  @CIUDAD char(20),'
      '  @FECHANACIMIENTO varchar(20),'
      '  @NUMEROCLIENTE INT,'
      '  @FECHA_HIPPA CHAR(10)'
      '  AS'
      '  SET NOCOUNT ON'
      '  begin transaction'
      
        #9'  INSERT INTO PACIENTES (NOMBRE, CARDHOLDERID, SEXO, DIRECCION1' +
        ', DIRECCION2,'
      #9'  DEUDA, LIMITECREDITO, INTERES, DIRECCIONFISICA,'
      
        #9'  APELLIDOPATERNO, APELLIDOMATERNO, TELEFONO, CODIGOPOSTAL, FAX' +
        ', CELULAR, EMAIL, LAWAY,'
      
        #9'  ESTADO, AUSPICIO, SOCIO, ORIENTACION, IDENTIFICACION, SMOKER,' +
        ' LOCATION, EMPLOYER_ID,'
      
        #9'  PATIENT_ID_QUAL, PREGNANCY_IDICATOR, DEUDA_WEB, LANGUAGE, INF' +
        'OADICIONAL,'
      
        #9'  CONSULTA, CIUDAD, FECHANACIMIENTO, NUMEROCLIENTE, FECHA_HIPPA' +
        ')'
      #9'  VALUES'
      #9'  (@NOMBRE, @CARDHOLDERID, @SEXO, @DIRECCION1, @DIRECCION2,'
      #9'  @DEUDA, @LIMITECREDITO, @INTERES, @DIRECCIONFISICA,'
      
        #9'  @APELLIDOPATERNO, @APELLIDOMATERNO, @TELEFONO, @CODIGOPOSTAL,' +
        ' @FAX, @CELULAR, @EMAIL, @LAWAY,'
      
        #9'  @ESTADO, @AUSPICIO, @SOCIO, @ORIENTACION, @IDENTIFICACION, @S' +
        'MOKER, @LOCATION, @EMPLOYER_ID,'
      
        #9'  @PATIENT_ID_QUAL, @PREGNANCY_IDICATOR,  @DEUDA_WEB, @LANGUAGE' +
        ', @INFOADICIONAL,'
      
        #9'  @CONSULTA, @CIUDAD, @FECHANACIMIENTO, @NUMEROCLIENTE, @FECHA_' +
        'HIPPA)'
      '  commit;')
    Left = 832
    Top = 160
  end
  object INSERTPRODUCT: TFDQuery
    AfterExecute = INSERTPRODUCTAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[INSERTPRODUCT] (@TIPOSTR                ' +
        '  CHAR(3),'
      '         @COSTOSTR                 FLOAT,'
      '         @RBPSTR                   FLOAT,'
      '         @PRECIOSTR                FLOAT,'
      '         @NDCSTR                   CHAR(11),'
      '         @CODIGOBARRASTR           CHAR(14),'
      '         @DESCRIPCIONSTR           CHAR(35),'
      '         @CASA_FARMACEUTICASTR     CHAR(35),'
      '         @ROUTEOFADMINISTRATIONSTR CHAR(16),'
      '         @CONTROLADOSTR            CHAR(4),'
      '         @STRENGTHSTR              CHAR(25),'
      '         @METRICSIZESTR            FLOAT,'
      '         @PACKAGESIZESTR           SMALLINT,'
      '         @CAUTION1STR              INTEGER,'
      '         @CAUTION2STR              INTEGER,'
      '         @CAUTION3STR              INTEGER,'
      '         @GENERICNAMESTR           CHAR(60),'
      '         @TXRSTR                   CHAR(8),'
      '         @BRANDSTR                 CHAR(1),'
      '         @TXR_EXTENSIONSTR         CHAR(14),'
      '         @IMAGE_CODESTR            CHAR(9))'
      'AS'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        '  Insert into InventarioPiso (TIPO, COSTO, RBP, PRECIO, QTYINVEN' +
        'TARIO, NDC, CODIGOBARRA, FOODITEM, NONEBC,'
      
        '                           DESCRIPCION, CASA_FARMACEUTICA, ROUTE' +
        'OFADMINISTRATION,'
      
        '                           CONTROLADO, STRENGTH, METRICSIZE, PAC' +
        'KAGESIZE, CAUTION1, CAUTION2, CAUTION3,'
      
        '                           GENERICNAME, TXR, BRAND, TXR_EXTENSIO' +
        'N, IMAGE_CODE, RECETARIO)'
      
        '                           Values (@TIPOstr, @COSTOstr, @RBPstr,' +
        ' @PRECIOstr, 0, @NDCstr, @CODIGOBARRAstr, 0, 0,'
      
        '                           @DESCRIPCIONstr, @CASA_FARMACEUTICAst' +
        'r, @ROUTEOFADMINISTRATIONstr,'
      
        '                           @CONTROLADOstr, @STRENGTHstr, @METRIC' +
        'SIZEstr, @PACKAGESIZEstr, @CAUTION1str, @CAUTION2str, @CAUTION3s' +
        'tr,'
      
        '                           @GENERICNAMEstr, @TXRstr, @BRANDstr, ' +
        '@TXR_EXTENSIONstr, @IMAGE_CODEstr, '#39'R'#39');'
      'commit'
      'end')
    Left = 672
    Top = 224
  end
  object LAST_IDENTITY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[LAST_IDENTITY]'
      ' @LASTIDENTITY INTEGER OUTPUT'
      'AS'
      'BEGIN'
      ' SELECT @LASTIDENTITY = @@Identity'
      'END')
    Left = 840
    Top = 288
  end
  object NEXTBARCODE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[NEXTBARCODE] @BARCODE_NO INTEGER OUTPUT'
      'AS'
      'begin'
      '  begin transaction'
      '  Update NEXT_RXNUMBER SET BARCODE = BARCODE + 1;'
      '  Select @BARCODE_NO = (BARCODE) FROM NEXT_RXNUMBER;'
      '  commit'
      'end')
    Left = 1144
    Top = 496
  end
  object NEXTINSTANCIA: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[NEXTINSTANCIA] @INSTANCIA INTEGER OUTPUT'
      'AS'
      '    DECLARE @NO Integer;'
      'begin'
      '  begin transaction'
      '  Select @NO = INSTANCIA FROM NEXT_RXNUMBER'
      '  if @NO < 5000'
      '  begin'
      '    Update NEXT_RXNUMBER SET INSTANCIA = INSTANCIA + 1;'
      '    Select @INSTANCIA = (INSTANCIA) FROM NEXT_RXNUMBER;'
      '  end'
      '  else'
      '  begin'
      '    Update NEXT_RXNUMBER SET INSTANCIA = 1;'
      '    Select @INSTANCIA = (INSTANCIA) FROM NEXT_RXNUMBER;'
      '  end'
      '  commit'
      'end')
    Left = 1152
    Top = 576
  end
  object NEXTINSTANCIA_SIGNATURE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[NEXTINSTANCIA_SIGNATURE] @INSTANCIA_SIGN' +
        'ATURE INTEGER OUTPUT'
      'AS'
      '    DECLARE @NO Integer;'
      'begin'
      '  begin transaction'
      '  Select @NO = INSTANCIA_SIGNATURE FROM NEXT_RXNUMBER '
      '  if @NO < 5000 '
      '  begin '
      
        '    Update NEXT_RXNUMBER SET INSTANCIA_SIGNATURE = INSTANCIA_SIG' +
        'NATURE + 1;'
      
        '    Select @INSTANCIA_SIGNATURE = (INSTANCIA_SIGNATURE) FROM NEX' +
        'T_RXNUMBER;'
      '  end'
      '  else '
      '  begin'
      '    Update NEXT_RXNUMBER SET INSTANCIA_SIGNATURE = 1;'
      
        '    Select @INSTANCIA_SIGNATURE = (INSTANCIA_SIGNATURE) FROM NEX' +
        'T_RXNUMBER; '
      '  end'
      '  commit'
      'end')
    Left = 1152
    Top = 656
  end
  object TRANSACTIONDETAIL_CANCELTRANS: TFDQuery
    AfterExecute = TRANSACTIONDETAIL_CANCELTRANSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[TRANSACTIONDETAIL_CANCELTRANS] @TRANNO I' +
        'NT'
      'AS'
      'SET NOCOUNT ON'
      'BEGIN  '
      #9'begin transaction'
      #9'if @TRANNO > 1'
      #9'begin'
      
        #9#9'delete from TRANSACTIONHEADER_TEMP where TRANSACTIONNUMBER = @' +
        'TRANNO;'
      
        #9#9'DELETE FROM TRANSACTIONDETAIL_TEMP WHERE TransactionNumber = @' +
        'TRANNO;'
      
        #9#9'UPDATE TRANSACTIONHEADER SET VOIDED = 1 WHERE TRANSACTIONNUMBE' +
        'R = @TRANNO;'
      
        #9#9'UPDATE TRANSACTIONDETAIL SET VOIDED = 1 WHERE TRANSACTIONNUMBE' +
        'R = @TRANNO;'
      #9#9'Delete From CLIENTTRANSACTIONS where TransNo = @TRANNO;'
      #9#9'Exec CANCEL_TABS @TRANNO; '
      #9#9'end;'
      #9'commit'
      'END')
    Left = 880
    Top = 832
  end
  object TRANSACTIONDETAIL_DELETE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE  PROCEDURE [dbo].[TRANSACTIONDETAIL_DELETE] @REGISTER INT' +
        ', @TNUMBER INT'
      'AS'
      'DECLARE @ID INT'
      'DECLARE @QTY FLOAT'
      'DECLARE @PRODUCTID INT'
      '  SET NOCOUNT ON'
      'BEGIN'
      '  begin transaction'
      '  INSERT INTO TRANSACTIONHEADER'
      '   SELECT *'
      
        '   FROM TRANSACTIONHEADER_TEMP WHERE TRANSACTIONNUMBER = @TNUMBE' +
        'R;'
      
        '  DELETE FROM TRANSACTIONHEADER_TEMP WHERE TRANSACTIONNUMBER = @' +
        'TNUMBER;'
      '  INSERT INTO TRANSACTIONDETAIL'
      
        '    SELECT * FROM TRANSACTIONDETAIL_TEMP WHERE TRANSACTIONNUMBER' +
        ' = @TNUMBER;'
      
        '  DELETE FROM TRANSACTIONDETAIL_TEMP WHERE OPENED = '#39'T'#39' AND TRAN' +
        'SACTIONNUMBER = @TNUMBER;   '
      
        '  --DELETE FROM TRANSACTIONHEADER_TEMP WHERE OPENED <> '#39'S'#39' AND O' +
        'PENED <> '#39'H'#39' AND TRANSACTIONNUMBER = @TNUMBER;'
      
        '  --DELETE FROM TRANSACTIONHEADER_TEMP WHERE OPENED <> '#39'S'#39' AND O' +
        'PENED <> '#39'H'#39' and TRANSACTIONDATE < dateadd(day, -4, getdate());'
      
        '  --DELETE FROM TRANSACTIONDETAIL_TEMP WHERE OPENED <> '#39'S'#39' AND O' +
        'PENED <> '#39'H'#39' and FECHAVENTA < dateadd(day, -4, getdate());'
      '  Exec CANCEL_TABS @TNUMBER;'
      '  commit'
      'END;')
    Left = 888
    Top = 912
  end
  object TRANSACTIONDETAIL_DELETE_PRODUCT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[TRANSACTIONDETAIL_DELETE_PRODUCT] @IDNUM' +
        'BER INT, @NO_RX INT, @TRIPLES_BALANCE real output, @DBName nchar' +
        '(20)  '
      'AS'
      '  set nocount on'
      '  DECLARE @TRANS_NO INTEGER;'
      '  DECLARE @MAIN_COURSE_ID INTEGER;'
      '  DECLARE @PRODUCT_NO INTEGER;'
      '  DECLARE @HAS_MODIFIER BIT;'
      '  DECLARE @OTCNUMBER Integer;'
      '  DECLARE @RECORDCOUNT INTEGER;'
      '  DECLARE @BAG_NUMBER INT;'
      '  DECLARE @SQL NVARCHAR(500);'
      ''
      'BEGIN'
      #9'begin transaction    '
      
        #9#9'SELECT @OTCNUMBER = OTC_NUMBER, @BAG_NUMBER = BAG_NUMBER, @TRA' +
        'NS_NO = TransactionNumber, @PRODUCT_NO = PRODUCTNO, @MAIN_COURSE' +
        '_ID = MAIN_COURSE_ID FROM TRANSACTIONDETAIL_TEMP WHERE IDNUMBER ' +
        '= @IDNUMBER;'
      
        #9#9'SELECT @HAS_MODIFIER = HAS_MODIFIER FROM INVENTARIOPISO WHERE ' +
        'PRODUCTNO = @PRODUCT_NO; '
      #9#9'IF @HAS_MODIFIER = 1'
      #9#9'begin'
      
        #9#9#9'DELETE FROM TRANSACTIONDETAIL_TEMP WHERE MAIN_COURSE_ID = @MA' +
        'IN_COURSE_ID;'
      
        #9#9#9'--DELETE FROM TRANSACTIONDETAIL WHERE MAIN_COURSE_ID = @MAIN_' +
        'COURSE_ID;'
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      
        #9#9#9'DELETE FROM TRANSACTIONDETAIL_TEMP WHERE IDNUMBER = @IDNUMBER' +
        ';'
      #9#9#9'--DELETE FROM TRANSACTIONDETAIL WHERE IDNUMBER = @IDNUMBER;'
      #9#9'end;'
      
        #9#9'SELECT @RECORDCOUNT = COUNT(*) FROM TRANSACTIONDETAIL_TEMP WHE' +
        'RE TRANSACTIONNUMBER = @TRANS_NO;'
      #9#9'IF @RECORDCOUNT = 0'
      #9#9'begin'
      #9#9#9'Exec CANCEL_TABS @TRANS_NO; '
      #9#9'end;'#9#9
      #9#9'set @TRIPLES_BALANCE = 0;'
      
        #9#9'exec CALC_TRIPLES_TAX @TRANS_NO, @TOTAL_BALANCE_PLUS_TAX = @TR' +
        'IPLES_BALANCE OUTPUT;'
      #9#9'IF @BAG_NUMBER > 0'
      #9#9'BEGIN'
      
        #9#9'   UPDATE WILLCALL SET POS_PICKUP = 0 WHERE OTC_NUMBER = @OTCN' +
        'UMBER;'#9#9'   '
      #9#9'END;'
      #9#9'IF @OTCNUMBER > 0'
      #9#9'begin'
      
        #9#9'  SET @SQL = '#39'Update ['#39' + @DBName + '#39'].dbo.OTC set WF_CASHIER ' +
        '= NULL, Cobrado = NULL, WC_PICKUP = 0, SIGNATURE_LINK = 1  where' +
        ' OTCNumber = @OTCNUMBER'#39';'
      #9#9'  Exec sp_executesql @SQL, N'#39'@OTCNUMBER INTEGER'#39', @OTCNUMBER;'
      #9#9'end;'
      #9'commit'
      'END')
    Left = 896
    Top = 984
  end
  object TRANSACTIONDETAIL_UPDATEPRICE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[TRANSACTIONDETAIL_UPDATEPRICE] @IDNUMBER' +
        ' INT, @TRANSNO INT, @PRODUCTNO INT, @PRICE FLOAT, @QTY FLOAT, @T' +
        'AXRATE FLOAT, @SUPER CHAR(3), @UPDATE_PRICE BIT'
      'AS'
      'DECLARE @PRODUCT_COUNT FLOAT'
      'DECLARE @ID_ONFILE INT'
      'DECLARE @TAX_RATE FLOAT;'
      'DECLARE @PREV_PRICE DECIMAL(18,2)'
      'DECLARE @SALESMAN NCHAR(3)'
      'DECLARE @COMMISSION1 DECIMAL(18,2)'
      'DECLARE @COMMISSION2 DECIMAL(18,2)'
      'DECLARE @COMMISSION3 DECIMAL(18,2)'
      'DECLARE @PRICE1 DECIMAL(18,2)'
      'DECLARE @PRICE2 DECIMAL(18,2)'
      'DECLARE @PRICE3 DECIMAL(18,2)'
      'DECLARE @COMMISSION_VALUE FLOAT'
      'DECLARE @TOTAL_VALUE FLOAT'
      'DECLARE @IS_COMMISSION_ACTIVE BIT'
      'SET NOCOUNT ON'
      'BEGIN'
      #9'begin transaction'
      
        #9'    Select @IS_COMMISSION_ACTIVE = ACTIVE_COMMISSIONS from CRED' +
        'ITDEBITSETUP;'
      #9#9'IF @IS_COMMISSION_ACTIVE = 1 '
      #9#9'begin'
      
        #9#9'  Exec @COMMISSION_VALUE = dbo.CALC_COMMISSION @PRODUCTNO, @PR' +
        'ICE, @QTY;'
      '              end'
      #9#9'else'
      #9#9'begin'
      #9#9'  Select @COMMISSION_VALUE = 0; '
      #9#9'end; '
      
        #9#9'IF (SELECT @TAXRATE) > 0  SELECT @TOTAL_VALUE = ISNULL((@Price' +
        ' * @QTY) * @TaxRate,  0);'
      
        #9#9'UPDATE TransactionDetaiL SET PRICE = @PRICE, TOTAL = @PRICE * ' +
        '@QTY, TOTAL_VALUE = @TOTAL_VALUE,'
      #9#9'QTY = @QTY, SUPERVISOR = @SUPER'
      #9#9'Where IDNUMBER = @IDNUMBER;'
      
        #9#9'UPDATE TransactionDetaiL_TEMP SET PRICE = @PRICE, TOTAL = @PRI' +
        'CE * @QTY,'
      
        #9#9'QTY = @QTY, SUPERVISOR = @SUPER, COMMISSION = @COMMISSION_VALU' +
        'E'
      #9#9'Where IDNUMBER = @IDNUMBER;'
      #9#9'IF @UPDATE_PRICE = 1'
      #9#9'begin'
      
        #9#9'  Update INVENTARIOPISO set PRECIO = @PRICE WHERE PRODUCTNO = ' +
        '@PRODUCTNO;'
      #9#9'end;'
      #9'commit'
      'END')
    Left = 992
    Top = 40
  end
  object UPDATE_DEBT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[UPDATE_DEBT] (@SSN  CHAR(9), @BALANCE FL' +
        'OAT)'
      'AS'
      '  SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        '  Update Pacientes set Deuda = @BALANCE WHERE CARDHOLDERID = @SS' +
        'N;'
      '  COMMIT'
      'end')
    Left = 984
    Top = 120
  end
  object UPDATE_INVENTORY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[UPDATE_INVENTORY] (@NDC_SEARCH CHAR(11),'
      '         @PRODUCTID  INTEGER,'
      '         @QTY        DECIMAL(18,2),'
      '         @RECETARIO  CHAR(1))'
      'AS'
      '  SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        #9'  Update InventarioPiso set QTYINVENTARIO = QTYINVENTARIO - @QT' +
        'Y where PRODUCTNO = @PRODUCTID;'
      '  commit'
      'end')
    Left = 984
    Top = 200
  end
  object UPDATE_WC_STATUS: TFDQuery
    AfterExecute = UPDATE_WC_STATUSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[UPDATE_WC_STATUS]'
      
        '(@NOTIFICATION INTEGER, @NOTIFICATIONMODE NCHAR(10), @ID INTEGER' +
        ')'
      'AS'
      'SET NOCOUNT ON'
      'BEGIN'
      '  begin transaction'
      '  IF @NOTIFICATION = 0'
      
        '    Update WillCall_Status set NOTIFICATION0 = 1, NOTIFICATION0_' +
        'DATE = SYSDATETIME(), NOTIFICATION0_MODE = @NOTIFICATIONMODE Whe' +
        're ID = @ID'
      '  IF @NOTIFICATION = 1'
      
        '    Update WillCall_Status set Reminder1 = 1, REMINDER1_DATE = S' +
        'YSDATETIME(), R1_NOTIFICATION_MODE = @NOTIFICATIONMODE Where ID ' +
        '= @ID'
      '  IF @NOTIFICATION = 2'
      
        '    Update WillCall_Status set Reminder2 = 1, REMINDER2_DATE = S' +
        'YSDATETIME(), R2_NOTIFICATION_MODE = @NOTIFICATIONMODE Where ID ' +
        '= @ID'
      '  IF @NOTIFICATION = 3'
      
        '    Update WillCall_Status set Reminder3 = 1, REMINDER3_DATE = S' +
        'YSDATETIME(), R3_NOTIFICATION_MODE = @NOTIFICATIONMODE Where ID ' +
        '= @ID'
      '  commit'
      'END')
    Left = 1080
    Top = 912
  end
  object WILLCALL_DELETE: TFDQuery
    AfterExecute = WILLCALL_DELETEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[WILLCALL_DELETE] @TNUMBER INT, @ID INT'
      'AS'
      'Declare @NoRecords int'
      'Set NOCOUNT ON'
      'begin'
      '  begin transaction '
      '  INSERT INTO WillCallHistory'
      '    SELECT * FROM WillCall WHERE TRANSACTION_NUMBER = @TNUMBER;'#9
      '    DELETE FROM WILLCALL WHERE TRANSACTION_NUMBER = @TNUMBER; '#9
      
        #9'SELECT @NoRecords = COUNT(*) from WillCall where BATCH_NUMBER =' +
        ' @ID;  '
      #9'IF @NoRecords = 0 '
      #9'begin'
      #9'  DELETE FROM WILLCALL_STATUS WHERE ID = @ID; '
      
        #9'  UPDATE WILLCALL_STATUS_HISTORY SET STATUS = 1, DATE_PICKUP_RT' +
        'S = GETDATE() WHERE ID = @ID;'
      '    end;'
      '  commit'
      'END')
    Left = 1264
    Top = 32
  end
  object WILLCALL_History_DELETE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE[dbo].[WILLCALL_History_DELETE] '
      'AS'
      'Declare @NoRecords int'
      'BEGIN '
      '  Set NOCOUNT ON'
      '  begin transaction '
      '  DELETE FROM WILLCALL_STATUS where RTS = 1'
      '  commit'
      'END')
    Left = 1256
    Top = 128
  end
  object WILLCALL_TOTAL_AMOUNT_DUE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[WILLCALL_TOTAL_AMOUNT_DUE]  @BAG_NUMBER ' +
        'INTEGER, @TAmountDue Float output'
      'AS'
      'SET NOCOUNT ON'
      'declare @TCOPAY Float;'
      'declare @TCASH Float;'
      'begin'
      '  begin transaction'
      #9'select @TCOPAY = ISNULL(sum(COPAY), 0) '
      #9'from WILLCALL WHERE CASH_PLAN = 2 AND BAG_NUMBER = @BAG_NUMBER;'
      
        #9'select @TCASH = ISNULL(sum(PRICE), 0) from WILLCALL WHERE CASH_' +
        'PLAN = 1 AND BAG_NUMBER = @BAG_NUMBER;'
      #9'select @TAmountDue = @TCOPAY + @TCASH;'
      '  commit'
      'end')
    Left = 1272
    Top = 200
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    OnError = FDQuery2Error
    Left = 680
    Top = 120
  end
  object EXPORTTOWILLCALLHISTORY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[EXPORTTOWILLCALLHISTORY] ON [dbo].[WILLCAL' +
        'L]'
      'FOR INSERT, UPDATE'
      'AS '
      'DECLARE @NOTRANS BIGINT'
      'DECLARE @STATUS INT'
      'DECLARE @NORECORDS INT'
      'DECLARE @ID_EDITED INT'
      'SET NOCOUNT ON'
      'BEGIN'
      '  begin transaction '
      
        '    Select @NOTRANS = TRANSACTION_NUMBER, @STATUS = STATUS, @ID_' +
        'EDITED = BATCH_NUMBER'#9#9'   '
      '    FROM INSERTED '
      
        '    IF (@STATUS = 1 OR @STATUS = 2 OR @STATUS = 3 OR @STATUS = 4' +
        ') '
      
        '    EXECUTE WILLCALL_DELETE @TNUMBER = @NOTRANS, @ID = @ID_EDITE' +
        'D;'
      '  commit'
      'END')
    Left = 1280
    Top = 288
  end
  object CREATEWILLCAL_STATUS_LHISTORY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[CREATEWILLCAL_STATUS_LHISTORY] ON [dbo].[W' +
        'ILLCALL_STATUS]'
      'FOR INSERT'
      'AS '
      'DECLARE @NOTRANS BIGINT'
      'DECLARE @STATUS INT'
      'SET NOCOUNT ON'
      'BEGIN'
      '  begin transaction'
      #9'INSERT INTO WILLCALL_STATUS_HISTORY'
      '    SELECT *'
      '    FROM inserted'
      '  commit'
      'END')
    Left = 1288
    Top = 360
  end
  object EXPORTTOWILLCAL_STATUS_LHISTORY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[EXPORTTOWILLCAL_STATUS_LHISTORY] ON [dbo].' +
        '[WILLCALL_STATUS]'
      'FOR UPDATE'
      'AS '
      'DECLARE @NOTRANS BIGINT'
      'DECLARE @STATUS INT'
      'DECLARE @CUSTOMERNUMBER INT'
      'DECLARE @REMINDER1 INT'
      'DECLARE @REMINDER2 INT'
      'DECLARE @REMINDER3 INT'
      'DECLARE @DATE_CREATED DATE'
      'DECLARE @BAG_NUMBER INT'
      'DECLARE @REMINDER1_DATE DATETIME'
      'DECLARE @REMINDER2_DATE DATETIME'
      'DECLARE @REMINDER3_DATE DATETIME'
      'DECLARE @R1_NOTIFICATION_MODE nchar(10)'
      'DECLARE @R2_NOTIFICATION_MODE nchar(10)'
      'DECLARE @R3_NOTIFICATION_MODE nchar(10)'
      'DECLARE @NOTIFICATION_MODE1 SMALLINT'
      'DECLARE @NOTIFICATION_MODE2 SMALLINT'
      'DECLARE @NOTIFICATION_MODE1_EMAIL NCHAR(80)'
      'DECLARE @NOTIFICATION_MODE2_TELEPHONE NCHAR(13)'
      'DECLARE @RTS BIT'
      'DECLARE @ID INT'
      'SET NOCOUNT ON;'
      'BEGIN'
      #9'begin transaction'
      
        #9'SELECT @CUSTOMERNUMBER = CUSTOMER_NUMBER, @REMINDER1 = REMINDER' +
        '1,'
      #9'@REMINDER1 = REMINDER1,  '
      #9'@REMINDER2 = REMINDER2,'
      #9'@REMINDER3 = REMINDER3,'
      #9'@STATUS = STATUS,'
      #9'@DATE_CREATED = DATE_CREATED,'
      #9'@BAG_NUMBER = BAG_NUMBER,'
      #9'@REMINDER1_DATE = REMINDER1_DATE,'
      #9'@REMINDER2_DATE = REMINDER2_DATE,'
      #9'@REMINDER3_DATE = REMINDER3_DATE,'
      #9'@R1_NOTIFICATION_MODE = R1_NOTIFICATION_MODE,'
      #9'@R2_NOTIFICATION_MODE = R2_NOTIFICATION_MODE,'
      #9'@R3_NOTIFICATION_MODE = R3_NOTIFICATION_MODE,'
      #9'@NOTIFICATION_MODE1 = NOTIFICATION_MODE1,'
      #9'@NOTIFICATION_MODE2 = NOTIFICATION_MODE2,'
      #9'@NOTIFICATION_MODE1_EMAIL = NOTIFICATION_MODE1_EMAIL,'
      #9'@NOTIFICATION_MODE2_TELEPHONE = NOTIFICATION_MODE2_TELEPHONE,'
      #9'@RTS = RTS,'
      #9'@ID = ID'
      #9'FROM INSERTED;'
      ''
      '    UPDATE WILLCALL_STATUS_HISTORY SET '
      #9'CUSTOMER_NUMBER = @CUSTOMERNUMBER,'
      #9'REMINDER1 = @REMINDER1,'
      #9'REMINDER2 = @REMINDER2,'
      #9'REMINDER3 = @REMINDER3,'
      #9'STATUS = @STATUS,'
      #9'DATE_CREATED = @DATE_CREATED,'
      #9'BAG_NUMBER = @BAG_NUMBER,'
      #9'REMINDER1_DATE = @REMINDER1_DATE,'
      #9'REMINDER2_DATE = @REMINDER2_DATE,'
      #9'REMINDER3_DATE = @REMINDER3_DATE,'
      #9'R1_NOTIFICATION_MODE= @R1_NOTIFICATION_MODE,'
      #9'R2_NOTIFICATION_MODE= @R2_NOTIFICATION_MODE,'
      #9'R3_NOTIFICATION_MODE= @R3_NOTIFICATION_MODE,'
      #9'NOTIFICATION_MODE1 = @NOTIFICATION_MODE1,'
      #9'NOTIFICATION_MODE2 = @NOTIFICATION_MODE2,'
      #9'NOTIFICATION_MODE1_EMAIL = @NOTIFICATION_MODE1_EMAIL,'
      #9'NOTIFICATION_MODE2_TELEPHONE = @NOTIFICATION_MODE2_TELEPHONE,'
      #9'RTS = @RTS'
      #9'WHERE ID = @ID'
      ''
      #9'IF @STATUS = 2 '
      #9'BEGIN'
      #9'  DELETE FROM WILLCALL_STATUS WHERE ID = @ID;'
      #9'  DELETE FROM WILLCALL WHERE BAG_NUMBER = @BAG_NUMBER;'
      #9'END;'
      #9'commit'
      'END')
    Left = 1296
    Top = 456
  end
  object DELETETRANS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[DELETETRANS] ON [dbo].[TRANSACTIONHEADER]'
      'FOR DELETE'
      'AS'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      '    DECLARE @NOTRANS INT'
      '    SELECT @NOTRANS = TRANSACTIONNUMBER FROM DELETED;'
      
        '    DELETE FROM TRANSACTIONDETAIL WHERE TRANSACTIONNUMBER = @NOT' +
        'RANS;'
      '  commit'
      'end;')
    Left = 1296
    Top = 536
  end
  object CALC_TRANSFER_TOTAL: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[CALC_TRANSFER_TOTAL] ON [dbo].[TRANSFER_DE' +
        'TAIL]'
      'FOR INSERT, UPDATE, DELETE'
      'AS'
      '  DECLARE @STOTAL Float;'
      '  DECLARE @TRANSFERID INT;'
      '  DECLARE @TAMANO FLOAT'
      '  DECLARE @METRICSIZE FLOAT'
      '  DECLARE @RECETARIO CHAR(1)'
      '  SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        #9'select @TRANSFERID = TRANSFERID, @TAMANO = PACKAGESIZE, @METRIC' +
        'SIZE = TAMANO, @RECETARIO = RECETARIO from INSERTED;'
      
        #9'Select @STotal = ISNULL(sum(TOTAL_VALUE), 0) FROM TRANSFER_DETA' +
        'IL WHERE transferid = @TRANSFERID; '
      
        #9'update Transfer_header set TOTAL = @STotal where transferid = @' +
        'TRANSFERID;'
      '  commit'
      'end')
    Left = 1296
    Top = 624
  end
  object UPDATE_OTC_WFPRINTED: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[UPDATE_OTC_WFPRINTED] ON [dbo].[PRINT_QUER' +
        'IES]'
      'FOR DELETE'
      'AS'
      'SET NOCOUNT ON'
      'DECLARE @RX_ID INTEGER'
      'DECLARE @TYPIST CHAR(3)'
      'DECLARE @TIME CHAR(10)'
      'DECLARE @DATE  CHAR(10)'
      'DECLARE @NORX BIGINT'
      'DECLARE @CONTROLLED CHAR(4)'
      'DECLARE @ISCONTROLLED INT'
      'BEGIN'
      '  begin transaction'
      #9'select @DATE = CONVERT(VARCHAR(10),GETDATE(),110);'
      
        #9'SELECT @TIME = RIGHT('#39'0'#39'+LTRIM(RIGHT(CONVERT(varchar,getDate(),' +
        '100),8)),7);'
      
        #9'Select @RX_ID = RX_ID, @TYPIST = SUBSTRING(TYPIST,1,3) FROM del' +
        'eted;'
      
        #9'Select @NORX = NUMERORECETA, @CONTROLLED = CONTROLADO FROM OTC ' +
        'WHERE OTCNUMBER = @RX_ID;'
      
        #9'IF RTRIM(@CONTROLLED) = '#39'RX'#39' SET @ISCONTROLLED = 0 ELSE SET @IS' +
        'CONTROLLED = 1;'
      #9'IF @RX_ID > 0'
      #9'begin'
      
        #9#9'UPDATE OTC SET WF_PRINTED = RTRIM(@TYPIST) + '#39' '#39' + RTRIM(@TIME' +
        ') + '#39' '#39' + RTRIM(@DATE) '
      
        #9#9'WHERE OTCNUMBER = @RX_ID AND(WF_PRINTED is NULL or WF_PRINTED ' +
        '= '#39#39');'
      
        #9#9'EXECUTE INSERT_LOG '#39'RX PRINTED'#39', '#39'P'#39', '#39#39', @TYPIST,  '#39#39', @NORX,' +
        ' @RX_ID,0,0,0,0,0,0,'#39'R'#39','#39#39',@ISCONTROLLED,1;'
      #9'end;'
      '  commit'
      'END;')
    Left = 1296
    Top = 696
  end
  object ORDER_TOTAL: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[ORDER_TOTAL] '
      '   ON  [dbo].[ORDER_DETAIL]'
      '   FOR INSERT,UPDATE,DELETE'
      'AS '
      'DECLARE @TOTAL_SENT FLOAT;'
      'DECLARE @ORDERID INT;'
      'set nocount on'
      'BEGIN'
      #9'begin transaction'
      
        #9'  IF UPDATE (TOTAL_VALUE) select @ORDERID = ORDERID FROM INSERT' +
        'ED'
      #9'  ELSE'
      #9'  select @ORDERID = ORDERID FROM deleted;'
      
        #9'  SELECT @TOTAL_SENT = ISNULL(sum(TOTAL_VALUE), 0) FROM ORDER_D' +
        'ETAIL WHERE ORDERID = @ORDERID;'#9
      
        #9'  Update ORDER_HEADER set RECEIVED =  @TOTAL_SENT WHERE ORDERID' +
        ' = @ORDERID;'
      #9'commit'
      'END')
    Left = 1296
    Top = 824
  end
  object INSERTGPID: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[INSERTGPID] ON [dbo].[INVENTARIOPISO]'
      'FOR INSERT'
      'AS'
      '  Declare @PID Int'
      '  set nocount on'
      'begin'
      'Begin Transaction'
      'select @PID = PRODUCTNO From Inserted;'
      
        'Update INVENTARIOPISO set GROUP_PRODUCTNO = @PID where PRODUCTNO' +
        ' = @PID;'
      'commit;'
      'end;')
    Left = 1304
    Top = 904
  end
  object AUSPICIO: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE VIEW [dbo].[AUSPICIO](NOMBRE,CARDHOLDERID,FECHANACIMIENTO' +
        ',SEXO,DIRECCION1,DIRECCION2,ULTTRANS,DEUDA,LIMITECREDITO,NUMEROC' +
        'LIENTE,APELLIDOPATERNO,APELLIDOMATERNO,TELEFONO,CODIGOPOSTAL,FAX' +
        ',CELULAR,EMAIL,LAWAY,ESTADO,AUSPICIO,SOCIO,IDENTIFICACION,CODE,A' +
        'MOUNT,DATEOFTRANS,ATTENDEDBY,CLIENTNO,TRANSNO,PAIDAMOUNT,'
      'BALANCE) AS SELECT PACIENTES_1.NOMBRE, PACIENTES_1.CARDHOLDERID,'
      
        'PACIENTES_1.FECHANACIMIENTO, PACIENTES_1.SEXO, PACIENTES_1.DIREC' +
        'CION1,'
      'PACIENTES_1.DIRECCION2, PACIENTES_1.ULTTRANS, PACIENTES_1.DEUDA,'
      'PACIENTES_1.LIMITECREDITO, PACIENTES_1.NUMEROCLIENTE,'
      'PACIENTES_1.APELLIDOPATERNO, PACIENTES_1.APELLIDOMATERNO,'
      'PACIENTES_1.TELEFONO, PACIENTES_1.CODIGOPOSTAL, PACIENTES_1.FAX,'
      'PACIENTES_1.CELULAR, PACIENTES_1.EMAIL, PACIENTES_1.LAWAY,'
      'PACIENTES_1.ESTADO, PACIENTES_1.AUSPICIO, PACIENTES_1.SOCIO,'
      'PACIENTES_1.IDENTIFICACION, CLIENTTRANSACTIONS_1.CODE,'
      'CLIENTTRANSACTIONS_1.AMOUNT, CLIENTTRANSACTIONS_1.DATEOFTRANS,'
      'CLIENTTRANSACTIONS_1.ATTENDEDBY, CLIENTTRANSACTIONS_1.CLIENTNO,'
      'CLIENTTRANSACTIONS_1.TRANSNO, CLIENTTRANSACTIONS_1.PAIDAMOUNT,'
      
        'CLIENTTRANSACTIONS_1.BALANCE FROM PACIENTES PACIENTES_1 INNER JO' +
        'IN'
      'CLIENTTRANSACTIONS CLIENTTRANSACTIONS_1 ON'
      '(CLIENTTRANSACTIONS_1.CLIENTNO = PACIENTES_1.NUMEROCLIENTE)')
    Left = 1304
    Top = 992
  end
  object AUSPICIOTOTAL: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE VIEW [dbo].[AUSPICIOTOTAL](SOCIO,APELLIDOPATERNO,APELLIDO' +
        'MATERNO,NOMBRE,AMOUNT,DATEOFTRANS) AS SELECT pacientes.socio, pa' +
        'cientes.apellidopaterno, pacientes.apellidomaterno, pacientes.no' +
        'mbre, SUM(amount), ClientTransactions.DATEOFTRANS FROM clienttra' +
        'nsactions INNER JOIN pacientes ON clienttransactions.clientno = ' +
        'pacientes.numerocliente WHERE code = '#39'AU'#39' AND pacientes.socio > ' +
        #39'0'#39' GROUP BY pacientes.socio, pacientes.apellidopaterno, pacient' +
        'es.apellidomaterno, pacientes.nombre, CLIENTTRANSACTIONS.DATEOFT' +
        'RANS')
    Left = 1312
    Top = 1080
  end
  object PRODUCTSALES: TFDQuery
    AfterExecute = PRODUCTSALESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE VIEW [dbo].[PRODUCTSALES](PROD_DESC,POD_UPC,T_SOLD,PROD_D' +
        'PT,PROD_SUP,PROD_FECHAVENTA) '
      
        '  AS SELECT ProdDescription, UPC ,SUM(Qty), PRODDEPARTMENT, Supl' +
        'idor, FechaVenta  '
      
        '  FROM transactiondetail WHERE ProdDepartment <> '#39'RECETAS'#39' AND P' +
        'rodDepartment <> '#39'OTC'#39' AND ProdDepartment <> '#39'PAGO'#39' '
      
        '  GROUP BY ProdDescription, UPC, ProdDepartment, Suplidor, Fecha' +
        'Venta')
    Left = 1000
    Top = 304
  end
  object RXDEPT: TFDQuery
    AfterExecute = RXDEPTAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE VIEW [dbo].[RXDEPT](NORX,MEDICAMENTO,CANTIDAD_DISPONIBLE,' +
        'FECHAVENTA,PRODID,PLANMEDICO,DEPT,PRODUCTID) AS SELECT PRESCRIPT' +
        'IONS_1.NUMERORECETA, PRESCRIPTIONS_1.MEDICAMENTO, PRESCRIPTIONS_' +
        '1.CANTIDAD_DISPONIBLE, PRESCRIPTIONS_1.FECHAVENTA, PRESCRIPTIONS' +
        '_1.PRODUCT_ID, PRESCRIPTIONS_1.PLANMEDICO, INVENTARIO_1.DEPARTAM' +
        'ENTO, INVENTARIO_1.PRODUCTNO FROM PRESCRIPTIONS PRESCRIPTIONS_1 ' +
        'INNER JOIN INVENTARIOPISO INVENTARIO_1 ON (INVENTARIO_1.PRODUCTN' +
        'O = PRESCRIPTIONS_1.PRODUCT_ID)')
    Left = 1440
    Top = 40
  end
  object TEMP: TFDQuery
    AfterExecute = TEMPAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[TEMP]'
      'AS'
      
        'SELECT        dbo.OTC.NUMERORECETA, dbo.OTC.MEDICAMENTO, dbo.PAC' +
        'IENTES.NOMBRE, dbo.DOCTOR.APELLIDO_PATERNO, dbo.PLANESMEDICOS.AB' +
        'REVIATURA'
      'FROM            dbo.PRESCRIPTIONS INNER JOIN'
      
        '                         dbo.OTC ON dbo.PRESCRIPTIONS.NUMERORECE' +
        'TA = dbo.OTC.NUMERORECETA INNER JOIN'
      
        '                         dbo.PACIENTES ON dbo.PRESCRIPTIONS.NUME' +
        'ROCLIENTE = dbo.PACIENTES.NUMEROCLIENTE INNER JOIN'
      
        '                         dbo.DOCTOR ON dbo.PRESCRIPTIONS.NUMEROD' +
        'OCTOR = dbo.DOCTOR.NUMERODOCTOR INNER JOIN'
      
        '                         dbo.PLANESMEDICOS ON dbo.OTC.PLAN_MEDIC' +
        'O = dbo.PLANESMEDICOS.ABREVIATURA')
    Left = 1448
    Top = 120
  end
  object TOTAL_POS_TRANS: TFDQuery
    AfterExecute = TOTAL_POS_TRANSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[TOTAL_POS_TRANS]'
      'AS'
      
        'SELECT        dbo.TRANSACTIONHEADER.TOTAL, dbo.TRANSACTIONHEADER' +
        '.TRANSACTIONTIME, dbo.TRANSACTIONDETAIL.PRODDEPARTMENT, dbo.TRAN' +
        'SACTIONHEADER.TRANSACTIONDATE'
      'FROM            dbo.TRANSACTIONDETAIL INNER JOIN'
      
        '                         dbo.TRANSACTIONHEADER ON dbo.TRANSACTIO' +
        'NDETAIL.TRANSACTIONNUMBER = dbo.TRANSACTIONHEADER.TRANSACTIONNUM' +
        'BER')
    Left = 1456
    Top = 208
  end
  object VERTRANSACCIONES: TFDQuery
    AfterExecute = VERTRANSACCIONESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[VERTRANSACCIONES]'
      'AS'
      
        'SELECT        TH.ID, TH.TRANSACTIONNUMBER, TH.TRANSACTIONDATE, T' +
        'H.NUMBERITEMS, TH.SUBTOTAL, TH.TAX, TH.TOTAL, TH.CHANGE, TH.PAYM' +
        'ENTTYPE1, TH.CREDITCARD1, TH.OPENED, TH.CUSTOMERID, TH.TRANSACTI' +
        'ONTIME, '
      
        '                         TH.PAID, TH.PAYMENTTYPE2, TH.CREDITCARD' +
        '2, TH.PAYAMOUNT1, TH.PAYAMOUNT2, TH.REGTOTAL, TH.FOODTOTAL, TH.S' +
        'HIFT, TH.EMPLOYNUMBER, TH.REGISTER, TD.IDNUMBER, TD.UPC, TD.QTY,' +
        ' TD.VOIDED, '
      
        '                         TD.SUBDETAIL, TD.PRODDESCRIPTION, TD.PR' +
        'ODDEPARTMENT, TD.FOOD, TD.PRICE, TD.REGPRICE, TD.MODIFIED, TD.DI' +
        'SCOUNT, TD.COSTO, TD.FECHAVENTA, TD.SUPLIDOR, TD.SUPERVISOR, TD.' +
        'TAX_MUNICIPAL, '
      
        '                         TD.TAX_ESTATAL, TD.SUBDEPARTAMENTO, TD.' +
        'BARCODEALTERNO2, TD.BARCODEALTERNO1, TD.UTILIDAD, TD.NOTE, TH.TI' +
        'P, TH.SALESMAN, TD.COMMISSION, TD.TAX_PROCESSED_FOOD, TH.TOTAL_T' +
        'AX, '
      '                         TD.TOTAL AS DETAIL_TOTAL, TH.LAST4'
      'FROM            dbo.TRANSACTIONHEADER AS TH INNER JOIN'
      
        '                         dbo.TRANSACTIONDETAIL AS TD ON TD.TRANS' +
        'ACTIONNUMBER = TH.TRANSACTIONNUMBER')
    Left = 1464
    Top = 304
  end
  object DSPacientes: TDataSource
    AutoEdit = False
    DataSet = CDSPacientes
    Left = 152
    Top = 241
  end
  object DSPPacientes: TDataSetProvider
    DataSet = SQDSPacientesFD1
    Options = [poFetchBlobsOnDemand, poFetchDetailsOnDemand, poPropogateChanges, poAllowCommandText]
    Left = 96
    Top = 241
  end
  object CDSPacientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPPacientes'
    Left = 232
    Top = 241
    object CDSPacientesNOMBRE: TStringField
      FieldName = 'NOMBRE'
      FixedChar = True
      Size = 12
    end
    object CDSPacientesFECHANACIMIENTO: TSQLTimeStampField
      FieldName = 'FECHANACIMIENTO'
    end
    object CDSPacientesSEXO: TIntegerField
      FieldName = 'SEXO'
    end
    object CDSPacientesDIRECCION1: TStringField
      FieldName = 'DIRECCION1'
      FixedChar = True
      Size = 30
    end
    object CDSPacientesULTTRANS: TSQLTimeStampField
      FieldName = 'ULTTRANS'
    end
    object CDSPacientesDEUDA: TSingleField
      FieldName = 'DEUDA'
    end
    object CDSPacientesLIMITECREDITO: TSingleField
      FieldName = 'LIMITECREDITO'
    end
    object CDSPacientesNUMEROCLIENTE: TAutoIncField
      FieldName = 'NUMEROCLIENTE'
      ReadOnly = True
    end
    object CDSPacientesINTERES: TStringField
      FieldName = 'INTERES'
      FixedChar = True
      Size = 1
    end
    object CDSPacientesDIRECCIONFISICA: TStringField
      FieldName = 'DIRECCIONFISICA'
      FixedChar = True
      Size = 50
    end
    object CDSPacientesAPELLIDOPATERNO: TStringField
      FieldName = 'APELLIDOPATERNO'
      FixedChar = True
      Size = 15
    end
    object CDSPacientesAPELLIDOMATERNO: TStringField
      FieldName = 'APELLIDOMATERNO'
      FixedChar = True
      Size = 15
    end
    object CDSPacientesIDENTIFICACION: TStringField
      FieldName = 'IDENTIFICACION'
      FixedChar = True
    end
  end
  object SQDSPacientesFD1: TFDQuery
    Connection = FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'Select * from Pacientes where apellidopaterno like '#39'A%'#39)
    Left = 32
    Top = 240
  end
  object DSPPatPlan: TDataSetProvider
    DataSet = qPatPlan
    Options = [poPropogateChanges, poAllowCommandText]
    Left = 96
    Top = 321
  end
  object DSPatPlan: TDataSource
    AutoEdit = False
    DataSet = CDSPatPlan
    Left = 168
    Top = 321
  end
  object CDSPatPlan: TClientDataSet
    Aggregates = <>
    CommandText = 'Select * from PatPlan'
    Params = <>
    ProviderName = 'DSPPatPlan'
    AfterPost = CDSPatPlanAfterPost
    AfterDelete = CDSPatPlanAfterPost
    Left = 240
    Top = 321
    object CDSPatPlanNUMEROCLIENTE: TIntegerField
      FieldName = 'NUMEROCLIENTE'
      Required = True
    end
    object CDSPatPlanNUMEROPLAN: TAutoIncField
      FieldName = 'NUMEROPLAN'
      ReadOnly = True
    end
    object CDSPatPlanPLANMEDICO: TStringField
      FieldName = 'PLANMEDICO'
      FixedChar = True
      Size = 3
    end
    object CDSPatPlanRELACION: TSmallintField
      FieldName = 'RELACION'
    end
    object CDSPatPlanPERSONCODE: TStringField
      FieldName = 'PERSONCODE'
      FixedChar = True
      Size = 3
    end
    object CDSPatPlanINACTIVE_DATE: TSQLTimeStampField
      FieldName = 'INACTIVE_DATE'
    end
    object CDSPatPlanCARDHOLDERID: TStringField
      FieldName = 'CARDHOLDERID'
      FixedChar = True
    end
    object CDSPatPlanNOGRUPO: TStringField
      FieldName = 'NOGRUPO'
      FixedChar = True
      Size = 15
    end
    object CDSPatPlanHOME_PLAN: TStringField
      FieldName = 'HOME_PLAN'
      FixedChar = True
      Size = 3
    end
    object CDSPatPlanPLAN_ID: TStringField
      FieldName = 'PLAN_ID'
      FixedChar = True
      Size = 8
    end
    object CDSPatPlanELIGIBILITY_CLARIF_CODE: TStringField
      FieldName = 'ELIGIBILITY_CLARIF_CODE'
      FixedChar = True
      Size = 1
    end
    object CDSPatPlanFACILITY_ID: TStringField
      FieldName = 'FACILITY_ID'
      FixedChar = True
      Size = 10
    end
    object CDSPatPlanCH_FIRSTNAME: TStringField
      FieldName = 'CH_FIRSTNAME'
      FixedChar = True
      Size = 12
    end
    object CDSPatPlanCH_LASTNAME: TStringField
      FieldName = 'CH_LASTNAME'
      FixedChar = True
      Size = 15
    end
    object CDSPatPlanMEDIGAP_ID: TStringField
      FieldName = 'MEDIGAP_ID'
      FixedChar = True
    end
    object CDSPatPlanMEDICAID_INDICATOR: TStringField
      FieldName = 'MEDICAID_INDICATOR'
      FixedChar = True
      Size = 2
    end
    object CDSPatPlanPAAI: TStringField
      FieldName = 'PAAI'
      FixedChar = True
      Size = 2
    end
    object CDSPatPlanPP997_G2: TStringField
      FieldName = 'PP997_G2'
      FixedChar = True
      Size = 1
    end
    object CDSPatPlanMEDICAID_ID_NUMBER: TStringField
      FieldName = 'MEDICAID_ID_NUMBER'
      FixedChar = True
    end
    object CDSPatPlanMEDICAID_AGENCY_NUMBER: TStringField
      FieldName = 'MEDICAID_AGENCY_NUMBER'
      FixedChar = True
      Size = 15
    end
    object CDSPatPlanACTIVO: TBooleanField
      FieldName = 'ACTIVO'
      Required = True
    end
    object CDSPatPlanPLAN_PRIMARIO: TBooleanField
      FieldName = 'PLAN_PRIMARIO'
    end
    object CDSPatPlanCARD_IMAGE: TIntegerField
      FieldName = 'CARD_IMAGE'
    end
  end
  object qPatPlan: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from PatPlan')
    Left = 32
    Top = 320
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=dbo'
      'Server=192.168.3.204,1433'
      'OSAuthent=No'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=AXELOFFICE'
      'MARS=yes'
      'Password=agabriel'
      'Database=rblp'
      'DriverID=MSSQL')
    ResourceOptions.AssignedValues = [rvAutoReconnect]
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Transaction = FDTransaction1
    AfterConnect = FDConnection1AfterConnect
    Left = 98
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 218
    Top = 104
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 90
    Top = 96
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 216
    Top = 24
  end
  object WC_PICKUP_TF: TFDQuery
    AfterExecute = WC_PICKUP_TFAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[WC_PICKUP_TF] @TF BIT, @OTCNUMBER INT, @' +
        'TN INT, @DBName nchar(20)'
      'AS'
      'SET NOCOUNT ON'
      'begin'
      '  DECLARE @SQL NVARCHAR(500);'
      '  begin transaction'
      
        '    Update WillCall set POS_PICKUP = @TF where TRANSACTION_NUMBE' +
        'R = @TN;'
      
        '    set @SQL = '#39'Update ['#39' + @DBName + '#39'].dbo.OTC set WC_Pickup =' +
        ' @TF where OTCNUMBER = @OTCNUMBER'#39';'
      
        #9'exec sp_executesql @SQL, N'#39'@TF BIT,@OTCNUMBER INT'#39', @TF,@OTCNUM' +
        'BER;    '
      '  commit'
      'end;')
    Left = 1464
    Top = 392
  end
  object Index_NCPATNAME: TFDQuery
    AfterExecute = Index_NCPATNAMEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE NONCLUSTERED INDEX [NC_PATNAME] ON [dbo].[PACIENTES]'
      '('
      #9'[APELLIDOPATERNO] ASC,'
      #9'[APELLIDOMATERNO] ASC,'
      #9'[NOMBRE] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]')
    Left = 496
    Top = 656
  end
  object INDEX_INVENTORY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE NONCLUSTERED INDEX [NCDrugName] ON [dbo].[INVENTARIOPISO]'
      '('
      #9'[DESCRIPCION] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]'
      ';'
      'CREATE NONCLUSTERED INDEX [NC_NDC] ON [dbo].[INVENTARIOPISO]'
      '('
      #9'[NDC] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];'
      ';'
      
        'CREATE NONCLUSTERED INDEX [NC_INVENTORY_BARCODE] ON [dbo].[INVEN' +
        'TARIOPISO]'
      '('
      #9'[CODIGOBARRA] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]'
      ';')
    Left = 384
    Top = 728
  end
  object TRANSACTIONDETAIL_UPDATEPRICE_MOBILE: TFDQuery
    AfterExecute = TRANSACTIONDETAIL_UPDATEPRICE_MOBILEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[TRANSACTIONDETAIL_UPDATEPRICE_MOBILE] @I' +
        'DNUMBER INT, @PRICE FLOAT, '
      
        '@QTY FLOAT, @DISC DECIMAL(18,2), @TRANS_NO INT, @TRANS_TYPE CHAR' +
        '(1), @ALL BIT'
      'AS'
      '  DECLARE @TOTAL_VALUE FLOAT'
      '  DECLARE @PRODUCTID INTEGER'
      '  DECLARE @REGPRICE FLOAT'
      '  DECLARE @REGTOTAL FLOAT'
      '  DECLARE @DISCOUNT FLOAT  '
      '  DECLARE @QTY_TMP FLOAT'
      '  DECLARE @IDNUMBER_TMP INT'
      '  DECLARE @PRICE_TMP FLOAT'
      '  SET NOCOUNT ON'
      'BEGIN'
      '  begin transaction'
      #9'if @TRANS_TYPE = '#39'$'#39' --change price '#9
      #9'begin'
      #9#9'if @DISC > 0'
      #9#9'begin'
      
        #9#9#9'UPDATE TRANSACTIONDETAIL_temp SET Total = Qty * (RegPrice - @' +
        'DISC)'
      #9#9#9#9#9', RegTotal = (RegPrice * QTY)'
      
        #9#9#9#9#9', Discount = @DISC Where IDNUMBER = @IDNUMBER and DISCOUNT ' +
        '= 0;'
      #9#9'end;'
      #9'end;'
      #9'if @TRANS_TYPE = '#39'1'#39'  --change price'
      #9'begin'
      
        #9#9'SELECT @PRODUCTID = PRODUCTNO, @REGPRICE = REGPRICE FROM TRANS' +
        'ACTIONDETAIL_TEMP WHERE IDNUMBER = @IDNUMBER;   '
      
        #9#9'UPDATE TRANSACTIONDETAIL_TEMP SET PRICE = @PRICE, TOTAL = (@PR' +
        'ICE * @QTY), '
      #9#9'DISCOUNT = 0,'
      #9#9'QTY = @QTY Where IDNUMBER = @IDNUMBER;'
      #9'end;'
      '    if (@TRANS_TYPE = '#39'2'#39') and (@QTY > 0) --change qty'
      #9'begin'
      
        #9'    SELECT @DISCOUNT = DISCOUNT, @REGPRICE = REGPRICE, @REGTOTA' +
        'L = REGTOTAL FROM TRANSACTIONDETAIL_TEMP WHERE IDNUMBER = @IDNUM' +
        'BER; '
      #9#9'if @DISCOUNT > 0'
      #9#9'begin'
      #9#9'  SET @DISCOUNT = ROUND(@DISCOUNT / @REGTOTAL, 2);'
      '  '#9#9'  SET @REGTOTAL = (@REGPRICE * @QTY);    '
      
        #9#9#9'UPDATE TRANSACTIONDETAIL_TEMP SET PRICE = @REGPRICE - (@REGPR' +
        'ICE * @DISCOUNT), '
      
        #9#9#9'    TOTAL = (@REGPRICE * @QTY) - ISNULL(((@QTY * @REGPRICE) *' +
        ' @DISCOUNT), 0), '
      #9#9#9#9'REGTOTAL = @REGTOTAL, '
      #9#9#9#9'DISCOUNT = ISNULL(((@QTY * @REGPRICE) * @DISCOUNT), 0),'
      #9#9#9#9'QTY = @QTY Where IDNUMBER = @IDNUMBER'#9'  '
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      
        #9#9'  UPDATE TRANSACTIONDETAIL_temp SET TOTAL = (PRICE * @QTY), QT' +
        'Y = @QTY Where IDNUMBER = @IDNUMBER;'#9#9'  '
      #9#9'end;'
      #9'end;'
      #9'if @TRANS_TYPE = '#39'%'#39'  --discount '
      #9'begin'
      #9#9'SET @DISC = @DISC / 100;'
      #9#9'if @ALL = 0 '
      #9#9'begin'
      
        #9#9#9'SELECT @PRODUCTID = PRODUCTNO, @REGPRICE = REGPRICE FROM TRAN' +
        'SACTIONDETAIL_TEMP WHERE IDNUMBER = @IDNUMBER;'
      #9#9#9'SELECT @REGTOTAL = (@REGPRICE * @QTY);    '
      
        #9#9#9'UPDATE TRANSACTIONDETAIL_TEMP SET PRICE = @REGPRICE - (@REGPR' +
        'ICE * @DISCOUNT), '
      
        #9#9#9'    TOTAL = (@REGPRICE * @QTY) - ISNULL(((@QTY * @REGPRICE) *' +
        ' @DISC), 0), '
      #9#9#9#9'REGPRICE = @REGPRICE, REGTOTAL = @REGTOTAL, '
      #9#9#9#9'DISCOUNT = ISNULL(((@QTY * @REGPRICE) * @DISC), 0),'
      #9#9#9#9'QTY = @QTY Where IDNUMBER = @IDNUMBER;'
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      
        #9#9#9'DECLARE MyCursor CURSOR STATIC LOCAL FOR SELECT PRODUCTNO, RE' +
        'GPRICE, QTY, IDNUMBER, PRICE FROM TRANSACTIONDETAIL_TEMP WHERE T' +
        'RANSACTIONNUMBER = @TRANS_NO;'
      #9#9#9'OPEN MyCursor'
      #9#9#9'FETCH NEXT FROM MyCursor'
      
        #9#9#9'INTO @PRODUCTID, @REGPRICE, @QTY_TMP, @IDNUMBER_TMP, @PRICE_T' +
        'MP'
      #9#9#9'WHILE @@FETCH_STATUS = 0'
      #9#9#9'BEGIN'#9
      #9#9#9'    if @REGPRICE > 0'
      #9#9#9#9'begin'
      #9#9#9#9#9'SELECT @REGTOTAL = (@REGPRICE * @QTY_TMP);'
      
        #9#9#9#9#9'UPDATE TRANSACTIONDETAIL_TEMP SET PRICE = @REGPRICE - (@REG' +
        'PRICE * @DISC), '
      
        #9#9#9#9#9'TOTAL = (@REGPRICE * @QTY_TMP) - ISNULL(((@QTY_TMP * @REGPR' +
        'ICE) * @DISC), 0), '
      #9#9#9#9#9'REGPRICE = @REGPRICE, REGTOTAL = @REGTOTAL, '
      #9#9#9#9#9'DISCOUNT = ISNULL(((@QTY_TMP * @REGPRICE) * @DISC), 0)'
      #9#9#9#9#9'Where IDNUMBER = @IDNUMBER_TMP;'
      #9#9#9#9'end;'
      #9#9#9#9'FETCH NEXT FROM MyCursor'
      
        #9#9#9#9'INTO @PRODUCTID, @REGPRICE, @QTY_TMP, @IDNUMBER_TMP, @PRICE_' +
        'TMP'
      #9#9#9'END;'
      #9#9#9'CLOSE MyCursor'
      #9'        DEALLOCATE MyCursor'
      #9#9'end;'
      #9'end;'
      '  commit;'
      'END;')
    Left = 488
    Top = 320
  end
  object STARTBANK: TFDQuery
    AfterExecute = STARTBANKAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[STARTBANK] @STARTBANK float, @EMPLOYNUMB' +
        'ER NCHAR(3),  @REGISTER INTEGER '
      ' AS'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      '    INSERT INTO [dbo].[DAILYTOTALS]'
      
        '           ([CASHCOUNT],[CASHREAD],[CHECKCOUNT],[CHECKREAD] ,[CC' +
        'ARDCOUNT],[CCARDREAD],[ATHCOUNT],[ATHREAD],[WICCOUNT]'
      
        '           ,[WICREAD],[POCOUNT] ,[POREAD],[OTHERCOUNT],[OTHERREA' +
        'D] ,[STARTBANK] ,[PAYOUTCOUNT] ,[PAYOUTREAD] ,[FAMREAD]'
      
        '           ,[FAMCOUNT],[CRPAYREAD],[CRPAYCOUNT] ,[WICPAYCOUNT] ,' +
        '[WICPAYREAD],[WICCRCOUNT],[WICCRREAD] ,[LOTOREAD]'
      
        '           ,[LOTOCOUNT] ,[COMMENTS],[SALESDATE],[EMPLOYNUMBER],[' +
        'SHIFT],[REGISTER] ,[REFUNDREAD] ,[SALESTIME]'
      
        '           ,[UTILITYREAD] ,[SALESDATE_END],[STATUS_CUADRE],[STAT' +
        'US_CAJA],[TAX_ESTATAL],[TAX_MUNICIPAL],[TAX_SERVICIO])'
      '     VALUES'
      
        '           (0,0,0,0,0,0,0,0,0,0,0,0,0,0, @STARTBANK,0,0,0,0,0,0,' +
        '0,0,0,0,0,0,'#39#39',GETDATE(),@EMPLOYNUMBER,0,@REGISTER,0,GETDATE(),0' +
        ',GETDATE(),'#39'O'#39','#39'O'#39',0,0,0);'
      ''
      '  COMMIT'
      'END;')
    Left = 488
    Top = 416
  end
  object GETNEWHEADER: TFDQuery
    AfterExecute = GETNEWHEADERAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[GETNEWHEADER]  @EMPLOYNUMBER NCHAR(3),  ' +
        '@REGISTER INTEGER, @ID INTEGER, @TRANSNO INT OUTPUT'
      ' AS'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        '     Insert Into TransactionHeader_temp (TransactionDate, Employ' +
        'Number, TransactionTime, Shift, Register, ID, CHANGE) '
      
        '     Values (GETDATE(),  @EMPLOYNUMBER, GETDATE(), 0, @REGISTER,' +
        ' @ID,0);'
      '     set @TRANSNO = SCOPE_IDENTITY();'
      '  COMMIT'
      'END;;')
    Left = 488
    Top = 504
  end
  object INSERT_ESIGNATURE_PICTURE: TFDQuery
    AfterExecute = INSERT_ESIGNATURE_PICTUREAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE  PROCEDURE [dbo].[INSERT_ESIGNATURE_PICTURE]'
      '('
      '@IMAGE_SIGNATURE IMAGE,'
      '@SIGNATURE_DATE DATE,'
      '@SIGNATURE_USER NCHAR(3),'
      '@SIGNATURE_LINK INT,'
      '@PICKEDUP_BY_RELATION SMALLINT,'
      '@PICKEDUP_ID NCHAR(20))'
      'AS'
      'SET NOCOUNT ON'
      'BEGIN '
      '  begin transaction'
      '    INSERT INTO [dbo].[PRESCRIPTION_ESIGNATURE]'
      '           ([IMAGE_SIGNATURE]'
      '           ,[SIGNATURE_DATE]'
      '           ,[SIGNATURE_USER]'
      '           ,[SIGNATURE_LINK]'
      '           ,[PICKEDUP_BY_RELATION]'
      '           ,[PICKEDUP_ID])'
      '     VALUES'
      '           (@IMAGE_SIGNATURE,'
      '           @SIGNATURE_DATE,'
      '           @SIGNATURE_USER,'
      '           @SIGNATURE_LINK,'
      '           @PICKEDUP_BY_RELATION,'
      '           @PICKEDUP_ID);'
      '  commit '
      'END;')
    Left = 488
    Top = 576
  end
  object RXTEMP1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TABLE [dbo].[RXTEMP1]('
      #9'[FECHAEXPIRACION] [datetime] NULL,'
      #9'[PAGO] [varchar](1) NULL,'
      #9'[NUMEROREFILLSDISPENSADOS] [int] NULL,'
      #9'[DIASSUPLIDOS] [int] NULL,'
      #9'[NUMERODOCTOR] [int] NULL,'
      #9'[LICENCIA] [varchar](15) NULL,'
      #9'[NUMEROAUTORIZACION] [varchar](20) NULL,'
      #9'[DAW] [varchar](1) NULL,'
      #9'[MEZCLA] [varchar](1) NULL,'
      #9'[NUMEROREFILLSAUTORIZADOS] [smallint] NULL,'
      #9'[CODIGOMEZCLA] [varchar](1) NULL,'
      #9'[CANTIDAD] [int] NULL,'
      #9'[CODIGOREFILLNUEVO] [smallint] NULL,'
      #9'[PAGADA] [nchar](1) NULL,'
      #9'[RXDENIALCLARIF] [varchar](2) NULL,'
      #9'[PRIORAUTHORIZATION] [varchar](12) NULL,'
      #9'[RXORIGINCODE] [varchar](1) NULL,'
      #9'[PRIMARYPRESCRIBER] [varchar](10) NULL,'
      #9'[BASISOFCOST] [varchar](2) NULL,'
      #9'[DURCONFLICTCODE] [varchar](2) NULL,'
      #9'[DUROUTCOMECODE] [varchar](2) NULL,'
      #9'[LEVELOFSERVICE] [int] NULL,'
      #9'[CLINICIDNUMBER] [int] NULL,'
      #9'[DIAGNOSISCODE] [varchar](6) NULL,'
      #9'[DURINTERVENTIONCODE] [varchar](2) NULL,'
      #9'[METRICDECIMALQUANTITY] [int] NULL,'
      #9'[RXDENIALOVERRIDE] [int] NULL,'
      #9'[NDCDESPACHADO] [varchar](11) NULL,'
      #9'[NUMEROPLAN] [int] NULL,'
      #9'[PLANMEDICO] [varchar](3) NULL,'
      #9'[MEDICAMENTO] [varchar](30) NULL,'
      #9'[METRICQUANTITY] [real] NULL,'
      #9'[IMPRIMIR] [varchar](1) NULL,'
      #9'[TERMINADA] [varchar](1) NULL,'
      #9'[MEDICAMENTOORIGINAL] [varchar](30) NULL,'
      #9'[COMPOUNDCODE] [int] NULL,'
      #9'[DIAHORA] [datetime] NULL,'
      #9'[CONTROLADO] [varchar](4) NULL,'
      #9'[MEDICAMENTOMIX1] [text] NULL,'
      #9'[LOTE] [varchar](12) NULL,'
      #9'[FASTMIX] [varchar](30) NULL,'
      #9'[BARCODE] [varchar](13) NULL,'
      #9'[RXNUMBERSRNQ] [varchar](1) NULL,'
      #9'[PRODUCTSERVID] [varchar](19) NULL,'
      #9'[PROVIDERIDQUALIFIER] [varchar](2) NULL,'
      #9'[PRESCRIBERIDQUALIFIER] [varchar](2) NULL,'
      #9'[PRESCRIBERLOCATIONCODE] [varchar](3) NULL,'
      #9'[PRESCRIBERLASTNAME] [varchar](15) NULL,'
      #9'[PRESCRIBERTELEPHONE] [varchar](10) NULL,'
      #9'[PRIMARYCAREPROVIDQUALIFIER] [varchar](2) NULL,'
      #9'[PRIMARYCAREPROVID] [varchar](15) NULL,'
      #9'[PRIMARYCAREPROVLOCATIONCODE] [varchar](3) NULL,'
      #9'[PRIMARYCAREPROVLASTNAME] [varchar](15) NULL,'
      #9'[OTHERAMOUNTCLAIMEDSUBCOUNT] [varchar](1) NULL,'
      #9'[OTHERAMOUNTCLAIMEDSUB] [real] NULL,'
      #9'[COSTOVENTA] [real] NULL,'
      #9'[SALESTAX] [real] NULL,'
      #9'[GROSSAMOUNTDUE] [real] NULL,'
      #9'[DISPENSINGFEE] [real] NULL,'
      #9'[PATIENTPAIDAMOUNT] [real] NULL,'
      #9'[DEDUCIBLE] [float] NULL,'
      #9'[PAGOPLAN] [float] NULL,'
      #9'[PRECIOVENTA] [real] NULL,'
      #9'[PRECIOFACTURACION] [real] NULL,'
      #9'[NO_HORA] [int] NULL,'
      #9'[NUMEROTRANSACCIONRX] [int] NOT NULL,'
      #9'[NDC] [varchar](19) NULL,'
      #9'[FECHAVENTA] [datetime] NULL,'
      #9'[CASHPLAN] [varchar](1) NULL,'
      #9'[FECHARECETA] [datetime] NULL,'
      #9'[NUMEROCLIENTE] [int] NULL,'
      #9'[OTAMCLDSUBCOUNTQUAL] [varchar](2) NULL,'
      #9'[PRESC_SRN] [char](7) NULL,'
      #9'[PRODUCTSERVIDQUAL] [char](2) NULL,'
      #9'[PROVIDERID] [char](15) NULL,'
      #9'[UNIT_DOSE_INDICATOR] [char](1) NULL,'
      #9'[UNIT_OF_MEASURE] [char](2) NULL,'
      #9'[SUB_CLARIF_CODE] [char](2) NULL,'
      #9'[OTHERCOVERAGECODE] [char](1) NULL,'
      #9'[TRANSACTION_CODE] [char](2) NULL,'
      #9'[SERVICEPROVIDQUALIFIER] [char](2) NULL,'
      #9'[OP_AMOUNTPAIDCOUNT] [int] NULL,'
      #9'[OP_REJECTCOUNT] [int] NULL,'
      #9'[COB_OTHERPAYMENTCOUNT] [int] NULL,'
      #9'[COMPDOSAGE_FORM_DESC_CODE] [char](2) NULL,'
      #9'[COMPDISP_UNIT_FORM_INDI] [char](1) NULL,'
      #9'[COMPROUTE_OF_ADMINISTRATION] [char](2) NULL,'
      #9'[COMPING_COMP_COUNT] [int] NULL,'
      #9'[DISPENSING_STATUS] [char](1) NULL,'
      #9'[QTY_INTENDED_DISP] [int] NULL,'
      #9'[DAYS_SUPPLY_INTEND_DISP] [int] NULL,'
      #9'[FLAT_SALES_TAXSUB] [real] NULL,'
      #9'[ASSOC_RX_SERVICE_DATE] [datetime] NULL,'
      #9'[ASSOC_RX_SERVICE_REF_NO] [char](7) NULL,'
      #9'[CUPONTYPE] [char](2) NULL,'
      #9'[CUPON_NUMBER] [char](15) NULL,'
      #9'[CUPON_VALUE_AMT] [real] NULL,'
      #9'[PRIOR_AUTH_TYPE_CODE] [char](1) NULL,'
      #9'[PERCENTAGE_SALES_TAX_RATE] [real] NULL,'
      #9'[PERCENTAGE_SALES_TAX_SUB] [real] NULL,'
      #9'[DIAGNOSIS_CODE_COUNT] [int] NULL,'
      #9'[WC_DATE_OF_INJURY] [datetime] NULL,'
      #9'[WC_EMPLOYER_NAME] [char](30) NULL,'
      #9'[WC_EMPLOYER_STREET] [char](30) NULL,'
      #9'[WC_EMPLOYER_CITY] [char](20) NULL,'
      #9'[WC_EMPLOYER_STATE] [char](2) NULL,'
      #9'[WC_EMLPOYER_ZIP] [char](15) NULL,'
      #9'[WC_EMPLOYER_CONTACT] [char](30) NULL,'
      #9'[WC_CARRIER_ID] [char](10) NULL,'
      #9'[WC_CLAIMREF_ID] [char](30) NULL,'
      #9'[WC_EMPLOYER_PHONE] [char](13) NULL,'
      #9'[PER_SALESTAX_BASIS_SUB] [char](2) NULL,'
      #9'[ORG_PRES_PROD_SIDQ] [char](2) NULL,'
      #9'[ORG_PROS_PROD_SERVID] [char](19) NULL,'
      #9'[ORG_PRESC_QTY] [int] NULL,'
      #9'[PROF_SERV_FEE_SUB] [real] NULL,'
      #9'[INCENTIVE_AMOUNT_SUB] [real] NULL,'
      #9'[SERVICEPROVID] [char](15) NULL,'
      #9'[INGREDIENT_COST_PAID] [float] NULL,'
      #9'[INCENTIVE_FEE_PAID] [float] NULL,'
      #9'[DISPENSING_FEE_PAID] [float] NULL,'
      #9'[OTHER_AMOUNT_PAID] [float] NULL,'
      #9'[AMOUNT_COPAY_COINS] [float] NULL,'
      #9'[PRODUCT_ID] [int] NULL,'
      #9'[PHARMACIST] [char](3) NULL,'
      #9'[ATENDIDAPOR] [varchar](5) NULL,'
      #9'[ANADIR_RX] [char](1) NULL,'
      #9'[OTC_NUMBER] [int] NULL,'
      #9'[DISPONIBLE] [float] NULL,'
      #9'[NUMEROTRANSACCIONRXOLD] [int] NULL,'
      #9'[REFILL_AUTOMATICO] [char](1) NULL,'
      #9'[SCANED_RX_LINK] [int] NULL,'
      #9'[RX_STATUS] [char](1) NULL,'
      #9'[ANADIR_OTC_TRANS] [char](1) NULL,'
      #9'[EDITAR_PRECIO] [char](1) NULL,'
      #9'[EP_TRANSACTION_NUMBER] [int] NULL,'
      #9'[INSTANCIA] [int] NULL,'
      #9'[IMAGE_CODE] [char](9) NULL,'
      #9'[ORIGINAL] [char](1) NULL,'
      #9'[ePRESCRIBE_IDMess] [bigint] NULL,'
      #9'[MEDICAID_PAID_AMOUNT] [float] NULL,'
      #9'[PMC_459_ER] [nchar](2) NULL,'
      #9'[PMCC_458_SE] [int] NULL,'
      #9'[SPIDN_454_EK] [nchar](12) NULL,'
      #9'[IATID_463_EW] [nchar](2) NULL,'
      #9'[IAID_464_EX] [nchar](11) NULL,'
      #9'[DRC_357_NV] [nchar](2) NULL,'
      #9'[PAI_391_MT] [nchar](2) NULL,'
      #9'[COMPOUND_TYPE_996_G1] [nchar](2) NULL,'
      #9'[PST_147_U7] [nchar](2) NULL,'
      #9'[SCCD_354_NX] [smallint] NULL,'
      #9'[PRAC_353_NR] [smallint] NULL,'
      #9'[BSC_392_MU] [smallint] NULL,'
      #9'[SPECIAL_PACK_INDI_429_DT] [smallint] NULL,'
      #9'[ROUTEOFADMIN_995_E2] [nchar](11) NULL,'
      #9'[USUARIO_NO] [int] NULL,'
      #9'[WC_117_TR] [smallint] NULL,'
      #9'[WC_118_TS] [nchar](2) NULL,'
      #9'[WC_119_TT] [nchar](15) NULL,'
      #9'[WC_120_TU] [nchar](20) NULL,'
      #9'[WC_121_TV] [nchar](30) NULL,'
      #9'[WC_122_TW] [nchar](20) NULL,'
      #9'[WC_123_TX] [nchar](2) NULL,'
      #9'[WC_124_TY] [nchar](15) NULL,'
      #9'[WC_125_TZ] [nchar](2) NULL,'
      #9'[WC_126_UA] [nchar](19) NULL,'
      #9'[STATUS_RX] [int] NULL,'
      #9'[PS_521_FL] [float] NULL,'
      #9'[PS_523_FN] [float] NULL,'
      #9'[PS_512_FC] [float] NULL,'
      #9'[PS_513_FD] [float] NULL,'
      #9'[PS_514_FE] [float] NULL,'
      #9'[PS_517_FH] [float] NULL,'
      #9'[PS_518_FI] [float] NULL,'
      #9'[PS_520_FK] [float] NULL,'
      #9'[PS_346_HH] [float] NULL,'
      #9'[PS_347_HJ] [float] NULL,'
      #9'[PS_348_HK] [float] NULL,'
      #9'[PS_571_NZ] [float] NULL,'
      #9'[PS_575_EQ] [float] NULL,'
      #9'[PS_574_2Y] [float] NULL,'
      #9'[PS_572_4U] [float] NULL,'
      #9'[PS_577_G3] [float] NULL,'
      #9'[PS_133_UJ] [float] NULL,'
      #9'[PS_134_UK] [float] NULL,'
      #9'[PS_135_UM] [float] NULL,'
      #9'[PS_136_UN] [float] NULL,'
      #9'[PS_137_UP] [float] NULL,'
      #9'[NUMERORECETA] [bigint] NOT NULL,'
      #9'[MEZCLA_TRAN_NO] [int] NULL,'
      #9'[TRANSACTIONNUMBER] [int] IDENTITY(1,1) NOT NULL,'
      #9'[ROBOT] [int] NULL,'
      #9'[BATCH_NUMBER] [int] NULL,'
      #9'[ALCHEMY_PRODUCTID] [int] NULL,'
      #9'[SPI] [nchar](13) NULL,'
      #9'[NO_REFILL_DISPO] [float] NULL,'
      #9'[CANTIDADRECETADA] [float] NULL,'
      #9'[CANTIDADDESPACHADA] [float] NULL,'
      #9'[ETIQUETA] [nchar](296) NULL,'
      #9'[REVENUE_CODE] [nchar](4) NULL,'
      #9'[HCPCS] [nchar](5) NULL,'
      #9'[PRICE_TABLE_ID] [int] NULL,'
      #9'[SIG] [nchar](296) NULL,'
      #9'[WF_TYPED] [nchar](30) NULL,'
      #9'[WF_BILLED] [nchar](30) NULL,'
      #9'[WF_PRINTED] [nchar](30) NULL,'
      #9'[CLAIM_STATUS] [int] NULL,'
      #9'[FACILITY_ID] [int] NULL,'
      #9'[ADHERENCE] [bit] NULL,'
      #9'[UNIT_PRICE] [float] NULL,'
      #9'[MED_CHART] [bit] NULL,'
      #9'[BILL_LATTER] [bit] NULL,'
      #9'[PRINTER_ID] [nchar](1) NULL,'
      #9'[LABEL_NAME] [nchar](20) NULL,'
      #9'[MARKETEDPRODUCTID] [int] NULL,'
      #9'[PA] [bit] NULL,'
      #9'[WF_REVERSE] [bit] NULL,'
      #9'[PDN_SENT] [bit] NULL,'
      #9'[PAIDBYPLAN] [bit] NULL,'
      #9'[REFILL_REQ_TRANSNO] [int] NULL,'
      #9'[TIME_RX] [datetime] NULL,'
      #9'[CREATE_REFILL_RECORD] [bit] NULL,'
      ' CONSTRAINT [PK_RXTEMP1] PRIMARY KEY CLUSTERED '
      '('
      #9'[NUMERORECETA] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]'
      ''
      
        'ALTER TABLE [dbo].[RXTEMP1] ADD  CONSTRAINT [DF__RXTEMP1__OTC_NU' +
        'M__37887847]  DEFAULT ('#39'0'#39') FOR [OTC_NUMBER]'
      
        'ALTER TABLE [dbo].[RXTEMP1] ADD  CONSTRAINT [DF__RXTEMP1__RX_STA' +
        'T__6C2EE8AB]  DEFAULT ('#39'N'#39') FOR [RX_STATUS]'
      
        'ALTER TABLE [dbo].[RXTEMP1] ADD  CONSTRAINT [DF__RXTEMP1__ANADIR' +
        '___6D230CE4]  DEFAULT ('#39'F'#39') FOR [ANADIR_OTC_TRANS]'
      
        'ALTER TABLE [dbo].[RXTEMP1] ADD  CONSTRAINT [DF__RXTEMP1__MARKET' +
        'E__6E928D21]  DEFAULT ((0)) FOR [MARKETEDPRODUCTID]'
      
        'ALTER TABLE [dbo].[RXTEMP1] ADD  CONSTRAINT [DF__RXTEMP1__PDN_SE' +
        'N__7EC8F4EA]  DEFAULT ((0)) FOR [PDN_SENT]'
      
        'ALTER TABLE [dbo].[RXTEMP1] ADD  CONSTRAINT [DF__RXTEMP1__PAIDBY' +
        'P__3C4D2D64]  DEFAULT ((0)) FOR [PAIDBYPLAN]'
      
        'ALTER TABLE [dbo].[RXTEMP1] ADD  CONSTRAINT [DF__RXTEMP1__REFILL' +
        '___3D41519D]  DEFAULT ((0)) FOR [REFILL_REQ_TRANSNO]'
      
        'ALTER TABLE [dbo].[RXTEMP1] ADD  CONSTRAINT [DF_RXTEMP1_TIME_RX]' +
        '  DEFAULT (getdate()) FOR [TIME_RX]'
      '')
    Left = 96
    Top = 584
  end
  object ADDUPDATEOTC: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[ADDUPDATEOTC] @INSTANCIA INT, @TERMINADA' +
        ' BIT, @NUMERORECETA BIGINT'
      'AS'
      'DECLARE @NORX INT'
      'BEGIN'
      '  SET NOCOUNT ON;'
      '  IF @NUMERORECETA > 0'
      '  BEGIN'
      
        '    DECLARE MyCursor CURSOR FOR Select NUMERORECETA FROM RXTEMP1' +
        ' WHERE NUMERORECETA = @NUMERORECETA;'
      '  END'
      '  ELSE'
      '  BEGIN'
      '    if @TERMINADA <> 1'
      
        '      DECLARE MyCursor CURSOR FOR Select NUMERORECETA from RxTem' +
        'p1 where Instancia = @INSTANCIA  order by NumeroReceta'
      '    else'
      
        '      DECLARE MyCursor CURSOR FOR Select NUMERORECETA from RxTem' +
        'p1 where Instancia = @INSTANCIA and Terminada = @TERMINADA order' +
        ' by NumeroReceta'
      '  END;'
      '  OPEN MyCursor'
      '  FETCH NEXT FROM MyCursor'
      '  INTO @NORX'
      '  WHILE @@FETCH_STATUS = 0'
      '  BEGIN'
      '   DELETE FROM RXTEMP1 WHERE NUMERORECETA = @NORX;'
      '   FETCH NEXT FROM MyCursor'
      '   INTO @NORX'
      '  END'
      '  CLOSE MyCursor'
      '  DEALLOCATE MyCursor    '
      'END')
    Left = 1296
    Top = 760
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    OnError = FDQuery1Error
    Left = 1008
    Top = 400
  end
  object UPDATE_OTC_WFCASHIER: TFDQuery
    AfterExecute = UPDATE_OTC_WFCASHIERAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[UPDATE_OTC_WFCASHIER] @OTCNUMBER INTEGER' +
        ', @WF_CASHIER NCHAR(30) '
      'AS'
      'BEGIN    '
      '  SET NOCOUNT ON;'
      '  BEGIN TRANSACTION'
      
        '    Update OTC set WF_CASHIER = @WF_CASHIER, Cobrado = '#39'T'#39' Where' +
        ' OTCNUMBER = @OTCNUMBER;'
      '  COMMIT;'
      'END')
    Left = 1472
    Top = 744
  end
  object INSERT_LOG: TFDQuery
    AfterExecute = INSERT_LOGAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_LOG]'
      '('
      '@DESCRIPCION CHAR(30),'
      '@CODIGO CHAR(1),'
      '@NDC_BARCODE CHAR(13),'
      '@USUARIO CHAR(3),'
      '@SUPERVISOR VARCHAR(3),'
      '@NO_RX BIGINT,'
      '@OTCNUMBER INT,'
      '@PRESCRIBER_ID INT,'
      '@CUSTOMER_ID INT,'
      '@PASSWORD_ID INT,'
      '@HEALTH_PLAN_ID INT,'
      '@PATIENT_HEALTH_PLAN_ID INT,'
      '@DRUG_ID INT,'
      '@POS_RX CHAR(1),'
      '@NOTE VARCHAR(MAX),'
      '@CONTROLLED BIT,'
      '@SUCCESSFUL BIT'
      ')'
      'AS'
      'BEGIN'
      '  SET NOCOUNT ON '
      '  BEGIN TRANSACTION'
      
        '  INSERT INTO LOG (CODIGO, NDC_BARCODE, FECHA, USUARIO, DESCRIPC' +
        'ION, SUPERVISOR, NO_RX, OTCNUMBER, PRESCRIBER_ID,CUSTOMER_ID,PAS' +
        'SWORD_ID,HEALTH_PLAN_ID,PATIENT_HEALTH_PLAN_ID,DRUG_ID,POS_RX,NO' +
        'TE,CONTROLLED, SUCCESSFUL)'
      
        '  VALUES (@CODIGO, @NDC_BARCODE, GETDATE(), @USUARIO, @DESCRIPCI' +
        'ON, @SUPERVISOR, @NO_RX, @OTCNUMBER, @PRESCRIBER_ID,@CUSTOMER_ID' +
        ',@PASSWORD_ID,@HEALTH_PLAN_ID,@PATIENT_HEALTH_PLAN_ID,@DRUG_ID,@' +
        'POS_RX,@NOTE,@CONTROLLED, @SUCCESSFUL) '
      '  COMMIT'
      'END')
    Left = 1480
    Top = 584
  end
  object EDIT_INVENTORY: TFDQuery
    AfterExecute = EDIT_INVENTORYAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[EDIT_INVENTORY] @TIPO char(3), @FECHA_EX' +
        'PIRACION date,'
      '@DEPARTAMENTO smallint, @LOTE char(12), @COMESPECIAL date, '
      
        '@TERMINAESPECIAL date, @ULTIMOCAMBIO char(30), @ULTIMAVENTA date' +
        ', '
      
        '@CODIGOBARRA char(14),  @NUMEROSUPLIDOR int, @SUB_DEPARTAMENTO s' +
        'mallint, '
      
        '@DESCRIPCION char(35), @ROUTEOFADMINISTRATION char(16), @CONTROL' +
        'ADO char(4), '
      '@STRENGTH char(25), @INFOADICIONAL char(25), '
      
        '@GENERICNAME char(60), @BRAND char(1), @RECETARIO char(1),  @PAC' +
        'KAGESIZE int,'
      
        '@STATUS char(1), @NDC nchar(19), @ROBOT int, @ROBOT_NDC nchar(11' +
        '),'
      '@REVENUE_CODE nchar(4),'
      
        '@HCPCS nchar(5), @CASA_FARMACEUTICA char(150), @AllowControledRe' +
        'fills bit,'
      '@PRICE_TABLE_ID int, @OVERRIDE_SYSTEM_DEFAULT_PRICE bit, '
      
        '@PRICE_UPDATE bit, @ENTER_LAB_RESULTS bit, @EXPIRE_OPTION nchar(' +
        '15),'
      '@EXPIRE_DAYS int, @EXPIRE_OTHER nchar(15),'
      '@MAIN_NDC bit, @PSEUDOEPHEDRINE bit,  '
      '@EDITAR_PRECIO bit, @PRECIO REAL,'
      '@COSTO REAL, @RBP REAL, @ESPECIAL REAL,'
      '@DIRECT_PRICE float, @UC_PRICE float, '
      '@WAC_PRICE float, @MAC_PRICE float,  @INITIAL_QTY decimal(18,2),'
      '@QTYINVENTARIO real, @CMININVENTARIO real, @CMAXINVENTARIO real,'
      '@METRICSIZE real,'
      '@ATENDIDAPOR CHAR(3),'
      '@PHARMACIST CHAR(3),'
      '@COBRAR_TAX int,'
      '@ALCHEMY_PRODUCTID int,'
      '@PAKAGE_ID int,'
      '@MARKETEDPRODUCTID int,'
      '@MARKET_STATUS nchar(10),'
      '@OUTERPACKAGEUNIT nchar(10),'
      '@PAKAGE_DESCRIPTION nchar(150),'
      '@VERSION_DESCRIPTION nchar(150),'
      '@PRODUCTNO INT OUTPUT,'
      '@NOTE VARCHAR(MAX),'
      '@INV340B_QT decimal(18,2),'
      '@INVLTC_QT decimal(18,2),'
      '@GENERIC_LNK int,'
      '@SPI varchar(10),'
      '@AP_FRM_SIG varchar(20),'
      '@AP_MTH_SIG varchar(20),'
      '@Drug340B bit,'
      '@FactorSig numeric(18,2),'
      '@DF_QTY numeric(18,2),'
      '@LTC bit,'
      '@UNIT_OF_MEASURE CHAR(2)'
      'AS'
      'DECLARE @ISCONTROLLED BIT'
      ''
      'BEGIN'
      '  begin transaction'
      
        ' IF RTRIM(@CONTROLADO) = '#39'RX'#39' SET @ISCONTROLLED = 0 ELSE SET @IS' +
        'CONTROLLED = 1;'
      '  IF @PRODUCTNO > 0  '
      '  BEGIN'
      #9'   UPDATE [dbo].[INVENTARIOPISO]'
      #9'   SET [TIPO] = @TIPO'
      #9#9'  ,[FECHA_EXPIRACION] = @FECHA_EXPIRACION'
      #9#9'  ,[COSTO] = @COSTO'
      #9#9'  ,[RBP] = @RBP'
      #9#9'  ,[ESPECIAL] = @ESPECIAL'
      #9#9'  ,[DEPARTAMENTO] = @DEPARTAMENTO'
      #9#9'  ,[LOTE] = @LOTE'
      #9#9'  ,[PRECIO] = @PRECIO'
      #9#9'  ,[COMESPECIAL] = @COMESPECIAL'
      #9#9'  ,[TERMINAESPECIAL] = @TERMINAESPECIAL'
      #9#9'  ,[ULTIMOCAMBIO] = @ULTIMOCAMBIO'
      #9#9'  ,[ULTIMAVENTA] = @ULTIMAVENTA'
      #9#9'  ,[QTYINVENTARIO] = @QTYINVENTARIO'
      #9#9'  ,[CMAXINVENTARIO] = @CMAXINVENTARIO'
      #9#9'  ,[CMININVENTARIO] = @CMININVENTARIO'
      #9#9'  ,[CODIGOBARRA] = @CODIGOBARRA'
      #9#9'  ,[NUMEROSUPLIDOR] = @NUMEROSUPLIDOR'
      #9#9'  ,[SUB_DEPARTAMENTO] = @SUB_DEPARTAMENTO'
      #9#9'  ,[DESCRIPCION] = @DESCRIPCION'
      #9#9'  ,[ROUTEOFADMINISTRATION] = @ROUTEOFADMINISTRATION'
      #9#9'  ,[CONTROLADO] = @CONTROLADO'
      #9#9'  ,[STRENGTH] = @STRENGTH'
      #9#9'  ,[INFOADICIONAL] = @INFOADICIONAL'
      #9#9'  ,[METRICSIZE] = @METRICSIZE'
      #9#9'  ,[GENERICNAME] = @GENERICNAME'
      #9#9'  ,[BRAND] = @BRAND'
      #9#9'  ,[RECETARIO] = @RECETARIO'
      #9#9'  ,[PACKAGESIZE] = @PACKAGESIZE'
      #9#9'  ,[STATUS] = @STATUS'
      #9#9'  ,[NDC] = @NDC'
      #9#9'  ,[ROBOT] = @ROBOT'
      #9#9'  ,[ROBOT_NDC] = @ROBOT_NDC'
      #9#9'  ,[REVENUE_CODE] = @REVENUE_CODE'
      #9#9'  ,[HCPCS] = @HCPCS'
      #9#9'  ,[CASA_FARMACEUTICA] = @CASA_FARMACEUTICA'
      #9#9'  ,[AllowControledRefills] = @AllowControledRefills'
      #9#9'  ,[PRICE_TABLE_ID] = @PRICE_TABLE_ID'
      
        #9#9'  ,[OVERRIDE_SYSTEM_DEFAULT_PRICE] = @OVERRIDE_SYSTEM_DEFAULT_' +
        'PRICE'
      #9#9'  ,[WAC_PRICE] = @WAC_PRICE'
      #9#9'  ,[MAC_PRICE] = @MAC_PRICE'
      #9#9'  ,[DIRECT_PRICE] = @DIRECT_PRICE'
      #9#9'  ,[UC_PRICE] = @UC_PRICE'
      #9#9'  ,[PRICE_UPDATE] = @PRICE_UPDATE'
      #9#9'  ,[ENTER_LAB_RESULTS] = @ENTER_LAB_RESULTS'
      #9#9'  ,[EXPIRE_OPTION] = @EXPIRE_OPTION'
      #9#9'  ,[EXPIRE_DAYS] = @EXPIRE_DAYS'
      #9#9'  ,[EXPIRE_OTHER] = @EXPIRE_OTHER'
      #9#9'  ,[MAIN_NDC] = @MAIN_NDC'
      #9#9'  ,[PSEUDOEPHEDRINE] = @PSEUDOEPHEDRINE'
      #9#9'  ,[INITIAL_QTY] = @INITIAL_QTY'
      #9#9'  ,[EDITAR_PRECIO] = @EDITAR_PRECIO'
      #9#9'  ,[COBRAR_TAX] = @COBRAR_TAX'
      #9#9'  ,[AP_FRM_SIG] = @AP_FRM_SIG'
      #9#9'  ,[AP_MTH_SIG] = @AP_MTH_SIG'
      #9#9'  ,[Drug340B] = @Drug340B'
      #9#9'  ,[LTC] = @LTC'
      #9#9'  ,[Unit_of_Measure] = @UNIT_OF_MEASURE'
      #9'   WHERE PRODUCTNO = @PRODUCTNO;'
      
        #9'   EXECUTE INSERT_LOG '#39'Inventory Modification'#39', '#39'M'#39', @NDC, @ATE' +
        'NDIDAPOR, @PHARMACIST, 0, 0,0,0,0,0,0,@PRODUCTNO,'#39'R'#39',@NOTE,@ISCO' +
        'NTROLLED,1;'
      '  END'
      '  else'
      '  begin'
      '    insert into INVENTARIOPISO ([TIPO]'
      #9#9#9',[FECHA_EXPIRACION]'
      #9#9#9',[COSTO]'
      #9#9#9',[RBP]'
      #9#9#9',[ESPECIAL]'
      #9#9#9',[DEPARTAMENTO]'
      #9#9#9',[LOTE] '
      #9#9#9',[PRECIO] '
      #9#9#9',[COMESPECIAL] '
      #9#9#9',[TERMINAESPECIAL] '
      #9#9#9',[ULTIMOCAMBIO] '
      #9#9#9',[ULTIMAVENTA] '
      #9#9#9',[QTYINVENTARIO] '
      #9#9#9',[CMAXINVENTARIO] '
      #9#9#9',[CMININVENTARIO] '
      #9#9#9',[CODIGOBARRA] '
      #9#9#9',[NUMEROSUPLIDOR] '
      #9#9#9',[SUB_DEPARTAMENTO] '
      #9#9#9',[DESCRIPCION] '
      #9#9#9',[ROUTEOFADMINISTRATION] '
      #9#9#9',[CONTROLADO] '
      #9#9#9',[STRENGTH] '
      #9#9#9',[INFOADICIONAL] '
      #9#9#9',[METRICSIZE] '
      #9#9#9',[GENERICNAME] '
      #9#9#9',[BRAND] '
      #9#9#9',[RECETARIO] '
      #9#9#9',[PACKAGESIZE] '
      #9#9#9',[STATUS] '
      #9#9#9',[NDC] '
      #9#9#9',[ROBOT] '
      #9#9#9',[ROBOT_NDC] '
      #9#9#9',[REVENUE_CODE] '
      #9#9#9',[HCPCS] '
      #9#9#9',[CASA_FARMACEUTICA] '
      #9#9#9',[AllowControledRefills] '
      #9#9#9',[PRICE_TABLE_ID] '
      #9#9#9',[OVERRIDE_SYSTEM_DEFAULT_PRICE] '
      #9#9#9',[WAC_PRICE] '
      #9#9#9',[MAC_PRICE] '
      #9#9#9',[DIRECT_PRICE] '
      #9#9#9',[UC_PRICE] '
      #9#9#9',[PRICE_UPDATE] '
      #9#9#9',[ENTER_LAB_RESULTS] '
      #9#9#9',[EXPIRE_OPTION] '
      #9#9#9',[EXPIRE_DAYS] '
      #9#9#9',[EXPIRE_OTHER] '
      #9#9#9',[MAIN_NDC] '
      #9#9#9',[PSEUDOEPHEDRINE] '
      #9#9#9',[INITIAL_QTY] '
      #9#9#9',[EDITAR_PRECIO]'
      #9#9#9',[ALCHEMY_PRODUCTID]'
      #9#9#9',[PAKAGE_ID]'
      #9#9#9',[MARKETEDPRODUCTID]'
      #9#9#9',[MARKET_STATUS]'
      #9#9#9',[OUTERPACKAGEUNIT]'
      #9#9#9',[PAKAGE_DESCRIPTION]'
      #9#9#9',[VERSION_DESCRIPTION]'
      #9#9#9',[FOODITEM]'
      #9#9#9',[NONEBC]'
      #9#9#9',[COBRAR_TAX]'
      #9#9#9',[INV340B_QT]'
      #9#9#9',[INVLTC_QT]'
      #9#9#9',[GENERIC_LNK]'
      #9#9#9',[SPI]'
      #9#9#9',[AP_FRM_SIG]'
      #9#9#9',[AP_MTH_SIG]'
      #9#9#9',[Drug340B]'
      #9#9#9',[FactorSig]'
      #9#9#9',[DF_QTY]'
      #9#9#9',[LTC]'
      #9#9#9',[UNIT_OF_MEASURE]) '
      #9#9'  Values'
      #9#9#9'(@TIPO'
      #9#9#9',@FECHA_EXPIRACION'
      #9#9#9',@COSTO'
      #9#9#9',@RBP'
      #9#9#9',@ESPECIAL'
      #9#9#9',@DEPARTAMENTO'
      #9#9#9',@LOTE'
      #9#9#9',@PRECIO'
      #9#9#9',@COMESPECIAL'
      #9#9#9',@TERMINAESPECIAL'
      #9#9#9',@ULTIMOCAMBIO'
      #9#9#9',@ULTIMAVENTA'
      #9#9#9',@QTYINVENTARIO'
      #9#9#9',@CMAXINVENTARIO'
      #9#9#9',@CMININVENTARIO'
      #9#9#9',@CODIGOBARRA'
      #9#9#9',@NUMEROSUPLIDOR'
      #9#9#9',@SUB_DEPARTAMENTO'
      #9#9#9',@DESCRIPCION'
      #9#9#9',@ROUTEOFADMINISTRATION'
      #9#9#9',@CONTROLADO'
      #9#9#9',@STRENGTH'
      #9#9#9',@INFOADICIONAL'
      #9#9#9',@METRICSIZE'
      #9#9#9',@GENERICNAME'
      #9#9#9',@BRAND'
      #9#9#9',@RECETARIO'
      #9#9#9',@PACKAGESIZE'
      #9#9#9',@STATUS'
      #9#9#9',@NDC'
      #9#9#9',@ROBOT'
      #9#9#9',@ROBOT_NDC'
      #9#9#9',@REVENUE_CODE'
      #9#9#9',@HCPCS'
      #9#9#9',@CASA_FARMACEUTICA'
      #9#9#9',@AllowControledRefills'
      #9#9#9',@PRICE_TABLE_ID'
      #9#9#9',@OVERRIDE_SYSTEM_DEFAULT_PRICE'
      #9#9#9',@WAC_PRICE'
      #9#9#9',@MAC_PRICE'
      #9#9#9',@DIRECT_PRICE'
      #9#9#9',@UC_PRICE'
      #9#9#9',@PRICE_UPDATE'
      #9#9#9',@ENTER_LAB_RESULTS'
      #9#9#9',@EXPIRE_OPTION'
      #9#9#9',@EXPIRE_DAYS'
      #9#9#9',@EXPIRE_OTHER'
      #9#9#9',@MAIN_NDC'
      #9#9#9',@PSEUDOEPHEDRINE'
      #9#9#9',@INITIAL_QTY'
      #9#9#9',@EDITAR_PRECIO'
      #9#9#9',@ALCHEMY_PRODUCTID'
      #9#9#9',@PAKAGE_ID'
      #9#9#9',@MARKETEDPRODUCTID'
      #9#9#9',@MARKET_STATUS'
      #9#9#9',@OUTERPACKAGEUNIT'
      #9#9#9',@PAKAGE_DESCRIPTION'
      #9#9#9',@VERSION_DESCRIPTION'
      #9#9#9',0'
      #9#9#9',0'
      #9#9#9',@COBRAR_TAX'
      #9#9#9',@INV340B_QT'
      #9#9#9',@INVLTC_QT'
      #9#9#9',@GENERIC_LNK'
      #9#9#9',@SPI'
      #9#9#9',@AP_FRM_SIG'
      #9#9#9',@AP_MTH_SIG'
      #9#9#9',@Drug340B'
      #9#9#9',@FactorSig'
      #9#9#9',@DF_QTY'
      #9#9#9',@LTC'
      #9#9#9',@UNIT_OF_MEASURE);'
      #9#9'  set @PRODUCTNO = SCOPE_IDENTITY();'
      
        #9#9'  EXECUTE INSERT_LOG '#39'Inventory, Drug inserted'#39', '#39'A'#39', @NDC, @A' +
        'TENDIDAPOR, @PHARMACIST, 0, 0,0,0,0,0,0,@PRODUCTNO,'#39'R'#39','#39#39',@ISCON' +
        'TROLLED,1;'
      '  end;'
      '  commit;'
      'END;')
    Left = 1592
    Top = 56
  end
  object INVENTORY_CONTROL: TFDQuery
    AfterExecute = INVENTORY_CONTROLAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE  PROCEDURE [dbo].[INVENTORY_CONTROL] (@OTC_NUMBER INT,'
      #9#9' @IMPRIMIR BIT, @LABEL_NAME NCHAR(15), @PRINTER_ID INT,'
      #9#9' @REVERSAL BIT, @PRINTER_IP NCHAR(15))'
      'AS'
      '  DECLARE @QTY FLOAT'
      '  DECLARE @COMPOUNDCODE INT'
      '  DECLARE @PRODUCTID  INTEGER'
      '  DECLARE @NORX BIGINT'
      '  DECLARE @ATENDIDAPOR NCHAR(3)'
      '  DECLARE @MEZCLA_TRAN_NO INT'
      '  DECLARE @RECETARIO_PISO CHAR(1)'
      '  DECLARE @METRIC_SIZE DECIMAL(18,2)'
      '  DECLARE @PACKAGE_SIZE INT'
      '  DECLARE @CONTROLADO CHAR(4)'
      '  DECLARE @NDC NCHAR(11)'
      '  DECLARE @PRESCRIBER NCHAR(50)'
      '  DECLARE @PATIENT NCHAR(50)'
      '  declare @NODOCTOR INT'
      '  DECLARE @PRESCRIBER_ID NCHAR(15)'
      '  DECLARE @NOCIENTE INT'
      '  DECLARE @BATCH NCHAR(15)'
      '  DECLARE @FECHAEXPI DATE'
      '  DECLARE @BALANCE DECIMAL(18,2)'
      '  DECLARE @DRUG NCHAR(30)'
      '  DECLARE @NOREFAUTO DECIMAL(18,2)'
      '  DECLARE @CANTRECETADA DECIMAL(18,2)'
      '  DECLARE @TOTALDISPENSADO DECIMAL(18,2)'
      '  DECLARE @NOREFDISP DECIMAL(18,2)'
      '  DECLARE @TOTALRECETADO DECIMAL(18,2)'
      '  DECLARE @CANT_DISPONIBLE DECIMAL(18,2)'
      '  DECLARE @340B BIT'
      '  DECLARE @LTC BIT'
      '  DECLARE @EasyrxUpdateInv BIT'
      '  DECLARE @REG BIT'
      '  SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      
        '     SELECT @DRUG = MEDICAMENTO, @QTY = QTY, @PRODUCTID = PRODUC' +
        'T_ID, @NORX = NUMERORECETA, @ATENDIDAPOR = ATENDIDOPOR, @MEZCLA_' +
        'TRAN_NO = MEZCLA_TRAN_NO,'
      
        #9' @CONTROLADO = CONTROLADO, @NDC = NDC FROM OTC WHERE OTCNUMBER ' +
        '= @OTC_NUMBER;'
      '     if @REVERSAL = 1 SELECT @QTY = @QTY-(@QTY+@QTY); '
      
        '     SELECT @COMPOUNDCODE = COMPOUNDCODE, @NODOCTOR = NUMERODOCT' +
        'OR, @PRESCRIBER_ID = LICENCIA, @NOCIENTE = NUMEROCLIENTE, @NOREF' +
        'AUTO = NUMEROREFILLSAUTORIZADOS, '
      
        #9' @CANTRECETADA = CANTIDADRECETADA, @CANT_DISPONIBLE = CANTIDAD_' +
        'DISPONIBLE, @340B = isNull(F340B,0),'
      
        #9' @LTC = isNull(LTC,0) FROM PRESCRIPTIONS WHERE NUMERORECETA = @' +
        'NORX;'
      #9' SELECT @EasyrxUpdateInv=EasyrxUpdateInv FROM CREDITDEBITSETUP;'
      #9' SELECT @REG=IIF(@340B=0 AND @LTC=0, 1, 0);'
      ''
      #9' IF @NOREFAUTO > 0 '
      #9' begin'
      
        #9'   SET @TOTALRECETADO = (@CANTRECETADA * @NOREFAUTO)+@CANTRECET' +
        'ADA;'
      #9'   SET @TOTALDISPENSADO = @TOTALRECETADO - @CANT_DISPONIBLE;'
      #9'   '#9'   IF @TOTALDISPENSADO > @CANTRECETADA '
      #9'   begin'
      #9'     SET @NOREFDISP = (@TOTALDISPENSADO / @CANTRECETADA)-1;'
      #9'   end'
      #9'   else'
      #9'   begin'
      #9'     SET @NOREFDISP = 0;'
      #9'   end'
      #9' end'
      #9' else'
      #9'    SET @NOREFDISP = 0;'
      #9#9'IF @COMPOUNDCODE = 1'
      #9#9'begin'
      
        #9#9#9'Select @RECETARIO_PISO = RECETARIO, @METRIC_SIZE = METRICSIZE' +
        ', @PACKAGE_SIZE = PACKAGESIZE FROM INVENTARIOPISO WHERE PRODUCTN' +
        'O = @PRODUCTID;'
      #9#9#9'IF @RECETARIO_PISO = '#39'R'#39' '
      #9#9#9'begin'
      
        #9#9#9#9'if @340B = 1 Update InventarioPiso set INV340B_QT = INV340B_' +
        'QT - @QTY where PRODUCTNO = @PRODUCTID'
      
        #9#9#9#9'else if @LTC = 1 Update InventarioPiso set LTC = LTC - @QTY ' +
        'where PRODUCTNO = @PRODUCTID'
      
        #9#9#9#9'else Update InventarioPiso set QTYINVENTARIO = QTYINVENTARIO' +
        ' - @QTY where PRODUCTNO = @PRODUCTID;'
      #9#9#9#9
      
        #9#9#9#9'IF @LTC = 1 Update Inventario_Item set INVREG_QT = INVREG_QT' +
        ' - @QTY where PRODUCTNO = @PRODUCTID;'#9#9#9#9
      
        #9#9#9#9'ELSE IF @340B = 1 Update Inventario_Item set INV340B_QT = IN' +
        'V340B_QT - @QTY where PRODUCTNO = @PRODUCTID;'#9#9#9#9
      
        #9#9#9#9'ELSE  Update Inventario_Item set INVREG_QT = INVREG_QT - @QT' +
        'Y where PRODUCTNO = @PRODUCTID;'#9#9#9#9
      ''
      ''
      #9#9#9#9'if (@CONTROLADO <> '#39'RX'#39') and (rtrim(@CONTROLADO) <> '#39#39')'
      #9#9#9#9'begin'
      
        #9#9#9#9#9'SELECT @BATCH = LOTE, @FECHAEXPI = FECHA_EXPIRACION, @BALAN' +
        'CE = QTYINVENTARIO FROM INVENTARIOPISO where PRODUCTNO = @PRODUC' +
        'TID; '
      
        #9#9#9#9#9'Select @PRESCRIBER = RTRIM(APELLIDO_PATERNO) + '#39' '#39' + RTRIM(' +
        'APELLIDO_MATERNO) + '#39' '#39' + RTRIM(NOMBRE)  from DOCTOR where NUMER' +
        'ODOCTOR = @NODOCTOR; '
      
        #9#9#9#9#9'Select @PATIENT = RTRIM(APELLIDOPATERNO) + '#39' '#39' + RTRIM(APEL' +
        'LIDOMATERNO) + '#39' '#39' + RTRIM(NOMBRE)  from PACIENTES where NUMEROC' +
        'LIENTE = @NOCIENTE;'
      
        #9#9#9#9#9'exec ADD_EDIT_CONTROLED_LOG @NORX,  @PATIENT, @PRESCRIBER, ' +
        '@PRESCRIBER_ID, @BATCH, @FECHAEXPI, @BALANCE, @DRUG, @NDC, @ATEN' +
        'DIDAPOR, @CONTROLADO, 0, @NODOCTOR, @NOCIENTE, @QTY, @NOCIENTE, ' +
        '@OTC_NUMBER,0,@NOREFDISP;     '
      #9#9#9#9'end;'
      #9#9#9#9
      #9#9#9#9'IF @EasyrxUpdateInv=1'
      
        #9#9#9#9#9'EXEC dbo.INVENTORY_ERX @sRXNum=@NORX,@NDC=@NDC ,@InvReg=@RE' +
        'G, @Inv340B=@340B, @InvLTC=@LTC, @QTY=@QTY '
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'begin'
      #9#9#9#9'SET @QTY = ((@QTY / @METRIC_SIZE) * @PACKAGE_SIZE);'
      
        #9#9#9#9'Update InventarioPiso set QTYINVENTARIO = QTYINVENTARIO - @Q' +
        'TY where PRODUCTNO = @PRODUCTID;'
      #9#9#9'end;'
      #9#9'end'
      #9#9'else'
      #9#9'begin '
      
        #9#9#9'DECLARE MyCursor CURSOR FOR SELECT CANTIDADDESPACHADA, PRODUC' +
        'T_ID from MEZCLAS where OTCNUMBER = @OTC_NUMBER;'
      #9#9#9'OPEN MyCursor'
      #9#9#9'FETCH NEXT FROM MyCursor'
      #9#9#9'INTO @QTY,@PRODUCTID'
      #9#9#9'WHILE @@FETCH_STATUS = 0'
      #9#9#9'BEGIN'
      
        #9#9#9#9'SELECT @BATCH = LOTE, @FECHAEXPI = FECHA_EXPIRACION, @BALANC' +
        'E = QTYINVENTARIO, @CONTROLADO = CONTROLADO FROM INVENTARIOPISO ' +
        'where PRODUCTNO = @PRODUCTID;'#9#9' '
      #9#9#9#9'if @REVERSAL = 1 SELECT @QTY = @QTY-(@QTY+@QTY);'
      
        #9#9#9#9'if @340B = 1 Update InventarioPiso set INV340B_QT = INV340B_' +
        'QT - @QTY where PRODUCTNO = @PRODUCTID'
      
        #9#9#9#9'else if @LTC = 1 Update InventarioPiso set LTC = LTC - @QTY ' +
        'where PRODUCTNO = @PRODUCTID'
      
        #9#9#9#9'else Update InventarioPiso set QTYINVENTARIO = QTYINVENTARIO' +
        ' - @QTY where PRODUCTNO = @PRODUCTID;'
      #9#9#9#9
      
        #9#9#9#9'IF @LTC = 1 Update Inventario_Item set INVREG_QT = INVREG_QT' +
        ' - @QTY where PRODUCTNO = @PRODUCTID;'#9#9#9#9
      
        #9#9#9#9'ELSE IF @340B = 1 Update Inventario_Item set INV340B_QT = IN' +
        'V340B_QT - @QTY where PRODUCTNO = @PRODUCTID;'#9#9#9#9
      
        #9#9#9#9'ELSE  Update Inventario_Item set INVREG_QT = INVREG_QT - @QT' +
        'Y where PRODUCTNO = @PRODUCTID;'#9
      ''
      #9#9#9#9'if (@CONTROLADO <> '#39'RX'#39') and (rtrim(@CONTROLADO) <> '#39#39')'
      #9#9#9#9'begin'
      
        #9#9#9#9#9'Select @PRESCRIBER = RTRIM(APELLIDO_PATERNO) + '#39' '#39' + RTRIM(' +
        'APELLIDO_MATERNO) + '#39' '#39' + RTRIM(NOMBRE)  from DOCTOR where NUMER' +
        'ODOCTOR = @NODOCTOR; '
      
        #9#9#9#9#9'Select @PATIENT = RTRIM(APELLIDOPATERNO) + '#39' '#39' + RTRIM(APEL' +
        'LIDOMATERNO) + '#39' '#39' + RTRIM(NOMBRE)  from PACIENTES where NUMEROC' +
        'LIENTE = @NOCIENTE;'
      
        #9#9#9#9#9'exec ADD_EDIT_CONTROLED_LOG @NORX,  @PATIENT, @PRESCRIBER, ' +
        '@PRESCRIBER_ID, @BATCH, @FECHAEXPI, @BALANCE, @DRUG, @NDC, @ATEN' +
        'DIDAPOR, @CONTROLADO, 0, @NODOCTOR, @NOCIENTE, @QTY,@NOCIENTE, @' +
        'OTC_NUMBER,0,@NOREFDISP;     '
      #9#9#9#9'end;'
      #9#9#9#9'FETCH NEXT FROM MyCursor'
      #9#9#9#9'INTO @QTY,@PRODUCTID'
      ''
      #9#9#9#9'IF @EasyrxUpdateInv=1'
      
        #9#9#9#9#9'EXEC dbo.INVENTORY_ERX @sRXNum=@NORX,@NDC=@NDC ,@InvReg=@RE' +
        'G, @Inv340B=@340B, @InvLTC=@LTC, @QTY=@QTY '
      #9#9#9'END'
      #9#9#9'CLOSE MyCursor'
      #9#9#9'DEALLOCATE MyCursor'
      #9#9'end;'
      '     if @IMPRIMIR = 1 '
      '     begin'#9
      
        '       IF (LTRIM(@LABEL_NAME) = '#39#39') SELECT @LABEL_NAME = '#39'DEFAUL' +
        'T'#39';   '
      '       INSERT INTO [dbo].[PRINT_QUERIES]'
      '           ([RX_ID]'
      '           ,[COPIES]'
      '           ,[RX_OTC]'
      '           ,[LABEL_NAME]'
      '           ,[TYPIST]'
      '           ,[PRINTTOSCREEN]'
      #9#9'   ,[PRINTER_ID]'
      #9#9'   ,[PRINTER_IP])'
      '       VALUES'
      
        '         (@OTC_NUMBER, 1, '#39'RX'#39', @LABEL_NAME, @ATENDIDAPOR, 0, @P' +
        'RINTER_ID, @PRINTER_IP)'
      '     end;'
      '     IF @REVERSAL = 1 '
      '     BEGIN'
      '       UPDATE OTC SET QTY = 0  WHERE OTCNUMBER = @OTC_NUMBER;'
      '       IF @COMPOUNDCODE = 2'
      '       BEGIN'
      
        '         UPDATE MEZCLAS SET CANTIDADDESPACHADA = 0 WHERE NO_TRAN' +
        'S = @MEZCLA_TRAN_NO;'
      '       END;'
      '     END;'
      '  commit'
      'end;')
    Left = 1480
    Top = 496
  end
  object PATIENT_SEARCH: TFDQuery
    AfterExecute = PATIENT_SEARCHAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[PATIENT_SEARCH]'
      '@TOKEN1 CHAR(15), @TOKEN2 CHAR(15), @TOKEN3 CHAR(15)'
      'AS'
      'BEGIN  '
      ' SET NOCOUNT ON;'
      ' SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;'
      ' BEGIN TRAN;'
      '  IF PATINDEX('#39'%[0-9]%'#39', @TOKEN1) > 0'
      '  BEGIN'
      '    IF LEN(@TOKEN1)-1 = 10'
      '    BEGIN'
      
        '        SELECT TOP(100) ISNULL(LTRIM(RTRIM(APELLIDOPATERNO)),'#39#39')' +
        ' + '#39' '#39' + ISNULL(LTRIM(RTRIM(APELLIDOMATERNO)),'#39#39')  + '#39' '#39' +  ISNU' +
        'LL(LTRIM(RTRIM(NOMBRE)),'#39#39') AS CUSTOMER, NUMEROCLIENTE as CUSTOM' +
        'ER_NO, SEXO AS GENDER, '
      
        #9#9'ISNULL(LTRIM(RTRIM(DIRECCION1)),'#39#39') + '#39' '#39'  + ISNULL(LTRIM(RTRI' +
        'M(DIRECCION2)),'#39#39') + '#39' '#39' + ISNULL(LTRIM(RTRIM(CIUDAD)),'#39#39') + '#39' '#39 +
        ' + ISNULL(LTRIM(RTRIM(CODIGOPOSTAL)),'#39#39') AS ADDRESS_STR,  CELULA' +
        'R AS MOBILEPHONE, TELEFONO AS TELEPHONE,'
      
        '        CARDHOLDERID, FECHANACIMIENTO AS DOB, ADHERENCE  FROM PA' +
        'CIENTES with (NOLOCK) WHERE (TELEFONO = '#39'('#39' + SUBSTRING(@TOKEN1,' +
        '1,3) + '#39')'#39' + SUBSTRING(@TOKEN1,4,3) + '#39'-'#39' + SUBSTRING(@TOKEN1,7,' +
        '4)) OR'
      
        #9'     (CELULAR = '#39'('#39' + SUBSTRING(@TOKEN1,1,3) + '#39')'#39' + SUBSTRING(' +
        '@TOKEN1,4,3) + '#39'-'#39' + SUBSTRING(@TOKEN1,7,4));'#9
      '    END'
      '    ELSE'
      '    BEGIN'
      #9'  IF @@ROWCOUNT = 0'
      #9'  BEGIN'
      
        #9'    SELECT TOP(100) ISNULL(LTRIM(RTRIM(APELLIDOPATERNO)),'#39#39') + ' +
        #39' '#39' + ISNULL(LTRIM(RTRIM(APELLIDOMATERNO)),'#39#39')  + '#39' '#39' +  ISNULL(' +
        'LTRIM(RTRIM(NOMBRE)),'#39#39') AS CUSTOMER, NUMEROCLIENTE as CUSTOMER_' +
        'NO, SEXO AS GENDER,'
      
        #9#9'ISNULL(LTRIM(RTRIM(DIRECCION1)),'#39#39') + '#39' '#39'  + ISNULL(LTRIM(RTRI' +
        'M(DIRECCION2)),'#39#39') + '#39' '#39' + ISNULL(LTRIM(RTRIM(CIUDAD)),'#39#39') + '#39' '#39 +
        ' + ISNULL(LTRIM(RTRIM(CODIGOPOSTAL)),'#39#39') AS ADDRESS_STR,  CELULA' +
        'R AS MOBILEPHONE, TELEFONO AS TELEPHONE,'
      
        '            CARDHOLDERID, FECHANACIMIENTO AS DOB, ADHERENCE FROM' +
        ' PACIENTES with (NOLOCK) WHERE CARDHOLDERID = (SUBSTRING(@TOKEN1' +
        ', 1, LEN(@TOKEN1)-1));'
      #9'  END;'
      #9'  IF @@ROWCOUNT = 0'
      #9'  BEGIN'
      
        #9'    SELECT TOP(100) ISNULL(LTRIM(RTRIM(APELLIDOPATERNO)),'#39#39') + ' +
        #39' '#39' + ISNULL(LTRIM(RTRIM(APELLIDOMATERNO)),'#39#39')  + '#39' '#39' +  ISNULL(' +
        'LTRIM(RTRIM(NOMBRE)),'#39#39') AS CUSTOMER, NUMEROCLIENTE as CUSTOMER_' +
        'NO, SEXO AS GENDER, '
      
        #9#9'ISNULL(LTRIM(RTRIM(DIRECCION1)),'#39#39') + '#39' '#39'  + ISNULL(LTRIM(RTRI' +
        'M(DIRECCION2)),'#39#39') + '#39' '#39' + ISNULL(LTRIM(RTRIM(CIUDAD)),'#39#39') + '#39' '#39 +
        ' + ISNULL(LTRIM(RTRIM(CODIGOPOSTAL)),'#39#39') AS ADDRESS_STR,  CELULA' +
        'R AS MOBILEPHONE, TELEFONO AS TELEPHONE,'
      
        '            CARDHOLDERID, FECHANACIMIENTO AS DOB, ADHERENCE FROM' +
        ' PACIENTES with (NOLOCK) WHERE SOCIO = (SUBSTRING(@TOKEN1, 1, LE' +
        'N(@TOKEN1)-1));'
      #9'  END;'
      '    END;'
      '  END'
      '  ELSE'
      '  BEGIN'
      '    IF (@TOKEN3 <> '#39'%'#39') '
      #9'BEGIN'
      
        #9'  SELECT TOP(100) ISNULL(LTRIM(RTRIM(APELLIDOPATERNO)),'#39#39') + '#39' ' +
        #39' + ISNULL(LTRIM(RTRIM(APELLIDOMATERNO)),'#39#39')  + '#39' '#39' +  ISNULL(LT' +
        'RIM(RTRIM(NOMBRE)),'#39#39') AS CUSTOMER, NUMEROCLIENTE as CUSTOMER_NO' +
        ', SEXO AS GENDER, '
      
        #9'  ISNULL(LTRIM(RTRIM(DIRECCION1)),'#39#39') + '#39' '#39'  + ISNULL(LTRIM(RTR' +
        'IM(DIRECCION2)),'#39#39') + '#39' '#39' + ISNULL(LTRIM(RTRIM(CIUDAD)),'#39#39') + '#39' ' +
        #39' + ISNULL(LTRIM(RTRIM(CODIGOPOSTAL)),'#39#39') AS ADDRESS_STR,  CELUL' +
        'AR AS MOBILEPHONE, TELEFONO AS TELEPHONE,'
      
        '          CARDHOLDERID, FECHANACIMIENTO AS DOB, ADHERENCE FROM P' +
        'ACIENTES with (NOLOCK) WHERE APELLIDOPATERNO LIKE RTRIM(LTRIM(@T' +
        'OKEN1))'
      
        #9'  AND APELLIDOMATERNO LIKE RTRIM(LTRIM(@TOKEN2)) AND NOMBRE LIK' +
        'E RTRIM(LTRIM(@TOKEN3)) '
      #9'  ORDER BY APELLIDOPATERNO, APELLIDOMATERNO, NOMBRE'
      #9'END'
      '    ELSE'
      #9'BEGIN'
      
        #9'  SELECT TOP(100) ISNULL(LTRIM(RTRIM(APELLIDOPATERNO)),'#39#39') + '#39' ' +
        #39' + ISNULL(LTRIM(RTRIM(APELLIDOMATERNO)),'#39#39')  + '#39' '#39' +  ISNULL(LT' +
        'RIM(RTRIM(NOMBRE)),'#39#39') AS CUSTOMER, NUMEROCLIENTE as CUSTOMER_NO' +
        ', SEXO AS GENDER, '
      
        #9'  ISNULL(LTRIM(RTRIM(DIRECCION1)),'#39#39') + '#39' '#39'  + ISNULL(LTRIM(RTR' +
        'IM(DIRECCION2)),'#39#39') + '#39' '#39' + ISNULL(LTRIM(RTRIM(CIUDAD)),'#39#39') + '#39' ' +
        #39' + ISNULL(LTRIM(RTRIM(CODIGOPOSTAL)),'#39#39')  AS ADDRESS_STR,  CELU' +
        'LAR AS MOBILEPHONE, TELEFONO AS TELEPHONE,'
      
        '          CARDHOLDERID, FECHANACIMIENTO AS DOB, ADHERENCE FROM P' +
        'ACIENTES with (NOLOCK) WHERE (APELLIDOPATERNO LIKE RTRIM(LTRIM(@' +
        'TOKEN1))'
      
        #9'  AND NOMBRE LIKE RTRIM(LTRIM(@TOKEN2))) OR (APELLIDOPATERNO LI' +
        'KE RTRIM(LTRIM(@TOKEN1))'
      #9'  AND APELLIDOMATERNO LIKE RTRIM(LTRIM(@TOKEN2)))'
      #9'  ORDER BY APELLIDOPATERNO, APELLIDOMATERNO, NOMBRE'
      #9'END;'
      '  END;'
      '  COMMIT;'
      'END;')
    Left = 1600
    Top = 144
  end
  object QCreateBackupDB: TFDQuery
    AfterExecute = QCreateBackupDBAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'if db_id('#39'Backup'#39') is  null '
      'begin'
      '  CREATE DATABASE "Backup";'
      'end;')
    Left = 1624
    Top = 376
  end
  object FDConnectionBackup: TFDConnection
    Params.Strings = (
      'Server=192.168.3.204, 1433'
      'User_Name=dbo'
      'Password=agabriel'
      'ApplicationName=Enterprise/Architect/Ultimate'
      'Workstation=SERVER'
      'MARS=yes'
      'Database=BACKUP'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 1608
    Top = 232
  end
  object CLONE_PRODUCT: TFDQuery
    AfterExecute = CLONE_PRODUCTAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[CLONE_PRODUCT] @PRODUCTNO INTEGER, @BARC' +
        'ODE NCHAR(14),  @PRODUCTID INTEGER OUTPUT'
      'AS'
      'BEGIN'
      '  BEGIN TRANSACTION'
      '    INSERT INTO [dbo].[INVENTARIOPISO]'
      '           ([TIPO]'
      '           ,[FECHA_EXPIRACION]'
      '           ,[CODIGO]'
      '           ,[COSTO]'
      '           ,[RBP]'
      '           ,[ESPECIAL]'
      '           ,[DEPARTAMENTO]'
      '           ,[LOTE]'
      '           ,[PRECIO]'
      '           ,[COMESPECIAL]'
      '           ,[TERMINAESPECIAL]'
      '           ,[PORCIENTODESCUENTO]'
      '           ,[ULTIMOCAMBIO]'
      '           ,[ULTIMAVENTA]'
      '           ,[CMAXINVENTARIO]'
      '           ,[CMININVENTARIO]'
      '           ,[CODIGOBARRA]'
      '           ,[FOODITEM]'
      '           ,[NONEBC]'
      '           ,[NUMEROSUPLIDOR]'
      '           ,[SUB_DEPARTAMENTO]'
      '           ,[DESCRIPCION]'
      '           ,[ROUTEOFADMINISTRATION]'
      '           ,[CONTROLADO]'
      '           ,[STRENGTH]'
      '           ,[INFOADICIONAL]'
      '           ,[METRICSIZE]'
      '           ,[CAUTION1]'
      '           ,[CAUTION2]'
      '           ,[CAUTION3]'
      '           ,[GENERICNAME]'
      '           ,[TXR]'
      '           ,[BRAND]'
      '           ,[GROUP_PRODUCTNO]'
      '           ,[RECETARIO]'
      '           ,[GROUP_QTY]'
      '           ,[PRECIO_CAJA]'
      '           ,[QTY_CAJA]'
      '           ,[DESCUENTO]'
      '           ,[IMAGE_CODE]'
      '           ,[PACKAGESIZE]'
      '           ,[TXR_EXTENSION]'
      '           ,[STATUS]'
      '           ,[TAXABLE]'
      '           ,[TAXABLE_ESTATAL]'
      '           ,[PRECIO2]'
      '           ,[PO]'
      '           ,[isbn]'
      '           ,[SHOWINDIVIDUAL]'
      '           ,[PRECIO_DACO]'
      '           ,[NDC]'
      '           ,[METRIC_UNIT]'
      '           ,[ROBOT]'
      '           ,[ROBOT_NDC]'
      '           ,[PATROCINIO]'
      '           ,[COBRAR_TAX]'
      '           ,[ALCHEMY_PRODUCTID]'
      '           ,[MARKET_STATUS]'
      '           ,[OUTERPACKAGEUNIT]'
      '           ,[PAKAGE_ID]'
      '           ,[REVENUE_CODE]'
      '           ,[HCPCS]'
      '           ,[CASA_FARMACEUTICA]'
      '           ,[VERSION_DESCRIPTION]'
      '           ,[PAKAGE_DESCRIPTION]'
      '           ,[AllowControledRefills]'
      '           ,[PRECIOVENTA2]'
      '           ,[PRICE_TABLE_ID]'
      '           ,[ESCANEAR_BARCODEALTERNO]'
      '           ,[PRICE_UPDATE]'
      '           ,[ENTER_LAB_RESULTS]'
      '           ,[OVERRIDE_SYSTEM_DEFAULT_PRICE]'
      '           ,[WAC_PRICE]'
      '           ,[MAC_PRICE]'
      '           ,[DIRECT_PRICE]'
      '           ,[UC_PRICE]'
      '           ,[EXPIRE_OPTION]'
      '           ,[EXPIRE_DAYS]'
      '           ,[EXPIRE_OTHER]'
      '           ,[MARKETEDPRODUCTID]'
      '           ,[MAIN_NDC]'
      '           ,[PSEUDOEPHEDRINE]'
      '           ,[INITIAL_QTY]'
      '           ,[EDITAR_PRECIO]'
      '           ,[QTYINVENTARIO])'
      '     select '
      '           [TIPO]'
      '           ,[FECHA_EXPIRACION]'
      '           ,[CODIGO]'
      '           ,[COSTO]'
      '           ,[RBP]'
      '           ,[ESPECIAL]'
      '           ,[DEPARTAMENTO]'
      '           ,[LOTE]'
      '           ,[PRECIO]'
      '           ,[COMESPECIAL]'
      '           ,[TERMINAESPECIAL]'
      '           ,[PORCIENTODESCUENTO]'
      '           ,[ULTIMOCAMBIO]'
      '           ,[ULTIMAVENTA]'
      '           ,[CMAXINVENTARIO]'
      '           ,[CMININVENTARIO]'
      '           ,@BARCODE'
      '           ,[FOODITEM]'
      '           ,[NONEBC]'
      '           ,[NUMEROSUPLIDOR]'
      '           ,[SUB_DEPARTAMENTO]'
      '           ,[DESCRIPCION]'
      '           ,[ROUTEOFADMINISTRATION]'
      '           ,[CONTROLADO]'
      '           ,[STRENGTH]'
      '           ,[INFOADICIONAL]'
      '           ,[METRICSIZE]'
      '           ,[CAUTION1]'
      '           ,[CAUTION2]'
      '           ,[CAUTION3]'
      '           ,[GENERICNAME]'
      '           ,[TXR]'
      '           ,[BRAND]'
      '           ,[GROUP_PRODUCTNO]'
      '           ,[RECETARIO]'
      '           ,[GROUP_QTY]'
      '           ,[PRECIO_CAJA]'
      '           ,[QTY_CAJA]'
      '           ,[DESCUENTO]'
      '           ,[IMAGE_CODE]'
      '           ,[PACKAGESIZE]'
      '           ,[TXR_EXTENSION]'
      '           ,[STATUS]'
      '           ,[TAXABLE]'
      '           ,[TAXABLE_ESTATAL]'
      '           ,[PRECIO2]'
      '           ,[PO]'
      '           ,[isbn]'
      '           ,[SHOWINDIVIDUAL]'
      '           ,[PRECIO_DACO]'
      '           ,[NDC]'
      '           ,[METRIC_UNIT]'
      '           ,[ROBOT]'
      '           ,[ROBOT_NDC]'
      '           ,[PATROCINIO]'
      '           ,[COBRAR_TAX]'
      '           ,[ALCHEMY_PRODUCTID]'
      '           ,[MARKET_STATUS]'
      '           ,[OUTERPACKAGEUNIT]'
      '           ,[PAKAGE_ID]'
      '           ,[REVENUE_CODE]'
      '           ,[HCPCS]'
      '           ,[CASA_FARMACEUTICA]'
      '           ,[VERSION_DESCRIPTION]'
      '           ,[PAKAGE_DESCRIPTION]'
      '           ,[AllowControledRefills]'
      '           ,[PRECIOVENTA2]'
      '           ,[PRICE_TABLE_ID]'
      '           ,[ESCANEAR_BARCODEALTERNO]'
      '           ,[PRICE_UPDATE]'
      '           ,[ENTER_LAB_RESULTS]'
      '           ,[OVERRIDE_SYSTEM_DEFAULT_PRICE]'
      '           ,[WAC_PRICE]'
      '           ,[MAC_PRICE]'
      '           ,[DIRECT_PRICE]'
      '           ,[UC_PRICE]'
      '           ,[EXPIRE_OPTION]'
      '           ,[EXPIRE_DAYS]'
      '           ,[EXPIRE_OTHER]'
      '           ,[MARKETEDPRODUCTID]'
      '           ,[MAIN_NDC]'
      '           ,[PSEUDOEPHEDRINE]'
      '           ,[INITIAL_QTY]'
      '           ,[EDITAR_PRECIO]'
      '           ,[QTYINVENTARIO]'
      #9#9#9'from INVENTARIOPISO where PRODUCTNO = @PRODUCTNO;'
      #9#9#9'set @PRODUCTID = SCOPE_IDENTITY();'
      '  COMMIT; '
      'END;')
    Left = 1464
    Top = 1048
  end
  object RXDATA: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TABLE [dbo].[RXDATA]('
      #9'[PHAR_NO] [int] NULL,'
      #9'[PHAR_ZIP] [varchar](9) NULL,'
      #9'[RX_NO] [int] NULL,'
      #9'[HIN] [varchar](9) NULL,'
      #9'[DATE_FILLE] [datetime] NULL,'
      #9'[NEW_REF_CO] [smallint] NULL,'
      #9'[DISP_NDC] [varchar](11) NULL,'
      #9'[DISP_DRUG] [varchar](28) NULL,'
      #9'[PRESC_NDC] [varchar](11) NULL,'
      #9'[PRESC_DRUG] [varchar](28) NULL,'
      #9'[MET_QUANT] [int] NULL,'
      #9'[DAYS_SUPLY] [smallint] NULL,'
      #9'[ING_COST] [decimal](18, 2) NULL,'
      #9'[GR_AMOU_DU] [decimal](18, 2) NULL,'
      #9'[PAYMENT_TY] [smallint] NULL,'
      #9'[PLAN_CODE] [varchar](4) NULL,'
      #9'[BIN] [varchar](6) NULL,'
      #9'[PROC_CON_N] [varchar](10) NULL,'
      #9'[GROUP_NO] [varchar](15) NULL,'
      #9'[NO_REF_AUT] [smallint] NULL,'
      #9'[REF_REMAIN] [smallint] NULL,'
      #9'[DAW] [varchar](1) NULL,'
      #9'[PRESC_LNAM] [varchar](15) NULL,'
      #9'[PRESC_FNAM] [varchar](10) NULL,'
      #9'[PRESC_MINI] [varchar](1) NULL,'
      #9'[PRESC_ID] [varchar](9) NULL,'
      #9'[PRESC_ZIP] [varchar](5) NULL,'
      #9'[PRESC_SPEC] [varchar](5) NULL,'
      #9'[PAT_DBIRTH] [datetime] NULL,'
      #9'[SEX_CODE] [smallint] NULL,'
      #9'[PAT_ZIPCOD] [varchar](5) NULL,'
      #9'[LO_PA_TR] [varchar](10) NULL,'
      #9'[PHAR_TYPE] [varchar](1) NULL,'
      #9'[CHAIN_CODE] [varchar](2) NULL,'
      #9'[NU_HO_IND] [varchar](1) NULL,'
      #9'[MAIL_RX_IN] [varchar](1) NULL,'
      #9'[COMP_CODE] [varchar](1) NULL,'
      #9'[ICD9] [varchar](10) NULL,'
      #9'[FILLER] [varchar](10) NULL,'
      #9'[NO_RX] [bigint] NULL,'
      #9'[DEA] [nchar](15) NULL,'
      #9'[NPI] [nchar](15) NULL,'
      #9'[OTCNUMBER] [int] NULL,'
      #9'[PUBLISHED] [bit] NULL'
      ') ON [PRIMARY];'
      
        'ALTER TABLE [dbo].[RXDATA] ADD  CONSTRAINT [DF_RXDATA_PUBLISHED]' +
        '  DEFAULT ((0)) FOR [PUBLISHED]'
      '')
    Left = 280
    Top = 584
  end
  object INSERT_RXDATA: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER  [dbo].[INSERT_RXDATA] ON [dbo].[OTC]'
      '   AFTER INSERT,UPDATE'
      'AS '
      'declare @PRESC_NDC char(11)'
      'DECLARE @PRESC_DRUG VARCHAR(28);'
      'DECLARE @PRODUCTID INTEGER'
      'DECLARE @NORX BIGINT'
      'DECLARE @NORX2 BIGINT'
      'DECLARE @PHAR_NO INT'
      'DECLARE @PHAR_ZIP NCHAR(9)'
      'DECLARE @DATE_FILLE DATE'
      'DECLARE @NEW_REF_CO INT'
      'DECLARE @DISP_NDC CHAR(11)'
      'DECLARE @DISP_DRUG NCHAR(28)'
      'DECLARE @MET_QUANT INT'
      'DECLARE @DAYS_SUPLY SMALLINT'
      'DECLARE @ING_COST DECIMAL(18,2)'
      'DECLARE @GR_AMOU_DU DECIMAL(18,2) '
      'DECLARE @PAYMENT_TY SMALLINT'
      'DECLARE @PLAN_CODE CHAR(3)'
      'DECLARE @BIN CHAR(6)'
      'DECLARE @PROCESSORCONTROL VARCHAR(10)'
      'DECLARE @GROUP_NO VARCHAR(15)'
      'DECLARE @NO_PLAN INTEGER'
      'DECLARE @NO_REF_AUT INT'
      'DECLARE @DAW SMALLINT'
      'DECLARE @NODOCTOR INTEGER'
      'DECLARE @PRESC_LNAME VARCHAR(15)'
      'DECLARE @PRESC_FNAM VARCHAR(10)'
      'DECLARE @PRESC_ID VARCHAR(9)'
      'DECLARE @PRESC_ZIP VARCHAR(5)'
      'DECLARE @PRESC_SPEC VARCHAR(5)'
      'DECLARE @PAT_DBIRTH DATE'
      'DECLARE @NOCLIENTE INT'
      'DECLARE @SEX_CODE SMALLINT'
      'DECLARE @PAT_ZIPCOD VARCHAR(5)'
      'DECLARE @COMP_CODE INT'
      'DECLARE @NPI NCHAR(15)'
      'DECLARE @DEA NCHAR(15)'
      'declare @type char(1)'
      'DECLARE @OTCNUMBER INT'
      'DECLARE @QTY FLOAT'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      
        #9'SELECT @PHAR_NO = NABP, @PHAR_ZIP = STOREZIPCODE FROM CREDITDEB' +
        'ITSETUP;'
      
        #9'Select @NORX = NUMERORECETA,  @PRODUCTID = PRODUCT_ID, @NEW_REF' +
        '_CO = NO_REF_DISPENSADO, @ING_COST = COSTOVENTA, @GR_AMOU_DU = (' +
        'PAGO_PLAN + DEDUCIBLE),'
      
        #9'@PLAN_CODE = PLAN_MEDICO, @NO_PLAN = NUMEROPLAN, @DAW = DAW, @N' +
        'OCLIENTE = NUMEROCLIENTE, @DISP_NDC = NDC, @DATE_FILLE = FECHAOT' +
        'C,'
      
        #9'@DISP_DRUG = SUBSTRING(MEDICAMENTO,1, 30), @MET_QUANT = METRICD' +
        'ECIMALQUANTITY, @DAYS_SUPLY = DAYS_SUPPLY, @OTCNUMBER = OTCNUMBE' +
        'R,'
      #9'@NEW_REF_CO = CODIGOREFILLNUEVO, @QTY = QTY FROM INSERTED'
      
        #9'Select @BIN = BINNUMBER, @PROCESSORCONTROL = PROCESSORCONTROL F' +
        'ROM PLANESMEDICOS with (NOLOCK) WHERE ABREVIATURA = @PLAN_CODE'
      
        #9'Select @NO_REF_AUT = NUMEROREFILLSAUTORIZADOS, @NODOCTOR = NUME' +
        'RODOCTOR, @COMP_CODE = COMPOUNDCODE, '
      
        #9'@PRESC_DRUG = substring(MEDICAMENTO,1,28), @PRESC_NDC = NDC fro' +
        'm PRESCRIPTIONS with (NOLOCK) where NUMERORECETA = @NORX;'
      
        #9'Select @PRESC_LNAME = APELLIDO_PATERNO, @PRESC_FNAM = NOMBRE, @' +
        'PRESC_ID = substring(LICENCIA,1,9), @PRESC_ZIP = SUBSTRING(CODIG' +
        'O_POSTAL,1,5),'
      
        #9'@PRESC_SPEC = SUBSTRING(ESPECIALIDAD,1,5), @NPI = NPI, @DEA = D' +
        'EA_FEDERAL FROM DOCTOR with (NOLOCK) WHERE NUMERODOCTOR = @NODOC' +
        'TOR; '
      
        #9'Select @GROUP_NO = NOGRUPO from PATPLAN with (NOLOCK) where NUM' +
        'EROPLAN = @NO_PLAN'
      
        #9'Select @PAT_DBIRTH = FECHANACIMIENTO, @SEX_CODE = SEXO, @PAT_ZI' +
        'PCOD = CODIGOPOSTAL from PACIENTES with (NOLOCK) where NUMEROCLI' +
        'ENTE = @NOCLIENTE;'
      #9'IF @PLAN_CODE = '#39'CAS'#39
      #9'begin'
      #9#9'SELECT @PAYMENT_TY = 1; '
      #9#9'select @GR_AMOU_DU = TOTAL FROM INSERTED'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'SELECT @PAYMENT_TY = 3; '
      #9'end;'
      #9'select @NORX2 = RX_NO from RXDATA WHERE RX_NO = @NORX'
      #9'IF (@NORX2 is null) and (@NORX is not null)'
      #9'begin'
      #9#9'IF UPDATE (QTY) '
      #9#9'begin  '
      #9#9#9'if @QTY > 0'
      #9#9#9'begin'
      
        #9#9#9#9'Insert into RXDATA (PHAR_NO, PHAR_ZIP, RX_NO,  DATE_FILLE, N' +
        'EW_REF_CO, DISP_NDC, DISP_DRUG, PRESC_NDC, PRESC_DRUG, MET_QUANT' +
        ','
      
        #9#9#9#9'DAYS_SUPLY, ING_COST, GR_AMOU_DU, PAYMENT_TY, PLAN_CODE, BIN' +
        ', PROC_CON_N, GROUP_NO, NO_REF_AUT, DAW, PRESC_LNAM, PRESC_FNAM,' +
        ' PRESC_ID,'
      
        #9#9#9#9'PRESC_SPEC, PAT_DBIRTH, SEX_CODE, PAT_ZIPCOD, PHAR_TYPE, COM' +
        'P_CODE, NPI, DEA, OTCNUMBER, REF_REMAIN)'
      
        #9#9#9#9'VALUES (@PHAR_NO, @PHAR_ZIP, @NORX, @DATE_FILLE, @NEW_REF_CO' +
        ', @DISP_NDC, @DISP_DRUG, @Presc_NDC, @PRESC_DRUG, @MET_QUANT,'
      
        #9#9#9#9'@DAYS_SUPLY, @ING_COST, @GR_AMOU_DU, @PAYMENT_TY, @PLAN_CODE' +
        ', @BIN, @PROCESSORCONTROL, @GROUP_NO, @NO_REF_AUT, @DAW, @PRESC_' +
        'LNAME, '
      
        #9#9#9#9'@PRESC_FNAM, @PRESC_ID, @PRESC_SPEC, @PAT_DBIRTH, @SEX_CODE,' +
        ' @PAT_ZIPCOD, '#39'I'#39', @COMP_CODE, @NPI, @DEA, @OTCNUMBER, (@NO_REF_' +
        'AUT - @NEW_REF_CO));'
      #9#9#9'end;'
      #9#9'end;'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'UPDATE [dbo].[RXDATA]'
      #9#9'SET [PHAR_NO] = @PHAR_NO   '
      #9#9',[PHAR_ZIP] = @PHAR_ZIP'
      #9#9',[RX_NO] = @NORX'
      #9#9',[DATE_FILLE] = @DATE_FILLE'
      #9#9',[NEW_REF_CO] = @NEW_REF_CO'
      #9#9',[DISP_NDC] = @DISP_NDC'
      #9#9',[DISP_DRUG] = @DISP_DRUG'
      #9#9',[PRESC_NDC] = @PRESC_NDC'
      #9#9',[PRESC_DRUG] = @PRESC_DRUG'
      #9#9',[MET_QUANT] = @MET_QUANT'
      #9#9',[DAYS_SUPLY] = @DAYS_SUPLY'
      #9#9',[ING_COST] = @ING_COST'
      #9#9',[GR_AMOU_DU] = @GR_AMOU_DU'
      #9#9',[PAYMENT_TY] = @PAYMENT_TY'
      #9#9',[PLAN_CODE] = @PLAN_CODE'
      #9#9',[BIN] = @BIN'
      #9#9',[PROC_CON_N] = @PROCESSORCONTROL'
      #9#9',[GROUP_NO] = @GROUP_NO'
      #9#9',[NO_REF_AUT] = @NO_REF_AUT'
      #9#9',[DAW] = @DAW'
      #9#9',[PRESC_LNAM] = @PRESC_LNAME'
      #9#9',[PRESC_FNAM] = @PRESC_FNAM'
      #9#9'--,[PRESC_MINI] = @PRESC_MINI'
      #9#9',[PRESC_ID] = @PRESC_ID'
      #9#9',[PRESC_ZIP] = @PRESC_ZIP'
      #9#9',[PRESC_SPEC] = @PRESC_SPEC'
      #9#9',[PAT_DBIRTH] = @PAT_DBIRTH'
      #9#9',[SEX_CODE] = @SEX_CODE'
      #9#9',[PAT_ZIPCOD] = @PAT_ZIPCOD'
      #9#9',[PHAR_TYPE] = '#39'I'#39
      #9#9',[COMP_CODE] = @COMP_CODE'
      #9#9',[DEA] = @DEA'
      #9#9',[NPI] = @NPI'
      #9#9',[REF_REMAIN] = (@NO_REF_AUT - @NEW_REF_CO)'
      #9#9'WHERE RX_NO = @NORX;'
      #9'end;'
      #9'commit;'
      'END;')
    Left = 200
    Top = 584
  end
  object RX: TFDQuery
    AfterExecute = RXAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[RX]'
      'AS'
      
        'SELECT        dbo.PACIENTES.NOMBRE, dbo.PACIENTES.APELLIDOPATERN' +
        'O, dbo.PACIENTES.APELLIDOMATERNO, dbo.PRESCRIPTIONS.NUMERORECETA' +
        ', dbo.OTC.PLAN_MEDICO, dbo.OTC.OTCNUMBER, '
      
        '                         dbo.OTC.MEDICAMENTO, dbo.OTC.FECHAOTC, ' +
        'dbo.PRESCRIPTIONS.NUMEROCLIENTE AS RX_NOCLIENTE, dbo.PACIENTES.N' +
        'UMEROCLIENTE AS PAT_NOCLIENTE, '
      
        '                         dbo.OTC.NUMEROCLIENTE AS OTC_NOCLIENTE,' +
        ' dbo.OTC.RX_STATUS, dbo.OTC.NUMEROPLAN, dbo.OTC.CLAIM_STATUS, db' +
        'o.OTC.BATCH_NUMBER'
      'FROM            dbo.OTC INNER JOIN'
      
        '                         dbo.PRESCRIPTIONS ON dbo.OTC.NUMERORECE' +
        'TA = dbo.PRESCRIPTIONS.NUMERORECETA INNER JOIN'
      
        '                         dbo.PACIENTES ON dbo.PRESCRIPTIONS.NUME' +
        'ROCLIENTE = dbo.PACIENTES.NUMEROCLIENTE')
    Left = 208
    Top = 824
  end
  object LOGEADOPOS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[LOGEADOPOS] (@USERNO INT,'
      '         @LOGEADO bit)'
      'AS'
      'begin'
      '  UPDATE passwords SET POS_LOGEADO = @LOGEADO'
      '  Where USERNO = @USERNO;'
      'end')
    Left = 336
    Top = 424
  end
  object PURCHASE_SALES: TFDQuery
    AfterExecute = PURCHASE_SALESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW PURCHASE_SALES'
      'AS'
      
        'SELECT        dbo.INVENTARIOPISO.PRODUCTNO, dbo.ORDER_DETAIL.DES' +
        'CRIPTION, dbo.ORDER_DETAIL.NDC, dbo.ORDER_DETAIL.QTYRECEIVED, db' +
        'o.INVENTARIOPISO.CONTROLADO, dbo.INVENTARIOPISO.INITIAL_QTY, '
      
        '                         dbo.ORDER_HEADER.ORDERDATE, dbo.ORDER_D' +
        'ETAIL.LOTE, dbo.ORDER_DETAIL.FECHA_EXPIRACION'
      'FROM            dbo.ORDER_DETAIL INNER JOIN'
      
        '                         dbo.INVENTARIOPISO ON dbo.ORDER_DETAIL.' +
        'NDC = dbo.INVENTARIOPISO.NDC INNER JOIN'
      
        '                         dbo.ORDER_HEADER ON dbo.ORDER_DETAIL.OR' +
        'DERID = dbo.ORDER_HEADER.ORDERID')
    Left = 1464
    Top = 832
  end
  object qInventarioPiso: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from InventarioPiso')
    Left = 32
    Top = 384
  end
  object dspInventarioPiso: TDataSetProvider
    DataSet = qInventarioPiso
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 384
  end
  object cdsInventarioPiso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInventarioPiso'
    Left = 248
    Top = 384
    object cdsInventarioPisoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 3
    end
    object cdsInventarioPisoFECHA_EXPIRACION: TSQLTimeStampField
      FieldName = 'FECHA_EXPIRACION'
      Origin = 'FECHA_EXPIRACION'
    end
    object cdsInventarioPisoCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioPisoCOSTO: TSingleField
      FieldName = 'COSTO'
      Origin = 'COSTO'
    end
    object cdsInventarioPisoRBP: TSingleField
      FieldName = 'RBP'
      Origin = 'RBP'
    end
    object cdsInventarioPisoESPECIAL: TSingleField
      FieldName = 'ESPECIAL'
      Origin = 'ESPECIAL'
    end
    object cdsInventarioPisoDEPARTAMENTO: TSmallintField
      FieldName = 'DEPARTAMENTO'
      Origin = 'DEPARTAMENTO'
    end
    object cdsInventarioPisoLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      FixedChar = True
      Size = 12
    end
    object cdsInventarioPisoPRECIO: TSingleField
      FieldName = 'PRECIO'
      Origin = 'PRECIO'
    end
    object cdsInventarioPisoCOMESPECIAL: TSQLTimeStampField
      FieldName = 'COMESPECIAL'
      Origin = 'COMESPECIAL'
    end
    object cdsInventarioPisoTERMINAESPECIAL: TSQLTimeStampField
      FieldName = 'TERMINAESPECIAL'
      Origin = 'TERMINAESPECIAL'
    end
    object cdsInventarioPisoPORCIENTODESCUENTO: TStringField
      FieldName = 'PORCIENTODESCUENTO'
      Origin = 'PORCIENTODESCUENTO'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioPisoULTIMOCAMBIO: TStringField
      FieldName = 'ULTIMOCAMBIO'
      Origin = 'ULTIMOCAMBIO'
      FixedChar = True
      Size = 30
    end
    object cdsInventarioPisoULTIMAVENTA: TSQLTimeStampField
      FieldName = 'ULTIMAVENTA'
      Origin = 'ULTIMAVENTA'
    end
    object cdsInventarioPisoCMAXINVENTARIO: TSingleField
      FieldName = 'CMAXINVENTARIO'
      Origin = 'CMAXINVENTARIO'
    end
    object cdsInventarioPisoCMININVENTARIO: TSingleField
      FieldName = 'CMININVENTARIO'
      Origin = 'CMININVENTARIO'
    end
    object cdsInventarioPisoCODIGOBARRA: TStringField
      FieldName = 'CODIGOBARRA'
      Origin = 'CODIGOBARRA'
      Required = True
      FixedChar = True
      Size = 14
    end
    object cdsInventarioPisoFOODITEM: TSmallintField
      FieldName = 'FOODITEM'
      Origin = 'FOODITEM'
      Required = True
    end
    object cdsInventarioPisoNONEBC: TSmallintField
      FieldName = 'NONEBC'
      Origin = 'NONEBC'
      Required = True
    end
    object cdsInventarioPisoNUMEROSUPLIDOR: TIntegerField
      FieldName = 'NUMEROSUPLIDOR'
      Origin = 'NUMEROSUPLIDOR'
    end
    object cdsInventarioPisoEDITAR_PRECIO: TBooleanField
      FieldName = 'EDITAR_PRECIO'
      Origin = 'EDITAR_PRECIO'
    end
    object cdsInventarioPisoPRODUCTNO: TAutoIncField
      FieldName = 'PRODUCTNO'
      Origin = 'PRODUCTNO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsInventarioPisoSUB_DEPARTAMENTO: TSmallintField
      FieldName = 'SUB_DEPARTAMENTO'
      Origin = 'SUB_DEPARTAMENTO'
    end
    object cdsInventarioPisoDESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Origin = 'DESCRIPCION'
      FixedChar = True
      Size = 35
    end
    object cdsInventarioPisoROUTEOFADMINISTRATION: TStringField
      FieldName = 'ROUTEOFADMINISTRATION'
      Origin = 'ROUTEOFADMINISTRATION'
      FixedChar = True
      Size = 16
    end
    object cdsInventarioPisoCONTROLADO: TStringField
      FieldName = 'CONTROLADO'
      Origin = 'CONTROLADO'
      FixedChar = True
      Size = 4
    end
    object cdsInventarioPisoSTRENGTH: TStringField
      FieldName = 'STRENGTH'
      Origin = 'STRENGTH'
      FixedChar = True
      Size = 25
    end
    object cdsInventarioPisoINFOADICIONAL: TStringField
      FieldName = 'INFOADICIONAL'
      Origin = 'INFOADICIONAL'
      FixedChar = True
      Size = 25
    end
    object cdsInventarioPisoMETRICSIZE: TSingleField
      FieldName = 'METRICSIZE'
      Origin = 'METRICSIZE'
    end
    object cdsInventarioPisoCAUTION1: TSmallintField
      FieldName = 'CAUTION1'
      Origin = 'CAUTION1'
    end
    object cdsInventarioPisoCAUTION2: TSmallintField
      FieldName = 'CAUTION2'
      Origin = 'CAUTION2'
    end
    object cdsInventarioPisoCAUTION3: TSmallintField
      FieldName = 'CAUTION3'
      Origin = 'CAUTION3'
    end
    object cdsInventarioPisoGENERICNAME: TStringField
      FieldName = 'GENERICNAME'
      Origin = 'GENERICNAME'
      FixedChar = True
      Size = 60
    end
    object cdsInventarioPisoTXR: TStringField
      FieldName = 'TXR'
      Origin = 'TXR'
      FixedChar = True
      Size = 8
    end
    object cdsInventarioPisoBRAND: TStringField
      FieldName = 'BRAND'
      Origin = 'BRAND'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioPisoGROUP_PRODUCTNO: TIntegerField
      FieldName = 'GROUP_PRODUCTNO'
      Origin = 'GROUP_PRODUCTNO'
    end
    object cdsInventarioPisoRECETARIO: TStringField
      FieldName = 'RECETARIO'
      Origin = 'RECETARIO'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioPisoGROUP_QTY: TIntegerField
      FieldName = 'GROUP_QTY'
      Origin = 'GROUP_QTY'
    end
    object cdsInventarioPisoPRECIO_CAJA: TSingleField
      FieldName = 'PRECIO_CAJA'
      Origin = 'PRECIO_CAJA'
    end
    object cdsInventarioPisoQTY_CAJA: TSingleField
      FieldName = 'QTY_CAJA'
      Origin = 'QTY_CAJA'
    end
    object cdsInventarioPisoDESCUENTO: TStringField
      FieldName = 'DESCUENTO'
      Origin = 'DESCUENTO'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioPisoIMAGE_CODE: TStringField
      FieldName = 'IMAGE_CODE'
      Origin = 'IMAGE_CODE'
      FixedChar = True
      Size = 9
    end
    object cdsInventarioPisoPACKAGESIZE: TIntegerField
      FieldName = 'PACKAGESIZE'
      Origin = 'PACKAGESIZE'
    end
    object cdsInventarioPisoTXR_EXTENSION: TStringField
      FieldName = 'TXR_EXTENSION'
      Origin = 'TXR_EXTENSION'
      FixedChar = True
      Size = 14
    end
    object cdsInventarioPisoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioPisoTAXABLE: TStringField
      FieldName = 'TAXABLE'
      Origin = 'TAXABLE'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioPisoPO: TStringField
      FieldName = 'PO'
      Origin = 'PO'
      Size = 10
    end
    object cdsInventarioPisoTAXABLE_ESTATAL: TStringField
      FieldName = 'TAXABLE_ESTATAL'
      Origin = 'TAXABLE_ESTATAL'
      FixedChar = True
      Size = 1
    end
    object cdsInventarioPisoISBN: TStringField
      FieldName = 'ISBN'
      Origin = 'isbn'
    end
    object cdsInventarioPisoSHOWINDIVIDUAL: TStringField
      FieldName = 'SHOWINDIVIDUAL'
      Origin = 'SHOWINDIVIDUAL'
      Size = 1
    end
    object cdsInventarioPisoPRECIO_DACO: TFloatField
      FieldName = 'PRECIO_DACO'
      Origin = 'PRECIO_DACO'
    end
    object cdsInventarioPisoPRECIO2: TCurrencyField
      FieldName = 'PRECIO2'
      Origin = 'PRECIO2'
    end
    object cdsInventarioPisoNDC: TWideStringField
      FieldName = 'NDC'
      Origin = 'NDC'
      FixedChar = True
      Size = 19
    end
    object cdsInventarioPisoPATROCINIO: TIntegerField
      FieldName = 'PATROCINIO'
      Origin = 'PATROCINIO'
    end
    object cdsInventarioPisoMETRIC_UNIT: TWideStringField
      FieldName = 'METRIC_UNIT'
      Origin = 'METRIC_UNIT'
      FixedChar = True
      Size = 3
    end
    object cdsInventarioPisoROBOT: TIntegerField
      FieldName = 'ROBOT'
      Origin = 'ROBOT'
    end
    object cdsInventarioPisoROBOT_NDC: TWideStringField
      FieldName = 'ROBOT_NDC'
      Origin = 'ROBOT_NDC'
      FixedChar = True
      Size = 11
    end
    object cdsInventarioPisoALCHEMY_PRODUCTID: TIntegerField
      FieldName = 'ALCHEMY_PRODUCTID'
      Origin = 'ALCHEMY_PRODUCTID'
    end
    object cdsInventarioPisoMARKET_STATUS: TWideStringField
      FieldName = 'MARKET_STATUS'
      Origin = 'MARKET_STATUS'
      FixedChar = True
      Size = 10
    end
    object cdsInventarioPisoOUTERPACKAGEUNIT: TWideStringField
      FieldName = 'OUTERPACKAGEUNIT'
      Origin = 'OUTERPACKAGEUNIT'
      FixedChar = True
      Size = 10
    end
    object cdsInventarioPisoPAKAGE_ID: TIntegerField
      FieldName = 'PAKAGE_ID'
      Origin = 'PAKAGE_ID'
    end
    object cdsInventarioPisoCOBRAR_TAX: TIntegerField
      FieldName = 'COBRAR_TAX'
      Origin = 'COBRAR_TAX'
    end
    object cdsInventarioPisoREVENUE_CODE: TWideStringField
      FieldName = 'REVENUE_CODE'
      Origin = 'REVENUE_CODE'
      FixedChar = True
      Size = 4
    end
    object cdsInventarioPisoHCPCS: TWideStringField
      FieldName = 'HCPCS'
      Origin = 'HCPCS'
      FixedChar = True
      Size = 5
    end
    object cdsInventarioPisoPRECIOVENTA2: TFloatField
      FieldName = 'PRECIOVENTA2'
      Origin = 'PRECIOVENTA2'
    end
    object cdsInventarioPisoPRICE_TABLE_ID: TIntegerField
      FieldName = 'PRICE_TABLE_ID'
      Origin = 'PRICE_TABLE_ID'
    end
    object cdsInventarioPisoCASA_FARMACEUTICA: TStringField
      FieldName = 'CASA_FARMACEUTICA'
      Origin = 'CASA_FARMACEUTICA'
      FixedChar = True
      Size = 150
    end
    object cdsInventarioPisoVERSION_DESCRIPTION: TWideStringField
      FieldName = 'VERSION_DESCRIPTION'
      Origin = 'VERSION_DESCRIPTION'
      FixedChar = True
      Size = 150
    end
    object cdsInventarioPisoPAKAGE_DESCRIPTION: TWideStringField
      FieldName = 'PAKAGE_DESCRIPTION'
      Origin = 'PAKAGE_DESCRIPTION'
      FixedChar = True
      Size = 150
    end
    object cdsInventarioPisoAllowControledRefills: TBooleanField
      FieldName = 'AllowControledRefills'
      Origin = 'AllowControledRefills'
    end
    object cdsInventarioPisoESCANEAR_BARCODEALTERNO: TSmallintField
      FieldName = 'ESCANEAR_BARCODEALTERNO'
      Origin = 'ESCANEAR_BARCODEALTERNO'
    end
    object cdsInventarioPisoOVERRIDE_SYSTEM_DEFAULT_PRICE: TBooleanField
      FieldName = 'OVERRIDE_SYSTEM_DEFAULT_PRICE'
      Origin = 'OVERRIDE_SYSTEM_DEFAULT_PRICE'
    end
    object cdsInventarioPisoWAC_PRICE: TFloatField
      FieldName = 'WAC_PRICE'
      Origin = 'WAC_PRICE'
    end
    object cdsInventarioPisoMAC_PRICE: TFloatField
      FieldName = 'MAC_PRICE'
      Origin = 'MAC_PRICE'
    end
    object cdsInventarioPisoDIRECT_PRICE: TFloatField
      FieldName = 'DIRECT_PRICE'
      Origin = 'DIRECT_PRICE'
    end
    object cdsInventarioPisoUC_PRICE: TFloatField
      FieldName = 'UC_PRICE'
      Origin = 'UC_PRICE'
    end
    object cdsInventarioPisoPRICE_UPDATE: TBooleanField
      FieldName = 'PRICE_UPDATE'
      Origin = 'PRICE_UPDATE'
    end
    object cdsInventarioPisoENTER_LAB_RESULTS: TBooleanField
      FieldName = 'ENTER_LAB_RESULTS'
      Origin = 'ENTER_LAB_RESULTS'
    end
    object cdsInventarioPisoEXPIRE_OPTION: TWideStringField
      FieldName = 'EXPIRE_OPTION'
      Origin = 'EXPIRE_OPTION'
      FixedChar = True
      Size = 15
    end
    object cdsInventarioPisoEXPIRE_DAYS: TIntegerField
      FieldName = 'EXPIRE_DAYS'
      Origin = 'EXPIRE_DAYS'
    end
    object cdsInventarioPisoEXPIRE_OTHER: TWideStringField
      FieldName = 'EXPIRE_OTHER'
      Origin = 'EXPIRE_OTHER'
      FixedChar = True
      Size = 15
    end
    object cdsInventarioPisoMARKETEDPRODUCTID: TIntegerField
      FieldName = 'MARKETEDPRODUCTID'
      Origin = 'MARKETEDPRODUCTID'
    end
    object cdsInventarioPisoMAIN_NDC: TBooleanField
      FieldName = 'MAIN_NDC'
      Origin = 'MAIN_NDC'
    end
    object cdsInventarioPisoPSEUDOEPHEDRINE: TBooleanField
      FieldName = 'PSEUDOEPHEDRINE'
      Origin = 'PSEUDOEPHEDRINE'
    end
    object cdsInventarioPisoINITIAL_QTY: TBCDField
      FieldName = 'INITIAL_QTY'
      Origin = 'INITIAL_QTY'
      Precision = 18
      Size = 2
    end
    object cdsInventarioPisoQTYINVENTARIO: TBCDField
      FieldName = 'QTYINVENTARIO'
      Origin = 'QTYINVENTARIO'
      Precision = 18
      Size = 2
    end
    object cdsInventarioPisoSALES_PROMOTION_ID: TIntegerField
      FieldName = 'SALES_PROMOTION_ID'
      Origin = 'SALES_PROMOTION_ID'
    end
  end
  object dsInventarioPiso: TDataSource
    Left = 176
    Top = 384
  end
  object dsOTC: TDataSource
    DataSet = cdsOTC
    Left = 168
    Top = 456
  end
  object DELETE_SIGNATURE: TFDQuery
    AfterExecute = DELETE_SIGNATUREAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[DELETE_SIGNATURE] @OTCNUMBER INT, @USER ' +
        'CHAR(3), @PHARMACIST CHAR(3), @NORX BIGINT, @SIGNATURE_LINK INT'
      'AS'
      'BEGIN'
      '    SET NOCOUNT ON;'
      '    begin transaction'
      
        '      Update OTC set SIGNATURE_LINK = 1, WF_SIGNATURE = '#39#39', WC_P' +
        'ICKUP = 0 where OTCNumber = @OTCNUMBER;'
      
        '      Delete from PRESCRIPTION_ESIGNATURE WHERE SIGNATURE_LINK =' +
        ' @SIGNATURE_LINK;'
      
        '      EXECUTE INSERT_LOG '#39'PATIENT SIGNATURE DELETED'#39', '#39'D'#39', '#39#39', @' +
        'USER, @PHARMACIST, @NORX, @OTCNUMBER,0,0,0,0,0,0,'#39'R'#39','#39#39',0,1;'
      '    commit;'
      'END')
    Left = 1472
    Top = 928
  end
  object cdsOTC: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOTC'
    Left = 240
    Top = 456
    object cdsOTCOTCNUMBER: TAutoIncField
      FieldName = 'OTCNUMBER'
      Origin = 'OTCNUMBER'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsOTCTOTAL: TSingleField
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
    end
    object cdsOTCCOBRADO: TStringField
      FieldName = 'COBRADO'
      Origin = 'COBRADO'
      FixedChar = True
      Size = 1
    end
    object cdsOTCFECHAOTC: TSQLTimeStampField
      FieldName = 'FECHAOTC'
      Origin = 'FECHAOTC'
    end
    object cdsOTCRX: TStringField
      FieldName = 'RX'
      Origin = 'RX'
      FixedChar = True
      Size = 1
    end
    object cdsOTCCOSTOVENTA: TSingleField
      FieldName = 'COSTOVENTA'
      Origin = 'COSTOVENTA'
    end
    object cdsOTCNUMEROCLIENTE: TIntegerField
      FieldName = 'NUMEROCLIENTE'
      Origin = 'NUMEROCLIENTE'
    end
    object cdsOTCMEDICAMENTOMIX: TStringField
      FieldName = 'MEDICAMENTOMIX'
      Origin = 'MEDICAMENTOMIX'
      FixedChar = True
      Size = 120
    end
    object cdsOTCNUMEROTRANSACCION: TIntegerField
      FieldName = 'NUMEROTRANSACCION'
      Origin = 'NUMEROTRANSACCION'
    end
    object cdsOTCPAGO_PLAN: TFloatField
      FieldName = 'PAGO_PLAN'
      Origin = 'PAGO_PLAN'
    end
    object cdsOTCDEDUCIBLE: TFloatField
      FieldName = 'DEDUCIBLE'
      Origin = 'DEDUCIBLE'
    end
    object cdsOTCPARTIAL_COMPLETION: TStringField
      FieldName = 'PARTIAL_COMPLETION'
      Origin = 'PARTIAL_COMPLETION'
      FixedChar = True
      Size = 1
    end
    object cdsOTCRX_STATUS: TStringField
      FieldName = 'RX_STATUS'
      Origin = 'RX_STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsOTCNO_REF_DISPENSADO: TIntegerField
      FieldName = 'NO_REF_DISPENSADO'
      Origin = 'NO_REF_DISPENSADO'
    end
    object cdsOTCINGREDIENT_COST_PAID: TFloatField
      FieldName = 'INGREDIENT_COST_PAID'
      Origin = 'INGREDIENT_COST_PAID'
    end
    object cdsOTCINCENTIVE_FEE_PAID: TFloatField
      FieldName = 'INCENTIVE_FEE_PAID'
      Origin = 'INCENTIVE_FEE_PAID'
    end
    object cdsOTCDISPENSING_FEE_PAID: TFloatField
      FieldName = 'DISPENSING_FEE_PAID'
      Origin = 'DISPENSING_FEE_PAID'
    end
    object cdsOTCOTHER_AMOUNT_PAID: TFloatField
      FieldName = 'OTHER_AMOUNT_PAID'
      Origin = 'OTHER_AMOUNT_PAID'
    end
    object cdsOTCAMOUNT_COPAY_COINS: TFloatField
      FieldName = 'AMOUNT_COPAY_COINS'
      Origin = 'AMOUNT_COPAY_COINS'
    end
    object cdsOTCGANANCIA: TFloatField
      FieldName = 'GANANCIA'
      Origin = 'GANANCIA'
    end
    object cdsOTCPHARMACIST: TStringField
      FieldName = 'PHARMACIST'
      Origin = 'PHARMACIST'
      FixedChar = True
      Size = 3
    end
    object cdsOTCDAYS_SUPPLY: TIntegerField
      FieldName = 'DAYS_SUPPLY'
      Origin = 'DAYS_SUPPLY'
    end
    object cdsOTCPAGADA: TStringField
      FieldName = 'PAGADA'
      Origin = 'PAGADA'
      FixedChar = True
      Size = 1
    end
    object cdsOTCPRECIOFACTURACION: TFloatField
      FieldName = 'PRECIOFACTURACION'
      Origin = 'PRECIOFACTURACION'
    end
    object cdsOTCPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Origin = 'PRODUCT_ID'
    end
    object cdsOTCTIME_RX: TSQLTimeStampField
      FieldName = 'TIME_RX'
      Origin = 'TIME_RX'
    end
    object cdsOTCNO_HORA: TIntegerField
      FieldName = 'NO_HORA'
      Origin = 'NO_HORA'
    end
    object cdsOTCNUMEROPLAN: TIntegerField
      FieldName = 'NUMEROPLAN'
      Origin = 'NUMEROPLAN'
    end
    object cdsOTCOTC_BARCODE: TStringField
      FieldName = 'OTC_BARCODE'
      Origin = 'OTC_BARCODE'
      FixedChar = True
      Size = 15
    end
    object cdsOTCPLAN_MEDICO: TStringField
      FieldName = 'PLAN_MEDICO'
      Origin = 'PLAN_MEDICO'
      Size = 3
    end
    object cdsOTCNUMERO_AUTORIZACION: TStringField
      FieldName = 'NUMERO_AUTORIZACION'
      Origin = 'NUMERO_AUTORIZACION'
    end
    object cdsOTCMEDICAMENTO: TStringField
      FieldName = 'MEDICAMENTO'
      Origin = 'MEDICAMENTO'
      Size = 30
    end
    object cdsOTCNDC: TStringField
      FieldName = 'NDC'
      Origin = 'NDC'
      Size = 15
    end
    object cdsOTCATENDIDOPOR: TStringField
      FieldName = 'ATENDIDOPOR'
      Origin = 'ATENDIDOPOR'
      Size = 5
    end
    object cdsOTCLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      Size = 12
    end
    object cdsOTCMETRICDECIMALQUANTITY: TIntegerField
      FieldName = 'METRICDECIMALQUANTITY'
      Origin = 'METRICDECIMALQUANTITY'
    end
    object cdsOTCSIGNATURE_LINK: TIntegerField
      FieldName = 'SIGNATURE_LINK'
      Origin = 'SIGNATURE_LINK'
    end
    object cdsOTCPICKEDUPBY_RELETION: TSmallintField
      FieldName = 'PICKEDUPBY_RELETION'
      Origin = 'PICKEDUPBY_RELETION'
    end
    object cdsOTCPICKEDUP_ID: TStringField
      FieldName = 'PICKEDUP_ID'
      Origin = 'PICKEDUP_ID'
      Size = 10
    end
    object cdsOTCCHECKED: TIntegerField
      FieldName = 'CHECKED'
      Origin = 'CHECKED'
    end
    object cdsOTCPICKEDUPBY_RELATION: TIntegerField
      FieldName = 'PICKEDUPBY_RELATION'
      Origin = 'PICKEDUPBY_RELATION'
    end
    object cdsOTCTXR: TStringField
      FieldName = 'TXR'
      Origin = 'TXR'
      FixedChar = True
      Size = 8
    end
    object cdsOTCPS_521_FL: TFloatField
      FieldName = 'PS_521_FL'
      Origin = 'PS_521_FL'
    end
    object cdsOTCPS_523_FN: TFloatField
      FieldName = 'PS_523_FN'
      Origin = 'PS_523_FN'
    end
    object cdsOTCPS_512_FC: TFloatField
      FieldName = 'PS_512_FC'
      Origin = 'PS_512_FC'
    end
    object cdsOTCPS_513_FD: TFloatField
      FieldName = 'PS_513_FD'
      Origin = 'PS_513_FD'
    end
    object cdsOTCPS_517_FH: TFloatField
      FieldName = 'PS_517_FH'
      Origin = 'PS_517_FH'
    end
    object cdsOTCPS_518_FI: TFloatField
      FieldName = 'PS_518_FI'
      Origin = 'PS_518_FI'
    end
    object cdsOTCPS_520_FK: TFloatField
      FieldName = 'PS_520_FK'
      Origin = 'PS_520_FK'
    end
    object cdsOTCPS_514_FE: TFloatField
      FieldName = 'PS_514_FE'
      Origin = 'PS_514_FE'
    end
    object cdsOTCPS_346_HH: TFloatField
      FieldName = 'PS_346_HH'
      Origin = 'PS_346_HH'
    end
    object cdsOTCPS_347_HJ: TFloatField
      FieldName = 'PS_347_HJ'
      Origin = 'PS_347_HJ'
    end
    object cdsOTCPS_348_HK: TFloatField
      FieldName = 'PS_348_HK'
      Origin = 'PS_348_HK'
    end
    object cdsOTCPS_571_NZ: TFloatField
      FieldName = 'PS_571_NZ'
      Origin = 'PS_571_NZ'
    end
    object cdsOTCPS_575_EQ: TFloatField
      FieldName = 'PS_575_EQ'
      Origin = 'PS_575_EQ'
    end
    object cdsOTCPS_574_2Y: TFloatField
      FieldName = 'PS_574_2Y'
      Origin = 'PS_574_2Y'
    end
    object cdsOTCPS_572_4U: TFloatField
      FieldName = 'PS_572_4U'
      Origin = 'PS_572_4U'
    end
    object cdsOTCPS_577_G3: TFloatField
      FieldName = 'PS_577_G3'
      Origin = 'PS_577_G3'
    end
    object cdsOTCPS_133_UJ: TFloatField
      FieldName = 'PS_133_UJ'
      Origin = 'PS_133_UJ'
    end
    object cdsOTCPS_134_UK: TFloatField
      FieldName = 'PS_134_UK'
      Origin = 'PS_134_UK'
    end
    object cdsOTCPS_135_UM: TFloatField
      FieldName = 'PS_135_UM'
      Origin = 'PS_135_UM'
    end
    object cdsOTCPS_136_UN: TFloatField
      FieldName = 'PS_136_UN'
      Origin = 'PS_136_UN'
    end
    object cdsOTCPS_137_UP: TFloatField
      FieldName = 'PS_137_UP'
      Origin = 'PS_137_UP'
    end
    object cdsOTCUSUARIO_NO: TIntegerField
      FieldName = 'USUARIO_NO'
      Origin = 'USUARIO_NO'
    end
    object cdsOTCMEZCLA_TRAN_NO: TIntegerField
      FieldName = 'MEZCLA_TRAN_NO'
      Origin = 'MEZCLA_TRAN_NO'
    end
    object cdsOTCNUMERORECETA: TLargeintField
      FieldName = 'NUMERORECETA'
      Origin = 'NUMERORECETA'
    end
    object cdsOTCREFILL_REMINDED: TIntegerField
      FieldName = 'REFILL_REMINDED'
      Origin = 'REFILL_REMINDED'
    end
    object cdsOTCBATCH_NUMBER: TIntegerField
      FieldName = 'BATCH_NUMBER'
      Origin = 'BATCH_NUMBER'
    end
    object cdsOTCAUDITED: TIntegerField
      FieldName = 'AUDITED'
      Origin = 'AUDITED'
    end
    object cdsOTCPRICE_TABLE_ID: TIntegerField
      FieldName = 'PRICE_TABLE_ID'
      Origin = 'PRICE_TABLE_ID'
    end
    object cdsOTCWC_PICKUP: TBooleanField
      FieldName = 'WC_PICKUP'
      Origin = 'WC_PICKUP'
    end
    object cdsOTCEP_TRANSACTION_NUMBER: TIntegerField
      FieldName = 'EP_TRANSACTION_NUMBER'
      Origin = 'EP_TRANSACTION_NUMBER'
    end
    object cdsOTCREFILL_NOTIFIED: TBooleanField
      FieldName = 'REFILL_NOTIFIED'
      Origin = 'REFILL_NOTIFIED'
    end
    object cdsOTCUNIT_PRICE: TFloatField
      FieldName = 'UNIT_PRICE'
      Origin = 'UNIT_PRICE'
    end
    object cdsOTCWF_TYPED: TWideStringField
      FieldName = 'WF_TYPED'
      Origin = 'WF_TYPED'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWF_BILLED: TWideStringField
      FieldName = 'WF_BILLED'
      Origin = 'WF_BILLED'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWF_PRINTED: TWideStringField
      FieldName = 'WF_PRINTED'
      Origin = 'WF_PRINTED'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWF_CHECKED: TWideStringField
      FieldName = 'WF_CHECKED'
      Origin = 'WF_CHECKED'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWF_DELIVERED: TWideStringField
      FieldName = 'WF_DELIVERED'
      Origin = 'WF_DELIVERED'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWF_FILLED: TWideStringField
      FieldName = 'WF_FILLED'
      Origin = 'WF_FILLED'
      FixedChar = True
      Size = 30
    end
    object cdsOTCMED_CHART: TBooleanField
      FieldName = 'MED_CHART'
      Origin = 'MED_CHART'
    end
    object cdsOTCWF_STORAGE: TWideStringField
      FieldName = 'WF_STORAGE'
      Origin = 'WF_STORAGE'
      FixedChar = True
      Size = 30
    end
    object cdsOTCPRINT_Q: TWideStringField
      FieldName = 'PRINT_Q'
      Origin = 'PRINT_Q'
      FixedChar = True
      Size = 1
    end
    object cdsOTCWFSTORAGE: TWideStringField
      FieldName = 'WFSTORAGE'
      Origin = 'WFSTORAGE'
      FixedChar = True
      Size = 30
    end
    object cdsOTCADHERENCE: TBooleanField
      FieldName = 'ADHERENCE'
      Origin = 'ADHERENCE'
    end
    object cdsOTCFACILITY_ID: TIntegerField
      FieldName = 'FACILITY_ID'
      Origin = 'FACILITY_ID'
    end
    object cdsOTCCLAIM_STATUS: TIntegerField
      FieldName = 'CLAIM_STATUS'
      Origin = 'CLAIM_STATUS'
    end
    object cdsOTCBILL_LATTER: TBooleanField
      FieldName = 'BILL_LATTER'
      Origin = 'BILL_LATTER'
    end
    object cdsOTCWF_CASHIER: TWideStringField
      FieldName = 'WF_CASHIER'
      Origin = 'WF_CASHIER'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWF_SIGNATURE: TWideStringField
      FieldName = 'WF_SIGNATURE'
      Origin = 'WF_SIGNATURE'
      FixedChar = True
      Size = 30
    end
    object cdsOTCALCHEMY_PRODUCTID: TIntegerField
      FieldName = 'ALCHEMY_PRODUCTID'
      Origin = 'ALCHEMY_PRODUCTID'
    end
    object cdsOTCMARKETEDPRODUCTID: TIntegerField
      FieldName = 'MARKETEDPRODUCTID'
      Origin = 'MARKETEDPRODUCTID'
    end
    object cdsOTCWF_REVERSE: TBooleanField
      FieldName = 'WF_REVERSE'
      Origin = 'WF_REVERSE'
    end
    object cdsOTCPA: TBooleanField
      FieldName = 'PA'
      Origin = 'PA'
    end
    object cdsOTCPDN_SENT: TBooleanField
      FieldName = 'PDN_SENT'
      Origin = 'PDN_SENT'
    end
    object cdsOTCREFILL_REQ_TRANSNO: TIntegerField
      FieldName = 'REFILL_REQ_TRANSNO'
      Origin = 'REFILL_REQ_TRANSNO'
    end
    object cdsOTCBATCH_REFILLREQ_DATE: TDateField
      FieldName = 'BATCH_REFILLREQ_DATE'
      Origin = 'BATCH_REFILLREQ_DATE'
    end
    object cdsOTCPRIORAUTHORIZATION: TStringField
      FieldName = 'PRIORAUTHORIZATION'
      Origin = 'PRIORAUTHORIZATION'
      Size = 12
    end
    object cdsOTCQTY: TBCDField
      FieldName = 'QTY'
      Origin = 'QTY'
      Precision = 18
      Size = 2
    end
    object cdsOTCBASISOFCOST: TStringField
      FieldName = 'BASISOFCOST'
      Origin = 'BASISOFCOST'
      FixedChar = True
      Size = 2
    end
    object cdsOTCCLINICIDNUMBER: TIntegerField
      FieldName = 'CLINICIDNUMBER'
      Origin = 'CLINICIDNUMBER'
    end
    object cdsOTCDIAGNOSISCODE: TWideStringField
      FieldName = 'DIAGNOSISCODE'
      Origin = 'DIAGNOSISCODE'
      FixedChar = True
      Size = 6
    end
    object cdsOTCDURCONFLICTCODE: TWideStringField
      FieldName = 'DURCONFLICTCODE'
      Origin = 'DURCONFLICTCODE'
      FixedChar = True
      Size = 2
    end
    object cdsOTCDURINTERVENTIONCODE: TWideStringField
      FieldName = 'DURINTERVENTIONCODE'
      Origin = 'DURINTERVENTIONCODE'
      FixedChar = True
      Size = 2
    end
    object cdsOTCDUROUTCOMECODE: TWideStringField
      FieldName = 'DUROUTCOMECODE'
      Origin = 'DUROUTCOMECODE'
      FixedChar = True
      Size = 2
    end
    object cdsOTCLEVELOFSERVICE: TIntegerField
      FieldName = 'LEVELOFSERVICE'
      Origin = 'LEVELOFSERVICE'
    end
    object cdsOTCPRIMARYPRESCRIBER: TWideStringField
      FieldName = 'PRIMARYPRESCRIBER'
      Origin = 'PRIMARYPRESCRIBER'
      FixedChar = True
      Size = 10
    end
    object cdsOTCRXDENIALCLARIF: TWideStringField
      FieldName = 'RXDENIALCLARIF'
      Origin = 'RXDENIALCLARIF'
      FixedChar = True
      Size = 2
    end
    object cdsOTCRXDENIALOVERRIDE: TIntegerField
      FieldName = 'RXDENIALOVERRIDE'
      Origin = 'RXDENIALOVERRIDE'
    end
    object cdsOTCDISPENSINGFEE: TFloatField
      FieldName = 'DISPENSINGFEE'
      Origin = 'DISPENSINGFEE'
    end
    object cdsOTCGROSSAMOUNTDUE: TFloatField
      FieldName = 'GROSSAMOUNTDUE'
      Origin = 'GROSSAMOUNTDUE'
    end
    object cdsOTCPATIENTPAIDAMOUNT: TFloatField
      FieldName = 'PATIENTPAIDAMOUNT'
      Origin = 'PATIENTPAIDAMOUNT'
    end
    object cdsOTCSALESTAX: TFloatField
      FieldName = 'SALESTAX'
      Origin = 'SALESTAX'
    end
    object cdsOTCOTAMCLDSUBCOUNTQUAL: TWideStringField
      FieldName = 'OTAMCLDSUBCOUNTQUAL'
      Origin = 'OTAMCLDSUBCOUNTQUAL'
      FixedChar = True
      Size = 2
    end
    object cdsOTCOTCOTHERAMOUNTCLAIMEDSUB: TFloatField
      FieldName = 'OTCOTHERAMOUNTCLAIMEDSUB'
      Origin = 'OTCOTHERAMOUNTCLAIMEDSUB'
    end
    object cdsOTCCOTHERAMOUNTCLAIMEDSUB: TFloatField
      FieldName = 'COTHERAMOUNTCLAIMEDSUB'
      Origin = 'COTHERAMOUNTCLAIMEDSUB'
    end
    object cdsOTCPRODUCTSERVIDQUAL: TWideStringField
      FieldName = 'PRODUCTSERVIDQUAL'
      Origin = 'PRODUCTSERVIDQUAL'
      FixedChar = True
      Size = 2
    end
    object cdsOTCPROVIDERID: TWideStringField
      FieldName = 'PROVIDERID'
      Origin = 'PROVIDERID'
      FixedChar = True
      Size = 15
    end
    object cdsOTCUNIT_DOSE_INDICATOR: TWideStringField
      FieldName = 'UNIT_DOSE_INDICATOR'
      Origin = 'UNIT_DOSE_INDICATOR'
      FixedChar = True
      Size = 1
    end
    object cdsOTCUNIT_OF_MEASURE: TWideStringField
      FieldName = 'UNIT_OF_MEASURE'
      Origin = 'UNIT_OF_MEASURE'
      FixedChar = True
      Size = 2
    end
    object cdsOTCSUB_CLARIF_CODE: TWideStringField
      FieldName = 'SUB_CLARIF_CODE'
      Origin = 'SUB_CLARIF_CODE'
      FixedChar = True
      Size = 2
    end
    object cdsOTCOTHERCOVERAGECODE: TWideStringField
      FieldName = 'OTHERCOVERAGECODE'
      Origin = 'OTHERCOVERAGECODE'
      FixedChar = True
      Size = 1
    end
    object cdsOTCSERVICEPROVIDQUALIFIER: TWideStringField
      FieldName = 'SERVICEPROVIDQUALIFIER'
      Origin = 'SERVICEPROVIDQUALIFIER'
      FixedChar = True
      Size = 2
    end
    object cdsOTCOP_AMOUNTPAIDCOUNT: TIntegerField
      FieldName = 'OP_AMOUNTPAIDCOUNT'
      Origin = 'OP_AMOUNTPAIDCOUNT'
    end
    object cdsOTCOP_REJECTCOUNT: TIntegerField
      FieldName = 'OP_REJECTCOUNT'
      Origin = 'OP_REJECTCOUNT'
    end
    object cdsOTCCOB_OTHERPAYMENTCOUNT: TIntegerField
      FieldName = 'COB_OTHERPAYMENTCOUNT'
      Origin = 'COB_OTHERPAYMENTCOUNT'
    end
    object cdsOTCCOMPDOSAGE_FORM_DESC_CODE: TWideStringField
      FieldName = 'COMPDOSAGE_FORM_DESC_CODE'
      Origin = 'COMPDOSAGE_FORM_DESC_CODE'
      FixedChar = True
      Size = 2
    end
    object cdsOTCCOMPDISP_UNIT_FORM_INDI: TWideStringField
      FieldName = 'COMPDISP_UNIT_FORM_INDI'
      Origin = 'COMPDISP_UNIT_FORM_INDI'
      FixedChar = True
      Size = 1
    end
    object cdsOTCCOMPROUTE_OF_ADMINISTRATION: TWideStringField
      FieldName = 'COMPROUTE_OF_ADMINISTRATION'
      Origin = 'COMPROUTE_OF_ADMINISTRATION'
      FixedChar = True
      Size = 2
    end
    object cdsOTCCOMPING_COMP_COUNT: TIntegerField
      FieldName = 'COMPING_COMP_COUNT'
      Origin = 'COMPING_COMP_COUNT'
    end
    object cdsOTCDISPENSING_STATUS: TWideStringField
      FieldName = 'DISPENSING_STATUS'
      Origin = 'DISPENSING_STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsOTCQTY_INTENDED_DISP: TIntegerField
      FieldName = 'QTY_INTENDED_DISP'
      Origin = 'QTY_INTENDED_DISP'
    end
    object cdsOTCDAYS_SUPPLY_INTEND_DISP: TIntegerField
      FieldName = 'DAYS_SUPPLY_INTEND_DISP'
      Origin = 'DAYS_SUPPLY_INTEND_DISP'
    end
    object cdsOTCFLAT_SALES_TAXSUB: TFloatField
      FieldName = 'FLAT_SALES_TAXSUB'
      Origin = 'FLAT_SALES_TAXSUB'
    end
    object cdsOTCASSOC_RX_SERVICE_DATE: TSQLTimeStampField
      FieldName = 'ASSOC_RX_SERVICE_DATE'
      Origin = 'ASSOC_RX_SERVICE_DATE'
    end
    object cdsOTCASSOC_RX_SERVICE_REF_NO: TWideStringField
      FieldName = 'ASSOC_RX_SERVICE_REF_NO'
      Origin = 'ASSOC_RX_SERVICE_REF_NO'
      FixedChar = True
      Size = 7
    end
    object cdsOTCCUPONTYPE: TWideStringField
      FieldName = 'CUPONTYPE'
      Origin = 'CUPONTYPE'
      FixedChar = True
      Size = 2
    end
    object cdsOTCCUPON_NUMBER: TWideStringField
      FieldName = 'CUPON_NUMBER'
      Origin = 'CUPON_NUMBER'
      FixedChar = True
      Size = 15
    end
    object cdsOTCCUPON_VALUE_AMT: TFloatField
      FieldName = 'CUPON_VALUE_AMT'
      Origin = 'CUPON_VALUE_AMT'
    end
    object cdsOTCPRIMARYCAREPROVIDQUALIFIER: TWideStringField
      FieldName = 'PRIMARYCAREPROVIDQUALIFIER'
      Origin = 'PRIMARYCAREPROVIDQUALIFIER'
      FixedChar = True
      Size = 2
    end
    object cdsOTCPRIMARYCAREPROVID: TWideStringField
      FieldName = 'PRIMARYCAREPROVID'
      Origin = 'PRIMARYCAREPROVID'
      FixedChar = True
      Size = 15
    end
    object cdsOTCPRIMARYCAREPROVLASTNAME: TWideStringField
      FieldName = 'PRIMARYCAREPROVLASTNAME'
      Origin = 'PRIMARYCAREPROVLASTNAME'
      FixedChar = True
      Size = 15
    end
    object cdsOTCIAID_464_EX: TWideStringField
      FieldName = 'IAID_464_EX'
      Origin = 'IAID_464_EX'
      FixedChar = True
      Size = 11
    end
    object cdsOTCDRC_357_NV: TWideStringField
      FieldName = 'DRC_357_NV'
      Origin = 'DRC_357_NV'
      FixedChar = True
      Size = 2
    end
    object cdsOTCPAI_391_MT: TWideStringField
      FieldName = 'PAI_391_MT'
      Origin = 'PAI_391_MT'
      FixedChar = True
      Size = 2
    end
    object cdsOTCCOMPOUND_TYPE_996_G1: TWideStringField
      FieldName = 'COMPOUND_TYPE_996_G1'
      Origin = 'COMPOUND_TYPE_996_G1'
      FixedChar = True
      Size = 2
    end
    object cdsOTCPST_147_U7: TWideStringField
      FieldName = 'PST_147_U7'
      Origin = 'PST_147_U7'
      FixedChar = True
      Size = 2
    end
    object cdsOTCSCCD_354_NX: TSmallintField
      FieldName = 'SCCD_354_NX'
      Origin = 'SCCD_354_NX'
    end
    object cdsOTCPRAC_353_NR: TSmallintField
      FieldName = 'PRAC_353_NR'
      Origin = 'PRAC_353_NR'
    end
    object cdsOTCBSC_392_MU: TSmallintField
      FieldName = 'BSC_392_MU'
      Origin = 'BSC_392_MU'
    end
    object cdsOTCSPECIAL_PACK_INDI_429_DT: TWideStringField
      FieldName = 'SPECIAL_PACK_INDI_429_DT'
      Origin = 'SPECIAL_PACK_INDI_429_DT'
      FixedChar = True
      Size = 2
    end
    object cdsOTCROUTEOFADMIN_995_E2: TWideStringField
      FieldName = 'ROUTEOFADMIN_995_E2'
      Origin = 'ROUTEOFADMIN_995_E2'
      FixedChar = True
      Size = 11
    end
    object cdsOTCWC_117_TR: TSmallintField
      FieldName = 'WC_117_TR'
      Origin = 'WC_117_TR'
    end
    object cdsOTCWC_118_TS: TWideStringField
      FieldName = 'WC_118_TS'
      Origin = 'WC_118_TS'
      FixedChar = True
      Size = 2
    end
    object cdsOTCWC_119_TT: TWideStringField
      FieldName = 'WC_119_TT'
      Origin = 'WC_119_TT'
      FixedChar = True
      Size = 15
    end
    object cdsOTCWC_120_TU: TWideStringField
      FieldName = 'WC_120_TU'
      Origin = 'WC_120_TU'
      FixedChar = True
    end
    object cdsOTCWC_121_TV: TWideStringField
      FieldName = 'WC_121_TV'
      Origin = 'WC_121_TV'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWC_122_TW: TWideStringField
      FieldName = 'WC_122_TW'
      Origin = 'WC_122_TW'
      FixedChar = True
    end
    object cdsOTCWC_123_TX: TWideStringField
      FieldName = 'WC_123_TX'
      Origin = 'WC_123_TX'
      FixedChar = True
      Size = 2
    end
    object cdsOTCWC_124_TY: TWideStringField
      FieldName = 'WC_124_TY'
      Origin = 'WC_124_TY'
      FixedChar = True
      Size = 15
    end
    object cdsOTCWC_125_TZ: TWideStringField
      FieldName = 'WC_125_TZ'
      Origin = 'WC_125_TZ'
      FixedChar = True
      Size = 2
    end
    object cdsOTCWC_126_UA: TWideStringField
      FieldName = 'WC_126_UA'
      Origin = 'WC_126_UA'
      FixedChar = True
      Size = 19
    end
    object cdsOTCPRIMARYCAREPROVLOCATIONCODE: TWideStringField
      FieldName = 'PRIMARYCAREPROVLOCATIONCODE'
      Origin = 'PRIMARYCAREPROVLOCATIONCODE'
      FixedChar = True
      Size = 3
    end
    object cdsOTCPATIENTLOCATION: TIntegerField
      FieldName = 'PATIENTLOCATION'
      Origin = 'PATIENTLOCATION'
    end
    object cdsOTCPRESC_SRNM: TWideStringField
      FieldName = 'PRESC_SRNM'
      Origin = 'PRESC_SRNM'
      FixedChar = True
      Size = 7
    end
    object cdsOTCPS_558_AW: TFloatField
      FieldName = 'PS_558_AW'
      Origin = 'PS_558_AW'
    end
    object cdsOTCPS_559_AX: TFloatField
      FieldName = 'PS_559_AX'
      Origin = 'PS_559_AX'
    end
    object cdsOTCREVENUE_CODE: TWideStringField
      FieldName = 'REVENUE_CODE'
      Origin = 'REVENUE_CODE'
      FixedChar = True
      Size = 4
    end
    object cdsOTCDAW: TSmallintField
      FieldName = 'DAW'
      Origin = 'DAW'
    end
    object cdsOTCBATCH_NUMBER_BILLING: TLargeintField
      FieldName = 'BATCH_NUMBER_BILLING'
      Origin = 'BATCH_NUMBER_BILLING'
    end
    object cdsOTCTERMINADA: TBooleanField
      FieldName = 'TERMINADA'
      Origin = 'TERMINADA'
    end
    object cdsOTCMEDICAID_PAID_AMOUNT: TFloatField
      FieldName = 'MEDICAID_PAID_AMOUNT'
      Origin = 'MEDICAID_PAID_AMOUNT'
    end
    object cdsOTCPMC_459_ER: TWideStringField
      FieldName = 'PMC_459_ER'
      Origin = 'PMC_459_ER'
      FixedChar = True
      Size = 2
    end
    object cdsOTCPMCC_458_SE: TIntegerField
      FieldName = 'PMCC_458_SE'
      Origin = 'PMCC_458_SE'
    end
    object cdsOTCSPIDN_454_EK: TWideStringField
      FieldName = 'SPIDN_454_EK'
      Origin = 'SPIDN_454_EK'
      FixedChar = True
      Size = 12
    end
    object cdsOTCIATID_463_EW: TWideStringField
      FieldName = 'IATID_463_EW'
      Origin = 'IATID_463_EW'
      FixedChar = True
      Size = 2
    end
    object cdsOTCCONTROLADO: TWideStringField
      FieldName = 'CONTROLADO'
      Origin = 'CONTROLADO'
      FixedChar = True
      Size = 4
    end
    object cdsOTCDAYS_SUPLY: TIntegerField
      FieldName = 'DAYS_SUPLY'
      Origin = 'DAYS_SUPLY'
    end
    object cdsOTCCODIGOREFILLNUEVO: TSmallintField
      FieldName = 'CODIGOREFILLNUEVO'
      Origin = 'CODIGOREFILLNUEVO'
    end
    object cdsOTCRXNUMBERSRNQ: TWideStringField
      FieldName = 'RXNUMBERSRNQ'
      Origin = 'RXNUMBERSRNQ'
      FixedChar = True
      Size = 1
    end
    object cdsOTCTRANSACTION_CODE: TWideStringField
      FieldName = 'TRANSACTION_CODE'
      Origin = 'TRANSACTION_CODE'
      FixedChar = True
      Size = 2
    end
    object cdsOTCMEDICAMENTOORIGINAL: TWideStringField
      FieldName = 'MEDICAMENTOORIGINAL'
      Origin = 'MEDICAMENTOORIGINAL'
      FixedChar = True
      Size = 30
    end
    object cdsOTCROBOT: TIntegerField
      FieldName = 'ROBOT'
      Origin = 'ROBOT'
    end
    object cdsOTCLABEL_NAME: TWideStringField
      FieldName = 'LABEL_NAME'
      Origin = 'LABEL_NAME'
      FixedChar = True
    end
    object cdsOTCFECHAEXPIRACION: TDateField
      FieldName = 'FECHAEXPIRACION'
      Origin = 'FECHAEXPIRACION'
    end
    object cdsOTCIMPRIMIR: TBooleanField
      FieldName = 'IMPRIMIR'
      Origin = 'IMPRIMIR'
    end
    object cdsOTCINSTANCIA: TIntegerField
      FieldName = 'INSTANCIA'
      Origin = 'INSTANCIA'
    end
    object cdsOTCORG_PROS_PROD_SERVID: TStringField
      FieldName = 'ORG_PROS_PROD_SERVID'
      Origin = 'ORG_PROS_PROD_SERVID'
      FixedChar = True
      Size = 2
    end
    object cdsOTCORG_PRESC_QTY: TIntegerField
      FieldName = 'ORG_PRESC_QTY'
      Origin = 'ORG_PRESC_QTY'
    end
    object cdsOTCORG_PRES_PROD_SIDQ: TStringField
      FieldName = 'ORG_PRES_PROD_SIDQ'
      Origin = 'ORG_PRES_PROD_SIDQ'
      FixedChar = True
      Size = 2
    end
    object cdsOTCPRIOR_AUTH_TYPE_CODE: TStringField
      FieldName = 'PRIOR_AUTH_TYPE_CODE'
      Origin = 'PRIOR_AUTH_TYPE_CODE'
      FixedChar = True
      Size = 1
    end
    object cdsOTCINCENTIVE_AMOUNT_SUB: TFloatField
      FieldName = 'INCENTIVE_AMOUNT_SUB'
      Origin = 'INCENTIVE_AMOUNT_SUB'
    end
    object cdsOTCPROF_SERV_FEE_SUB: TFloatField
      FieldName = 'PROF_SERV_FEE_SUB'
      Origin = 'PROF_SERV_FEE_SUB'
    end
    object cdsOTCPERCENTAGE_SALES_TAX_SUB: TFloatField
      FieldName = 'PERCENTAGE_SALES_TAX_SUB'
      Origin = 'PERCENTAGE_SALES_TAX_SUB'
    end
    object cdsOTCPERCENTAGE_SALES_TAX_RATE: TFloatField
      FieldName = 'PERCENTAGE_SALES_TAX_RATE'
      Origin = 'PERCENTAGE_SALES_TAX_RATE'
    end
    object cdsOTCOTHERAMOUNTCLAIMEDSUB: TFloatField
      FieldName = 'OTHERAMOUNTCLAIMEDSUB'
      Origin = 'OTHERAMOUNTCLAIMEDSUB'
    end
    object cdsOTCQTY_TEMP: TBCDField
      FieldName = 'QTY_TEMP'
      Origin = 'QTY_TEMP'
      Precision = 18
      Size = 2
    end
    object cdsOTCOTHERAMOUNTCLAIMEDSUBCOUNT: TIntegerField
      FieldName = 'OTHERAMOUNTCLAIMEDSUBCOUNT'
      Origin = 'OTHERAMOUNTCLAIMEDSUBCOUNT'
    end
    object cdsOTCPER_SALESTAX_BASIS_SUB: TStringField
      FieldName = 'PER_SALESTAX_BASIS_SUB'
      Origin = 'PER_SALESTAX_BASIS_SUB'
      FixedChar = True
      Size = 2
    end
    object cdsOTCWC_DATE_OF_INJURY: TSQLTimeStampField
      FieldName = 'WC_DATE_OF_INJURY'
      Origin = 'WC_DATE_OF_INJURY'
    end
    object cdsOTCWC_EMPLOYER_NAME: TStringField
      FieldName = 'WC_EMPLOYER_NAME'
      Origin = 'WC_EMPLOYER_NAME'
      FixedChar = True
      Size = 3
    end
    object cdsOTCWC_EMPLOYER_STREET: TStringField
      FieldName = 'WC_EMPLOYER_STREET'
      Origin = 'WC_EMPLOYER_STREET'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWC_EMPLOYER_CITY: TStringField
      FieldName = 'WC_EMPLOYER_CITY'
      Origin = 'WC_EMPLOYER_CITY'
      FixedChar = True
      Size = 15
    end
    object cdsOTCWC_EMPLOYER_STATE: TStringField
      FieldName = 'WC_EMPLOYER_STATE'
      Origin = 'WC_EMPLOYER_STATE'
      FixedChar = True
      Size = 2
    end
    object cdsOTCWC_EMPLOYER_CONTACT: TStringField
      FieldName = 'WC_EMPLOYER_CONTACT'
      Origin = 'WC_EMPLOYER_CONTACT'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWC_EMLPOYER_ZIP: TStringField
      FieldName = 'WC_EMLPOYER_ZIP'
      Origin = 'WC_EMLPOYER_ZIP'
      FixedChar = True
      Size = 15
    end
    object cdsOTCWC_CARRIER_ID: TStringField
      FieldName = 'WC_CARRIER_ID'
      Origin = 'WC_CARRIER_ID'
      FixedChar = True
      Size = 10
    end
    object cdsOTCWC_CLAIMREF_ID: TStringField
      FieldName = 'WC_CLAIMREF_ID'
      Origin = 'WC_CLAIMREF_ID'
      FixedChar = True
      Size = 30
    end
    object cdsOTCWC_EMPLOYER_PHONE: TStringField
      FieldName = 'WC_EMPLOYER_PHONE'
      Origin = 'WC_EMPLOYER_PHONE'
      FixedChar = True
      Size = 13
    end
    object cdsOTCPLANESMEDICOSNO: TIntegerField
      FieldName = 'PLANESMEDICOSNO'
      Origin = 'PLANESMEDICOSNO'
    end
  end
  object qOTC2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from OTC')
    Left = 32
    Top = 456
  end
  object dspOTC: TDataSetProvider
    DataSet = qOTC2
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 456
  end
  object CALC_DAILYTOTALS_READ: TFDQuery
    AfterExecute = CALC_DAILYTOTALS_READAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE  PROCEDURE [dbo].[CALC_DAILYTOTALS_READ] (@ID INT, @TRANS' +
        'ACTIONDATE DATE, @TRANS_HEAD_ID INT)'
      'AS'
      'DECLARE @REFUNDREAD FLOAT'
      'DECLARE @REFUNDREAD_PT2 FLOAT'
      'DECLARE @UtilityRead FLOAT'
      'DECLARE @WICREAD FLOAT'
      'DECLARE @WICREAD_PT2 FLOAT'
      'DECLARE @WICCRREAD FLOAT'
      'DECLARE @WICCRREAD_PT2 FLOAT'
      'DECLARE @CashRead FLOAT'
      'DECLARE @CashRead_PT2 FLOAT '
      'DECLARE @CheckRead FLOAT'
      'DECLARE @CheckRead_PT2 FLOAT'
      'DECLARE @CCardRead FLOAT'
      'DECLARE @CCardRead_PT2 FLOAT'
      'DECLARE @ATHRead FLOAT'
      'DECLARE @ATHRead_PT2 FLOAT'
      'DECLARE @ATHMRead FLOAT'
      'DECLARE @ATHMRead_PT2 FLOAT'
      'DECLARE @PORead FLOAT '
      'DECLARE @PORead_PT2 FLOAT '
      'DECLARE @POCOUNT FLOAT'
      'DECLARE @POCOUNT_PT2 FLOAT'
      'DECLARE @PayOutRead FLOAT'
      'DECLARE @PayOutRead_PT2 FLOAT'
      'DECLARE @OtherRead FLOAT'
      'DECLARE @OtherRead_PT2 FLOAT'
      'DECLARE @OTHERCOUNT FLOAT'
      'DECLARE @OTHERCOUNT_PT2 FLOAT'
      'DECLARE @TAX_MUNICIPAL FLOAT'
      'DECLARE @TAX_ESTATAL FLOAT'
      'DECLARE @TAX_SERVICIO FLOAT'
      'DECLARE @EMPLOYEENUMBER CHAR(3)'
      'DECLARE @REGISTER INT'
      'DECLARE @TTIP FLOAT'
      'DECLARE @TRIPLES_Read FLOAT'
      'DECLARE @TRIPLES_ReadT_PT2 FLOAT'
      'DECLARE @PayPal_read FLOAT'
      'DECLARE @PayPal_read_PT2 FLOAT '
      'DECLARE @Coupon Decimal(18, 2)'
      'BEGIN'
      '-- SET NOCOUNT ON added to prevent extra result sets from'
      '-- interfering with SELECT statements.'
      'SET NOCOUNT ON;'
      #9'begin transaction;'
      
        #9#9'--select @EMPLOYEENUMBER = EMPLOYNUMBER, @REGISTER = REGISTER ' +
        'FROM DAILYTOTALS WHERE ID = @ID;'
      
        #9#9'SELECT @TTIP = ISNULL(sum(TOTAL_TIP), 0) From TransactionHeade' +
        'r Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRANSACTIO' +
        'NDATE) AND (Voided = 0) AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @REFUNDREAD = ISNULL(sum(PayAmount1), 0)  From Transact' +
        'ionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TR' +
        'ANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PayAmount' +
        '1 < 0) AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @REFUNDREAD_PT2 = ISNULL(sum(PayAmount2), 0)  From Tran' +
        'sactionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) =' +
        ' @TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PayAm' +
        'ount2 < 0)AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @WICREAD = ISNULL(sum(PayAmount1), 0) From TransactionH' +
        'eader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRANSA' +
        'CTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentType1 ' +
        '= '#39'WIC'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @WICREAD_PT2 = ISNULL(sum(PayAmount2), 0) From Transact' +
        'ionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TR' +
        'ANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentTy' +
        'pe2 = '#39'WIC'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @WICCRREAD = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRAN' +
        'SACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentType' +
        '1 = '#39'PICK'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @WICCRREAD_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @' +
        'TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Payment' +
        'Type2 = '#39'PICK'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @CheckRead = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRAN' +
        'SACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentType' +
        '1 = '#39'CHK'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @CheckRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @' +
        'TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Payment' +
        'Type2 = '#39'CHK'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @CCardRead = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRAN' +
        'SACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentType' +
        '1 = '#39'VISA'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @CCardRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @' +
        'TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Payment' +
        'Type2 = '#39'VISA'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @ATHRead = ISNULL(sum(PayAmount1), 0) From TransactionH' +
        'eader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRANSA' +
        'CTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentType1 ' +
        '= '#39'ATH'#39' or PAYMENTTYPE1 = '#39'TFAM'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @ATHRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transact' +
        'ionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TR' +
        'ANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PAYMENTTY' +
        'PE2 = '#39'ATH'#39' or PAYMENTTYPE2 = '#39'TFAM'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @ATHMRead = ISNULL(sum(PayAmount1), 0) From Transaction' +
        'Header Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRANS' +
        'ACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentType1' +
        ' = '#39'ATHM'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @ATHMRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transac' +
        'tionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @T' +
        'RANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentT' +
        'ype2 = '#39'ATHM'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @PORead = ISNULL(sum(PayAmount1), 0) From TransactionHe' +
        'ader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRANSAC' +
        'TIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentType1 =' +
        ' '#39'CRED'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @PORead_PT2 = ISNULL(sum(PayAmount2), 0)  From Transact' +
        'ionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TR' +
        'ANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentTy' +
        'pe2 = '#39'CRED'#39') AND (ID = @TRANS_HEAD_ID);'
      ''
      
        #9#9'SELECT @PayPal_read = ISNULL(sum(PayAmount1), 0) From Transact' +
        'ionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TR' +
        'ANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentTy' +
        'pe1 = '#39'PPAL'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @PayPal_read_PT2 = ISNULL(sum(PayAmount2), 0)  From Tra' +
        'nsactionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) ' +
        '= @TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Paym' +
        'entType2 = '#39'PPAL'#39') AND (ID = @TRANS_HEAD_ID);'
      ''
      
        #9#9'SELECT @TRIPLES_Read = ISNULL(sum(PayAmount1), 0)  From Transa' +
        'ctionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @' +
        'TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Payment' +
        'Type2 = '#39'TSSS'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @TRIPLES_ReadT_PT2 = ISNULL(sum(PayAmount2), 0) From Tr' +
        'ansactionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101)' +
        ' = @TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Pay' +
        'mentType2 = '#39'TSSS'#39') AND (ID = @TRANS_HEAD_ID);'
      #9#9
      
        #9#9'SELECT @POCOUNT = ISNULL(sum(PayAmount1), 0)  From Transaction' +
        'Header Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRANS' +
        'ACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentType1' +
        ' = '#39'CRED'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @POCOUNT_PT2 = ISNULL(sum(PayAmount2), 0) From Transact' +
        'ionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TR' +
        'ANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentTy' +
        'pe2 = '#39'CRED'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @PayOutRead = ISNULL(sum(PayAmount1), 0) From Transacti' +
        'onHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRA' +
        'NSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentTyp' +
        'e1 = '#39'POUT'#39') AND (ID = @TRANS_HEAD_ID); '
      
        #9#9'SELECT @PayOutRead_PT2 = ISNULL(sum(PayAmount2), 0) From Trans' +
        'actionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = ' +
        '@TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Paymen' +
        'tType2 = '#39'POUT'#39') AND (ID = @TRANS_HEAD_ID); '
      
        #9#9'SELECT @CashRead = ((ISNULL(sum(PayAmount1), 0)) - (ISNULL(sum' +
        '(CHANGE), 0))) From TransactionHeader Where (CONVERT(VARCHAR(10)' +
        ', TRANSACTIONDATE,101) = @TRANSACTIONDATE) AND (Voided = 0)  AND' +
        ' (PaymentType1 = '#39'CASH'#39') AND (ID = @TRANS_HEAD_ID);'#9
      
        #9#9'SELECT @CashRead_PT2 = ((ISNULL(sum(PayAmount2), 0))) From Tra' +
        'nsactionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) ' +
        '= @TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Paym' +
        'entType2 = '#39'CASH'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @OtherRead = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRAN' +
        'SACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentType' +
        '1 = '#39'NCHG'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @OtherRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @' +
        'TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Payment' +
        'Type2 = '#39'NCHG'#39') AND (ID = @TRANS_HEAD_ID);'
      
        #9#9'SELECT @OTHERCOUNT = ISNULL(sum(PayAmount1), 0) From Transacti' +
        'onHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRA' +
        'NSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (PaymentTyp' +
        'e1 = '#39'NCHG'#39') AND (ID = @TRANS_HEAD_ID);  '
      
        #9#9'SELECT @OTHERCOUNT_PT2 = ISNULL(sum(PayAmount2), 0) From Trans' +
        'actionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = ' +
        '@TRANSACTIONDATE) AND (Voided = 0)  AND (Voided = 0) AND (Paymen' +
        'tType2 = '#39'NCHG'#39') AND (ID = @TRANS_HEAD_ID);  '
      
        #9#9'SELECT @UtilityRead = (ISNULL(sum(transactiondetail.total),0))' +
        ' From transactiondetail inner join transactionheader on transact' +
        'iondetail.transactionnumber = transactionheader.transactionnumbe' +
        'r '
      #9#9#9#9'Where transactiondetail.upc like '#39'99999999995%'#39
      #9#9#9#9'AND (transactionheader.EmployNumber = @EMPLOYEENUMBER'
      #9#9#9#9'AND (transactionheader.Voided = 0) '
      #9#9#9#9'AND (transactionheader.TRANSACTIONDATE = @TRANSACTIONDATE)'
      #9#9#9#9'AND (transactionheader.Register = @REGISTER)'
      #9#9#9#9'AND (transactionheader.ID = @TRANS_HEAD_ID));'
      
        #9#9'select @Coupon = ISNULL(COUPONREAD, 0) From DAILYTOTALS where ' +
        'ID = @TRANS_HEAD_ID;'
      
        #9#9'SELECT @TAX_MUNICIPAL = ISNULL(sum(TAX), 0)  From TransactionH' +
        'eader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = @TRANSA' +
        'CTIONDATE) AND (Voided = 0) AND (Voided = 0) AND (ID = @TRANS_HE' +
        'AD_ID);'
      
        #9#9'SELECT @TAX_ESTATAL =   ISNULL(sum(TAX_ESTATAL), 0) From Trans' +
        'actionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) = ' +
        '@TRANSACTIONDATE) AND (Voided = 0) AND (Voided = 0) AND (ID = @T' +
        'RANS_HEAD_ID);'
      
        #9#9'SELECT @TAX_SERVICIO =  ISNULL(sum(TAX_SERVICIO), 0) From Tran' +
        'sactionHeader Where (CONVERT(VARCHAR(10), TRANSACTIONDATE,101) =' +
        ' @TRANSACTIONDATE) AND (Voided = 0) AND (Voided = 0) AND (ID = @' +
        'TRANS_HEAD_ID);'
      
        #9#9'Update DAILYTOTALS set REFUNDREAD = REFUNDREAD + @REFUNDREAD +' +
        ' @REFUNDREAD_PT2, WICREAD = WICREAD + @WICREAD + @WICREAD_PT2, W' +
        'ICCRREAD = WICCRREAD + @WICCRREAD + @WICCRREAD_PT2, CashRead = C' +
        'ashRead + (@CashRead + @CashRead_PT2) - (@PayOutRead + @PayOutRe' +
        'ad_PT2), CheckRead = CheckRead + @CheckRead + @CheckRead_PT2,'
      
        #9#9'CCardRead = CCardRead + @CCardRead + @CCardRead_PT2, ATHRead =' +
        ' ATHRead + @ATHRead + @ATHRead_PT2, ATHMRead = ATHMRead + @ATHMR' +
        'ead + @ATHMRead_PT2, PORead = PORead + @PORead + @PORead_PT2, PO' +
        'COUNT = POCOUNT + @POCOUNT + @POCOUNT_PT2, PayOutRead = PayOutRe' +
        'ad + @PayOutRead + @PayOutRead_PT2, OtherRead = OtherRead + @Oth' +
        'erRead + @OtherRead_PT2, '
      
        #9#9'TRIPLESREAD = TRIPLESREAD + @TRIPLES_Read + @TRIPLES_ReadT_PT2' +
        ','
      #9#9'PAYPAlREAD = PAYPALREAD + @PayPal_read + @PayPal_read_PT2,'
      
        #9#9'OTHERCOUNT = OTHERCOUNT + @OTHERCOUNT + @OTHERCOUNT_PT2, UTILI' +
        'TYREAD = UTILITYREAD + @UtilityRead, COUPONREAD = COUPONREAD + @' +
        'COUPON, '
      
        #9#9'TOTAL_READ = TOTAL_READ + (ISNULL(@CASHREAD,0)) + ISNULL(@Cash' +
        'Read_PT2,0) + '
      #9#9'(ISNULL(@ATHREAD,0)) + (ISNULL(@ATHMREAD,0)) + '
      #9#9'(ISNULL(@TRIPLES_Read,0)) + (ISNULL(@TRIPLES_ReadT_PT2,0)) +'
      #9#9'(ISNULL(@PayPal_read,0)) + (ISNULL(@PayPal_read_PT2,0)) +'
      #9#9'(ISNULL(@CCARDREAD,0)) + (ISNULL(@CHECKREAD,0)) + '
      #9#9'(ISNULL(@WICREAD,0)) - (ISNULL(@PayOutRead,0)), '
      
        #9#9'TOTAL_COUNT = TOTAL_COUNT + (((ISNULL(CASHCOUNT,0)) + (ISNULL(' +
        'ATHCOUNT,0)) + (ISNULL(PAYPALCOUNT,0)) + (ISNULL(CCARDCOUNT,0)) ' +
        '+ (ISNULL(CHECKCOUNT,0)) + (ISNULL(WICCOUNT,0))) - STARTBANK),'
      #9#9'DIFFERENCE_AMOUNT = DIFFERENCE_AMOUNT + ISNULL(TOTAL_COUNT,0) '
      
        #9#9'- ISNULL(TOTAL_READ,0), TAX_ESTATAL = TAX_ESTATAL + @TAX_ESTAT' +
        'AL, TAX_MUNICIPAL = TAX_MUNICIPAL + @TAX_MUNICIPAL, TAX_SERVICIO' +
        ' = TAX_SERVICIO + @TAX_SERVICIO,'
      #9#9'TIPSREAD = TIPSREAD + @TTIP  '
      #9#9'Where ID = @ID;'
      ''
      
        #9#9'update DAILYTOTALS set END_OF_DAY_COMPLETED = 1, EOD_LINK = @I' +
        'D where id = @TRANS_HEAD_ID;'
      #9'commit;'
      'END;')
    Left = 1952
    Top = 304
  end
  object UPDATE_PATIENT_NOTIFICATIONS: TFDQuery
    AfterExecute = UPDATE_PATIENT_NOTIFICATIONSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE  PROCEDURE [dbo].[UPDATE_PATIENT_NOTIFICATIONS] @TELEFONO' +
        ' char(13), @WORKPHONE CHAR(23), @CELULAR CHAR(13), @EMAIL NCHAR(' +
        '80),'
      
        '@NOTIFICATION_MODE_PHONE SMALLINT, @NOTIFICATION_MODE_CEL SMALLI' +
        'NT, @NOTIFICATION_MODE_SMS SMALLINT,'
      
        '@NOTIFICATION_MODE_EMAIL SMALLINT,  @WC_NO_NOTIFICATION bit, @NU' +
        'MEROCLIENTE INT, @ATENDIDAPOR CHAR(3), @PHARMACIST CHAR(3)'
      'AS'
      'begin'
      '  begin transaction'
      '  UPDATE [dbo].[PACIENTES]'
      '  SET [TELEFONO] = @TELEFONO'
      '      ,[FAX] = @WORKPHONE'
      '      ,[CELULAR] = @CELULAR'
      '      ,[EMAIL] = @EMAIL'
      '      ,[NOTIFICATION_MODE_PHONE] = @NOTIFICATION_MODE_PHONE'
      '      ,[NOTIFICATION_MODE_CEL] = @NOTIFICATION_MODE_CEL'
      '      ,[NOTIFICATION_MODE_SMS] = @NOTIFICATION_MODE_SMS'
      '      ,[NOTIFICATION_MODE_EMAIL] = @NOTIFICATION_MODE_EMAIL'
      '      ,[WC_NO_NOTIFICATION] = @WC_NO_NOTIFICATION'
      '  WHERE NUMEROCLIENTE = @NUMEROCLIENTE;'
      
        '  EXECUTE INSERT_LOG '#39'PATIENT COMUNICATION MODE'#39', '#39'M'#39', 0, @ATEND' +
        'IDAPOR,  @PHARMACIST, 0, 0,0,@NUMEROCLIENTE,0,0,0,0,'#39'R'#39','#39#39',0,1;'
      '  commit;'
      'end;')
    Left = 1640
    Top = 648
  end
  object qClaims: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select * from Claim')
    Left = 32
    Top = 520
  end
  object dspClaims: TDataSetProvider
    DataSet = qClaims
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 112
    Top = 520
  end
  object cdsClaims: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClaims'
    Left = 248
    Top = 528
    object cdsClaimsSERVICEDATE: TSQLTimeStampField
      FieldName = 'SERVICEDATE'
      Required = True
    end
    object cdsClaimsCLAIM: TWideStringField
      FieldName = 'CLAIM'
      Required = True
      FixedChar = True
      Size = 1500
    end
    object cdsClaimsCLAIM_NO: TAutoIncField
      FieldName = 'CLAIM_NO'
      ReadOnly = True
    end
    object cdsClaimsRX_NUMBER: TLargeintField
      FieldName = 'RX_NUMBER'
    end
    object cdsClaimsTYPIST: TWideStringField
      FieldName = 'TYPIST'
      FixedChar = True
      Size = 4
    end
    object cdsClaimsOTCNUMBER: TIntegerField
      FieldName = 'OTCNUMBER'
    end
  end
  object dsClaims: TDataSource
    DataSet = cdsClaims
    Left = 184
    Top = 520
  end
  object PICKUP_TF: TFDQuery
    AfterExecute = PICKUP_TFAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[PICKUP_TF] @TF BIT, @OTCNUMBER INT, @TN ' +
        'INT'
      'AS'
      'SET NOCOUNT ON'
      'begin'
      '  begin transaction'
      '    Update OTC set WC_Pickup = @TF where OTCNUMBER = @OTCNUMBER;'
      
        '    Update WillCall set POS_PICKUP = @TF where TRANSACTION_NUMBE' +
        'R = @TN;'
      '  commit'
      'end')
    Left = 1768
    Top = 64
  end
  object CLOSE_BALANCE: TFDQuery
    AfterExecute = CLOSE_BALANCEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE CLOSE_BALANCE @ID INTEGER '
      'AS'
      'BEGIN'
      '  -- SET NOCOUNT ON added to prevent extra result sets from'
      '  -- interfering with SELECT statements.'
      '  SET NOCOUNT ON;'
      '  BEGIN TRANSACTION;'
      
        '    UPDATE DAILYTOTALS SET STATUS_CUADRE = '#39'C'#39', STATUS_CAJA = '#39'C' +
        #39' WHERE ID = @ID; '
      '  COMMIT;'
      'END')
    Left = 1776
    Top = 144
  end
  object INSERT_PASSWORD_LOG: TFDQuery
    AfterExecute = INSERT_PASSWORD_LOGAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_PASSWORD_LOG]'
      '@USERNAME VARCHAR(35),'
      '@PASSWORD_COL NCHAR(30)'
      'AS'
      'BEGIN'
      '  SET NOCOUNT ON '
      '  BEGIN TRANSACTION'
      '  INSERT INTO PASSWORD_LOG (USERNAME, PASSWORD_COL, DATE_TIME)'
      '  VALUES (@USERNAME, @PASSWORD_COL, GETDATE()); '
      '  COMMIT'
      'END')
    Left = 1792
    Top = 224
  end
  object TIME_STAMP: TFDQuery
    AfterExecute = TIME_STAMPAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'Create  PROCEDURE [dbo].[TIME_STAMP] @EMPLOYEE INT, @DATETIME DA' +
        'TETIME, @RESULT CHAR(15) OUTPUT'
      'AS'
      'DECLARE @REC_COUNT INT'
      'DECLARE @EMP INT'
      'DECLARE @PI1 DATETIME'
      'DECLARE @PO1 DATETIME '
      'DECLARE @PI2 DATETIME'
      'DECLARE @PO2 DATETIME'
      'DECLARE @ID INT'
      'declare @NumberOfSeconds int'
      'BEGIN'
      #9'begin transaction'
      #9'SET NOCOUNT ON;'
      
        #9'Select @ID = isnull(ID,0) from TIMECARD where EMPLOYEE = @EMPLO' +
        'YEE AND ((PUNCH_IN_1 is Null) or (PUNCH_OUT_1 is null) or (PUNCH' +
        '_IN_2 is Null) or (PUNCH_OUT_2 is null));'
      
        #9'Select @REC_COUNT = COUNT(*) from TIMECARD where EMPLOYEE = @EM' +
        'PLOYEE AND ((PUNCH_IN_1 is Null) or (PUNCH_OUT_1 is null) or (PU' +
        'NCH_IN_2 is Null) or (PUNCH_OUT_2 is null));'
      #9'IF @REC_COUNT = 0  '
      #9'begin'
      
        #9#9'INSERT INTO TIMECARD (PUNCH_IN_1, EMPLOYEE) VALUES (@DATETIME,' +
        ' @EMPLOYEE);'
      #9#9'SELECT @RESULT = '#39'PUNCH IN 1'#39';'
      #9'end'
      #9'else'
      #9'begin'
      
        #9#9'SELECT @REC_COUNT = COUNT(*) FROM TIMECARD WHERE ID = @ID AND ' +
        'PUNCH_OUT_1 IS NULL;'
      #9#9'if @REC_COUNT = 1'
      #9#9'begin'
      #9#9#9'UPDATE TIMECARD SET PUNCH_OUT_1 = @DATETIME WHERE ID = @ID;'
      #9#9#9'SELECT @RESULT = '#39'PUNCH OUT 1'#39';'
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      
        #9#9#9'SELECT @REC_COUNT = COUNT(*) FROM TIMECARD WHERE ID = @ID AND' +
        ' PUNCH_IN_2 IS NULL;'
      #9#9#9'if @REC_COUNT = 1'
      #9#9#9'begin'
      #9#9#9#9'UPDATE TIMECARD SET PUNCH_IN_2 = @DATETIME WHERE ID = @ID;'
      #9#9#9#9'SELECT @RESULT = '#39'PUNCH IN 2'#39';'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'begin'
      #9#9#9#9'UPDATE TIMECARD SET PUNCH_OUT_2 = @DATETIME WHERE ID = @ID;'
      #9#9#9#9'SELECT @RESULT = '#39'PUNCH OUT 2'#39';'
      #9#9#9'end;'
      #9#9'end;'
      #9'end;'
      #9'commit;'
      'END')
    Left = 1992
    Top = 872
  end
  object UPDATE_TH_BALANCE: TFDQuery
    AfterExecute = UPDATE_TH_BALANCEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[UPDATE_TH_BALANCE] ON [dbo].[TABS_DETAIL] '
      '   AFTER INSERT,DELETE,UPDATE'
      'AS'
      'DECLARE @TBALANCE FLOAT '
      'DECLARE @ID INTEGER'
      'DECLARE @GROUP_BY_ID INTEGER'
      'BEGIN'
      '    SET NOCOUNT ON;'
      #9'begin transaction'
      
        #9#9'SELECT @ID = isnull(TABS_ID,0), @GROUP_BY_ID = GROUP_BY_ID FRO' +
        'M inserted; '
      
        #9#9'select @TBALANCE = ISNULL(SUM(BALANCE),0) from TABS_DETAIL WHE' +
        'RE GROUP_BY_ID = @GROUP_BY_ID;'
      
        #9#9'UPDATE TABS_HEADER SET GROUP_BY_ID = @GROUP_BY_ID WHERE ID = @' +
        'ID;'
      
        #9#9'UPDATE TABS_HEADER SET GROUP_BALANCE = @TBALANCE WHERE GROUP_B' +
        'Y_ID = @GROUP_BY_ID;'
      
        #9#9'--UPDATE TABS_HEADER SET GROUP_BALANCE = @TBALANCE, GROUP_BY_I' +
        'D = @GROUP_BY_ID WHERE ID = @ID;'
      #9'commit;'
      'END;')
    Left = 1792
    Top = 312
  end
  object UPDATE_TH_BALANCE_DEL: TFDQuery
    AfterExecute = UPDATE_TH_BALANCE_DELAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[UPDATE_TH_BALANCE_DEL] ON [dbo].[TABS_DETA' +
        'IL] '
      '   AFTER INSERT,DELETE,UPDATE'
      'AS'
      'DECLARE @TBALANCE FLOAT '
      'DECLARE @ID INTEGER'
      'DECLARE @GROUP_BY_ID INTEGER'#9
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'begin transaction '
      #9'select @ID = TABS_ID, @GROUP_BY_ID = GROUP_BY_ID FROM deleted; '
      
        #9'select @TBALANCE = ISNULL(SUM(BALANCE),0) from TABS_DETAIL WHER' +
        'E GROUP_BY_ID = @GROUP_BY_ID;'
      
        #9'UPDATE TABS_HEADER SET GROUP_BALANCE = @TBALANCE WHERE GROUP_BY' +
        '_ID = @GROUP_BY_ID;'
      #9'commit;'
      'END;')
    Left = 1792
    Top = 400
  end
  object OPEN_TABS: TFDQuery
    AfterExecute = OPEN_TABSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[OPEN_TABS]'
      'AS'
      
        'SELECT        dbo.TABS_HEADER.ID, dbo.TABS_HEADER.SERVER, dbo.TA' +
        'BS_HEADER.GROUP_BALANCE, dbo.TABS_DETAIL.CUSTOMER, dbo.TABS_DETA' +
        'IL.TELEPHONE, dbo.TABS_DETAIL.CREDIT_CARD, dbo.TABS_DETAIL.BALAN' +
        'CE, '
      
        '                         dbo.TABS_DETAIL.DATE, dbo.TABS_DETAIL.T' +
        'RANSACTIONNUMBER, dbo.TABS_HEADER.BUTTON_CAPTION, dbo.TABS_HEADE' +
        'R.CUSTOMER_ID, dbo.TABS_HEADER.DELIVER_BY_ID, dbo.TABS_HEADER.TR' +
        'ANS_TYPE, '
      
        '                         dbo.TABS_DETAIL.GROUP_BY_ID, dbo.TABS_H' +
        'EADER.GROUP_BY_NAME, dbo.TABS_HEADER.ISTABLE'
      'FROM            dbo.TABS_HEADER INNER JOIN'
      
        '                         dbo.TABS_DETAIL ON dbo.TABS_HEADER.ID =' +
        ' dbo.TABS_DETAIL.TABS_ID')
    Left = 1792
    Top = 480
  end
  object CALC_TAB_BALANCE: TFDQuery
    AfterExecute = CALC_TAB_BALANCEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[CALC_TAB_BALANCE] @TRANSNO INT'
      'AS'
      'DECLARE @TBALANCE FLOAT '
      'DECLARE @ID INTEGER'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      
        #9#9'SELECT @ID = isnull(TABS_ID,0) FROM TABS_DETAIL WHERE TRANSACT' +
        'IONNUMBER = @TRANSNO; '
      
        #9#9'select @TBALANCE = ISNULL(SUM(BALANCE),0) from TABS_DETAIL WHE' +
        'RE TABS_ID = @ID;'
      
        #9#9'UPDATE TABS_HEADER SET GROUP_BALANCE = @TBALANCE WHERE ID = @I' +
        'D;'
      #9'commit;'
      'END')
    Left = 1792
    Top = 560
  end
  object CANCEL_TABS: TFDQuery
    AfterExecute = CANCEL_TABSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[CANCEL_TABS] @TRANNO INT'#9
      'AS'
      'DECLARE @ID INT '
      'DECLARE @BUTTON_NAME NCHAR(30)'
      'DECLARE @NO_TABS INT'
      'DECLARE @GROUP_BALANCE FLOAT'
      'DECLARE @TBALANCE FLOAT'
      'DECLARE @TABS_ID INT'
      'BEGIN'
      '  begin transaction'
      #9'SET NOCOUNT ON;'
      
        #9'Select @ID = TABS_ID from TABS_DETAIL WHERE TRANSACTIONNUMBER =' +
        ' @TRANNO;'
      #9'Update BUTTONS_MOBILE_DETAIL set tab_id = 0 where tab_id = @ID;'
      #9'delete from TABS_DETAIL WHERE TRANSACTIONNUMBER = @TRANNO;   '
      
        #9'select @TBALANCE = ISNULL(SUM(BALANCE),0) from TABS_DETAIL WHER' +
        'E TABS_ID = @ID;'
      #9'if @TBALANCE > 0'
      #9'begin'
      
        #9#9'UPDATE TABS_HEADER SET GROUP_BALANCE = @TBALANCE WHERE ID = @I' +
        'D;   '
      #9'end;'
      #9'else'
      #9'begin'
      
        #9#9'SELECT @BUTTON_NAME = BUTTON_NAME FROM TABS_HEADER WHERE ID = ' +
        '@ID;'
      #9#9'IF (LEN(@BUTTON_NAME) > 1) '
      #9#9'begin'
      #9#9'  UPDATE TABS_HEADER SET GROUP_BALANCE = 0 WHERE ID = @ID;'
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      #9#9'  delete from TABS_HEADER where ID = @ID;'
      #9#9'end;'
      #9'end;'
      
        #9'DECLARE MyCursorRecipe CURSOR FOR SELECT TABS_ID from TABS_DETA' +
        'IL where ID = @ID;'
      #9'OPEN MyCursorRecipe'
      #9'FETCH NEXT FROM MyCursorRecipe'
      #9'INTO @TABS_ID'
      #9'WHILE @@FETCH_STATUS = 0'
      #9'begin'
      #9#9'DELETE FROM TABS_HEADER WHERE ID = @TABS_ID;'
      #9#9'FETCH NEXT FROM MyCursorRecipe'
      #9#9'INTO @TABS_ID'
      #9'end;'
      #9'CLOSE MyCursorRecipe'
      #9'DEALLOCATE MyCursorRecipe  '
      
        #9'DELETE from TABS_DETAIL where BALANCE IS NULL OR BALANCE = 0 AN' +
        'D CONVERT(varchar, date, 101) < GETDATE() AND ID = @ID;'
      '  commit;'
      'END;')
    Left = 1936
    Top = 72
  end
  object NEXT_MAIN_COURSE_ID: TFDQuery
    AfterExecute = NEXT_MAIN_COURSE_IDAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[NEXT_MAIN_COURSE_ID] @ID INTEGER OUTPUT'
      'AS;'
      'begin'
      '  begin transaction'
      '  Update NEXT_RXNUMBER SET MAIN_COURSE_ID = MAIN_COURSE_ID + 1;'
      '  Select @ID = (MAIN_COURSE_ID) FROM NEXT_RXNUMBER;'
      '  commit'
      'end')
    Left = 1944
    Top = 136
  end
  object POS_INVENTORY_CONTROL: TFDQuery
    AfterExecute = POS_INVENTORY_CONTROLAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[POS_INVENTORY_CONTROL] @TRASNNO INT'
      'AS'
      'DECLARE @QTY FLOAT'
      'DECLARE @PRODUCTID INT'
      'DECLARE @QTY_RECIPE FLOAT'
      'DECLARE @PRODUCTID_RECIPE INT'
      'DECLARE @INVCONTROL_RECIPE BIT'
      'DECLARE @BUTTON_QTY FLOAT'
      'BEGIN'
      '    SET NOCOUNT ON;'
      #9'begin transaction'
      
        '    DECLARE MyCursor CURSOR STATIC LOCAL FOR SELECT QTY, PRODUCT' +
        'NO, INVCONTROL_RECIPE, isnull(BUTTON_QTY,0) from TRANSACTIONDETA' +
        'IL_TEMP where TRANSACTIONNUMBER = @TRASNNO;'
      '    OPEN MyCursor'
      '    FETCH NEXT FROM MyCursor'
      '    INTO @QTY, @PRODUCTID, @INVCONTROL_RECIPE, @BUTTON_QTY'
      '    WHILE @@FETCH_STATUS = 0'
      '    BEGIN'
      #9#9'IF @INVCONTROL_RECIPE = 0'
      #9#9'begin'
      #9#9#9'if @BUTTON_QTY > 0'
      #9#9#9'begin'
      
        #9#9#9#9'Update InventarioPiso set QTYINVENTARIO = QTYINVENTARIO - (@' +
        'QTY * @BUTTON_QTY) where PRODUCTNO = @PRODUCTID;'#9
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'begin'
      
        #9#9#9#9'Update InventarioPiso set QTYINVENTARIO = QTYINVENTARIO - @Q' +
        'TY where PRODUCTNO = @PRODUCTID;'
      #9#9#9'end;'
      #9#9'end;'
      #9#9'else'
      #9#9'begin'
      
        #9#9#9'DECLARE MyCursorRecipe CURSOR FOR SELECT QTY, PRODUCT_ID from' +
        ' RECIPE where MAIN_PRODUCT_ID = @PRODUCTID;'
      #9#9#9'OPEN MyCursorRecipe'
      #9#9#9'FETCH NEXT FROM MyCursorRecipe'
      #9#9#9'INTO @QTY_RECIPE,@PRODUCTID_RECIPE'
      #9#9#9'WHILE @@FETCH_STATUS = 0'
      #9#9#9'begin'
      
        #9#9#9#9'Update InventarioPiso set QTYINVENTARIO = (QTYINVENTARIO - (' +
        '@QTY_RECIPE * @QTY))  where PRODUCTNO = @PRODUCTID_RECIPE; '
      #9#9#9#9'FETCH NEXT FROM MyCursorRecipe'
      #9#9#9#9'INTO @QTY_RECIPE, @PRODUCTID_RECIPE'
      #9#9'    end;'
      #9#9#9'CLOSE MyCursorRecipe'
      #9#9#9'DEALLOCATE MyCursorRecipe'
      #9#9'end;'
      '      FETCH NEXT FROM MyCursor'
      '      INTO @QTY, @PRODUCTID, @INVCONTROL_RECIPE, @BUTTON_QTY'
      '    END'
      '    CLOSE MyCursor'
      '    DEALLOCATE MyCursor'
      #9'commit;'
      'END')
    Left = 1952
    Top = 224
  end
  object CALC_DAILYTOTALS_READ_REST: TFDQuery
    AfterExecute = CALC_DAILYTOTALS_READ_RESTAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[CALC_DAILYTOTALS_READ_REST] (@ID INT)'
      'AS'
      'DECLARE @REFUNDREAD FLOAT'
      'DECLARE @REFUNDREAD_PT2 FLOAT'
      'DECLARE @UtilityReadCASH FLOAT'
      'DECLARE @UtilityReadATH FLOAT'
      'DECLARE @WICREAD FLOAT'
      'DECLARE @WICREAD_PT2 FLOAT'
      'DECLARE @WICCRREAD FLOAT'
      'DECLARE @WICCRREAD_PT2 FLOAT'
      'DECLARE @CashRead FLOAT'
      'DECLARE @CashRead_PT2 FLOAT '
      'DECLARE @CheckRead FLOAT'
      'DECLARE @CheckRead_PT2 FLOAT'
      'DECLARE @CCardRead FLOAT'
      'DECLARE @CCardRead_PT2 FLOAT'
      'DECLARE @ATHRead FLOAT'
      'DECLARE @ATHRead_PT2 FLOAT'
      'DECLARE @ATHMRead FLOAT'
      'DECLARE @ATHMRead_PT2 FLOAT'
      'DECLARE @PORead FLOAT '
      'DECLARE @PORead_PT2 FLOAT '
      'DECLARE @POCOUNT FLOAT'
      'DECLARE @POCOUNT_PT2 FLOAT'
      'DECLARE @PayOutRead FLOAT'
      'DECLARE @PayOutRead_PT2 FLOAT'
      'DECLARE @OtherRead FLOAT'
      'DECLARE @OtherRead_PT2 FLOAT'
      'DECLARE @OTHERCOUNT FLOAT'
      'DECLARE @OTHERCOUNT_PT2 FLOAT'
      'DECLARE @TAX_MUNICIPAL FLOAT'
      'DECLARE @TAX_ESTATAL FLOAT'
      'DECLARE @TAX_SERVICIO FLOAT'
      'DECLARE @TAX_PROC_FOOD FLOAT'
      'DECLARE @EMPLOYEENUMBER CHAR(3)'
      'DECLARE @REGISTER INT'
      'DECLARE @TTIP FLOAT'
      'DECLARE @CASHBACK FLOAT'
      'DECLARE @TRIPLES_Read FLOAT'
      'DECLARE @TRIPLES_ReadT_PT2 FLOAT'
      'DECLARE @PayPal_read FLOAT'
      'DECLARE @PayPal_read_PT2 FLOAT '
      'DECLARE @Coupon decimal(18, 2)'
      'BEGIN'
      '-- SET NOCOUNT ON added to prevent extra result sets from'
      '-- interfering with SELECT statements.'
      'SET NOCOUNT ON;'
      #9'begin transaction;'
      
        #9#9'Select @EMPLOYEENUMBER = EMPLOYNUMBER, @REGISTER = REGISTER FR' +
        'OM DAILYTOTALS WHERE ID = @ID;'
      
        #9#9'SELECT @TTIP = ISNULL(sum(TOTAL_TIP), 0) From TransactionHeade' +
        'r Where (ID = @ID) AND (Voided = 0) and (Register = @REGISTER);'
      
        #9#9'SELECT @REFUNDREAD = ISNULL(sum(PayAmount1), 0)  From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PayAmount1 < 0' +
        ') and (Register = @REGISTER);'
      
        #9#9'SELECT @REFUNDREAD_PT2 = ISNULL(sum(PayAmount2), 0)  From Tran' +
        'sactionHeader Where (ID = @ID)  AND (Voided = 0) AND (PayAmount2' +
        ' < 0) and (Register = @REGISTER);'
      
        #9#9'SELECT @WICREAD = ISNULL(sum(PayAmount1), 0) From TransactionH' +
        'eader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39'WI' +
        'C'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @WICREAD_PT2 = ISNULL(sum(PayAmount2), 0) From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2 =' +
        ' '#39'WIC'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @WICCRREAD = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39 +
        'PICK'#39') and (Register = @REGISTER);'#9
      
        #9#9'SELECT @WICCRREAD_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2' +
        ' = '#39'PICK'#39') and (Register = @REGISTER);'#9
      
        #9#9'SELECT @CheckRead = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39 +
        'CHK'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @CheckRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2' +
        ' = '#39'CHK'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @CCardRead = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39 +
        'VISA'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @CCardRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2' +
        ' = '#39'VISA'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @ATHRead = ISNULL(sum(PayAmount1), 0) From TransactionH' +
        'eader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39'AT' +
        'H'#39' or PAYMENTTYPE1 = '#39'TFAM'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @ATHRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PAYMENTTYPE2 =' +
        ' '#39'ATH'#39' or PAYMENTTYPE2 = '#39'TFAM'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @ATHMRead = ISNULL(sum(PayAmount1), 0) From Transaction' +
        'Header Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39'A' +
        'THM'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @ATHMRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transac' +
        'tionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2 ' +
        '= '#39'ATHM'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @PORead = ISNULL(sum(PayAmount1), 0) From TransactionHe' +
        'ader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39'CRE' +
        'D'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @PORead_PT2 = ISNULL(sum(PayAmount2), 0)  From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2 =' +
        ' '#39'CRED'#39') and (Register = @REGISTER);'
      #9#9
      
        #9#9'SELECT @PayPal_read = ISNULL(sum(PayAmount1), 0) From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 =' +
        ' '#39'PPAL'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @PayPal_read_PT2 = ISNULL(sum(PayAmount2), 0) From Tran' +
        'sactionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentTyp' +
        'e2 = '#39'PPAL'#39') and (Register = @REGISTER);'
      ''
      
        #9#9'SELECT @TRIPLES_Read = ISNULL(sum(PayAmount1), 0)  From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1' +
        ' = '#39'TSSS'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @TRIPLES_ReadT_PT2 = ISNULL(sum(PayAmount2), 0) From Tr' +
        'ansactionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentT' +
        'ype2 = '#39'TSSS'#39') and (Register = @REGISTER);'
      #9#9
      
        #9#9'SELECT @PayOutRead = ISNULL(sum(PayAmount1), 0) From Transacti' +
        'onHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = ' +
        #39'POUT'#39') and (Register = @REGISTER); '
      
        #9#9'SELECT @PayOutRead_PT2 = ISNULL(sum(PayAmount2), 0) From Trans' +
        'actionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType' +
        '2 = '#39'POUT'#39') and (Register = @REGISTER); '
      ''
      ''
      
        #9#9'SELECT @CashRead = ((ISNULL(sum(PayAmount1), 0)) - (ISNULL(sum' +
        '(CHANGE), 0))) From TransactionHeader Where (ID = @ID)  AND (Voi' +
        'ded = 0) AND (PaymentType1 = '#39'CASH'#39') and (Register = @REGISTER) ' +
        'and (PayAmount1 > TOTAL);'#9
      
        #9#9'SELECT @CashRead = @CashRead + (ISNULL(sum(PayAmount1), 0)) Fr' +
        'om TransactionHeader Where (ID = @ID)  AND (Voided = 0) AND (Pay' +
        'mentType1 = '#39'CASH'#39') and (Register = @REGISTER) and (PayAmount1 <' +
        '= TOTAL);'#9
      
        #9#9'SELECT @CashRead_PT2 = ((ISNULL(sum(PayAmount2), 0)) - (ISNULL' +
        '(sum(CHANGE), 0))) From TransactionHeader Where (ID = @ID)  AND ' +
        '(Voided = 0) AND (PaymentType2 = '#39'CASH'#39') and (Register = @REGIST' +
        'ER);'
      
        #9#9'SELECT @CASHBACK = ISNULL(SUM(CASHBACK), 0) From TransactionHe' +
        'ader Where (ID = @ID)  AND (Voided = 0) AND (Register = @REGISTE' +
        'R);'
      ''
      ''
      
        #9#9'SELECT @OtherRead = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39 +
        'NCHG'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @OtherRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2' +
        ' = '#39'NCHG'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @OTHERCOUNT = ISNULL(sum(PayAmount1), 0) From Transacti' +
        'onHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = ' +
        #39'NCHG'#39') and (Register = @REGISTER);  '
      
        #9#9'SELECT @OTHERCOUNT_PT2 = ISNULL(sum(PayAmount2), 0) From Trans' +
        'actionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType' +
        '2 = '#39'NCHG'#39') and (Register = @REGISTER);  '
      
        #9#9'SELECT @UtilityReadCASH = (ISNULL(sum(transactiondetail.total)' +
        ',0)) From transactiondetail inner join transactionheader on tran' +
        'sactiondetail.transactionnumber = transactionheader.transactionn' +
        'umber '
      #9#9#9#9'Where transactiondetail.upc like '#39'99999999995%'#39
      #9#9#9#9'AND (transactionheader.EmployNumber = @EMPLOYEENUMBER'
      #9#9#9#9'AND (transactionheader.Voided = 0) '
      #9#9#9#9'AND (TRANSACTIONHEADER.PAYMENTTYPE1 = '#39'CASH'#39')'
      #9#9#9#9'AND (transactionheader.ID = @ID)'
      #9#9#9#9'AND (transactionheader.Register = @REGISTER));'
      
        #9#9'SELECT @UtilityReadATH = (ISNULL(sum(transactiondetail.total),' +
        '0)) From transactiondetail inner join transactionheader on trans' +
        'actiondetail.transactionnumber = transactionheader.transactionnu' +
        'mber '
      #9#9#9#9'Where transactiondetail.upc like '#39'99999999995%'#39
      #9#9#9#9'AND (transactionheader.EmployNumber = @EMPLOYEENUMBER'
      #9#9#9#9'AND (transactionheader.Voided = 0) '
      #9#9#9#9'AND (TRANSACTIONHEADER.PAYMENTTYPE1 <> '#39'CASH'#39')'
      #9#9#9#9'AND (transactionheader.ID = @ID)'
      #9#9#9#9'AND (transactionheader.Register = @REGISTER));'
      
        #9#9'SELECT @COUPON = (ISNULL(sum(transactiondetail.total),0)) From' +
        ' transactiondetail inner join transactionheader on transactionde' +
        'tail.transactionnumber = transactionheader.transactionnumber '
      #9#9#9#9'Where transactiondetail.upc = '#39'999999999989'#39
      #9#9#9#9'AND (transactionheader.EmployNumber = @EMPLOYEENUMBER'
      #9#9#9#9'AND (transactionheader.Voided = 0) '
      #9#9#9#9'AND (transactionheader.Register = @REGISTER)'
      #9#9#9#9'AND (transactionheader.ID = @ID));'
      
        #9#9'SELECT @TAX_MUNICIPAL = ISNULL(sum(TAX), 0)  From TransactionH' +
        'eader Where (ID = @ID) AND (Voided = 0) AND (Register = @REGISTE' +
        'R);'
      
        #9#9'SELECT @TAX_ESTATAL =   ISNULL(sum(TAX_ESTATAL), 0) From Trans' +
        'actionHeader Where (ID = @ID) AND (Voided = 0) AND (Register = @' +
        'REGISTER);'
      
        #9#9'SELECT @TAX_SERVICIO =  ISNULL(sum(TAX_SERVICIO), 0) From Tran' +
        'sactionHeader Where (ID = @ID) AND (Voided = 0) AND (Register = ' +
        '@REGISTER);'
      
        #9#9'SELECT @TAX_PROC_FOOD =  ISNULL(sum(TAX_PROCESSED_FOOD), 0) Fr' +
        'om TransactionHeader Where (ID = @ID) AND (Voided = 0) AND (Regi' +
        'ster = @REGISTER);'
      #9#9
      
        #9#9'Update DAILYTOTALS set REFUNDREAD = @REFUNDREAD + @REFUNDREAD_' +
        'PT2, WICREAD = @WICREAD + @WICREAD_PT2, WICCRREAD = @WICCRREAD +' +
        ' @WICCRREAD_PT2, '
      
        #9#9'CashRead = (@CashRead + @CashRead_PT2) - (@PayOutRead + @PayOu' +
        'tRead_PT2 + @CASHBACK), CheckRead = @CheckRead + @CheckRead_PT2,'
      
        #9#9'CCardRead = @CCardRead + @CCardRead_PT2, ATHRead = @ATHRead + ' +
        '@ATHRead_PT2, ATHMRead = @ATHMRead + @ATHMRead_PT2, PORead = @PO' +
        'Read + @PORead_PT2, '
      #9#9'TRIPLESREAD = @TRIPLES_Read + @TRIPLES_ReadT_PT2,'
      
        #9#9'PayOutRead = @PayOutRead + @PayOutRead_PT2, OtherRead = @Other' +
        'Read + @OtherRead_PT2, '
      
        #9#9'OTHERCOUNT = @OTHERCOUNT + @OTHERCOUNT_PT2, UTILITYREAD = @Uti' +
        'lityReadCASH + @UtilityReadATH, UTILITY_CASH_READ = @UtilityRead' +
        'CASH, COUPONREAD = abs(@Coupon),'
      
        #9#9'PAYPALREAD = @PayPal_read + @PayOutRead_PT2, CASHBACK = @CASHB' +
        'ACK,'
      
        #9#9'TOTAL_READ =  Cast((ISNULL(@CASHREAD,0)) + (ISNULL(@CashRead_P' +
        'T2,0)) + '
      
        #9#9'              (ISNULL(@ATHREAD,0)) + (ISNULL(@ATHRead_PT2,0)) ' +
        '+ '
      #9#9#9#9#9'  (ISNULL(@ATHMREAD,0)) + (ISNULL(@ATHMRead_PT2,0)) + '
      #9#9#9#9#9'  (ISNULL(@CCARDREAD,0)) + (ISNULL(@CCardRead_PT2,0)) +'
      #9#9#9#9#9'  (ISNULL(@CHECKREAD,0)) + (ISNULL(@CheckRead_PT2,0)) +'
      #9#9#9#9#9'  (ISNULL(@TRIPLES_Read,0)) + (ISNULL(@CheckRead_PT2,0)) +'
      #9#9#9#9#9'  (ISNULL(@WICREAD,0)) + (ISNULL(@TRIPLES_ReadT_PT2,0)) + '
      #9#9#9#9#9'  (ISNULL(@PayPal_read,0)) + (ISNULL(@PayPal_read_PT2,0)) -'
      #9#9#9#9#9'  (ISNULL(@PayOutRead,0) + @CASHBACK) as decimal(18,2)),'
      #9#9#9#9#9'   '
      
        #9#9'TOTAL_COUNT = CAST(isNull(cashcount,0) + isNull(TRIPLESREAD,0)' +
        ' + isNull(ATHCOUNT,0) +  isnull(ATHMCOUNT,0) + ISNULL(PAYPALCOUN' +
        'T, 0) + isNull(CCARDCOUNT,0) + isNull(CHECKCOUNT,0) + isNull(WIC' +
        'COUNT,0)  as decimal(20,2)) -CAST(isNull(STARTBANK,0)   as decim' +
        'al(20,2)),'
      
        #9#9'DIFFERENCE_AMOUNT = CAST(ISNULL(TOTAL_COUNT,0) AS decimal(18,2' +
        ')) - CAST(ISNULL(TOTAL_READ,0) AS decimal(18,2) ),'
      
        #9#9'TAX_ESTATAL = @TAX_ESTATAL, TAX_MUNICIPAL = @TAX_MUNICIPAL, TA' +
        'X_SERVICIO = @TAX_SERVICIO, '
      #9#9'TAX_PROCESSED_FOOD = @TAX_PROC_FOOD, TIPSREAD = @TTIP  '
      #9#9'Where ID = @ID;'
      #9'commit;'
      'END;')
    Left = 1952
    Top = 376
  end
  object CALC_HEAD_TOTALS_DEL_TRIG: TFDQuery
    AfterExecute = CALC_HEAD_TOTALS_DEL_TRIGAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[CALC_HEAD_TOTALS_DEL_TRIG] ON [dbo].[TRANS' +
        'ACTIONDETAIL_TEMP]'
      'AFTER DELETE'
      'AS'
      '  SET NOCOUNT ON'
      #9'DECLARE @TAX_SERVICIO decimal(18,2);'
      #9'DECLARE @TAXABLE_QTY_Servicio decimal(18,2);'
      #9'DECLARE @INRTotal decimal(18,2);'
      #9'DECLARE @INItems Integer;'
      #9'DECLARE @INTax decimal(18,2);'
      #9'DECLARE @TAXAMOUNT decimal(18,2);'
      #9'DECLARE @TAXABLE_QTY_MUNICIPAL decimal(18,2);'
      #9'DECLARE @TAXABLE_QTY_Estatal decimal(18,2);'
      #9'DECLARE @SUBTOTAL decimal(18,2);'
      #9'DECLARE @TotalFinal decimal(18,2);'
      #9'DECLARE @Estatal decimal(18,2);'
      #9'DECLARE @Municipal decimal(18,2);'
      #9'DECLARE @TAX_FOOD_MUNICIPAL_QTY decimal(18,2);'
      #9'DECLARE @TMUNICIPAL_FOOD decimal(18,2);'
      #9'DECLARE @TESTATAL_FOOD decimal(18,2);'
      #9'DECLARE @FOOD VARCHAR(1);'
      #9'DECLARE @TOTAL_DISCOUNT decimal(18,2);'
      #9'DECLARE @INTrans Integer;'
      #9'DECLARE @TAXFROM decimal(18,2);'
      #9'DECLARE @TAXRATE_Estatal float;'
      #9'DECLARE @TAXRATE_Municipal float;'
      #9'DECLARE @TAX_PROCESSED_FOOD_RATE float;'
      #9'DECLARE @TAX_PROCESSED_FOOD float;'
      #9'DECLARE @TAXABLE_QTY_PROCESSED_FOOD decimal(18,2);'
      #9'DECLARE @OTCCARD decimal(18,2);'
      #9'DECLARE @FSA decimal(18,2);'
      'begin'
      #9'begin transaction'
      #9'select @INTrans = isnull(transactionnumber,0) from deleted;'
      
        #9'SELECT @TAXRATE_Estatal = TAX_RATE_ESTATAL, @TAXRATE_Municipal ' +
        '= TAX_RATE, @TAXFROM = TAX_RATE_FROM, '
      
        #9'@TAX_PROCESSED_FOOD_RATE = TAX_PROCESSED_FOOD FROM CREDITDEBITS' +
        'ETUP; '
      #9'/*****SERVICE TAX *********/'
      #9'select @TAXABLE_QTY_Servicio = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'AX_SERVICIO = 1;'
      #9'if @TAXABLE_QTY_Servicio <> 0'
      #9'begin'
      #9#9'select @TAX_SERVICIO = ISNULL(@TAXABLE_QTY_Servicio,0) * .04;'
      #9'end'
      #9'else'
      #9#9'select @TAX_SERVICIO = 0; '
      #9'/*****************/'
      
        #9'select @InRTotal = sum(regtotal), @InItems = sum(qty), @TOTAL_D' +
        'ISCOUNT = sum(DISCOUNT) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans AND P' +
        'RODDEPARTMENT <> '#39'CASB'#39';'
      #9'select @SUBTOTAL = sum(total) from TRANSACTIONDETAIL_TEMP where'
      #9'transactionnumber = @INTrans AND PRODDEPARTMENT <> '#39'CASB'#39';'
      #9'/****** CALCULAR TAX ESTATAL ****/'
      #9'select @TAXABLE_QTY_Estatal = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'ax_Estatal = '#39'T'#39';'
      #9'if (@TAXABLE_QTY_Estatal <> 0) and (@TAXFROM > 0)'
      #9'begin'
      
        #9#9'select @Estatal = ISNULL(@TAXABLE_QTY_Estatal,0) * @TAXRATE_Es' +
        'tatal;'
      #9'end'
      #9'else'
      #9#9'Select @Estatal = 0;'
      #9'/*******TAX MUNICIPAL*******/'
      #9'select @TAXABLE_QTY_MUNICIPAL = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'ax_Municipal = '#39'T'#39';'
      #9'if (@TAXABLE_QTY_MUNICIPAL <> 0) and (@TAXFROM > 0)'
      #9'begin'
      
        #9#9'select @MUNICIPAL = ISNULL(@TAXABLE_QTY_MUNICIPAL,0) * @TAXRAT' +
        'E_Municipal;'
      #9'end'
      #9'else'
      #9#9'select @MUNICIPAL = 0;'
      #9'/*****TAX PROCESSED FOOD****/'
      #9'select @TAXABLE_QTY_PROCESSED_FOOD = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'AX_PROCESSED_FOOD = 1;'
      #9'if (@TAXABLE_QTY_PROCESSED_FOOD > 0)'
      #9'begin'
      
        #9#9'select @TAX_PROCESSED_FOOD = ISNULL(@TAXABLE_QTY_PROCESSED_FOO' +
        'D,0) * @TAX_PROCESSED_FOOD_RATE;'
      #9'end'
      #9'else'
      #9#9'Select @TAX_PROCESSED_FOOD = 0;'
      #9'/****MUNICIPAL FOOD******/'
      #9'select @TAX_FOOD_MUNICIPAL_QTY = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'ax_Municipal = '#39'T'#39' and Food = '#39'F'#39';'
      #9'if (@TAX_FOOD_MUNICIPAL_QTY > 0)'
      #9'begin'
      
        #9#9'select @TMUNICIPAL_FOOD = ISNULL(@TAX_FOOD_MUNICIPAL_QTY,0) * ' +
        '@TAXRATE_Municipal;'
      #9'end'
      #9'else'
      #9#9'select @TMUNICIPAL_FOOD = 0;'
      ''
      #9#9'/****OTC CARD******/'
      #9'select @OTCCARD = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and O' +
        'TCCard = 1;'
      ''
      #9'/***** FSA *******/'
      #9'select @FSA = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and F' +
        'SA = 1;'
      ''
      #9'/*****************/'
      #9'--Select @SUBTOTAL = @InFTotal;'
      
        #9'Select @TotalFinal = @SUBTOTAL + @MUNICIPAL + @ESTATAL + @TAX_S' +
        'ERVICIO + @TAX_PROCESSED_FOOD;'
      #9'update transactionheader_temp'
      
        #9'set Total = @TotalFinal, RegTotal = @INRTotal, FoodTotal = @SUB' +
        'TOTAL, numberitems = ISNULL(@InItems,0),'
      
        #9'SUBTOTAL = @SUBTOTAL, TAX_PROCESSED_FOOD = @TAX_PROCESSED_FOOD,' +
        ' '
      #9'TOTAL_TAX = @MUNICIPAL + @ESTATAL + @TAX_PROCESSED_FOOD,  '
      #9'TAX_ESTATAL = @ESTATAL, TAX_SERVICIO = @TAX_SERVICIO,'
      
        #9'TAX = @MUNICIPAL, TAX_FOOD_ESTATAL = @TESTATAL_FOOD, TAX_FOOD_M' +
        'UNICIPAL ='
      
        #9'@TMUNICIPAL_FOOD, TOTAL_DISCOUNT = @TOTAL_DISCOUNT  where trans' +
        'actionnumber = @InTrans'
      
        #9'update TABS_DETAIL SET BALANCE = @TotalFinal where TRANSACTIONN' +
        'UMBER = @INTRANS;'
      #9'commit;'
      'end;')
    Left = 1968
    Top = 488
  end
  object CALC_HEAD_TOTALS_TRIG: TFDQuery
    AfterExecute = CALC_HEAD_TOTALS_TRIGAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[CALC_HEAD_TOTALS_TRIG] ON [dbo].[TRANSACTI' +
        'ONDETAIL_TEMP]'
      'AFTER INSERT, UPDATE'
      'AS'
      '  SET NOCOUNT ON'
      #9'DECLARE @TAX_SERVICIO decimal(18,2);'
      #9'DECLARE @TAXABLE_QTY_Servicio decimal(18,2);'
      #9'DECLARE @INRTotal decimal(18,2);'
      #9'DECLARE @INFTotal decimal(18,2);'
      #9'DECLARE @INItems Integer;'
      #9'DECLARE @INTax decimal(18,2);'
      #9'DECLARE @TAXAMOUNT decimal(18,2);'
      #9'DECLARE @TAXABLE_QTY_MUNICIPAL decimal(18,2);'
      #9'DECLARE @TAXABLE_QTY_Estatal decimal(18,2);'
      #9'DECLARE @SUBTOTAL decimal(18,2);'
      #9'DECLARE @TotalFinal decimal(18,2);'
      #9'DECLARE @Estatal decimal(18,2);'
      #9'DECLARE @Municipal decimal(18,2);'
      #9'DECLARE @TAX_FOOD_MUNICIPAL_QTY decimal(18,2);'
      #9'DECLARE @TMUNICIPAL_FOOD decimal(18,2);'
      #9'DECLARE @TESTATAL_FOOD decimal(18,2);'
      #9'DECLARE @FOOD VARCHAR(1);'
      #9'DECLARE @TOTAL_DISCOUNT decimal(18,2);'
      #9'DECLARE @INTrans Integer;'
      #9'DECLARE @TAXFROM decimal(18,2);'
      #9'DECLARE @TAXRATE_Estatal float; '
      #9'DECLARE @TAXRATE_Municipal float;'
      #9'DECLARE @TAX_PROCESSED_FOOD_RATE float;'
      #9'DECLARE @TAX_PROCESSED_FOOD float;'
      #9'DECLARE @TAXABLE_QTY_PROCESSED_FOOD decimal(18,2);'
      #9'DECLARE @OTCCARD decimal(18,2);'
      #9'DECLARE @FSA decimal(18,2);'
      'begin'
      #9'begin transaction'
      #9'select @INTrans = isnull(transactionnumber,0) from inserted;'
      
        #9'SELECT @TAXRATE_Estatal = TAX_RATE_ESTATAL, @TAXRATE_Municipal ' +
        '= TAX_RATE, @TAXFROM = TAX_RATE_FROM, '
      
        #9'@TAX_PROCESSED_FOOD_RATE = TAX_PROCESSED_FOOD FROM CREDITDEBITS' +
        'ETUP; '
      #9'/****************SERVICE TAX ************************/'
      #9'select @TAXABLE_QTY_Servicio = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'AX_SERVICIO = 1;'
      #9'if @TAXABLE_QTY_Servicio <> 0'
      #9'begin'
      #9#9'select @TAX_SERVICIO = ISNULL(@TAXABLE_QTY_Servicio,0) * .04;'
      #9'end'
      #9'else'
      #9#9'select @TAX_SERVICIO = 0; '
      #9'/***************************************************/'
      
        #9'select @InRTotal = sum(regtotal), @InItems = sum(qty), @TOTAL_D' +
        'ISCOUNT = sum(DISCOUNT) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans AND P' +
        'RODDEPARTMENT <> '#39'CASB'#39';'
      #9'select @InFTotal = sum(total) from TRANSACTIONDETAIL_TEMP where'
      #9'transactionnumber = @INTrans AND PRODDEPARTMENT <> '#39'CASB'#39';'
      #9'/**************** CALCULAR TAX ESTATAL ************/'
      #9'select @TAXABLE_QTY_Estatal = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'ax_Estatal = '#39'T'#39';'
      #9'if (@TAXABLE_QTY_Estatal <> 0) and (@TAXFROM > 0)'
      #9'begin'
      
        #9#9'select @Estatal = ISNULL(@TAXABLE_QTY_Estatal,0) * @TAXRATE_Es' +
        'tatal;'
      #9'end'
      #9'else'
      #9#9'Select @Estatal = 0;'
      #9'/********************TAX MUNICIPAL**********************/'
      #9'select @TAXABLE_QTY_MUNICIPAL = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'ax_Municipal = '#39'T'#39';'
      #9'if (@TAXABLE_QTY_MUNICIPAL <> 0) and (@TAXFROM > 0)'
      #9'begin'
      
        #9#9'select @MUNICIPAL = ISNULL(@TAXABLE_QTY_MUNICIPAL,0) * @TAXRAT' +
        'E_Municipal;'
      #9'end'
      #9'else'
      #9#9'select @MUNICIPAL = 0;'
      #9'/************TAX PROCESSED FOOD*********/'
      #9'select @TAXABLE_QTY_PROCESSED_FOOD = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'AX_PROCESSED_FOOD = 1;'
      #9'if (@TAXABLE_QTY_PROCESSED_FOOD <> 0)'
      #9'begin'
      
        #9#9'select @TAX_PROCESSED_FOOD = ISNULL(@TAXABLE_QTY_PROCESSED_FOO' +
        'D,0) * @TAX_PROCESSED_FOOD_RATE;'
      #9'end'
      #9'else'
      #9#9'Select @TAX_PROCESSED_FOOD = 0;'
      #9'/*************MUNICIPAL FOOD*******************/'
      #9'select @TAX_FOOD_MUNICIPAL_QTY = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and T' +
        'ax_Municipal = '#39'T'#39' and Food = '#39'F'#39';'
      #9'if (@TAX_FOOD_MUNICIPAL_QTY > 0)'
      #9'begin'
      
        #9#9'select @TMUNICIPAL_FOOD = ISNULL(@TAX_FOOD_MUNICIPAL_QTY,0) * ' +
        '@TAXRATE_Municipal;'
      #9'end'
      #9'else'
      #9#9'select @TMUNICIPAL_FOOD = 0;'
      #9'/*************OTC CARD*******************/'
      #9'select @OTCCARD = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and O' +
        'TCCard = 1;'
      ''
      #9'/************* FSA *******************/'
      #9'select @FSA = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @INTrans and F' +
        'SA = 1;  '
      ''
      #9'/***********************************************/'
      #9'Select @SUBTOTAL = @InFTotal;'
      
        #9'Select @TotalFinal = @InFTotal + @MUNICIPAL + @ESTATAL + @TAX_S' +
        'ERVICIO + @TAX_PROCESSED_FOOD;'
      ''
      #9'update transactionheader_temp'
      
        #9'set Total = @TotalFinal, RegTotal = @INRTotal, FoodTotal = @InF' +
        'Total, numberitems = ISNULL(@InItems,0),'
      
        #9'FSA = @FSA, OTCCard = @otcCard, SUBTOTAL = @SUBTOTAL, TAX_PROCE' +
        'SSED_FOOD = @TAX_PROCESSED_FOOD, '
      #9'TOTAL_TAX = @MUNICIPAL + @ESTATAL + @TAX_PROCESSED_FOOD,  '
      #9'TAX_ESTATAL = @ESTATAL, TAX_SERVICIO = @TAX_SERVICIO,'
      
        #9'TAX = @MUNICIPAL, TAX_FOOD_ESTATAL = @TESTATAL_FOOD, TAX_FOOD_M' +
        'UNICIPAL ='
      
        #9'@TMUNICIPAL_FOOD, TOTAL_DISCOUNT = @TOTAL_DISCOUNT  where trans' +
        'actionnumber = @InTrans'
      
        #9'update TABS_DETAIL SET BALANCE = @TotalFinal where TRANSACTIONN' +
        'UMBER = @INTRANS;'
      #9'commit;'
      'end;')
    Left = 1968
    Top = 560
  end
  object INSERT_NEWTAB: TFDQuery
    AfterExecute = INSERT_NEWTABAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[INSERT_NEWTAB] @SERVER INT, @TRANNO INT,' +
        ' @CUSTOMER NCHAR(45), @TELEPHONE NCHAR(13), @CREDITCARD NCHAR(20' +
        '), '
      
        ' @BALANCE FLOAT, @CUSTOMER_ID INT, @TRANS_TYPE NCHAR(1), @BUTTON' +
        '_ID INT, @LASTIDENTITY INTEGER output, @ISTABLE BIT'
      'AS'
      'DECLARE @ISINTABS BIT'
      'DECLARE @NUMBER_OF_RECORDS INT'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      
        #9'Update TRANSACTIONHEADER_TEMP set CUSTOMERID = @CUSTOMER_ID,  O' +
        'PENED = '#39'S'#39'  where TRANSACTIONNUMBER = @TRANNO;'
      
        #9'Update TRANSACTIONDETAIL_TEMP set TAB_SAVED = 1 where TRANSACTI' +
        'ONNUMBER = @TRANNO; '
      
        #9'SELECT @NUMBER_OF_RECORDS = isnull(COUNT(*),0) FROM TABS_DETAIL' +
        ' WHERE TRANSACTIONNUMBER = @TRANNO;'#9
      #9#9'INSERT INTO [dbo].[TABS_HEADER]'
      #9#9'([BUTTON_NAME]'
      #9#9',[SERVER]'
      #9#9',[GROUP_BALANCE]'
      #9#9',[BUTTON_CAPTION]'
      #9#9',[CUSTOMER_ID]'
      #9#9',[TRANS_TYPE]'
      #9#9',[GROUP_BY_NAME]'
      #9#9',[ISTABLE])'
      #9#9'VALUES'
      
        #9#9'('#39#39', @SERVER, @BALANCE, '#39#39', @CUSTOMER_ID, @TRANS_TYPE, SUBSTRI' +
        'NG(@CUSTOMER,1,20), @ISTABLE);'
      #9#9'SELECT @LASTIDENTITY = IDENT_CURRENT('#39'TABS_HEADER'#39');'
      #9#9'IF @BUTTON_ID > 0'
      #9#9'BEGIN'
      
        '          UPDATE BUTTONS_MOBILE_DETAIL SET TAB_ID = @LASTIDENTIT' +
        'Y WHERE ID = @BUTTON_ID;'
      '        END;       '
      '    '#9'INSERT INTO [dbo].[TABS_DETAIL]'
      #9#9'([TABS_ID]'
      #9#9',[CUSTOMER]'
      #9#9',[TELEPHONE]'
      #9#9',[CREDIT_CARD]'
      #9#9',[BALANCE]'
      #9#9',[TRANSACTIONNUMBER]'
      #9#9',[DATE]'
      #9#9',[GROUP_BY_ID])'
      #9'VALUES  '
      
        #9#9'(@LASTIDENTITY, @CUSTOMER, @TELEPHONE,@CREDITCARD, @BALANCE, @' +
        'TRANNO, GETDATE(), @LASTIDENTITY);'#9
      #9'commit;'
      'END;')
    Left = 1976
    Top = 696
  end
  object UPDATE_TIME_STAMP: TFDQuery
    AfterExecute = UPDATE_TIME_STAMPAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[UPDATE_TIME_STAMP] ON [dbo].[TIMECARD] AFT' +
        'ER INSERT, UPDATE'
      'AS'
      'DECLARE @ID INT'
      'DECLARE @TOTAL_Seconds_WORKED_h int'
      'DECLARE @TOTAL_Seconds_WORKED_m int'
      'DECLARE @TOTAL_Seconds_WORKED_s int'
      'DECLARE @HOURS CHAR(5)'
      'DECLARE @MINUTES CHAR(5)'
      'DECLARE @SECONDS CHAR(5)'
      'DECLARE @THOURS CHAR(16)'
      'BEGIN'
      #9'begin transaction'
      #9'SET NOCOUNT ON;'
      #9'Select @ID = ID from inserted;'
      
        #9'SELECT @TOTAL_Seconds_WORKED_h = (isNull(DATEDIFF(second, PUNCH' +
        '_IN_1, PUNCH_OUT_1),0) + isNull(DATEDIFF(second, PUNCH_IN_2, PUN' +
        'CH_OUT_2),0)) '
      #9'FROM timecard  WHERE ID = @ID;'
      #9'IF @TOTAL_Seconds_WORKED_h > 0'
      #9'begin'
      #9#9'Select @TOTAL_Seconds_WORKED_m = @TOTAL_Seconds_WORKED_h;'
      #9#9'Select @TOTAL_Seconds_WORKED_s = @TOTAL_Seconds_WORKED_h;  '
      
        #9#9'select @HOURS = convert(varchar(5),(@TOTAL_Seconds_WORKED_h / ' +
        '3600)); '
      
        #9#9'select @MINUTES = convert(varchar(5),(@TOTAL_Seconds_WORKED_m ' +
        '% 3600)) / 60 ; '
      
        #9#9'select @SECONDS = convert(varchar(5),(@TOTAL_Seconds_WORKED_s ' +
        '% 60));'
      
        #9#9'select @THOURS = RIGHT(REPLACE(STR(RTRIM(LTRIM(@HOURS))),'#39' '#39','#39 +
        '0'#39'),2) + '#39':'#39' + '
      
        #9#9#9#9#9'RIGHT(REPLACE(STR(RTRIM(LTRIM(@MINUTES))),'#39' '#39','#39'0'#39'),2) + '#39':'#39 +
        ' + '
      #9#9#9#9#9'RIGHT(REPLACE(STR(RTRIM(LTRIM(@SECONDS))),'#39' '#39','#39'0'#39'),2);'
      #9#9'Update TIMECARD set DAILY = @THOURS WHERE ID = @ID;'
      #9'end'
      #9'commit;'
      'END')
    Left = 1984
    Top = 792
  end
  object HOLD_SAVE_TRANSACTION: TFDQuery
    AfterExecute = HOLD_SAVE_TRANSACTIONAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[HOLD_SAVE_TRANSACTION] @TRANNO INT OUTPU' +
        'T, @ID INT, @OPTION CHAR(1), @DELIVER CHAR(1), '
      '@DELIVERNAME VARCHAR(30), @CUSTOMER NCHAR(30), '
      '@DELIVERYADDRESS1 NCHAR(30), @DELIVERYADDRESS2 NCHAR(30),'
      '@DELIVERY_CITY NCHAR(20), @DELIVERY_ZIPCODE NCHAR(15),'
      
        '@DELIVERY_STATE CHAR(2), @REGISTER_NO INT, @EMPLOYNUMBER CHAR(3)' +
        ','
      '@DELIVERYPHONE varchar(13), @PONUMBER VARCHAR(20)'
      'AS'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'begin tran'
      #9'IF @TRANNO = 0'
      #9'begin'
      
        #9#9'Select @TRANNO = TransactionNumber From TransactionHeader_TEMP' +
        ' Where (Opened = '#39'H'#39') And (Register = @REGISTER_NO);'
      #9'end;'
      #9'IF LTRIM(@DELIVERYADDRESS1) = '#39'N/A'#39
      #9'begin'
      
        #9#9'Update TransactionHeader_TEMP Set Opened = @OPTION, ID = @ID, ' +
        'CUSTOMER = @CUSTOMER, REGISTER = @REGISTER_NO, EMPLOYNUMBER = @E' +
        'MPLOYNUMBER Where TransactionNumber = @TRANNO;'
      #9'end'
      #9'begin'
      
        #9#9'Update TransactionHeader_TEMP Set Opened = @OPTION, ID = @ID, ' +
        'Delivered = @DELIVER, DELIVERYNAME = @CUSTOMER, CUSTOMER = @CUST' +
        'OMER, '
      
        #9#9'REGISTER = @REGISTER_NO, DELIVERYADDRESS1 = @DELIVERYADDRESS1,' +
        ' DELIVERYADDRESS2 = @DELIVERYADDRESS2,'
      
        #9#9'DELIVERY_CITY = @DELIVERY_CITY, DELIVERY_STATE = @DELIVERY_STA' +
        'TE, DELIVERYPHONE = @DELIVERYPHONE, DELIVEREDBY = @DELIVERNAME,'
      #9#9'PONUMBER = @PONUMBER, EMPLOYNUMBER = @EMPLOYNUMBER, '
      
        #9#9'DELIVERY_ZIPCODE = @DELIVERY_ZIPCODE Where TransactionNumber =' +
        ' @TRANNO;'#9#9
      #9'end;'
      
        #9'Update TransactionDetail_TEMP Set Opened = @OPTION, ID = @ID, R' +
        'EGISTER = @REGISTER_NO, TAB_SAVED = 1 Where TransactionNumber = ' +
        '@TRANNO;'
      #9'commit tran;'
      'END')
    Left = 1992
    Top = 944
  end
  object POS_DELETE_OPEN_TRANSACTIONS: TFDQuery
    AfterExecute = POS_DELETE_OPEN_TRANSACTIONSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE procedure [dbo].[POS_DELETE_OPEN_TRANSACTIONS] @REGISTER ' +
        'INT'
      'AS'
      'DECLARE @TRANSNO INT'
      'DECLARE @NORECORDS INT'
      'DECLARE @ID INT'
      'begin'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRAN'
      #9'DELETE from PICK_UP where REGISTER_ID = @REGISTER; '
      
        #9'DECLARE MyCursor CURSOR STATIC LOCAL FOR SELECT TRANSACTIONNUMB' +
        'ER, ID FROM TRANSACTIONHEADER_TEMP WHERE OPENED <> '#39'S'#39' AND REGIS' +
        'TER = @REGISTER;'
      #9'OPEN MyCursor'
      #9'FETCH NEXT FROM MyCursor'
      #9'INTO @TRANSNO, @ID'
      #9'WHILE @@FETCH_STATUS = 0'
      #9'BEGIN'
      
        #9#9'Select @NORECORDS = COUNT(*) from OPEN_TABS where TRANSACTIONN' +
        'UMBER = @TRANSNO;'
      #9#9'IF @NORECORDS = 0'
      #9#9'BEGIN'
      
        #9#9#9'delete from TRANSACTIONHEADER_TEMP where TRANSACTIONNUMBER = ' +
        '@TRANSNO;'
      
        #9#9#9'delete from TRANSACTIONDETAIL_TEMP where TRANSACTIONNUMBER = ' +
        '@TRANSNO;'
      #9#9'END'
      #9#9'ELSE'
      #9#9'BEGIN'
      
        #9#9#9'EXEC HOLD_SAVE_TRANSACTION @TRANSNO, @ID, '#39'S'#39', '#39#39', '#39#39', '#39#39',  '#39 +
        #39', '#39#39', '#39#39', '#39#39','#39#39',@REGISTER,'#39#39','#39#39','#39#39'; '
      #9#9'END;'
      #9#9'FETCH NEXT FROM MyCursor'
      #9#9'INTO @TRANSNO, @ID'
      #9'END;'
      #9'CLOSE MyCursor'
      #9'DEALLOCATE MyCursor'
      #9'COMMIT'
      'END;')
    Left = 2000
    Top = 1032
  end
  object TIMECARD_TOTALHOURSWORKED: TFDQuery
    AfterExecute = TIMECARD_TOTALHOURSWORKEDAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[TIMECARD_TOTALHOURSWORKED] @FROM DATETIM' +
        'E, @TO DATETIME, @EMPLOEE INT, @THW CHAR(16) OUTPUT'
      'AS'
      ''
      'DECLARE @TOTAL_Seconds_WORKED_h int'
      'DECLARE @TOTAL_Seconds_WORKED_m int'
      'DECLARE @TOTAL_Seconds_WORKED_s int'
      'DECLARE @HOURS CHAR(5)'
      'DECLARE @MINUTES CHAR(5)'
      'DECLARE @SECONDS CHAR(5)'
      'DECLARE @THOURS CHAR(16)'
      'DECLARE @ID INT'
      'BEGIN'
      #9'begin transaction'
      #9'SET NOCOUNT ON;'
      #9'Select @TOTAL_Seconds_WORKED_h = 0;'
      
        #9'DECLARE MyCursor CURSOR STATIC LOCAL FOR SELECT ID FROM TIMECAR' +
        'D WHERE PUNCH_IN_1 between @FROM and @TO and EMPLOYEE = @EMPLOEE' +
        ';'
      #9'OPEN MyCursor'
      #9'FETCH NEXT FROM MyCursor'
      #9'INTO @ID'
      #9'WHILE @@FETCH_STATUS = 0'
      #9'BEGIN'
      
        #9'  SELECT @TOTAL_Seconds_WORKED_h = @TOTAL_Seconds_WORKED_h + ((' +
        'isNull(DATEDIFF(second, PUNCH_IN_1, PUNCH_OUT_1),0) + isNull(DAT' +
        'EDIFF(second, PUNCH_IN_2, PUNCH_OUT_2),0))) FROM timecard  WHERE' +
        ' ID = @ID;'
      #9'  FETCH NEXT FROM MyCursor'
      #9'  INTO @ID'
      #9'END;'
      '        CLOSE MyCursor'
      '        DEALLOCATE MyCursor'
      #9'IF @TOTAL_Seconds_WORKED_h > 0'
      #9'begin'
      #9#9'Select @TOTAL_Seconds_WORKED_m = @TOTAL_Seconds_WORKED_h;'
      #9#9'Select @TOTAL_Seconds_WORKED_s = @TOTAL_Seconds_WORKED_h;  '
      
        #9#9'select @HOURS = convert(varchar(5),(@TOTAL_Seconds_WORKED_h / ' +
        '3600)); '
      
        #9#9'select @MINUTES = convert(varchar(5),(@TOTAL_Seconds_WORKED_m ' +
        '% 3600)) / 60 ; '
      
        #9#9'select @SECONDS = convert(varchar(5),(@TOTAL_Seconds_WORKED_s ' +
        '% 60));'
      
        #9#9'select @THW = RIGHT(REPLACE(STR(RTRIM(LTRIM(@HOURS))),'#39' '#39','#39'0'#39')' +
        ',2) + '#39':'#39' + '
      
        #9#9#9#9#9'RIGHT(REPLACE(STR(RTRIM(LTRIM(@MINUTES))),'#39' '#39','#39'0'#39'),2) + '#39':'#39 +
        ' + '
      #9#9#9#9#9'RIGHT(REPLACE(STR(RTRIM(LTRIM(@SECONDS))),'#39' '#39','#39'0'#39'),2);'
      #9'end'
      #9'else'
      #9'begin'
      #9'  Select @THW = @TOTAL_Seconds_WORKED_h;'
      #9'end;'
      #9'commit;'
      'END')
    Left = 1984
    Top = 728
  end
  object UPDATE_TRANSACTION_HEADER: TFDQuery
    AfterExecute = UPDATE_TRANSACTION_HEADERAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[UPDATE_TRANSACTION_HEADER] @TRANSNO INT,' +
        ' @AMOUNT_TENDERED DECIMAL(18,2), '
      
        #9#9#9#9#9'@PAYMENTTYPE CHAR(4), @CHANGE DECIMAL(18,2), @CUSTOMERID IN' +
        'T, @TRANS_TYPE nchar(10),'
      
        #9#9#9#9#9'@TIP DECIMAL(18,2), @PAYAMOUNT_TYPE CHAR(10) OUTPUT, @ISVAL' +
        'ID BIT OUTPUT'
      #9'AS'
      #9'DECLARE @TOTAL DECIMAL(18,2) '
      #9'DECLARE @AMOUNT1 DECIMAL(18,2)'
      #9'DECLARE @AMOUNT2 DECIMAL(18,2)'
      #9'DECLARE @AMOUNT3 DECIMAL(18,2)'
      #9'DECLARE @AMOUNT4 DECIMAL(18,2)'
      #9'DECLARE @CASHBACK DECIMAL(18,2)'
      #9'DECLARE @CHANGE_MUSTBE_ZERO BIT'
      #9'DECLARE @CALC_CHANGE DECIMAL(18,2)'
      ''
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION;'
      #9#9
      
        #9#9'SELECT @AMOUNT1 = ISNULL(PAYAMOUNT1,0), @AMOUNT2 = ISNULL(PAYA' +
        'MOUNT2,0),'
      
        #9#9'@AMOUNT3 = ISNULL(PAYAMOUNT3,0), @AMOUNT4 = ISNULL(PAYAMOUNT4,' +
        '0),  '
      
        #9#9'@TOTAL = ISNULL(TOTAL,0) FROM TRANSACTIONHEADER_TEMP WHERE TRA' +
        'NSACTIONNUMBER = @TRANSNO;  '
      #9#9'--IF @AMOUNT1 > 0 '
      #9#9'--BEGIN'
      #9#9'--  SET @AMOUNT_TENDERED = @TOTAL - @AMOUNT1;'
      #9#9'--END;'
      #9#9'SET @ISVALID = 1;'
      #9#9'if @AMOUNT1 = 0'
      #9#9'begin '
      
        #9#9#9'if ((@AMOUNT1 + @AMOUNT_TENDERED + @TIP) - (@TOTAL) between 0' +
        '.001 and 0.009)'
      #9#9#9'begin '
      #9#9#9#9'SET @CALC_CHANGE = 0;'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'begin'
      #9#9#9#9'SET @CALC_CHANGE = ((@AMOUNT_TENDERED - @TOTAL) + @TIP);'
      #9#9#9'end;'
      
        #9#9#9'Update TransactionHeader_TEMP Set PayAmount1 = @AMOUNT_TENDER' +
        'ED , PaymentType1 = @PAYMENTTYPE, Opened = '#39'F'#39', '
      
        #9#9#9#9#9'CustomerID = @CUSTOMERID, TIP = @TIP, TOTAL_TIP = @TIP + IS' +
        'NULL(TIP2,0), AMOUNT_TENDERED1 = @AMOUNT_TENDERED,  '
      
        #9#9#9#9#9'TRANS_TYPE = @TRANS_TYPE Where TransactionNumber = @TRANSNO' +
        ';'
      #9#9#9#9#9'SET @PAYAMOUNT_TYPE = '#39'PayAmount1'#39';'
      #9#9#9#9#9'SET @ISVALID = 1;'
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      #9#9#9'if @AMOUNT2 = 0 '
      #9#9#9'begin'#9
      #9#9#9'    if (@AMOUNT1 + @AMOUNT_TENDERED + @TIP) - (@TOTAL) < 0.01'
      #9#9#9#9'begin '
      #9#9#9#9#9'SET @CALC_CHANGE = 0;'
      #9#9#9#9'end'
      #9#9#9#9'else'
      #9#9#9#9'begin'
      
        #9#9#9#9#9'SET @CALC_CHANGE = (@AMOUNT1 + @AMOUNT_TENDERED) - (@TOTAL ' +
        '+ @TIP);'
      #9#9#9#9'end;'
      #9#9#9#9'IF (@AMOUNT1 + @AMOUNT_TENDERED) >= (@TOTAL)'
      #9#9#9#9'begin'
      
        #9#9#9#9'  Update TransactionHeader_TEMP Set PAYAMOUNT2 = @AMOUNT_TEN' +
        'DERED, PaymentType2 = @PAYMENTTYPE, Opened = '#39'F'#39', AMOUNT_TENDERE' +
        'D2 = @AMOUNT_TENDERED,'
      
        #9#9#9#9#9#9#9'CustomerID = @CUSTOMERID, TIP2 = @TIP, TOTAL_TIP = @TIP +' +
        ' ISNULL(TIP,0),'
      
        #9#9#9#9#9#9#9'TRANS_TYPE = @TRANS_TYPE Where TransactionNumber = @TRANS' +
        'NO;'#9
      #9#9#9#9#9#9#9'SET @PAYAMOUNT_TYPE = '#39'PayAmount2'#39';'
      #9#9#9#9'end'
      #9#9#9#9'else'
      #9#9#9#9'begin'
      #9#9#9#9'  SET @ISVALID = 0;'
      #9#9#9#9'end;'
      #9#9#9'end;'
      #9#9'end;'
      #9#9'IF @ISVALID = 1'
      #9#9'begin'
      #9#9#9'if (@PAYMENTTYPE = '#39'POUT'#39' or @PAYMENTTYPE = '#39'PICK'#39')'
      #9#9#9'begin'
      
        #9#9#9#9'Update TRANSACTIONHEADER_TEMP set CHANGE = 0, OPENED = '#39'F'#39', ' +
        'CUSTOMERID = 0, TOTAL = (TOTAL * -1),'
      #9#9#9#9#9'FOODTOTAL = 0  where TRANSACTIONNUMBER = @TRANSNO;'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'begin'
      
        #9#9#9#9'if (@PAYMENTTYPE = '#39'ATH'#39') OR (@PAYMENTTYPE = '#39'CHK'#39') OR (@PAY' +
        'MENTTYPE = '#39'VISA'#39') '
      #9#9#9#9'or (@PAYMENTTYPE = '#39'ATHM'#39') OR (@PAYMENTTYPE = '#39'PPAL'#39')'
      #9#9#9#9'begin'
      #9#9#9#9#9
      #9#9#9#9#9'Update TRANSACTIONHEADER_TEMP set CHANGE = @CALC_CHANGE,'
      #9#9#9#9#9'CASHBACK = (PAYAMOUNT1 + PAYAMOUNT2) - (TOTAL + TOTAL_TIP)'
      #9#9#9#9#9'Where TransactionNumber = @TRANSNO;'
      #9#9#9#9'end'
      #9#9#9#9'else'
      #9#9#9#9'begin'
      #9#9#9#9#9'Update TRANSACTIONHEADER_TEMP set CHANGE = @CALC_CHANGE,'
      #9#9#9#9#9'CASHBACK = 0'
      #9#9#9#9#9'Where TransactionNumber = @TRANSNO;'
      #9#9#9#9'end;'
      #9#9#9'end;'#9
      #9#9'end;'#9
      #9'COMMIT TRANSACTION;'
      'END;')
    Left = 2000
    Top = 1112
  end
  object PRICE_UPDATE: TFDQuery
    AfterExecute = PRICE_UPDATEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[PRICE_UPDATE] @AWP FLOAT, @MAC_PRICE FLO' +
        'AT, @PRODUCT_ID INT, @SIMPLE_PRICE_UPDATE BIT, @ALCHEMY_PRODUCTI' +
        'D INT,'
      
        '@CASA_FARMACEUTICA VARCHAR(150), @PAKAGE_ID INT, @MARKET_STATUS ' +
        'NCHAR(10), @VERSION_DESCRIPTION NCHAR(150), @OUTERPACKAGEUNIT NC' +
        'HAR(10),'
      
        '@MARKETEDPRODUCTID INT, @CONTROLADO NCHAR(4), @PAKAGE_DESCRIPTIO' +
        'N NCHAR(150), @METRIC_SIZE real, @ROUTEOFADMINISTRATION char(16)' +
        ','
      
        '@unit_of_Measure char(2), @Drug_name char(35), @STRENGTH CHAR(25' +
        '), @BRAND CHAR(1), @DRUG_TYPE char(3), @DOSE_FORM nchar(50),'
      '@WAC_PRICE FLOAT'
      'AS'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      #9'  if @SIMPLE_PRICE_UPDATE = 1 '
      #9'  begin'
      
        #9'    Update InventarioPiso set RBP = @AWP, MAC_PRICE = @MAC_PRIC' +
        'E, WAC_PRICE = @WAC_PRICE where PRODUCTNO = @PRODUCT_ID;'
      #9'  end'
      #9'  else'
      #9'  begin'
      
        #9'    Update InventarioPiso set ALCHEMY_PRODUCTID = @ALCHEMY_PROD' +
        'UCTID, CASA_FARMACEUTICA = @CASA_FARMACEUTICA,'
      
        #9#9'RBP = @AWP, MAC_PRICE = @MAC_PRICE, PAKAGE_ID = @PAKAGE_ID, MA' +
        'RKET_STATUS = @MARKET_STATUS, '
      
        #9#9'VERSION_DESCRIPTION = @VERSION_DESCRIPTION, OUTERPACKAGEUNIT =' +
        ' @OUTERPACKAGEUNIT, '
      
        #9#9'MARKETEDPRODUCTID = @MARKETEDPRODUCTID, CONTROLADO = @CONTROLA' +
        'DO, PAKAGE_DESCRIPTION = @PAKAGE_DESCRIPTION,'
      #9#9'METRICSIZE = @METRIC_SIZE, BRAND = @BRAND, TIPO = @DRUG_TYPE,'
      
        #9#9'ROUTEOFADMINISTRATION = @ROUTEOFADMINISTRATION, Unit_of_Measur' +
        'e = @Unit_of_Measure,'
      #9#9'DOSE_FORM = @DOSE_FORM,'
      
        #9#9'DESCRIPCION = @Drug_name, STRENGTH = @STRENGTH, WAC_PRICE = @W' +
        'AC_PRICE'
      #9#9'where PRODUCTNO = @PRODUCT_ID;'
      #9'  end;'
      #9'COMMIT;'
      'END;')
    Left = 2112
    Top = 80
  end
  object POS_INSERT_EDIT_INVENTORY: TFDQuery
    AfterExecute = POS_INSERT_EDIT_INVENTORYAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POS_INSERT_EDIT_INVENTORY] @ADD_EDIT INT' +
        ',  @PROCUCT_ID INT, @DESCRIPCION CHAR(35),'
      
        '   @COSTO REAL, @PRECIO REAL, @PRECIOVENTA2 FLOAT, @PRECIOVENTA3' +
        ' FLOAT, @RBP REAL, @GROUP_QTY INT, @PRECIO_CAJA REAL, @QTY_CAJA ' +
        'REAL,'
      
        '   @ESPECIAL REAL, @COMESPECIAL DATETIME, @TERMINAESPECIAL DATET' +
        'IME, @SALES_PROMO_DEFINE INT, @KITCHEN BIT, @HAS_MODIFIER BIT,'
      
        '   @MODIFIER_QTY INT, @DESCDEPT SMALLINT, @SUBDEPT SMALLINT, @Su' +
        'plidor INT, @CMININVENTARIO REAL, @CMAXINVENTARIO REAL, @QTYINVE' +
        'NTARIO DECIMAL(18,2),'
      
        '   @EDITAR_PRECIO BIT, @PO VARCHAR(10), @CODIGOBARRA CHAR(14), @' +
        'BARCODE2 NCHAR(14), @INFOADICIONAL char(25), @SHOWINDIVIDUAL VAR' +
        'CHAR(1), @PATROCINIO INT,'
      
        '   @TAXABLE_ESTATAL CHAR(1), @TAXABLE CHAR(1), @FOODITEM SMALLIN' +
        'T, @NONEBC SMALLINT, @RECIPE BIT, @PID INT OUTPUT, @RECIPEPRICE ' +
        'FLOAT,'
      
        '   @DAILY_SALE_START_TIME TIME, @DAILY_SALE_END_TIME TIME, @DAIL' +
        'Y_SALE_ACTIVE BIT, @DAILY_SPECIAL_PRICE DECIMAL(18,2), @PROCESSE' +
        'D_FOOD BIT, @SHOW_ON_ECOMM BIT, '
      
        '   @TRIPLES_PRODUCT BIT, @ULTIMOCAMBIO char(30), @CUSTOMER_ID_RE' +
        'QUIRED bit, @NOTE text, @PRODUCT_CLASSIFICATION NCHAR(20), @GM1 ' +
        'DECIMAL(18,2), @GM2 DECIMAL(18,2), @GM3 DECIMAL(18,2), '
      
        '   @ALWDISC BIT, @ROUND BIT, @DEPL VARCHAR(4), @DEPS VARCHAR(4),' +
        ' @NLINE BIT, @EBT BIT, @SIGIS BIT, @OTCCARD BIT, @PSEUDO BIT, @P' +
        'SEUDOMGD INT, @PSEUDOMGP INT,'
      
        '   @NONREFUND BIT, @PEP_SPRAY BIT, @MAXPERTX INT, @SKIPPRICEUPD ' +
        'BIT, @DTSKIPPRICEUPD DATETIME, @SKIPPRICEUPDINIT VARCHAR(10), @L' +
        'INE_LOC VARCHAR(10), @SHELF_LOC VARCHAR(10),'
      
        '   @STOCK_LOC VARCHAR(10), @SIZE_IT VARCHAR(20), @AskID INT,@NUM' +
        'EROSUPLIDOR2 int, @SUPPLIER_PRICE_DEFINE int, @SUPPLIER_PRICE de' +
        'cimal(18,2), @SUPPLIER_PRICE2 decimal(18,2),'
      
        '   @SUPP_ITEMID char(20), @SUPP_ITEMID2 char(20), @GROUP_PRODUCT' +
        'NO INT, @MAIN_NDC bit, @LST_MODIF_PR DATETIME'
      'AS'
      'BEGIN'
      #9'begin transaction;'
      #9'SET NOCOUNT ON; '
      #9'IF @PROCUCT_ID > 0'
      #9'begin'
      
        #9#9'UPDATE INVENTARIOPISO SET DESCRIPCION = @DESCRIPCION, COSTO = ' +
        '@COSTO, PRECIO = @PRECIO, PRECIOVENTA2 = @PRECIOVENTA2, RBP = @R' +
        'BP, GROUP_QTY = @GROUP_QTY, PRECIO_CAJA = @PRECIO_CAJA,'
      
        #9#9#9'QTY_CAJA = @QTY_CAJA, ESPECIAL = @ESPECIAL, COMESPECIAL = @CO' +
        'MESPECIAL, TERMINAESPECIAL = @TERMINAESPECIAL, SALES_PROMOTION_I' +
        'D = @SALES_PROMO_DEFINE, KITCHEN = @KITCHEN,'
      
        #9#9#9'HAS_MODIFIER = @HAS_MODIFIER, MODIFIER_QTY = @MODIFIER_QTY, D' +
        'EPARTAMENTO = @DESCDEPT, SUB_DEPARTAMENTO = @SUBDEPT, NUMEROSUPL' +
        'IDOR = @Suplidor, CMININVENTARIO = @CMININVENTARIO,'
      
        #9#9#9'CMAXINVENTARIO = @CMAXINVENTARIO, QTYINVENTARIO = @QTYINVENTA' +
        'RIO, EDITAR_PRECIO = @EDITAR_PRECIO, PO = @PO, CODIGOBARRA = @CO' +
        'DIGOBARRA, BARCODE2 = @BARCODE2, INFOADICIONAL = @INFOADICIONAL,'
      
        #9#9#9'SHOWINDIVIDUAL = @SHOWINDIVIDUAL, PATROCINIO = @PATROCINIO, T' +
        'AXABLE_ESTATAL = @TAXABLE_ESTATAL, TAXABLE = @TAXABLE, FOODITEM ' +
        '= @FOODITEM, NONEBC = @NONEBC, RECIPE = @RECIPE,'
      
        #9#9#9'RECIPE_PRICE = @RECIPEPRICE, DAILY_SALE_START_TIME = @DAILY_S' +
        'ALE_START_TIME, DAILY_SALE_END_TIME = @DAILY_SALE_END_TIME, DAIL' +
        'Y_SALE_ACTIVE = @DAILY_SALE_ACTIVE,'
      
        #9#9#9'DAILY_SPECIAL_PRICE = @DAILY_SPECIAL_PRICE, PRECIOVENTA3 = @P' +
        'RECIOVENTA3, PROCESSED_FOOD = @PROCESSED_FOOD, TRIPLES_PRODUCT =' +
        ' @TRIPLES_PRODUCT, '
      
        #9#9#9'ULTIMOCAMBIO = @ULTIMOCAMBIO, SHOW_ON_ECOMM = @SHOW_ON_ECOMM,' +
        ' CUSTOMER_ID_REQUIRED = @CUSTOMER_ID_REQUIRED, NOTE = @NOTE, PRO' +
        'DUCT_CLASSIFICATION = @PRODUCT_CLASSIFICATION, '
      
        #9#9#9'Gm1 = @Gm1, Gm2 = @GM2, Gm3 = @GM3, ALWDISC = @ALWDISC, ROUND' +
        ' = @ROUND, DepL = @DEPL, DepS = @DEPS, NLINE = @NLINE, EBT = @EB' +
        'T, SIGIS = @SIGIS, OTCCard = @OTCCARD, '
      
        #9#9#9'Pseudo = @PSEUDO, pseudoMgD = @PSEUDOMGD, pseudoMgP = @PSEUDO' +
        'MGP, NonRefund = @NONREFUND, PepSpray = @PEP_SPRAY, MAxPerTx = @' +
        'MAXPERTX, SkipPriceUpd = @SKIPPRICEUPD,'
      
        #9#9#9'DtSkipPriceUpd = @DTSKIPPRICEUPD, SkipPriceUpdInit = @SKIPPRI' +
        'CEUPDINIT, line_loc = @LINE_LOC, shelf_loc = @SHELF_LOC, stock_l' +
        'oc = @STOCK_LOC, SIZE_IT = @SIZE_IT,'
      
        #9#9#9'AskID = @AskID, NUMEROSUPLIDOR2 = @NUMEROSUPLIDOR2, SUPPLIER_' +
        'PRICE_DEFINE = @SUPPLIER_PRICE_DEFINE, SUPPLIER_PRICE = @SUPPLIE' +
        'R_PRICE, SUPPLIER_PRICE2 = @SUPPLIER_PRICE2,'
      
        #9#9#9'SUPP_ITEMID = @SUPP_ITEMID, SUPP_ITEMID2 = @SUPP_ITEMID2, GRO' +
        'UP_PRODUCTNO = @GROUP_PRODUCTNO, MAIN_NDC = @MAIN_NDC,  LST_MODI' +
        'F_PR = @LST_MODIF_PR'
      #9#9#9'WHERE PRODUCTNO = @PROCUCT_ID;'
      #9#9'SELECT @PID = @PROCUCT_ID; '
      #9'end'
      #9'else'
      #9'begin'
      
        #9#9'INSERT INTO INVENTARIOPISO (RECETARIO, DESCRIPCION, COSTO, PRE' +
        'CIO, PRECIOVENTA2, RBP, GROUP_QTY, PRECIO_CAJA, QTY_CAJA, ESPECI' +
        'AL, COMESPECIAL, TERMINAESPECIAL, SALES_PROMOTION_ID, KITCHEN, '
      
        #9#9'CMAXINVENTARIO, QTYINVENTARIO, EDITAR_PRECIO, PO, CODIGOBARRA,' +
        ' BARCODE2, INFOADICIONAL, SHOWINDIVIDUAL, PATROCINIO, TAXABLE_ES' +
        'TATAL, TAXABLE, FOODITEM, NONEBC, RECIPE, RECIPE_PRICE,'
      
        #9#9'DAILY_SALE_START_TIME, DAILY_SALE_END_TIME, DAILY_SALE_ACTIVE,' +
        ' DAILY_SPECIAL_PRICE, PRECIOVENTA3, DEPARTAMENTO, SUB_DEPARTAMEN' +
        'TO,PROCESSED_FOOD, TRIPLES_PRODUCT, ULTIMOCAMBIO, SHOW_ON_ECOMM,'
      
        #9#9'CUSTOMER_ID_REQUIRED, NOTE, PRODUCT_CLASSIFICATION, CMININVENT' +
        'ARIO, Gm1, Gm2, Gm3, ALWDISC, ROUND, DepL, DepS, NLINE, EBT, Sig' +
        'Is, OTCCard, Pseudo, pseudoMgD, pseudoMgP, NonRefund, '
      
        #9#9'PepSpray, MAxPerTx, SkipPriceUpd, DtSkipPriceUpd, SkipPriceUpd' +
        'Init, line_loc, shelf_loc, stock_loc, SIZE_IT, AskID, NUMEROSUPL' +
        'IDOR2, SUPPLIER_PRICE_DEFINE, SUPPLIER_PRICE, SUPPLIER_PRICE2,'
      
        #9#9'SUPP_ITEMID, SUPP_ITEMID2, GROUP_PRODUCTNO, MAIN_NDC, LST_MODI' +
        'F_PR)'
      
        #9#9'VALUES('#39'P'#39',@DESCRIPCION, @COSTO, @PRECIO, @PRECIOVENTA2, @RBP,' +
        ' @GROUP_QTY, @PRECIO_CAJA, @QTY_CAJA, @ESPECIAL, @COMESPECIAL, @' +
        'TERMINAESPECIAL, @SALES_PROMO_DEFINE, @KITCHEN, '
      
        #9#9'@CMAXINVENTARIO, @QTYINVENTARIO, @EDITAR_PRECIO, @PO, @CODIGOB' +
        'ARRA, @BARCODE2, @INFOADICIONAL, @SHOWINDIVIDUAL, @PATROCINIO, @' +
        'TAXABLE_ESTATAL, @TAXABLE, @FOODITEM, @NONEBC, @RECIPE, @RECIPEP' +
        'RICE,'
      
        #9#9'@DAILY_SALE_START_TIME, @DAILY_SALE_END_TIME, @DAILY_SALE_ACTI' +
        'VE, @DAILY_SPECIAL_PRICE, @PRECIOVENTA3, @DESCDEPT, @SUBDEPT, @P' +
        'ROCESSED_FOOD, '
      
        #9#9'@TRIPLES_PRODUCT, @ULTIMOCAMBIO, @SHOW_ON_ECOMM, @CUSTOMER_ID_' +
        'REQUIRED, @NOTE, @PRODUCT_CLASSIFICATION,@CMININVENTARIO, @Gm1, ' +
        '@GM2, @GM3, @ALWDISC, @ROUND, @DEPL, @DEPS, @NLINE, '
      
        #9#9'@EBT, @SIGIS, @OTCCARD, @PSEUDO, @PSEUDOMGD, @PSEUDOMGP, @NONR' +
        'EFUND, @PEP_SPRAY, @MAXPERTX, @SKIPPRICEUPD, @DTSKIPPRICEUPD, @S' +
        'KIPPRICEUPDINIT, @LINE_LOC, @SHELF_LOC, @STOCK_LOC,'
      
        #9#9'@SIZE_IT, @AskID, @NUMEROSUPLIDOR2, @SUPPLIER_PRICE_DEFINE, @S' +
        'UPPLIER_PRICE, @SUPPLIER_PRICE2,@SUPP_ITEMID, @SUPP_ITEMID2, @GR' +
        'OUP_PRODUCTNO, @MAIN_NDC, @LST_MODIF_PR)'
      #9#9'set @PID = SCOPE_IDENTITY();'
      #9'end'
      
        #9'update RECIPE set COST = (@COSTO * QTY) where PRODUCT_ID = @PRO' +
        'CUCT_ID;'
      #9'IF @MAIN_NDC = 1'
      #9'BEGIN'
      
        #9#9'UPDATE INVENTARIOPISO SET MAIN_NDC = 0, GROUP_QTY = 0 WHERE GR' +
        'OUP_PRODUCTNO = @GROUP_PRODUCTNO AND PRODUCTNO <> @PROCUCT_ID'
      
        #9#9'update INVENTARIOPISO set GROUP_QTY = 1 where PRODUCTNO = @PRO' +
        'CUCT_ID;'
      #9'END'
      #9'/*UPDATE I'
      '    SET I.GROUP_QTY = G.Cnt'
      '    FROM INVENTARIOPISO AS I'
      '    INNER JOIN ('
      '        SELECT GROUP_PRODUCTNO,'
      '               COUNT(*) AS Cnt'
      '        FROM INVENTARIOPISO'
      '        WHERE GROUP_PRODUCTNO = @GROUP_PRODUCTNO'
      '        GROUP BY GROUP_PRODUCTNO'
      '    ) AS G'
      '        ON I.GROUP_PRODUCTNO = G.GROUP_PRODUCTNO;  */'
      #9'commit;'
      'END;')
    Left = 2128
    Top = 176
  end
  object CAL_BALANCE_TEMP: TFDQuery
    AfterExecute = CAL_BALANCE_TEMPAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[CALC_BALANCE] ON [dbo].[CLIENTTRANSACTIONS' +
        ']'
      'FOR INSERT, UPDATE, DELETE'
      'AS'
      '  DECLARE @CREDS Float'
      '  DECLARE @DEBS Float'
      '  DECLARE @CREDSLW Float'
      '  DECLARE @DEBSLW Float'
      '  DECLARE @CREDPAT FLOAT'
      '  DECLARE @DEBPAT FLOAT'
      '  Declare @NoCliente Int'
      '  Declare @BALANCE float'
      '  DECLARE @ID INT'
      'begin'
      '  BEGIN TRANSACTION'
      #9'select @NoCliente = clientno, @ID = ID From Inserted;'
      
        #9'select @DEBS = ISNULL(sum(amount),0) from clienttransactions wh' +
        'ere clientno = @NoCliente and code = '#39'DB'#39
      
        #9'select @CREDS = IsNull(sum(amount),0) from clienttransactions w' +
        'here clientno = @NoCliente and code = '#39'CR'#39
      ''
      
        #9'select @DEBSLW = IsNull(sum(amount),0) from clienttransactions ' +
        'where clientno = @NoCliente and code = '#39'LD'#39
      
        #9'select @CREDSLW = IsNull(sum(amount),0) from clienttransactions' +
        ' where clientno = @NoCliente and code = '#39'LC'#39
      ''
      
        #9'select @DEBPAT = IsNull(sum(amount),0) from clienttransactions ' +
        'where clientno = @NoCliente and code = '#39'PD'#39
      
        #9'select @CREDPAT = IsNull(sum(amount),0) from clienttransactions' +
        ' where clientno = @NoCliente and code = '#39'PC'#39
      ''
      
        #9'Update Pacientes set Deuda = @DEBS - @CREDS, LAWAY= @DEBSLW - @' +
        'CREDSLW, PATROCINIO = @CREDPAT - @DEBPAT  where NumeroCliente = ' +
        '@NoCliente;'
      
        #9'UPDATE CLIENTTRANSACTIONS SET BALANCE = @BALANCE WHERE ID = @ID' +
        ';'
      '  COMMIT'
      'end;')
    Left = 2144
    Top = 280
  end
  object CALC_BALANCE_DELETE: TFDQuery
    AfterExecute = CALC_BALANCE_DELETEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[CALC_BALANCE_DELETE] ON [dbo].[CLIENTTRANS' +
        'ACTIONS]'
      'FOR DELETE'
      'AS'
      '  DECLARE @CREDS Float'
      '  DECLARE @DEBS Float'
      '  DECLARE @CREDSLW Float'
      '  DECLARE @DEBSLW Float'
      '  DECLARE @CREDPAT FLOAT'
      '  DECLARE @DEBPAT FLOAT'
      '  Declare @NoCliente Int'
      '  Declare @BALANCE float'
      '  DECLARE @ID INT'
      'begin'
      '  BEGIN TRANSACTION'
      #9'select @NoCliente = clientno, @ID = ID From Deleted;'
      
        #9'select @DEBS = ISNULL(sum(amount),0) from clienttransactions wh' +
        'ere clientno = @NoCliente and code = '#39'DB'#39
      
        #9'select @CREDS = IsNull(sum(amount),0) from clienttransactions w' +
        'here clientno = @NoCliente and code = '#39'CR'#39
      ''
      
        #9'select @DEBSLW = IsNull(sum(amount),0) from clienttransactions ' +
        'where clientno = @NoCliente and code = '#39'LD'#39
      
        #9'select @CREDSLW = IsNull(sum(amount),0) from clienttransactions' +
        ' where clientno = @NoCliente and code = '#39'LC'#39
      ''
      
        #9'select @DEBPAT = IsNull(sum(amount),0) from clienttransactions ' +
        'where clientno = @NoCliente and code = '#39'PD'#39
      
        #9'select @CREDPAT = IsNull(sum(amount),0) from clienttransactions' +
        ' where clientno = @NoCliente and code = '#39'PC'#39
      ''
      
        #9'Update Pacientes set Deuda = @DEBS - @CREDS, LAWAY= @DEBSLW - @' +
        'CREDSLW, PATROCINIO = @CREDPAT - @DEBPAT  where NumeroCliente = ' +
        '@NoCliente;'
      #9'SELECT @BALANCE = (@DEBS - @CREDS);'
      
        #9'UPDATE CLIENTTRANSACTIONS SET BALANCE = @BALANCE WHERE ID = @ID' +
        ';'
      '  COMMIT'
      'end;')
    Left = 2136
    Top = 408
  end
  object CALC_BALANCE: TFDQuery
    AfterExecute = CALC_BALANCEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[CALC_BALANCE] ON [dbo].[CLIENTTRANSACTIONS' +
        ']'
      'FOR INSERT, UPDATE, DELETE'
      'AS'
      '  DECLARE @CREDS Float'
      '  DECLARE @DEBS Float'
      '  DECLARE @CREDSLW Float'
      '  DECLARE @DEBSLW Float'
      '  DECLARE @CREDPAT FLOAT'
      '  DECLARE @DEBPAT FLOAT'
      '  Declare @NoCliente Int'
      '  Declare @BALANCE float'
      '  DECLARE @ID INT'
      'begin'
      '  BEGIN TRANSACTION'
      #9'select @NoCliente = clientno, @ID = ID From Inserted;'
      
        #9'select @DEBS = ISNULL(sum(amount),0) from clienttransactions wh' +
        'ere clientno = @NoCliente and code = '#39'DB'#39
      
        #9'select @CREDS = IsNull(sum(amount),0) from clienttransactions w' +
        'here clientno = @NoCliente and code = '#39'CR'#39
      ''
      
        #9'select @DEBSLW = IsNull(sum(amount),0) from clienttransactions ' +
        'where clientno = @NoCliente and code = '#39'LD'#39
      
        #9'select @CREDSLW = IsNull(sum(amount),0) from clienttransactions' +
        ' where clientno = @NoCliente and code = '#39'LC'#39
      ''
      
        #9'select @DEBPAT = IsNull(sum(amount),0) from clienttransactions ' +
        'where clientno = @NoCliente and code = '#39'PD'#39
      
        #9'select @CREDPAT = IsNull(sum(amount),0) from clienttransactions' +
        ' where clientno = @NoCliente and code = '#39'PC'#39
      ''
      
        #9'Update Pacientes set Deuda = @DEBS - @CREDS, LAWAY= @DEBSLW - @' +
        'CREDSLW, PATROCINIO = @CREDPAT - @DEBPAT  where NumeroCliente = ' +
        '@NoCliente;'
      #9'SELECT @BALANCE = (@DEBS - @CREDS);'
      
        #9'UPDATE CLIENTTRANSACTIONS SET BALANCE = @BALANCE WHERE ID = @ID' +
        ';'
      '  COMMIT'
      'end;')
    Left = 2136
    Top = 496
  end
  object POS_CANCEL_TRANS: TFDQuery
    AfterExecute = POS_CANCEL_TRANSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POS_CANCEL_TRANS] @NOTRANS INT, @UPDATE_' +
        'INV bit, @isVoid BIT, @DBName nchar(20) '
      'AS'
      'declare @OTCNUMBER int'
      'DECLARE @QTY DECIMAL(18,2)'
      'DECLARE @PRODUCTNO INT'
      'DECLARE @SQL NVARCHAR(500);'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION;'
      
        #9'DECLARE MyCursor CURSOR FOR SELECT OTC_NUMBER, QTY, PRODUCTNO f' +
        'rom TRANSACTIONDETAIL where TRANSACTIONNUMBER = @NOTRANS;'
      #9'OPEN MyCursor'
      #9'FETCH NEXT FROM MyCursor'
      #9'INTO @OTCNUMBER, @QTY, @PRODUCTNO'
      #9'WHILE @@FETCH_STATUS = 0'
      #9'BEGIN'
      #9#9'IF @OTCNUMBER > 0 '
      #9#9'begin'
      
        #9#9#9'SET @SQL = '#39'Update ['#39' + @DBName + '#39'].dbo.OTC set WF_CASHIER =' +
        ' NULL, Cobrado = NULL, WC_PICKUP = 0, SIGNATURE_LINK = 1  where ' +
        'OTCNumber = @OTCNUMBER'#39';'
      #9#9#9'Exec sp_executesql @SQL, N'#39'@OTCNUMBER INTEGER'#39', @OTCNUMBER;'
      
        #9#9#9'Update WillCall set POS_PICKUP = 0 where OTC_NUMBER = @OTCNUM' +
        'BER; '
      #9#9'end;'#9#9#9#9
      #9#9'IF @UPDATE_INV = 1'
      #9#9'BEGIN'
      
        #9#9#9'Update INVENTARIOPISO set QTYINVENTARIO = QTYINVENTARIO + @QT' +
        'Y WHERE PRODUCTNO = @PRODUCTNO; '
      #9#9'END;'#9
      #9#9'FETCH NEXT FROM MyCursor'
      #9#9'INTO @OTCNUMBER, @QTY, @PRODUCTNO'
      #9'END'
      #9'CLOSE MyCursor'
      #9'DEALLOCATE MyCursor'
      
        #9'DECLARE MyCursor CURSOR FOR SELECT OTC_NUMBER, QTY, PRODUCTNO f' +
        'rom TRANSACTIONDETAIL_TEMP where TRANSACTIONNUMBER = @NOTRANS;'
      #9'OPEN MyCursor'
      #9'FETCH NEXT FROM MyCursor'
      #9'INTO @OTCNUMBER, @QTY, @PRODUCTNO'
      #9'WHILE @@FETCH_STATUS = 0'
      #9'BEGIN'
      #9#9'IF @OTCNUMBER > 0 '
      #9#9'begin'
      
        #9#9#9'SET @SQL = '#39'Update ['#39' + @DBName + '#39'].dbo.OTC set WF_CASHIER =' +
        ' NULL, Cobrado = NULL, WC_PICKUP = 0, SIGNATURE_LINK = 1  where ' +
        'OTCNumber = @OTCNUMBER'#39';'
      #9#9#9'Exec sp_executesql @SQL, N'#39'@OTCNUMBER INTEGER'#39', @OTCNUMBER;'
      
        #9#9#9'Update WillCall set POS_PICKUP = 0 where OTC_NUMBER = @OTCNUM' +
        'BER; '
      #9#9'end;'#9#9#9#9#9
      #9#9'FETCH NEXT FROM MyCursor'
      #9#9'INTO @OTCNUMBER, @QTY, @PRODUCTNO'
      #9'END'
      #9'CLOSE MyCursor'
      #9'DEALLOCATE MyCursor;'
      #9'if @isVoid = 1'
      #9'begin'
      
        #9'  update TRANSACTIONDETAIL set VOIDED = 0, PRICE = 0, TOTAL = 0' +
        ', COSTO = 0 where TRANSACTIONNUMBER = @NOTRANS;'
      
        #9'  update TRANSACTIONHEADER set PAYAMOUNT1 = 0, PAYAMOUNT2 = 0, ' +
        'tax = 0, TOTAL_TAX = 0, tip = 0, tax_servicio = 0, '
      
        '                         TAX_PROCESSED_FOOD = 0, TAX_ESTATAL = 0' +
        ', TAX_FOOD_MUNICIPAL = 0, VOIDED = 1, AMOUNT_TENDERED1 = 0, '
      
        '                         AMOUNT_TENDERED2 = 0, TOTAL = 0, SUBTOT' +
        'AL = 0 where TRANSACTIONNUMBER = @NOTRANS;'
      #9'  '
      #9'end'
      #9'else'
      #9'begin'
      
        #9#9'DELETE FROM TRANSACTIONHEADER_TEMP WHERE TRANSACTIONNUMBER = @' +
        'NOTRANS;'
      
        #9#9'DELETE FROM TRANSACTIONDETAIL_TEMP WHERE TRANSACTIONNUMBER = @' +
        'NOTRANS;'
      
        #9#9'UPDATE TRANSACTIONHEADER SET VOIDED = 1 WHERE TRANSACTIONNUMBE' +
        'R = @NOTRANS;'
      
        #9#9'UPDATE TRANSACTIONDETAIL SET VOIDED = 1 WHERE TRANSACTIONNUMBE' +
        'R = @NOTRANS;'
      #9#9'DELETE FROM CLIENTTRANSACTIONS WHERE TRANSNO = @NOTRANS;'
      #9#9'DELETE FROM TRIPLE_S WHERE TRANSACTIONNUMBER = @NOTRANS;'
      
        #9#9'DELETE FROM PRODUCT_SIGNATURE WHERE TRANSACTIONNUMBER = @NOTRA' +
        'NS;'
      #9#9'Exec CANCEL_TABS @NOTRANS;'
      #9'end;'
      #9'COMMIT;'
      'END;')
    Left = 2136
    Top = 600
  end
  object PATIENT_HIPPA_ORIENTED: TFDQuery
    AfterExecute = PATIENT_HIPPA_ORIENTEDAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE PATIENT_HIPPA_ORIENTED @NOCLIENTE INT'
      'AS'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9'UPDATE PACIENTES SET ORIENTACION = '#39'TRUE'#39', FECHA_HIPPA = GETDAT' +
        'E() WHERE NUMEROCLIENTE = @NOCLIENTE;'
      #9'COMMIT;'
      ''
      'END')
    Left = 2144
    Top = 672
  end
  object POS_RECALL_TRANSACTION: TFDQuery
    AfterExecute = POS_RECALL_TRANSACTIONAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POS_RECALL_TRANSACTION] @ID INT, @EMPLOY' +
        'EE CHAR(3), @REGISTER INT, @TRANSNO INT'
      'AS'
      'BEGIN'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9#9'Update TransactionHeader_Temp set ID = @ID, EMPLOYNUMBER = @EM' +
        'PLOYEE, Register = @REGISTER, '
      #9#9'TransactionDate = GETDATE(), TransactionTime = GETDATE(),'
      #9#9'Opened =  '#39'T'#39' Where TransactionNumber = @TRANSNO;'
      
        #9#9'Update TransactionDetail_TEMP Set Opened = '#39'T'#39', ID = @ID, Regi' +
        'ster = @REGISTER  Where TransactionNumber = @TRANSNO;'
      #9'COMMIT TRANSACTION;'
      'END')
    Left = 2144
    Top = 744
  end
  object POS_SPLIT_TAB: TFDQuery
    AfterExecute = POS_SPLIT_TABAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POS_SPLIT_TAB] @TRANSNO_FROM INT,  @TRAN' +
        'SNO_TO INT, @ID INT, @CANCEL_TRANS BIT'
      'AS'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'begin transaction'
      #9'SET NOCOUNT ON;'
      #9'IF @ID > 0 '
      #9'begin'
      
        #9'  Update TRANSACTIONDETAIL_TEMP set TransactionNumber = @TRANSN' +
        'O_TO where IDNUMBER = @ID;'
      #9'end'
      #9'else'
      #9'begin'
      
        #9'  Update TRANSACTIONDETAIL_TEMP set TransactionNumber = @TRANSN' +
        'O_TO where TransactionNumber  = @TRANSNO_FROM;'
      '        end;'
      #9'if @CANCEL_TRANS = 1'
      #9'begin'
      #9'  exec TRANSACTIONDETAIL_CANCELTRANS @TRANSNO_FROM;'
      #9'end;'
      #9'commit;'
      'END')
    Left = 2144
    Top = 824
  end
  object POST_SHOPPER: TFDQuery
    AfterExecute = POST_SHOPPERAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE POST_SHOPPER @ID INT, @COMESPECIAL DATETIME, @T' +
        'ERMINAESPECIAL DATETIME'
      'AS'
      'DECLARE @PRODUCT_ID INT'
      'DECLARE @SPECIAL FLOAT'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9'DECLARE MyCursor CURSOR FOR SELECT PRODUCT_ID, SPECIAL from SHO' +
        'PPER_DETAIL where ID = @ID;'
      #9'OPEN MyCursor'
      #9'FETCH NEXT FROM MyCursor'
      #9'INTO @PRODUCT_ID, @SPECIAL'
      #9'WHILE @@FETCH_STATUS = 0'
      #9'begin'
      
        #9#9'Update InventarioPiso set  ESPECIAL = @SPECIAL, COMESPECIAL = ' +
        '@COMESPECIAL, TERMINAESPECIAL = @TERMINAESPECIAL where PRODUCTNO' +
        ' = @PRODUCT_ID; '
      #9#9'FETCH NEXT FROM MyCursor'
      #9#9'INTO @PRODUCT_ID, @SPECIAL'
      #9'end;'
      #9'CLOSE MyCursor'
      #9'DEALLOCATE MyCursor'
      #9'UPDATE SHOPPER_HEADER SET ACTIVE = 1 WHERE ID = @ID;'
      #9'COMMIT'
      'END')
    Left = 1632
    Top = 840
  end
  object CALC_CHANGE: TFDQuery
    AfterExecute = CALC_CHANGEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE TRIGGER [dbo].[CALC_CHANGE] ON [dbo].[TRANSACTIONHEADER_T' +
        'EMP]'
      '   AFTER INSERT, UPDATE'
      'AS '
      'DECLARE @CHANGE FLOAT'
      'DECLARE @TRANSNO INT'
      'DECLARE @PAYAMOUNT1 FLOAT'
      'DECLARE @PAYAMOUNT2 FLOAT'
      'DECLARE @TOTAL_TIP FLOAT'
      'DECLARE @TOTAL FLOAT'
      'DECLARE @PAYMENTTYPE CHAR(4)'
      'DECLARE @AMOUNT_TENDERED DECIMAL(18,2)'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      
        #9'Select @PAYMENTTYPE = LTRIM(RTRIM(PAYMENTTYPE1)), @TRANSNO = TR' +
        'ANSACTIONNUMBER, @PAYAMOUNT1 = ISNULL(PAYAMOUNT1,0), @PAYAMOUNT2' +
        ' = ISNULL(PAYAMOUNT2,0), '
      
        #9'@TOTAL_TIP = ISNULL(TOTAL_TIP,0), @TOTAL = ISNULL(TOTAL,0), @AM' +
        'OUNT_TENDERED = ISNULL(AMOUNT_TENDERED,0) FROM INSERTED;'
      #9'if (@PAYMENTTYPE = '#39'POUT'#39' or @PAYMENTTYPE = '#39'PICK'#39')'
      #9'begin'
      
        #9#9'Update TRANSACTIONHEADER_TEMP set CHANGE = 0, OPENED = '#39'F'#39', CU' +
        'STOMERID = 0, TOTAL = (TOTAL * -1),'
      #9#9#9'FOODTOTAL = 0  where TRANSACTIONNUMBER = @TRANSNO;'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'IF ((@PAYAMOUNT1 + @PAYAMOUNT2) > 0) '
      #9#9'begin '
      
        #9#9#9'SELECT @CHANGE = (@PAYAMOUNT1 + @AMOUNT_TENDERED) - (@TOTAL+@' +
        'TOTAL_TIP);'
      
        #9#9#9'Update TRANSACTIONHEADER_TEMP set CHANGE = @CHANGE where TRAN' +
        'SACTIONNUMBER = @TRANSNO;'
      #9#9'end'#9'  '
      #9'end;'
      #9'commit;'
      'END')
    Left = 2152
    Top = 904
  end
  object POS_INSERT_BUTTON_IMAGE: TFDQuery
    AfterExecute = POS_INSERT_BUTTON_IMAGEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE POS_INSERT_BUTTON_IMAGE @BUTTON_IMAGE IMAGE, @B' +
        'UTTON_NUMBER INT'
      'AS'
      'SET NOCOUNT ON'
      'BEGIN '
      '  begin transaction'
      
        '    UPDATE BOTONES SET BUTTON_IMAGE = @BUTTON_IMAGE WHERE BUTTON' +
        '_NUMBER = @BUTTON_NUMBER;'
      '  commit '
      'END')
    Left = 2152
    Top = 1000
  end
  object POS_UPDATE_PRINTED: TFDQuery
    AfterExecute = POS_UPDATE_PRINTEDAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE POS_UPDATE_PRINTED @TRANSNO INT'
      'AS'
      'BEGIN'#9
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9'UPDATE TRANSACTIONDETAIL_TEMP SET PRINTED = 1 WHERE TRANSACTION' +
        'NUMBER = @TRANSNO;'
      #9'COMMIT;'
      'END')
    Left = 2344
    Top = 96
  end
  object POS_INSERT_DAILYTOTALS: TFDQuery
    AfterExecute = POS_INSERT_DAILYTOTALSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POS_INSERT_DAILYTOTALS] @STARTBANK FLOAT' +
        ', @EMPLOYNUMBER VARCHAR(3), @REGISTER INT, @DTCurrent_Identity I' +
        'NT OUTPUT'
      'AS'
      'BEGIN'
      #9'DECLARE @END_OF_DAY bit;'
      #9'IF @STARTBANK = 0  --Checks if it is an end of day--'
      '    BEGIN'
      '        SET @END_OF_DAY = 1;'
      '    END'
      '    ELSE'
      '    BEGIN'
      '        SET @END_OF_DAY = 0;'
      '    END;'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9#9'Insert into DAILYTOTALS (STARTBANK, EMPLOYNUMBER, REGISTER, SH' +
        'IFT, STATUS_CUADRE, STATUS_CAJA, SALESDATE,CASHCOUNT,CASHREAD,CH' +
        'ECKCOUNT,CHECKREAD,CCARDCOUNT,'
      
        #9#9'CCARDREAD,ATHCOUNT,ATHREAD,WICCOUNT,WICREAD,POCOUNT,POREAD,OTH' +
        'ERCOUNT,OTHERREAD,PAYOUTCOUNT,PAYOUTREAD,FAMREAD,FAMCOUNT,CRPAYR' +
        'EAD,CRPAYCOUNT,'
      
        #9#9'WICPAYCOUNT,WICPAYREAD,WICCRCOUNT,WICCRREAD,LOTOREAD,LOTOCOUNT' +
        ',PAYPALCOUNT, END_OF_DAY, END_OF_DAY_COMPLETED)'
      
        #9#9'Values (@STARTBANK, @EMPLOYNUMBER, @REGISTER, 0, '#39'O'#39', '#39'O'#39', GET' +
        'DATE(),0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,@EN' +
        'D_OF_DAY, 0);'
      #9#9'set @DTCurrent_Identity = SCOPE_IDENTITY();'
      #9'COMMIT'
      'END;')
    Left = 2336
    Top = 192
  end
  object POS_UPDATE_PAYMENTTYPE: TFDQuery
    AfterExecute = POS_UPDATE_PAYMENTTYPEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE POS_UPDATE_PAYMENTTYPE @TRANSNO INT, @PAYMENTTY' +
        'PE CHAR(4), @AMOUNT FLOAT  '
      'AS'
      ' '
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      
        #9#9'Update TRANSACTIONHEADER_TEMP set CHANGE = 0, PAYMENTTYPE1 = @' +
        'PAYMENTTYPE, OPENED = '#39'F'#39', CUSTOMERID = 0, TOTAL = (@AMOUNT * -1' +
        '),'
      
        #9#9'PAYAMOUNT1 = @AMOUNT, SUBTOTAL = @AMOUNT, FOODTOTAL = 0  where' +
        ' TRANSACTIONNUMBER = @TRANSNO; '
      '    commit;'
      'END')
    Left = 2336
    Top = 280
  end
  object POST_SHOPPER_DAILY: TFDQuery
    AfterExecute = POST_SHOPPER_DAILYAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POST_SHOPPER_DAILY] @ID INT, @COMESPECIA' +
        'L TIME, @TERMINAESPECIAL TIME, @PERCENTAGE_DISCOUNT DECIMAL(18,2' +
        '), @ACTIVE_INACTIVE BIT'
      'AS'
      'DECLARE @PRODUCT_ID INT'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9'DECLARE MyCursor CURSOR FOR SELECT PRODUCT_ID from SHOPPER_DETA' +
        'IL where ID = @ID;'
      #9'OPEN MyCursor'
      #9'FETCH NEXT FROM MyCursor'
      #9'INTO @PRODUCT_ID '
      #9'WHILE @@FETCH_STATUS = 0'
      #9'begin'
      
        #9#9'Update InventarioPiso set  DAILY_SPECIAL_PRICE = PRECIO - (PRE' +
        'CIO * @PERCENTAGE_DISCOUNT), DAILY_SALE_START_TIME = @COMESPECIA' +
        'L, DAILY_SALE_END_TIME = @TERMINAESPECIAL, DAILY_SALE_ACTIVE = @' +
        'ACTIVE_INACTIVE where PRODUCTNO = @PRODUCT_ID; '
      #9#9'FETCH NEXT FROM MyCursor'
      #9#9'INTO @PRODUCT_ID '
      #9'end;'
      #9'CLOSE MyCursor'
      #9'DEALLOCATE MyCursor'
      
        #9'UPDATE SHOPPER_HEADER SET ACTIVE = @ACTIVE_INACTIVE WHERE ID = ' +
        '@ID;'
      #9'COMMIT'
      'END')
    Left = 1640
    Top = 752
  end
  object VIP: TFDQuery
    AfterExecute = VIPAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[VIP]'
      'AS'
      
        'SELECT        dbo.PACIENTES.NUMEROCLIENTE, dbo.PACIENTES.NOMBRE,' +
        ' dbo.PACIENTES.APELLIDOPATERNO, dbo.PACIENTES.APELLIDOMATERNO, d' +
        'bo.CLIENTTRANSACTIONS.AMOUNT, '
      
        '                         dbo.CLIENTTRANSACTIONS.DATEOFTRANS, dbo' +
        '.CLIENTTRANSACTIONS.CODE, dbo.PACIENTES.DIRECCION1, dbo.PACIENTE' +
        'S.DIRECCION2, dbo.PACIENTES.CIUDAD, dbo.PACIENTES.ESTADO, '
      
        '                         dbo.PACIENTES.CODIGOPOSTAL, dbo.PACIENT' +
        'ES.CELULAR'
      'FROM            dbo.PACIENTES INNER JOIN'
      
        '                         dbo.CLIENTTRANSACTIONS ON dbo.PACIENTES' +
        '.NUMEROCLIENTE = dbo.CLIENTTRANSACTIONS.CLIENTNO')
    Left = 1632
    Top = 936
  end
  object ADD_EDIT_PACIENTES: TFDQuery
    AfterExecute = ADD_EDIT_PACIENTESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE  PROCEDURE [dbo].[ADD_EDIT_PACIENTES]'
      '@NOMBRE CHAR(12),'
      '@FECHANACIMIENTO DATETIME, '
      '@SEXO INT, '
      '@DIRECCION1 CHAR(30),'
      '@ULTTRANS DATETIME,'
      '@DEUDA REAL,'
      '@NUMEROCLIENTE INT,'
      '@INTERES CHAR(1),'
      '@DIRECCIONFISICA CHAR(50),'
      '@APELLIDOPATERNO CHAR(15),'
      '@APELLIDOMATERNO CHAR(15),'
      '@TELEFONO CHAR(13),'
      '@FAX CHAR(13),'
      '@CELULAR CHAR(13),'
      '@LAYAWAY REAL,'
      '@ESTADO CHAR(2),'
      '@AUSPICIO REAL,'
      '@SOCIO VARCHAR(12),'
      '@ORIENTACION CHAR(5),'
      '@IDENTIFICACION CHAR (20),'
      '@SMOKER CHAR(1),'
      '@LOCATION CHAR(2),'
      '@EMPLOYER_ID CHAR(15),'
      '@PATIENT_ID_QUAL CHAR(2),'
      '@PREGNANCY_IDICATOR CHAR(1),'
      '@FECHA_HIPPA DATETIME, '
      '@DEUDA_WEB REAL,'
      '@LANGUAGE CHAR(12),'
      '@INFOADICIONAL VARCHAR (100),'
      '@CONSULTA VARCHAR(100),'
      '@CIUDAD CHAR(20),'
      '@ACCIONES FLOAT, '
      '@DEUDA_EXTENDIDA VARCHAR(1),'
      '@PATROCINIO FLOAT, '
      '@MAILING_ADDRESS1 VARCHAR(30),'
      '@MAILING_ADDRESS2 VARCHAR(30), '
      '@MAILING_CITY VARCHAR(15),'
      '@MAILING_STATE VARCHAR(2),'
      '@MAILING_ZIPCODE VARCHAR (12),'
      '@PATIENT_RESIDENCE NCHAR(2),'
      '@PLACE_OF_SERVICE NCHAR(2),'
      '@EMAIL NCHAR(80),'
      '@CARDHOLDERID NCHAR(20), '
      '@CODIGOPOSTAL NCHAR(15),'
      '@DIRECCION2 NCHAR(40), '
      '@SIGNATURE TEXT, '
      '@OUT_DIAL_PERMISSION NCHAR(1),'
      '@SSN NCHAR(9),'
      '@NOTIFICATION_MODE_PHONE SMALLINT,'
      '@NOTIFICATION_MODE_CEL SMALLINT, '
      '@NOTIFICATION_MODE_SMS SMALLINT, '
      '@NOTIFICATION_MODE_EMAIL SMALLINT, '
      '@NIGHT_PHONE NCHAR(13),'
      '@VETERANO FLOAT,'
      '@NOTIFICATION_MODE NCHAR(1),'
      '@PRIMARY_TELEPHONE NCHAR(7),'
      '@WC_NO_NOTIFICATION BIT,'
      '@FACILITY_ID INT, '
      '@FACILITY_ADMISSION_DATE DATE, '
      '@FACILITY_ROOM NCHAR(10),'
      '@FACILITY_PRESCRIBER NCHAR(50), '
      '@OVERRIDE_SYSTEM_DEFAULT_PRICE BIT, '
      '@PRICE_TABLE_ID INT, '
      '@ADHERENCE BIT, '
      '@NUMERO_REGISTRO_COMERCIANTE NCHAR(15),'
      '@ALLERGY BIT, '
      '@DECEASED BIT, '
      '@MIDDLE_NAME VARCHAR(12),'
      '@NUMEROCLIENTE_OUTPUT INT OUTPUT,'
      '@ANIMAL_NAME NCHAR(45),'
      '@DELIVERY BIT,'
      '@AUTOMATIC_REFILL bit,'
      '@CODE CHAR(1),'
      '@USER NCHAR(3),'
      '@NOTE NCHAR(30),'
      '@LANGUAGE_CODE NCHAR(5),'
      '@LTC bit'
      'AS'
      'DECLARE @NO_PLAN INT'
      'BEGIN'
      '    BEGIN TRANSACTION'
      #9#9'IF @NUMEROCLIENTE = 0 '
      #9#9#9'BEGIN '
      
        #9#9#9#9'INSERT INTO [DBO].[PACIENTES](NOMBRE, FECHANACIMIENTO, SEXO,' +
        ' DIRECCION1, ULTTRANS, DEUDA, '
      #9#9#9#9'INTERES, DIRECCIONFISICA, APELLIDOPATERNO,'
      #9#9#9#9'APELLIDOMATERNO, TELEFONO, FAX, CELULAR, LAWAY,'
      #9#9#9#9'ESTADO, AUSPICIO, SOCIO, ORIENTACION, IDENTIFICACION, '
      
        #9#9#9#9'SMOKER, LOCATION, EMPLOYER_ID, PATIENT_ID_QUAL,PREGNANCY_IDI' +
        'CATOR,'
      #9#9#9#9'FECHA_HIPPA, DEUDA_WEB, LANGUAGE, INFOADICIONAL, CONSULTA, '
      
        #9#9#9#9'CIUDAD, ACCIONES, DEUDA_EXTENDIDA, PATROCINIO, MAILING_ADDRE' +
        'SS1,'
      
        #9#9#9#9'MAILING_ADDRESS2, MAILING_CITY, MAILING_STATE, MAILING_ZIPCO' +
        'DE, '
      
        #9#9#9#9'PATIENT_RESIDENCE, PLACE_OF_SERVICE, EMAIL, CARDHOLDERID, CO' +
        'DIGOPOSTAL, DIRECCION2, '
      
        #9#9#9#9'SIGNATURE, OUT_DIAL_PERMISSION, SSN, NOTIFICATION_MODE_PHONE' +
        ', NOTIFICATION_MODE_CEL, '
      
        #9#9#9#9'NOTIFICATION_MODE_SMS, NOTIFICATION_MODE_EMAIL, NIGHT_PHONE,' +
        ' VETERANO,'
      #9#9#9#9'NOTIFICATION_MODE, PRIMARY_TELEPHONE, WC_NO_NOTIFICATION, '
      
        #9#9#9#9'--FACILITY_ID, FACILITY_ADMISSION_DATE, FACILITY_ROOM, FACIL' +
        'ITY_PRESCRIBER, '
      #9#9#9#9'OVERRIDE_SYSTEM_DEFAULT_PRICE, '
      
        #9#9#9#9'PRICE_TABLE_ID, ADHERENCE, NUMERO_REGISTRO_COMERCIANTE, ALLE' +
        'RGY, DECEASED, MIDDLE_NAME,'
      
        #9#9#9#9'ANIMAL_NAME, DELIVERY, AUTOMATIC_REFILL, LANGUAGE_CODE, LTC)' +
        #9#9#9
      
        #9#9#9#9'VALUES(@NOMBRE, @FECHANACIMIENTO, @SEXO, @DIRECCION1, @ULTTR' +
        'ANS, '
      #9#9#9#9'@DEUDA,  @INTERES, @DIRECCIONFISICA, @APELLIDOPATERNO, '
      
        #9#9#9#9'@APELLIDOMATERNO, @TELEFONO, @FAX, @CELULAR, @LAYAWAY, @ESTA' +
        'DO,'
      
        #9#9#9#9'@AUSPICIO, @SOCIO, @ORIENTACION, @IDENTIFICACION, @SMOKER, @' +
        'LOCATION, @EMPLOYER_ID, '
      
        #9#9#9#9'@PATIENT_ID_QUAL, @PREGNANCY_IDICATOR, @FECHA_HIPPA, @DEUDA_' +
        'WEB, @LANGUAGE, '
      
        #9#9#9#9'@INFOADICIONAL, @CONSULTA, @CIUDAD, @ACCIONES, @DEUDA_EXTEND' +
        'IDA, '
      
        #9#9#9#9'@PATROCINIO, @MAILING_ADDRESS1, @MAILING_ADDRESS2, @MAILING_' +
        'CITY, '
      
        #9#9#9#9'@MAILING_STATE, @MAILING_ZIPCODE, @PATIENT_RESIDENCE, @PLACE' +
        '_OF_SERVICE, '
      
        #9#9#9#9'@EMAIL, @CARDHOLDERID, @CODIGOPOSTAL, @DIRECCION2, @SIGNATUR' +
        'E, @OUT_DIAL_PERMISSION,'
      
        #9#9#9#9'@SSN, @NOTIFICATION_MODE_PHONE, @NOTIFICATION_MODE_CEL, @NOT' +
        'IFICATION_MODE_SMS, '
      
        #9#9#9#9'@NOTIFICATION_MODE_EMAIL, @NIGHT_PHONE, @VETERANO, @NOTIFICA' +
        'TION_MODE, '
      #9#9#9#9'@PRIMARY_TELEPHONE, @WC_NO_NOTIFICATION, '
      
        #9#9#9#9'--@FACILITY_ID, @FACILITY_ADMISSION_DATE, @FACILITY_ROOM, @F' +
        'ACILITY_PRESCRIBER, '
      #9#9#9#9'@OVERRIDE_SYSTEM_DEFAULT_PRICE,'
      
        #9#9#9#9'@PRICE_TABLE_ID, @ADHERENCE, @NUMERO_REGISTRO_COMERCIANTE, @' +
        'ALLERGY,'
      
        #9#9#9#9'@DECEASED, @MIDDLE_NAME, @ANIMAL_NAME, @DELIVERY, @AUTOMATIC' +
        '_REFILL, @LANGUAGE_CODE, @LTC);'
      #9#9#9#9'SET @NUMEROCLIENTE_OUTPUT=SCOPE_IDENTITY();'
      #9#9#9#9'SET @CODE = '#39'A'#39';'
      #9#9#9#9'SET @NOTE = '#39'NEW CUSTOMER ADDED'#39';'
      #9#9#9'END'
      #9#9'ELSE'
      #9#9#9'BEGIN'
      #9#9#9#9'UPDATE [dbo].[PACIENTES]'
      #9#9#9#9'   SET [NOMBRE] = @NOMBRE'
      
        #9#9#9#9#9'  ,[FECHANACIMIENTO] = @FECHANACIMIENTO, [SEXO] = @SEXO, [D' +
        'IRECCION1] = @DIRECCION1, '
      #9#9#9#9#9'   [ULTTRANS] = @ULTTRANS'
      
        #9#9#9#9#9'  ,[INTERES] = @INTERES, [DIRECCIONFISICA] = @DIRECCIONFISI' +
        'CA, [APELLIDOPATERNO] = @APELLIDOPATERNO'
      
        #9#9#9#9#9'  ,[APELLIDOMATERNO] = @APELLIDOMATERNO, [TELEFONO] = @TELE' +
        'FONO, [FAX] = @FAX, [CELULAR] = @CELULAR'
      #9#9#9#9#9'  ,[ESTADO] = @ESTADO,  [SOCIO] = @SOCIO'
      
        #9#9#9#9#9'  ,[ORIENTACION] = @ORIENTACION, [IDENTIFICACION] = @IDENTI' +
        'FICACION, [SMOKER] = @SMOKER'
      
        #9#9#9#9#9'  ,[LOCATION] = @LOCATION, [EMPLOYER_ID] = @EMPLOYER_ID, [P' +
        'ATIENT_ID_QUAL] = @PATIENT_ID_QUAL'
      
        #9#9#9#9#9'  ,[PREGNANCY_IDICATOR] = @PREGNANCY_IDICATOR, [FECHA_HIPPA' +
        '] = @FECHA_HIPPA '
      
        #9#9#9#9#9'  ,[LANGUAGE] = @LANGUAGE, [INFOADICIONAL] = @INFOADICIONAL' +
        ', [CONSULTA] = @CONSULTA'
      #9#9#9#9#9'  ,[CIUDAD] = @CIUDAD, [ACCIONES] = @ACCIONES'
      
        #9#9#9#9#9'  ,[MAILING_ADDRESS1] = @MAILING_ADDRESS1, [MAILING_ADDRESS' +
        '2] = @MAILING_ADDRESS2'
      
        #9#9#9#9#9'  ,[MAILING_CITY] = @MAILING_CITY, [MAILING_STATE] = @MAILI' +
        'NG_STATE, [MAILING_ZIPCODE] = @MAILING_ZIPCODE'
      
        #9#9#9#9#9'  ,[PATIENT_RESIDENCE] = @PATIENT_RESIDENCE, [PLACE_OF_SERV' +
        'ICE] = @PLACE_OF_SERVICE'
      
        #9#9#9#9#9'  ,[EMAIL] = @EMAIL, [CARDHOLDERID] = @CARDHOLDERID, [CODIG' +
        'OPOSTAL] = @CODIGOPOSTAL'
      
        #9#9#9#9#9'  ,[DIRECCION2] = @DIRECCION2, [SIGNATURE] = @SIGNATURE, [O' +
        'UT_DIAL_PERMISSION] = @OUT_DIAL_PERMISSION'
      
        #9#9#9#9#9'  ,[SSN] = @SSN, [NOTIFICATION_MODE_PHONE] = @NOTIFICATION_' +
        'MODE_PHONE, [NOTIFICATION_MODE_CEL] = @NOTIFICATION_MODE_CEL'
      
        #9#9#9#9#9'  ,[NOTIFICATION_MODE_SMS] = @NOTIFICATION_MODE_SMS, [NOTIF' +
        'ICATION_MODE_EMAIL] = @NOTIFICATION_MODE_EMAIL'
      
        #9#9#9#9#9'  ,[NIGHT_PHONE] = @NIGHT_PHONE, [VETERANO] = @VETERANO, [N' +
        'OTIFICATION_MODE] = @NOTIFICATION_MODE'
      
        #9#9#9#9#9'  ,[PRIMARY_TELEPHONE] = @PRIMARY_TELEPHONE, [WC_NO_NOTIFIC' +
        'ATION] = @WC_NO_NOTIFICATION'
      
        #9#9#9#9#9'  ,[OVERRIDE_SYSTEM_DEFAULT_PRICE] = @OVERRIDE_SYSTEM_DEFAU' +
        'LT_PRICE, [PRICE_TABLE_ID] = @PRICE_TABLE_ID'
      
        #9#9#9#9#9'  ,[ADHERENCE] = @ADHERENCE, [NUMERO_REGISTRO_COMERCIANTE] ' +
        '= @NUMERO_REGISTRO_COMERCIANTE'
      
        #9#9#9#9#9'  ,[ALLERGY] = @ALLERGY, [DECEASED] = @DECEASED, [MIDDLE_NA' +
        'ME] = @MIDDLE_NAME'
      
        #9#9#9#9#9'  ,[ANIMAL_NAME] = @ANIMAL_NAME, [DELIVERY] = @DELIVERY, [A' +
        'UTOMATIC_REFILL] = @AUTOMATIC_REFILL'
      #9#9#9#9#9'  ,[LANGUAGE_CODE] = @LANGUAGE_CODE, [LTC] = @LTC'
      #9#9#9#9' WHERE NUMEROCLIENTE = @NUMEROCLIENTE;'
      #9#9#9#9' SELECT @NUMEROCLIENTE_OUTPUT = @NUMEROCLIENTE;'
      #9#9#9#9' if @DECEASED = 1 '
      #9#9#9#9' begin'
      
        #9#9#9#9'   Update PRESCRIPTIONS set ACTIVE = 0 where NUMEROCLIENTE =' +
        ' @NUMEROCLIENTE and ACTIVE = 1;'
      #9#9#9#9' end;'
      #9#9#9#9' SET @CODE = '#39'U'#39';'
      #9#9#9#9' SET @NOTE = '#39'CUSTOMER MODIFIED'#39';'
      #9#9#9'END;'
      
        #9#9#9'EXECUTE INSERT_LOG '#39'CUSTOMER'#39', @CODE, '#39#39', @USER, '#39#39', 0, 0, 0,' +
        '@NUMEROCLIENTE,0,0,0,0,'#39'R'#39',@NOTE,0,1;'
      #9#9'  COMMIT;'
      'END;')
    Left = 1800
    Top = 680
  end
  object FDQueryBackup: TFDQuery
    Connection = FDConnectionBackup
    Left = 1616
    Top = 296
  end
  object POS_HOLD_TRANS: TFDQuery
    AfterExecute = POS_HOLD_TRANSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'Create PROCEDURE POS_HOLD_TRANS @RegisterNo int, @Trans_No int, ' +
        '@TransNo Integer Output, @Hold char(1) Output'
      'AS'
      'declare @TN INT'
      'BEGIN'
      '  '#9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'Begin Transaction'
      #9'if @Trans_No > 0'
      #9'begin'
      #9#9'Select @TN = @Trans_No;'
      #9#9'Select @Hold = '#39'H'#39';'
      
        #9#9'Update TransactionHeader_TEMP Set Opened = '#39'H'#39' Where Transacti' +
        'onNumber = @Trans_No;'
      
        #9#9'Update TransactionDetail_TEMP Set Opened = '#39'H'#39', FECHAVENTA = G' +
        'ETDATE() Where TransactionNumber = @TransNo;'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'Select @Hold = '#39'T'#39';'
      
        #9#9'Select @TN = TransactionNumber From TransactionHeader_TEMP Whe' +
        're (Opened = '#39'H'#39') And (Register = @RegisterNo);'
      
        #9#9'Update TransactionHeader_TEMP Set Opened = '#39'T'#39' Where Transacti' +
        'onNumber = @TN;'
      
        #9#9'Update TransactionDetail_TEMP Set Opened = '#39'T'#39', FECHAVENTA = G' +
        'ETDATE() Where TransactionNumber = @Tn;'#9'  '
      #9'end;'
      #9'Select @TransNo = @TN;'
      #9'COMMIT TRANSACTION;'
      'END')
    Left = 1808
    Top = 840
  end
  object POS_ROUND_TOTAL: TFDQuery
    AfterExecute = POS_ROUND_TOTALAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE POS_ROUND_TOTAL  '
      
        '  @AMOUNT Float output, @Round1 float output, @Round2 float outp' +
        'ut'
      
        '  , @Round3 float output, @Round4 float output, @Round5 float ou' +
        'tput'
      'AS'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'declare @RoundUp DECIMAL'
      #9'SET @RoundUp = 5'
      #9'SELECT @Round1 = CEILING(@AMOUNT/@RoundUp)*@RoundUp'
      #9'SET @RoundUp = 10'
      #9'SELECT @Round2 = CEILING(@AMOUNT/@RoundUp)*@RoundUp'
      #9'SET @RoundUp = 20'
      #9'SELECT @Round3 = CEILING(@AMOUNT/@RoundUp)*@RoundUp'
      #9'SET @RoundUp = 50'
      #9'SELECT @Round4 = CEILING(@AMOUNT/@RoundUp)*@RoundUp'
      #9'SET @RoundUp = 100'
      #9'SELECT @Round5 = CEILING(@AMOUNT/@RoundUp)*@RoundUp'
      ''
      'END')
    Left = 1808
    Top = 920
  end
  object CALC_COMMISSION: TFDQuery
    AfterExecute = CALC_COMMISSIONAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE FUNCTION [dbo].[CALC_COMMISSION] (@PRODUCTNO INT, @SALES_' +
        'PRICE DECIMAL(18,2), @QTY FLOAT)'
      'RETURNS DECIMAL(18,2)'
      'AS'
      'BEGIN'
      #9'DECLARE @COMMISSION1 DECIMAL(18,2)'
      #9'DECLARE @COMMISSION2 DECIMAL(18,2)'
      #9'DECLARE @COMMISSION3 DECIMAL(18,2)'
      #9'DECLARE @PRICE1 DECIMAL(18,2)'
      #9'DECLARE @PRICE2 DECIMAL(18,2)'
      #9'DECLARE @PRICE3 DECIMAL(18,2)'
      #9'DECLARE @COMMISSION_VALUE DECIMAL(18,2)'
      #9'DECLARE @TOTAL_VALUE FLOAT'
      #9'SELECT @COMMISSION_VALUE = 0;'
      
        #9'SELECT @COMMISSION1 = COMMISSION1, @COMMISSION2 = COMMISSION2, ' +
        '@COMMISSION3 = COMMISSION3 FROM CREDITDEBITSETUP; '
      
        #9'SELECT @PRICE1 = PRECIO, @PRICE2 = PRECIOVENTA2, @PRICE3 = PREC' +
        'IOVENTA3  FROM INVENTARIOPISO WHERE PRODUCTNO = @PRODUCTNO;'
      #9'IF (@SALES_PRICE >= @PRICE1)'
      #9'begin'
      
        #9#9'SELECT @COMMISSION_VALUE = isnull((@SALES_PRICE * @COMMISSION1' +
        ')*@QTY,0);  '
      #9'end; '
      #9'IF (@SALES_PRICE < @PRICE1) AND (@SALES_PRICE >= @PRICE2)'
      #9'begin'
      
        #9#9'SELECT @COMMISSION_VALUE = isnull((@SALES_PRICE * @COMMISSION2' +
        ')*@QTY,0); '
      #9'end;  '
      #9'IF (@SALES_PRICE < @PRICE2) AND (@SALES_PRICE >= @PRICE3)'
      #9'begin'
      
        #9#9'SELECT @COMMISSION_VALUE = isnull((@SALES_PRICE * @COMMISSION3' +
        ')*@QTY,0);'
      #9'end;'
      #9'IF (@SALES_PRICE < @PRICE3)'
      #9'begin'
      
        #9#9'SELECT @COMMISSION_VALUE = isnull((@SALES_PRICE * .01)*@QTY,0)' +
        ';'
      #9'end;'
      #9'Return @COMMISSION_VALUE'
      'END')
    Left = 2176
    Top = 1088
  end
  object Reindex: TFDQuery
    AfterExecute = ReindexAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'EXEC sp_MSforeachtable @command1="print '#39'?'#39' DBCC DBREINDEX ('#39'?'#39',' +
        ' '#39' '#39', 80)";'
      'EXEC sp_updatestats;')
    Left = 2472
    Top = 96
  end
  object POS_TFAM_CALC: TFDQuery
    AfterExecute = POS_TFAM_CALCAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POS_TFAM_CALC] (@TRANSNO INT,  @AMOUNT F' +
        'LOAT OUTPUT, @UPDATEDATA BIT)'
      'AS'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      '    SET NOCOUNT ON;'
      '    begin transaction'
      #9'IF @UPDATEDATA = 1'
      #9'BEGIN'
      
        '      UPDATE TRANSACTIONDETAIL_TEMP SET TAX_PROCESSED_FOOD = 0, ' +
        'TAX_ESTATAL = '#39'F'#39', TAX_MUNICIPAL = '#39'F'#39', TAX_SERVICIO = 0 '
      #9'  where TransactionNumber = @TRANSNO and FOOD = '#39'F'#39';'
      #9'END;'
      
        '    Select @AMOUNT = sum(Total) from TransactionDetail_Temp wher' +
        'e Food = '#39'F'#39'  and TransactionNumber = @TRANSNO'
      '    commit'
      'END')
    Left = 2488
    Top = 160
  end
  object FDQuery3: TFDQuery
    Connection = FDConnection1
    OnError = FDQuery3Error
    Left = 1120
    Top = 408
  end
  object NEXT_ID: TFDQuery
    AfterExecute = NEXT_IDAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[NEXT_ID] @OPTION VARCHAR(15), @ID INTEGE' +
        'R OUTPUT'
      'AS'
      'DECLARE @CURRENT_APPRISS_TN INT'
      'DECLARE @NO Integer;'
      'DECLARE @REFERENCE_NO INT;'
      'begin'
      '  begin transaction'
      '  IF @OPTION = '#39'MessageID'#39' '
      '  begin'
      #9'  Update NEXT_RXNUMBER SET MessageID = MessageID + 1;'
      #9'  Select @ID = (MessageID) FROM NEXT_RXNUMBER;'
      '  end;'
      '  if @OPTION = '#39'APPRISS'#39' '
      '  begin'
      
        #9'  SELECT @CURRENT_APPRISS_TN = APPRISS_TRANSACTION_NUMBER FROM ' +
        'NEXT_RXNUMBER;'
      #9'  IF (@CURRENT_APPRISS_TN IS NULL) OR (@CURRENT_APPRISS_TN = 0)'
      #9'  begin'
      #9'   SELECT @CURRENT_APPRISS_TN = MAX(OTCNUMBER) FROM OTC; '
      
        #9'   Update NEXT_RXNUMBER set APPRISS_TRANSACTION_NUMBER = @CURRE' +
        'NT_APPRISS_TN;'
      #9'  end;'
      
        #9'  Update NEXT_RXNUMBER SET APPRISS_TRANSACTION_NUMBER = APPRISS' +
        '_TRANSACTION_NUMBER + 1 Select @ID = (APPRISS_TRANSACTION_NUMBER' +
        ') FROM NEXT_RXNUMBER;'
      '  end;'
      '  if @OPTION = '#39'MAIN_COURSE_ID'#39
      '  begin'
      #9'  Update NEXT_RXNUMBER SET MAIN_COURSE_ID = MAIN_COURSE_ID + 1;'
      #9'  Select @ID = (MAIN_COURSE_ID) FROM NEXT_RXNUMBER;'
      '  end;'
      '  if @OPTION = '#39'BARCODE'#39
      '  begin'
      #9'  Update NEXT_RXNUMBER SET BARCODE = BARCODE + 1;'
      #9'  Select @ID = (BARCODE) FROM NEXT_RXNUMBER;'
      '  end;'
      '  if @OPTION = '#39'INSTANCIA'#39
      '  begin'
      #9'Select @NO = INSTANCIA FROM NEXT_RXNUMBER'
      #9'if @NO < 5000'
      #9'begin'
      #9#9'Update NEXT_RXNUMBER SET INSTANCIA = INSTANCIA + 1;'
      #9#9'Select @ID = (INSTANCIA) FROM NEXT_RXNUMBER;'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'Update NEXT_RXNUMBER SET INSTANCIA = 1;'
      #9#9'Select @ID= (INSTANCIA) FROM NEXT_RXNUMBER;'
      #9'end'
      '  end;'
      '  if @OPTION = '#39'MEZCLA_TRAN_NO'#39
      '  begin'
      #9'Update NEXT_RXNUMBER SET MEZCLA_TRAN_NO = MEZCLA_TRAN_NO + 1;'
      #9'Select @ID = (MEZCLA_TRAN_NO) FROM NEXT_RXNUMBER;'
      '  end;'
      '  if @OPTION = '#39'PARATA'#39
      '  begin'
      #9'Update NEXT_RXNUMBER SET PARATA = PARATA + 1;'
      #9'Select @ID = (PARATA) FROM NEXT_RXNUMBER;'
      '  end;'
      '  if @OPTION = '#39'RX_TRAN_NO'#39
      '  begin'
      #9'Update NEXT_RXNUMBER SET RX_TRAN_NO = RX_TRAN_NO + 1;'
      #9'Select @ID = (RX_TRAN_NO) FROM NEXT_RXNUMBER;'
      '  end;'
      '  if @OPTION = '#39'REFERENCE_NO'#39
      '  begin'
      #9'Select @REFERENCE_NO = REFERENCE_NO from NEXT_RXNUMBER;'
      #9'if @REFERENCE_NO >= 999999 '
      #9'begin'
      #9'  Update NEXT_RXNUMBER SET REFERENCE_NO = 0;'
      #9'end;'
      #9'Update NEXT_RXNUMBER SET REFERENCE_NO = REFERENCE_NO + 1;'
      #9'Select @ID = (REFERENCE_NO) FROM NEXT_RXNUMBER;'
      '  end;'
      '  commit'
      'end;')
    Left = 1808
    Top = 760
  end
  object WF_UPDATE: TFDQuery
    AfterExecute = WF_UPDATEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[WF_UPDATE] @OTCNUMBER INT, @TOKEN NCHAR(' +
        '30), @OPTION CHAR(1), @SIGNATURE_LINK INT  '
      'AS'
      'DECLARE @USER CHAR(3)'
      'DECLARE @NORX BIGINT'
      'DECLARE @CONTROLLED CHAR(4)'
      'DECLARE @ISCONTROLLED BIT'
      'DECLARE @NUMEROCLIENTE INT'
      'DECLARE @PRODUCTNO INT'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      #9'SELECT @USER = substring(@TOKEN,1,3);'
      
        #9'SELECT @NORX = NUMERORECETA, @CONTROLLED = CONTROLADO, @NUMEROC' +
        'LIENTE = NUMEROCLIENTE,'
      #9'@PRODUCTNO = PRODUCT_ID FROM OTC WHERE OTCNUMBER = @OTCNUMBER;'
      
        #9'IF RTRIM(@CONTROLLED) = '#39'RX'#39' SET @ISCONTROLLED = 0 ELSE SET @IS' +
        'CONTROLLED = 1;'
      #9'IF @OPTION  = '#39'F'#39' '
      #9'begin'
      
        #9'  Update OTC set WF_FILLED =  @TOKEN WHERE OTCNUMBER = @OTCNUMB' +
        'ER;'
      
        #9'  EXECUTE INSERT_LOG '#39'RX FILLED'#39', '#39'U'#39', '#39#39', @USER, '#39#39', @NORX, @O' +
        'TCNUMBER, 0,@NUMEROCLIENTE,0,0,0,@PRODUCTNO,'#39'R'#39','#39#39',@ISCONTROLLED' +
        ',1;'
      #9'end;'
      #9'IF @OPTION  = '#39'D'#39' '
      #9'begin'
      
        #9'  Update OTC set WF_DELIVERED =  @TOKEN WHERE OTCNUMBER = @OTCN' +
        'UMBER;'
      
        #9'  EXECUTE INSERT_LOG '#39'RX DELIVERED'#39', '#39'U'#39', '#39#39', @USER, '#39#39', @NORX,' +
        ' @OTCNUMBER, 0,@NUMEROCLIENTE,0,0,0,@PRODUCTNO,'#39'R'#39','#39#39',@ISCONTROL' +
        'LED,1;'
      #9'end;'
      #9'IF @OPTION  = '#39'C'#39' '
      #9'begin'
      
        #9'  Update OTC set WF_CHECKED = @TOKEN, PHARMACIST = @USER WHERE ' +
        'OTCNUMBER = @OTCNUMBER;'
      
        #9'  EXECUTE INSERT_LOG '#39'RX CHECKED BY PHARMACIST'#39', '#39'U'#39', '#39#39', @USER' +
        ', '#39#39', @NORX, @OTCNUMBER, 0,@NUMEROCLIENTE,0,0,0,@PRODUCTNO,'#39'R'#39','#39 +
        #39',@ISCONTROLLED,1;'
      
        #9'  Update CONTROLED_LOG set PHARMACIST = @USER WHERE OTCNUMBER =' +
        ' @OTCNUMBER;'
      #9'end;'
      #9'IF @OPTION  = '#39'P'#39' '
      #9'begin'
      
        #9'  Update OTC set WF_CASHIER = @TOKEN, Cobrado = '#39'T'#39' Where OTCNU' +
        'MBER = @OTCNUMBER;'
      
        #9'  EXECUTE INSERT_LOG '#39'RX POS PAID FOR'#39', '#39'U'#39', '#39#39', @USER, '#39#39', @NO' +
        'RX, @OTCNUMBER, 0,@NUMEROCLIENTE,0,0,0,@PRODUCTNO,'#39'R'#39','#39#39',@ISCONT' +
        'ROLLED,1;'
      #9'end;'
      #9'IF @OPTION  = '#39'S'#39' '
      #9'begin'
      
        #9'  Update OTC set WF_CASHIER = @TOKEN, WC_PICKUP = 1, COBRADO = ' +
        #39'T'#39' Where OTCNUMBER = @OTCNUMBER;'
      
        #9'  EXECUTE INSERT_LOG '#39'RX PICKED UP BY SMARTPICKUP'#39', '#39'U'#39', '#39#39', @U' +
        'SER, '#39#39', @NORX, @OTCNUMBER, 0,@NUMEROCLIENTE,0,0,0,@PRODUCTNO,'#39'R' +
        #39','#39#39',@ISCONTROLLED,1;'
      
        #9'  EXECUTE INSERT_LOG '#39'RX POS PAID FOR'#39', '#39'U'#39', '#39#39', @USER, '#39#39', @NO' +
        'RX, @OTCNUMBER, 0,@NUMEROCLIENTE,0,0,0,@PRODUCTNO,'#39'R'#39','#39#39',@ISCONT' +
        'ROLLED,1;'
      #9'end;'
      #9'IF @OPTION  = '#39'X'#39' '
      #9'begin'
      
        #9'  Update OTC set WF_SIGNATURE  = @TOKEN, SIGNATURE_LINK = @SIGN' +
        'ATURE_LINK Where OTCNUMBER = @OTCNUMBER;'
      
        #9'  EXECUTE INSERT_LOG '#39'RX SIGNED'#39', '#39'U'#39', '#39#39', @USER, '#39#39', @NORX, @O' +
        'TCNUMBER, 0,@NUMEROCLIENTE,0,0,0,@PRODUCTNO,'#39'R'#39','#39#39',@ISCONTROLLED' +
        ',1;'
      #9'end;'#9
      #9'COMMIT'
      'END;')
    Left = 2768
    Top = 888
  end
  object EDIT_DAILYTOTALS: TFDQuery
    AfterExecute = EDIT_DAILYTOTALSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[EDIT_DAILYTOTALS] @CASHCOUNT REAL, @CHEC' +
        'KCOUNT REAL, @CCARDCOUNT REAL, @ATHCOUNT REAL,'
      '@WICCOUNT REAL ,@POCOUNT REAL'
      '           ,@OTHERCOUNT REAL'
      '           ,@PAYOUTCOUNT REAL'
      '           ,@FAMCOUNT REAL'
      '           ,@CRPAYCOUNT REAL'
      '           ,@WICPAYCOUNT REAL'
      '           ,@WICCRCOUNT REAL'
      '           ,@LOTOCOUNT REAL'
      '           ,@REFUNDREAD REAL'
      '           ,@UTILITYREAD REAL'
      '           ,@STATUS_CUADRE char(1)'
      '           ,@STATUS_CAJA char(1)'
      '           ,@TOTAL_READ REAL'
      '           ,@ATHMREAD REAL'
      '           ,@TIPSREAD REAL'
      #9'    ,@ATHMCOUNT REAL'
      '           ,@ID INT'
      'AS'
      ''
      'begin'
      '  SET NOCOUNT ON'
      '  begin transaction'
      '    UPDATE  [dbo].[DAILYTOTALS] SET CASHCOUNT = @CASHCOUNT'
      '           ,CHECKCOUNT = @CHECKCOUNT'
      '           ,CCARDCOUNT = @CCARDCOUNT'
      '           ,ATHCOUNT = @ATHCOUNT'
      '           ,WICCOUNT = @WICCOUNT'
      '           ,POCOUNT = @POCOUNT'
      '           ,OTHERCOUNT = @OTHERCOUNT'
      '           ,PAYOUTCOUNT = @PAYOUTCOUNT'
      '           ,FAMCOUNT = @FAMCOUNT'
      '           ,CRPAYCOUNT = @CRPAYCOUNT'
      '           ,WICPAYCOUNT = @WICPAYCOUNT'
      '           ,WICCRCOUNT = @WICCRCOUNT'
      '           ,LOTOCOUNT = @LOTOCOUNT'
      '           ,REFUNDREAD = @REFUNDREAD'
      '           ,UTILITYREAD = @UTILITYREAD'
      '           ,STATUS_CUADRE = @STATUS_CUADRE'
      '           ,STATUS_CAJA = @STATUS_CAJA'
      '           ,TOTAL_READ = @TOTAL_READ'
      '           ,ATHMREAD = @ATHMREAD'
      '           ,ATHMCOUNT = @ATHMCOUNT'
      '           ,TIPSREAD = @TIPSREAD'
      '           where ID = @ID;'
      '  commit transaction;'
      'end;')
    Left = 2336
    Top = 392
  end
  object ADD_EDIT_USERS_POS: TFDQuery
    AfterExecute = ADD_EDIT_USERS_POSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[ADD_EDIT_USERS_POS] @ACTIVATE BIT,  @USE' +
        'RNAME varchar(35), @INICIALES varchar(3), @SEC_LEVEL char(1),'
      
        #9'@MAIN_SETUP bit, @MAIN_CUST bit, @MAIN_LABEL bit, @MAIN_INV bit' +
        ', @MAIN_DEPT bit, @MAIN_SUPL bit,@MAIN_TOTAL bit,'
      
        #9'@MAIN_ACCTS bit,@MAIN_INVRPT bit,@MAIN_RECV bit,@POS_REFUND bit' +
        ',@POS_DELPROD bit, @POS_CHGPRICE bit,@POS_DELTRANS bit,'
      #9'@POS_DISCOUNT bit, @POS_PAYOUT bit,@POS_OPNDRAWR bit,'
      
        #9'@CUST_IBAL bit, @CUST_ILWAY bit, @CUST_EDIT bit,@CUST_DEL bit,@' +
        'TOT_ADDOLD bit,@TOT_EDIT bit,@TOT_EDITOLD bit,'
      
        #9'@TOT_DEL bit, @POS_NCGH bit,@POS_REPRINT bit, @POS_CANCEL bit,@' +
        'MAIN_TRANS bit,'
      
        #9'@POS_CREDIT bit, @VERTRANSACCIONES bit,@POS_LOGEADO bit, @AGRUP' +
        'ARPRODUCTOS bit,'
      
        #9'@EM_VERQTYORD bit,@POS_IVU bit, @QUICKENTRY bit, @GUARDAR_TRANS' +
        'ACCIONES bit,'
      
        #9'@RECALL_TRANS bit,@BACKUP_PERMIT bit,@POS_HOLD bit, @VENTA_MANU' +
        'AL bit, @REDIMIR_PATROCINIO bit, @RPT_POS bit,@RPT_INVENTARIO bi' +
        't, '
      #9'@RPT_RECONCILIACION bit, @RPT_CLIENTES bit,'
      
        #9'@REPORTES bit, @CAMBIAR_PRECIO_OTC_RX bit,@PORCENTO_DESCUENTO b' +
        'it,  @CAPTURAR_FIRMA bit,'
      
        #9'@POS_BUTTONS bit, @POS_CUADRE_ADMINISTRADOR bit, @POS_VER_TOTAL' +
        '_CASH bit, @POS_POST_SHOPPER bit, @TIME_CARD bit, @POS_TAB_CANCE' +
        'L bit, @POS_ADD_BUTTONS bit,'
      
        #9'@POS_REST_DELETEPRODUCT bit, @POS_LIMITE_CAMBIO_PRECIO bit, @PO' +
        'S_CAMBIAR_PRECIO_INV bit,'
      
        #9'@CELULAR nchar(13), @HOME_PHONE nchar(13), @ADDRESS1 nchar(30),' +
        '@ADDRESS2 nchar(30), @CITY nchar(20), @ZIP_CODE nchar(15),@STATE' +
        ' nchar(2), '
      
        #9'@USERNO INT, @LOG_DATA bit, @PASSWORD_COL NCHAR(30), @ACTIVE BI' +
        'T, @POS_CERRAR_CUADRE_ALIMPIRIMIR BIT, @CAMBIARPASSWORD bit,'
      
        #9'@USER CHAR(3),@NOTE VARCHAR(MAX), @USERNO_OUTPUT INT OUTPUT, @R' +
        'X_UPDATE_INV_BROWSE BIT, @POS_MODIFY_PAYOUT bit, @PROCESS_HANDHE' +
        'LD bit, '
      
        #9'@CREATE_INVENTORY bit, @EDIT_INVENTORY bit, @DELETE_INVENTORY b' +
        'it, @POS_COUPON bit, @MODIFY_HELP_FORM bit, @POS_DELETE_RX bit o' +
        'utput'
      'AS'
      'begin'
      '   begin transaction'
      '   if @ACTIVATE = 1'
      '   begin'
      #9#9'Update Passwords set Active = @ACTIVE where userno = @USERNO;'
      
        #9#9'EXECUTE INSERT_LOG '#39'USER ACTIVATED'#39', '#39'M'#39', '#39#39', @USER,  '#39#39', 0,0,' +
        '0,0,0,0,0,0,'#39'P'#39', @NOTE,0,1;'
      '   end'
      '   else'
      '   begin'
      #9'   if @USERNO = 0'
      #9'   begin'
      ' '#9#9'  insert into PASSWORDS ([USERNAME]'
      #9#9#9'  ,[INICIALES] '
      #9#9#9'  ,[PASSWORD_COL]'
      #9#9#9'  , [ACTIVE]'
      #9#9#9'  ,[SEC_LEVEL] )'
      #9#9#9'  Values'
      #9#9#9'  (@USERNAME, @INICIALES'
      #9#9#9'  ,@PASSWORD_COL,1,1)'
      
        #9#9#9'  EXECUTE INSERT_LOG '#39'NUEW USER CREATED'#39', '#39'A'#39', '#39#39', @USER,  '#39#39 +
        ', 0,0,0,0,0,0,0,0,'#39'P'#39', @NOTE,0,1;'
      #9'   end;'
      #9'   else'
      #9'   begin '
      
        #9#9'UPDATE PASSWORDS SET USERNAME = @USERNAME, PASSWORD_COL = @PAS' +
        'SWORD_COL, INICIALES = @INICIALES, SEC_LEVEL = @SEC_LEVEL, MAIN_' +
        'SETUP = @MAIN_SETUP, '
      
        #9#9'MAIN_CUST = @MAIN_CUST, MAIN_LABEL = @MAIN_LABEL, MAIN_INV = @' +
        'MAIN_INV, MAIN_DEPT = @MAIN_DEPT,MAIN_SUPL = @MAIN_SUPL,MAIN_TOT' +
        'AL = @MAIN_TOTAL,'
      
        #9#9'MAIN_ACCTS = @MAIN_ACCTS,MAIN_INVRPT = @MAIN_INVRPT, MAIN_RECV' +
        ' = @MAIN_RECV, POS_REFUND = @POS_REFUND, POS_DELPROD = @POS_DELP' +
        'ROD, '
      
        #9#9'POS_CHGPRICE = @POS_CHGPRICE, POS_DELTRANS = @POS_DELTRANS, PO' +
        'S_DISCOUNT = @POS_DISCOUNT, POS_PAYOUT = @POS_PAYOUT, POS_OPNDRA' +
        'WR = @POS_OPNDRAWR,'
      
        #9#9'CUST_IBAL = @CUST_IBAL, CUST_ILWAY = @CUST_ILWAY, CUST_EDIT = ' +
        '@CUST_EDIT, CUST_DEL = @CUST_DEL, TOT_ADDOLD = @TOT_ADDOLD, TOT_' +
        'EDIT = @TOT_EDIT,'
      
        #9#9'TOT_EDITOLD = @TOT_EDITOLD,TOT_DEL = @TOT_DEL, POS_NCGH = @POS' +
        '_NCGH, POS_REPRINT = @POS_REPRINT, POS_CANCEL = @POS_CANCEL, MAI' +
        'N_TRANS = @MAIN_TRANS,'
      
        #9#9'POS_CREDIT = @POS_CREDIT, VERTRANSACCIONES = @VERTRANSACCIONES' +
        ', POS_LOGEADO = @POS_LOGEADO, AGRUPARPRODUCTOS = @AGRUPARPRODUCT' +
        'OS, '
      
        #9#9'EM_VERQTYORD = @EM_VERQTYORD, POS_IVU = @POS_IVU, QUICKENTRY =' +
        ' @QUICKENTRY, GUARDAR_TRANSACCIONES = @GUARDAR_TRANSACCIONES,'
      
        #9#9'RECALL_TRANS = @RECALL_TRANS, BACKUP_PERMIT = @BACKUP_PERMIT, ' +
        'POS_HOLD = @POS_HOLD, VENTA_MANUAL = @VENTA_MANUAL, REDIMIR_PATR' +
        'OCINIO = @REDIMIR_PATROCINIO,'
      
        #9#9'RPT_POS = @RPT_POS,RPT_INVENTARIO = @RPT_INVENTARIO, RPT_RECON' +
        'CILIACION = @RPT_RECONCILIACION,  RPT_CLIENTES = @RPT_CLIENTES,'
      
        #9#9'REPORTES = @REPORTES, CAMBIAR_PRECIO_OTC_RX = @CAMBIAR_PRECIO_' +
        'OTC_RX, PORCENTO_DESCUENTO = @PORCENTO_DESCUENTO, POS_BUTTONS = ' +
        '@POS_BUTTONS,'
      
        #9#9'CAPTURAR_FIRMA = @CAPTURAR_FIRMA ,POS_CUADRE_ADMINISTRADOR = @' +
        'POS_CUADRE_ADMINISTRADOR,'
      
        #9#9'POS_VER_TOTAL_CASH = @POS_VER_TOTAL_CASH, POS_POST_SHOPPER = @' +
        'POS_POST_SHOPPER, '#9'   '
      
        #9#9'TIME_CARD = @TIME_CARD, POS_TAB_CANCEL = @POS_TAB_CANCEL,POS_A' +
        'DD_BUTTONS = @POS_ADD_BUTTONS, POS_REST_DELETEPRODUCT = @POS_RES' +
        'T_DELETEPRODUCT, '
      
        #9#9'POS_LIMITE_CAMBIO_PRECIO = @POS_LIMITE_CAMBIO_PRECIO, POS_CAMB' +
        'IAR_PRECIO_INV = @POS_CAMBIAR_PRECIO_INV, CELULAR = @CELULAR, '
      
        #9#9'HOME_PHONE = @HOME_PHONE, ADDRESS1 = @ADDRESS1, ADDRESS2 = @AD' +
        'DRESS2,'
      
        #9#9'CITY = @CITY, ZIP_CODE = @ZIP_CODE, STATE = @STATE, LOG_DATA =' +
        ' @LOG_DATA, ACTIVE = @ACTIVE, '
      
        #9#9'POS_CERRAR_CUADRE_ALIMPIRIMIR = @POS_CERRAR_CUADRE_ALIMPIRIMIR' +
        ', CAMBIARPASSWORD = @CAMBIARPASSWORD,'
      
        #9#9'RX_UPDATE_INV_BROWSE = @RX_UPDATE_INV_BROWSE, POS_MODIFY_PAYOU' +
        'T = @POS_MODIFY_PAYOUT, POS_DELETE_RX = @POS_DELETE_RX, PROCESS_' +
        'HANDHELD = @PROCESS_HANDHELD, '
      
        #9#9'CREATE_INVENTORY = @CREATE_INVENTORY, EDIT_INVENTORY = @EDIT_I' +
        'NVENTORY, DELETE_INVENTORY = @DELETE_INVENTORY, POS_COUPON = @PO' +
        'S_COUPON, MODIFY_HELP_FORM = @MODIFY_HELP_FORM'
      #9#9'WHERE USERNO = @USERNO;'#9' '
      #9#9'SET @USERNO_OUTPUT = @USERNO;'
      
        #9#9'EXECUTE INSERT_LOG '#39'USER MODIFIED'#39', '#39'M'#39', '#39#39', @USER,  '#39#39', 0,0,0' +
        ',0,0,0,0,0,'#39'P'#39', @NOTE,0,1;'
      #9'   end;'
      #9'end;'
      #9'commit;'
      'end;')
    Left = 2336
    Top = 464
  end
  object INSERT_SCANNED_DOC: TFDQuery
    AfterExecute = INSERT_SCANNED_DOCAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'create PROCEDURE [dbo].[INSERT_SCANNED_DOC]'
      '('
      '@SCANNED_DOC VARBINARY(MAX),'
      '@DESCRIPTION NCHAR(100),'
      '@CUSTOMERNUMBER INT,'
      '@Link_ID INT'
      ')'
      'AS'
      'DECLARE @RX_LINK INT'
      '  '
      'SET NOCOUNT ON'
      'BEGIN '
      '  begin transaction'
      '    INSERT INTO [dbo].[DOCUMENT]'
      '           ([Doc_Description]'
      '           ,[Doc_date]'
      '           ,[Tema]'
      '           ,[Link_ID]'
      '           ,[Doc_Name]'
      #9#9'   ,[CustomerNumber])'
      '     VALUES'
      '           (@DESCRIPTION,'
      '           GETDATE(),'
      '           '#39#39','
      '           @Link_ID,'
      '           @SCANNED_DOC,'
      #9'    @CUSTOMERNUMBER);'
      '  commit '
      'END')
    Left = 2496
    Top = 264
  end
  object FDQuery4: TFDQuery
    Connection = FDConnection1
    OnError = FDQuery4Error
    Left = 1480
    Top = 664
  end
  object TRANSFER_PROD: TFDQuery
    AfterExecute = TRANSFER_PRODAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'TRANSFER' +
        '_PROD'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[TRANSFER_PROD]('
      #9'[PRODUCTNO] [int] NULL,'
      #9'[TRANSFERID] [int] NULL,'
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      ' CONSTRAINT [PK_TRANSFER_PROD] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 2344
    Top = 1000
  end
  object TRANSFER_DETAIL: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'TRANSFER' +
        '_DETAIL'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[TRANSFER_DETAIL]('
      #9'[DETAILID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[UPC] [char](14) NULL,'
      #9'[COSTORDERED] [decimal](18, 2) NULL,'
      #9'[PRICE] [decimal](18, 2) NULL,'
      #9'[QTYORDERED] [decimal](18, 2) NULL,'
      #9'[QTYRECEIVED] [decimal](18, 2) NULL,'
      #9'[TAMANO] [decimal](18, 2) NULL,'
      #9'[PACKAGESIZE] [smallint] NULL,'
      #9'[TRANSFERID] [int] NULL,'
      #9'[COSTSENT] [decimal](18, 2) NULL,'
      #9'[PRODUCTO] [char](45) NULL,'
      #9'[ESPECIAL] [decimal](18, 2) NULL,'
      #9'[COMESPECIAL] [datetime] NULL,'
      #9'[TERMINAESPECIAL] [datetime] NULL,'
      #9'[RECETARIO] [char](1) NULL,'
      #9'[AWP] [decimal](18, 2) NULL,'
      #9'[TOTAL_VALUE] [decimal](18, 2) NULL,'
      #9'[PAQUETES_FRASCOS] [int] NULL,'
      #9'[FECHA_EXPIRACION] [datetime] NULL,'
      #9'[NDC] [nchar](19) NULL,'
      #9'[PRECIO_WIC] [decimal](18, 2) NULL,'
      #9'[LOTE] [nchar](12) NULL,'
      #9'[PRODUCTNO] [int] NULL,'
      ' CONSTRAINT [PK_TRANSFER_DETAIL] PRIMARY KEY CLUSTERED '
      '('
      #9'[DETAILID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 2344
    Top = 688
  end
  object TRANSFER_HEADER: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'TRANSFER' +
        '_HEADER'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[TRANSFER_HEADER]('
      #9'[TOTAL] [decimal](18, 2) NULL,'
      #9'[DESCRIPTION] [varchar](60) NULL,'
      #9'[TRANSFERID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[TRANSFERNUMBER] [varchar](30) NULL,'
      #9'[SENT] [decimal](18, 2) NULL,'
      #9'[TRANSFERDATE] [datetime] NOT NULL,'
      #9'[PARTNER] [int] NOT NULL,'
      #9'[SENTDATE] [datetime] NULL,'
      #9'[STATUS] [char](1) NOT NULL,'
      ' CONSTRAINT [PK_TRANSFER_HEADER] PRIMARY KEY CLUSTERED '
      '('
      #9'[TRANSFERID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 2344
    Top = 760
  end
  object TRANSFERED_PRODUCTS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'TRANSFER' +
        'ED_PRODUCTS'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[TRANSFERED_PRODUCTS]('
      #9'[TIPO] [char](3) NULL,'
      #9'[FECHA_EXPIRACION] [datetime] NULL,'
      #9'[CODIGO] [char](1) NULL,'
      #9'[COSTO] [decimal](18, 2) NULL,'
      #9'[RBP] [decimal](18, 2) NULL,'
      #9'[ESPECIAL] [decimal](18, 2) NULL,'
      #9'[DEPARTAMENTO] [smallint] NULL,'
      #9'[LOTE] [char](12) NULL,'
      #9'[PRECIO] [decimal](18, 2) NULL,'
      #9'[COMESPECIAL] [datetime] NULL,'
      #9'[TERMINAESPECIAL] [datetime] NULL,'
      #9'[PORCIENTODESCUENTO] [char](1) NULL,'
      #9'[ULTIMOCAMBIO] [char](30) NULL,'
      #9'[ULTIMAVENTA] [datetime] NULL,'
      #9'[QTYINVENTARIO] [decimal](18, 2) NULL,'
      #9'[CMAXINVENTARIO] [decimal](18, 2) NULL,'
      #9'[CMININVENTARIO] [decimal](18, 2) NULL,'
      #9'[CODIGOBARRA] [char](14) NOT NULL,'
      #9'[FOODITEM] [smallint] NULL,'
      #9'[NONEBC] [smallint] NULL,'
      #9'[NUMEROSUPLIDOR] [int] NULL,'
      #9'[EDITAR_PRECIO] [bit] NULL,'
      #9'[PRODUCTNO] [int] NULL,'
      #9'[SUB_DEPARTAMENTO] [smallint] NULL,'
      #9'[DESCRIPCION] [char](35) NULL,'
      #9'[ROUTEOFADMINISTRATION] [char](16) NULL,'
      #9'[CONTROLADO] [char](4) NULL,'
      #9'[STRENGTH] [char](25) NULL,'
      #9'[INFOADICIONAL] [char](25) NULL,'
      #9'[METRICSIZE] [decimal](18, 2) NULL,'
      #9'[CAUTION1] [smallint] NULL,'
      #9'[CAUTION2] [smallint] NULL,'
      #9'[CAUTION3] [smallint] NULL,'
      #9'[GENERICNAME] [char](60) NULL,'
      #9'[TXR] [char](8) NULL,'
      #9'[BRAND] [char](1) NULL,'
      #9'[GROUP_PRODUCTNO] [int] NULL,'
      #9'[RECETARIO] [char](1) NULL,'
      #9'[GROUP_QTY] [int] NULL,'
      #9'[PRECIO_CAJA] [decimal](18, 2) NULL,'
      #9'[QTY_CAJA] [decimal](18, 2) NULL,'
      #9'[DESCUENTO] [char](1) NULL,'
      #9'[IMAGE_CODE] [char](9) NULL,'
      #9'[PACKAGESIZE] [int] NULL,'
      #9'[TXR_EXTENSION] [char](14) NULL,'
      #9'[STATUS] [char](1) NULL,'
      #9'[TAXABLE] [char](1) NULL,'
      #9'[TAXABLE_ESTATAL] [char](1) NULL,'
      #9'[PRECIO2] [decimal](18, 2) NULL,'
      #9'[PO] [varchar](10) NULL,'
      #9'[isbn] [varchar](20) NULL,'
      #9'[SHOWINDIVIDUAL] [bit] NULL,'
      #9'[PRECIO_DACO] [decimal](18, 2) NULL,'
      #9'[NDC] [nchar](19) NULL,'
      #9'[PATROCINIO] [int] NULL,'
      #9'[METRIC_UNIT] [nchar](3) NULL,'
      #9'[ROBOT] [int] NULL,'
      #9'[ROBOT_NDC] [nchar](11) NULL,'
      #9'[ALCHEMY_PRODUCTID] [int] NULL,'
      #9'[MARKET_STATUS] [nchar](10) NULL,'
      #9'[OUTERPACKAGEUNIT] [nchar](10) NULL,'
      #9'[PAKAGE_ID] [int] NULL,'
      #9'[COBRAR_TAX] [int] NULL,'
      #9'[REVENUE_CODE] [nchar](4) NULL,'
      #9'[HCPCS] [nchar](5) NULL,'
      #9'[CASA_FARMACEUTICA] [char](150) NULL,'
      #9'[VERSION_DESCRIPTION] [nchar](150) NULL,'
      #9'[PAKAGE_DESCRIPTION] [nchar](150) NULL,'
      #9'[AllowControledRefills] [bit] NULL,'
      #9'[PRECIOVENTA2] [decimal](18, 2) NULL,'
      #9'[ESCANEAR_BARCODEALTERNO] [smallint] NULL,'
      #9'[PRICE_TABLE_ID] [int] NULL,'
      #9'[OVERRIDE_SYSTEM_DEFAULT_PRICE] [bit] NULL,'
      #9'[WAC_PRICE] [decimal](18, 2) NULL,'
      #9'[MAC_PRICE] [decimal](18, 2) NULL,'
      #9'[DIRECT_PRICE] [decimal](18, 2) NULL,'
      #9'[UC_PRICE] [decimal](18, 2) NULL,'
      #9'[TRANSFERID] [int] NULL,'
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      ' CONSTRAINT [PK_TRANSFERED_PRODUCTS] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY];'
      
        'ALTER TABLE [dbo].[TRANSFERED_PRODUCTS] ADD  CONSTRAINT [DF_TRAN' +
        'SFERED_PRODUCTS_TAXABLE]  DEFAULT ('#39'A'#39') FOR [TAXABLE];'
      
        'ALTER TABLE [dbo].[TRANSFERED_PRODUCTS] ADD  CONSTRAINT [DF__TRA' +
        'NSFERE__OVERR__1F0ADBF3]  DEFAULT ((0)) FOR [OVERRIDE_SYSTEM_DEF' +
        'AULT_PRICE]'
      'END;')
    Left = 2344
    Top = 832
  end
  object POS_ADD_EDIT_CLIENTES: TFDQuery
    AfterExecute = POS_ADD_EDIT_CLIENTESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[POS_ADD_EDIT_CLIENTES]'
      '@NOMBRE CHAR(12),'
      '@FECHANACIMIENTO DATETIME, '
      '@SEXO INT, '
      '@DIRECCION1 CHAR(30),'
      '@ULTTRANS DATETIME,'
      '@DEUDA REAL,'
      '@NUMEROCLIENTE INT,'
      '@APELLIDOPATERNO CHAR(15),'
      '@APELLIDOMATERNO CHAR(15),'
      '@TELEFONO CHAR(13),'
      '@CELULAR CHAR(13),'
      '@LAYAWAY REAL,'
      '@ESTADO CHAR(2),'
      '@AUSPICIO REAL,'
      '@SOCIO VARCHAR(12),'
      '@IDENTIFICACION CHAR (20),'
      '@LANGUAGE CHAR(7),'
      '@INFOADICIONAL VARCHAR (100),'
      '@CIUDAD CHAR(20),'
      '@ACCIONES FLOAT, '
      '@DEUDA_EXTENDIDA VARCHAR(1),'
      '@PATROCINIO FLOAT, '
      '@EMAIL NCHAR(80),'
      '@CODIGOPOSTAL NCHAR(15),'
      '@DIRECCION2 NCHAR(20), '
      '@VETERANO FLOAT,'
      '@NUMERO_REGISTRO_COMERCIANTE NCHAR(15),'
      '@NUMEROCLIENTE_OUTPUT INT OUTPUT'
      'AS'
      'DECLARE @NO_PLAN INT'
      'BEGIN'
      '    BEGIN TRANSACTION'
      #9#9'IF @NUMEROCLIENTE = 0 '
      #9#9#9'BEGIN '
      
        #9#9#9#9'INSERT INTO [DBO].[PACIENTES](NOMBRE, FECHANACIMIENTO, SEXO,' +
        ' DIRECCION1, ULTTRANS, DEUDA, '
      #9#9#9#9'APELLIDOPATERNO,'
      #9#9#9#9'APELLIDOMATERNO, TELEFONO, CELULAR, LAWAY,'
      #9#9#9#9'ESTADO, AUSPICIO, SOCIO, IDENTIFICACION, '
      #9#9#9#9'LANGUAGE, INFOADICIONAL,  '
      #9#9#9#9'CIUDAD, ACCIONES, DEUDA_EXTENDIDA, PATROCINIO,'
      #9#9#9'       EMAIL, CODIGOPOSTAL, DIRECCION2, VETERANO,'
      #9#9#9#9'NUMERO_REGISTRO_COMERCIANTE)'#9#9#9
      
        #9#9#9#9'VALUES(@NOMBRE, @FECHANACIMIENTO, @SEXO, @DIRECCION1, @ULTTR' +
        'ANS, '
      #9#9#9#9'0, @APELLIDOPATERNO, '
      #9#9#9#9'@APELLIDOMATERNO, @TELEFONO, @CELULAR, 0, @ESTADO,'
      #9#9#9#9'0, @SOCIO, @IDENTIFICACION,  '
      #9#9#9#9'@LANGUAGE, '
      #9#9#9#9'@INFOADICIONAL, @CIUDAD, 0, @DEUDA_EXTENDIDA, '
      #9#9#9#9'0,  '#9#9#9#9' '
      #9#9#9#9'@EMAIL, @CODIGOPOSTAL, @DIRECCION2,'
      #9#9#9#9'@VETERANO, @NUMERO_REGISTRO_COMERCIANTE);'
      #9#9#9#9'SET @NUMEROCLIENTE_OUTPUT = SCOPE_IDENTITY();'
      #9#9#9'END'
      #9#9'ELSE'
      #9#9#9'BEGIN'
      #9#9#9#9'UPDATE [dbo].[PACIENTES]'
      #9#9#9#9'   SET [NOMBRE] = @NOMBRE'
      
        #9#9#9#9#9'  ,[FECHANACIMIENTO] = @FECHANACIMIENTO, [SEXO] = @SEXO, [D' +
        'IRECCION1] = @DIRECCION1, '
      #9#9#9#9#9'   [ULTTRANS] = @ULTTRANS'
      #9#9#9#9#9'  ,[APELLIDOPATERNO] = @APELLIDOPATERNO'
      
        #9#9#9#9#9'  ,[APELLIDOMATERNO] = @APELLIDOMATERNO, [TELEFONO] = @TELE' +
        'FONO,[CELULAR] = @CELULAR'
      #9#9#9#9#9'  ,[ESTADO] = @ESTADO,  [SOCIO] = @SOCIO'
      #9#9#9#9#9'  ,[IDENTIFICACION] = @IDENTIFICACION '
      #9#9#9#9#9'  ,[LANGUAGE] = @LANGUAGE, [INFOADICIONAL] = @INFOADICIONAL'
      #9#9#9#9#9'  ,[CIUDAD] = @CIUDAD'#9#9#9#9#9' '
      #9#9#9#9#9'  ,[EMAIL] = @EMAIL, [CODIGOPOSTAL] = @CODIGOPOSTAL'
      #9#9#9#9#9'  ,[DIRECCION2] = @DIRECCION2'
      #9#9#9#9#9'  ,[VETERANO] = @VETERANO'
      
        #9#9#9#9#9'  ,[NUMERO_REGISTRO_COMERCIANTE] = @NUMERO_REGISTRO_COMERCI' +
        'ANTE'#9#9#9#9#9'  '
      #9#9#9#9' WHERE NUMEROCLIENTE = @NUMEROCLIENTE;'
      #9#9#9#9' SELECT @NUMEROCLIENTE_OUTPUT = @NUMEROCLIENTE;'
      #9#9#9'END;'
      #9#9'  COMMIT;'
      'END;')
    Left = 2344
    Top = 920
  end
  object LOCK_UNLOCK: TFDQuery
    AfterExecute = LOCK_UNLOCKAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[LOCK_UNLOCK]'
      '   ON [dbo].[OTC] '
      '   AFTER UPDATE, INSERT'
      'AS '
      'declare @REC_LOCKED BIT'
      'declare @NO_RX BIGINT'
      'declare @NO_CLIENTE INT'
      'declare @INSTANCIA INT'
      'BEGIN'
      '  SET NOCOUNT ON;'
      '  begin transaction'
      #9#9'IF ( UPDATE (RECORD_LOCKED)  )'
      #9#9'BEGIN '
      
        #9#9#9'SELECT @REC_LOCKED = RECORD_LOCKED, @NO_RX = NUMERORECETA, @N' +
        'O_CLIENTE = NUMEROCLIENTE, @INSTANCIA = INSTANCIA  FROM INSERTED' +
        ';'
      
        #9#9#9'Update PRESCRIPTIONS set RECORD_LOCKED = @REC_LOCKED, INSTANC' +
        'IA = @INSTANCIA WHERE NUMERORECETA = @NO_RX;'
      
        #9#9#9'Update PACIENTES set RECORD_LOCKED = @REC_LOCKED, INSTANCIA =' +
        ' @INSTANCIA WHERE NUMEROCLIENTE = @NO_CLIENTE;'
      #9#9'END;'
      '  commit;'
      'END')
    Left = 1800
    Top = 1024
  end
  object LOCK_UNLOCK_DEL: TFDQuery
    AfterExecute = LOCK_UNLOCK_DELAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[LOCK_UNLOCK_DEL]'
      '   ON [dbo].[OTC] '
      '   AFTER DELETE'
      'AS '
      'declare @NO_RX BIGINT'
      'declare @NO_CLIENTE INT'
      'BEGIN'
      '  SET NOCOUNT ON;'
      '  begin transaction'
      
        #9'SELECT @NO_RX = NUMERORECETA, @NO_CLIENTE = NUMEROCLIENTE  FROM' +
        ' deleted;'
      
        #9'Update PRESCRIPTIONS set RECORD_LOCKED = 0, INSTANCIA = 0 WHERE' +
        ' NUMERORECETA = @NO_RX;'
      
        #9'Update PACIENTES set RECORD_LOCKED = 0, INSTANCIA = 0 WHERE NUM' +
        'EROCLIENTE = @NO_CLIENTE;'
      '  commit;'
      'END')
    Left = 1624
    Top = 1024
  end
  object INSERT_PRINT_QUERIES: TFDQuery
    AfterExecute = INSERT_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER[dbo].[INSERT_PRINT_QUERIES] ON [dbo].[OTC]'
      '   FOR INSERT'
      'AS '
      'SET NOCOUNT ON'
      'DECLARE @OTCNUMBER INT'
      'DECLARE @ATENDIDAPOR CHAR(4)'
      'DECLARE @IMPRIMIR CHAR(1)'
      'begin'
      #9'begin transaction'
      
        #9'Select @OTCNUMBER = OTCNUMBER, @ATENDIDAPOR = ATENDIDOPOR, @IMP' +
        'RIMIR = PRINT_Q FROM INSERTED;'
      #9'IF @IMPRIMIR = '#39'T'#39' '
      #9'begin'
      #9#9'INSERT INTO [dbo].[PRINT_QUERIES]'
      #9#9'([RX_ID]'
      #9#9',[COPIES]'
      #9#9',[RX_OTC]'
      #9#9',[LABEL_NAME]'
      #9#9',[TYPIST]'
      #9#9',[PRINTTOSCREEN])'
      #9#9'VALUES'
      #9#9'(@OTCNUMBER, 1, '#39'RX'#39', '#39'DEFAULT'#39', @ATENDIDAPOR, 0);  '
      #9'end;'
      #9'commit'
      'end;')
    Left = 488
    Top = 128
  end
  object qObjects: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT NAME FROM sys.objects')
    Left = 2504
    Top = 368
  end
  object dspObjects: TDataSetProvider
    DataSet = qObjects
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 2584
    Top = 368
  end
  object dsObjects: TDataSource
    Left = 2664
    Top = 368
  end
  object cdsObjects: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspObjects'
    Left = 2736
    Top = 368
    object cdsObjectsNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 128
    end
  end
  object qProcedures: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM sys.procedures '
      'where is_ms_shipped = 0;')
    Left = 2504
    Top = 448
  end
  object dspProcedures: TDataSetProvider
    DataSet = qProcedures
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 2592
    Top = 448
  end
  object cdsProcedures: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcedures'
    Left = 2744
    Top = 448
    object cdsProceduresname: TWideStringField
      FieldName = 'name'
      Required = True
      Size = 128
    end
    object cdsProceduresobject_id: TIntegerField
      FieldName = 'object_id'
      Required = True
    end
    object cdsProceduresprincipal_id: TIntegerField
      FieldName = 'principal_id'
    end
    object cdsProceduresschema_id: TIntegerField
      FieldName = 'schema_id'
      Required = True
    end
    object cdsProceduresparent_object_id: TIntegerField
      FieldName = 'parent_object_id'
      Required = True
    end
    object cdsProcedurestype: TStringField
      FieldName = 'type'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object cdsProcedurestype_desc: TWideStringField
      FieldName = 'type_desc'
      Size = 60
    end
    object cdsProcedurescreate_date: TSQLTimeStampField
      FieldName = 'create_date'
      Required = True
    end
    object cdsProceduresmodify_date: TSQLTimeStampField
      FieldName = 'modify_date'
      Required = True
    end
    object cdsProceduresis_ms_shipped: TBooleanField
      FieldName = 'is_ms_shipped'
      ReadOnly = True
      Required = True
    end
    object cdsProceduresis_published: TBooleanField
      FieldName = 'is_published'
      ReadOnly = True
      Required = True
    end
    object cdsProceduresis_schema_published: TBooleanField
      FieldName = 'is_schema_published'
      ReadOnly = True
      Required = True
    end
    object cdsProceduresis_auto_executed: TBooleanField
      FieldName = 'is_auto_executed'
      ReadOnly = True
      Required = True
    end
    object cdsProceduresis_execution_replicated: TBooleanField
      FieldName = 'is_execution_replicated'
      ReadOnly = True
    end
    object cdsProceduresis_repl_serializable_only: TBooleanField
      FieldName = 'is_repl_serializable_only'
      ReadOnly = True
    end
    object cdsProceduresskips_repl_constraints: TBooleanField
      FieldName = 'skips_repl_constraints'
      ReadOnly = True
    end
  end
  object dsProcedures: TDataSource
    DataSet = cdsProcedures
    Left = 2664
    Top = 448
  end
  object qTriggers: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT  '
      '    name,'
      '    is_instead_of_trigger'
      'FROM '
      '    sys.triggers  '
      'WHERE '
      '    type = '#39'TR'#39';')
    Left = 2504
    Top = 536
  end
  object dspTriggers: TDataSetProvider
    DataSet = qTriggers
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 2592
    Top = 536
  end
  object cdsTriggers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTriggers'
    Left = 2752
    Top = 536
    object cdsTriggersname: TWideStringField
      FieldName = 'name'
      Required = True
      Size = 128
    end
    object cdsTriggersis_instead_of_trigger: TBooleanField
      FieldName = 'is_instead_of_trigger'
      ReadOnly = True
      Required = True
    end
  end
  object dsTriggers: TDataSource
    DataSet = cdsTriggers
    Left = 2664
    Top = 536
  end
  object qViews: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT  '
      '   NAME'
      'FROM '
      '    sys.views  '
      'WHERE '
      '    is_ms_shipped = 0;')
    Left = 2512
    Top = 624
  end
  object dspViews: TDataSetProvider
    DataSet = qViews
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 2592
    Top = 624
  end
  object dsViews: TDataSource
    DataSet = cdsViews
    Left = 2680
    Top = 624
  end
  object cdsViews: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspViews'
    Left = 2760
    Top = 624
    object cdsViewsNAME: TWideStringField
      FieldName = 'NAME'
      Required = True
      Size = 128
    end
  end
  object qFunctions: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT name, definition, type_desc '
      '  FROM sys.sql_modules m '
      'INNER JOIN sys.objects o '
      '        ON m.object_id=o.object_id'
      'WHERE type_desc like '#39'%function%'#39)
    Left = 2520
    Top = 720
  end
  object dspFunctions: TDataSetProvider
    DataSet = qFunctions
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 2600
    Top = 720
  end
  object cdsFunctions: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFunctions'
    Left = 2760
    Top = 720
    object cdsFunctionsname: TWideStringField
      FieldName = 'name'
      Required = True
      Size = 128
    end
    object cdsFunctionsdefinition: TWideMemoField
      FieldName = 'definition'
      ReadOnly = True
      BlobType = ftWideMemo
      Size = 1073741823
    end
    object cdsFunctionstype_desc: TWideStringField
      FieldName = 'type_desc'
      Size = 60
    end
  end
  object dsFunctions: TDataSource
    DataSet = cdsFunctions
    Left = 2680
    Top = 720
  end
  object qConstrain: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    TableName = t.Name,'
      '    ColumnName = c.Name,'
      '    dc.Name,'
      '    dc.definition'
      'FROM sys.tables t'
      
        'INNER JOIN sys.default_constraints dc ON t.object_id = dc.parent' +
        '_object_id'
      
        'INNER JOIN sys.columns c ON dc.parent_object_id = c.object_id AN' +
        'D c.column_id = dc.parent_column_id'
      ''
      'where t.Name = '#39'inventarioPiso'#39
      'ORDER BY t.Name')
    Left = 2520
    Top = 816
  end
  object dspConstrain: TDataSetProvider
    DataSet = qConstrain
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 2608
    Top = 816
  end
  object dsConstrain: TDataSource
    Left = 2688
    Top = 816
  end
  object cdsConstrains: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConstrain'
    Left = 2776
    Top = 816
    object cdsConstrainsTableName: TWideStringField
      FieldName = 'TableName'
      Required = True
      Size = 128
    end
    object cdsConstrainsColumnName: TWideStringField
      FieldName = 'ColumnName'
      Size = 128
    end
    object cdsConstrainsName: TWideStringField
      FieldName = 'Name'
      Required = True
      Size = 128
    end
    object cdsConstrainsdefinition: TWideMemoField
      FieldName = 'definition'
      ReadOnly = True
      BlobType = ftWideMemo
      Size = 1073741823
    end
  end
  object INVENTORY_CART: TFDQuery
    AfterExecute = INVENTORY_CARTAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[INVENTORY_CART]'
      'AS'
      
        'SELECT        dbo.INVENTORY_IMAGE.PROD_IMAGE, dbo.INVENTARIOPISO' +
        '.PRECIO, dbo.INVENTARIOPISO.COSTO, dbo.INVENTARIOPISO.PRODUCTNO,' +
        ' dbo.INVENTARIOPISO.DESCRIPCION, dbo.INVENTARIOPISO.NOTE'
      'FROM            dbo.INVENTARIOPISO INNER JOIN'
      
        '                         dbo.INVENTORY_IMAGE ON dbo.INVENTARIOPI' +
        'SO.PRODUCTNO = dbo.INVENTORY_IMAGE.PRODUCT_ID')
    Left = 2848
    Top = 624
  end
  object INVENTORY_IMAGE: TFDQuery
    AfterExecute = INVENTORY_IMAGEAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'INVENTOR' +
        'Y_IMAGE'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[INVENTORY_IMAGE]('
      #9'[PRODUCT_ID] [int] NOT NULL,'
      #9'[PROD_IMAGE] [image] NULL,'
      ' CONSTRAINT [PK_INVENTORY_IMAGE] PRIMARY KEY CLUSTERED '
      '('
      #9'[PRODUCT_ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]'
      'END;')
    Left = 2976
    Top = 368
  end
  object INSERT_EDIT_SHOPPINGCART_DETAIL: TFDQuery
    AfterExecute = INSERT_EDIT_SHOPPINGCART_DETAILAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_EDIT_SHOPPINGCART_DETAIL] '
      #9'-- Add the parameters for the stored procedure here'
      ''
      '@product_no int, --'
      '@qty decimal (18, 2),--'
      '@customer nchar (45),--'
      '@telefono nchar (13),--'
      '@cartIdLocal int output,'
      '@numberOfItems int output'
      'AS'
      'declare @recordcount int'
      'declare @id int'
      'declare @retail_price decimal (18, 2)'
      'declare @product_desc nchar (35)'
      'declare @food bit'
      'declare @tax_estatal char(1)'
      'declare @tax_municipal char (1)'
      'declare @total_value decimal (18,2)'
      'declare @NoItems integer'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      '    -- Insert statements for procedure here'
      #9'SELECT @NoItems = COUNT(*)  FROM INVENTARIOPISO '
      
        '        WHERE GETDATE() BETWEEN COMESPECIAL AND TERMINAESPECIAL ' +
        'and PRODUCTNO = @product_no; '
      #9'if @NoItems = 0 '
      #9'begin'
      
        #9#9'SELECT @product_desc = descripcion, @retail_price = PRECIO, @f' +
        'ood = FOODITEM, '
      
        #9#9'@tax_estatal = TAXABLE_ESTATAL, @tax_municipal = TAXABLE from ' +
        'INVENTARIOPISO where PRODUCTNO = @product_no;'
      #9'end'
      #9'else'
      #9'begin'
      
        #9#9'SELECT @product_desc = descripcion, @retail_price = ESPECIAL, ' +
        '@food = FOODITEM, '
      
        #9#9'@tax_estatal = TAXABLE_ESTATAL, @tax_municipal = TAXABLE from ' +
        'INVENTARIOPISO where PRODUCTNO = @product_no;'
      #9'end;'
      #9'SET @cartIdLocal = 0;'
      
        #9'EXEC INSERT_EDIT_SHOPPINGCART_HEADER @customer, @telefono, @car' +
        'tid = @cartIdLocal output'
      ''
      
        #9'Select @id = id from CART_DETAIL where CART_ID = @cartIdLocal a' +
        'nd PRODUCT_NO = @product_no;'
      
        #9'SELECT @recordcount = COUNT (*) from CART_DETAIL WHERE (CART_ID' +
        ' = @cartIdLocal) and (PRODUCT_NO = @product_no)'
      #9'IF @recordcount = 0'
      #9'BEGIN'
      
        #9'  INSERT INTO CART_DETAIL (CART_ID, PRODUCT_DESC, PRODUCT_NO, R' +
        'ETAIL_PRICE, QTY, FOOD, TAX_ESTATAL, TAX_MUNICIPAL, TOTAL_VALUE)'
      #9'  VALUES'
      
        #9'  (@cartIdLocal, @product_desc, @product_no, @retail_price, @qt' +
        'y, @food, @tax_estatal, @tax_municipal, @retail_price * @qty)'
      #9'END'
      #9'ELSE'
      #9'BEGIN'
      
        #9'  UPDATE CART_DETAIL SET product_desc = @product_desc, PRODUCT_' +
        'NO = @product_no, RETAIL_PRICE = @retail_price, QTY = @qty, FOOD' +
        ' = @food, '
      
        #9'         TAX_ESTATAL = @tax_estatal, TAX_MUNICIPAL = @tax_munic' +
        'ipal, TOTAL_VALUE = (@retail_price * @qty) WHERE ID = @id;'
      #9'END;'
      
        #9'EXEC CALC_TOTALS_CART_HEADER @cartIdLocal, @NO_ITEMS = @numberO' +
        'fItems OUTPUT;'
      #9'COMMIT TRANSACTION;'
      'END')
    Left = 2976
    Top = 496
  end
  object INSERT_EDIT_SHOPPINGCART_HEADER: TFDQuery
    AfterExecute = INSERT_EDIT_SHOPPINGCART_HEADERAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_EDIT_SHOPPINGCART_HEADER]'
      '@customer nchar (45),'
      '@telefono nchar (13),'
      '@cartid int output'
      'AS'
      'DECLARE @RECORD_COUNT int'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      ''
      '    -- Insert statements for procedure here'#9
      #9'BEGIN transaction'
      
        #9'  Select @RECORD_COUNT = count (*) from CART_HEADER Where (CUST' +
        'OMER = rtrim(@customer)) And (TELEFONO = rtrim(@telefono) And (O' +
        'RDER_STATUS = 0));'
      #9'  IF @RECORD_COUNT = 0 '
      #9'  begin'
      #9'    insert into CART_HEADER (DATE,  CUSTOMER, TELEFONO) '
      #9#9'VALUES '
      #9#9'(GETDATE(),@customer, @telefono)'
      #9#9'SELECT @cartid = IDENT_CURRENT ('#39'CART_HEADER'#39');'
      #9'  end;'
      #9'  else'
      #9'  begin'
      
        #9'    select @cartid = ID from CART_HEADER WHERE (CUSTOMER = @cus' +
        'tomer) And (TELEFONO = @telefono);'
      #9'  end;'
      #9'commit;'
      'END')
    Left = 2976
    Top = 576
  end
  object CART_DETAIL: TFDQuery
    AfterExecute = CART_DETAILAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'CART_DET' +
        'AIL'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[CART_DETAIL]('
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[CART_ID] [int] NULL,'
      #9'[PRODUCT_DESC] [nchar](35) NULL,'
      #9'[PRODUCT_NO] [int] NULL,'
      #9'[RETAIL_PRICE] [decimal](18, 2) NULL,'
      #9'[QTY] [decimal](18, 2) NULL,'
      #9'[FOOD] [bit] NULL,'
      #9'[TAX_ESTATAL] [bit] NULL,'
      #9'[TAX_MUNICIPAL] [bit] NULL,'
      #9'[TOTAL_VALUE] [decimal](18, 2) NULL,'
      #9'[REGTOTAL] [decimal](18, 2) NULL,'
      #9'[DISCOUNT] [decimal](18, 2) NULL,'
      ' CONSTRAINT [PK_CART_DETAIL] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 2976
    Top = 648
  end
  object CART_HEADER: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'CART_HEA' +
        'DER'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[CART_HEADER]('
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[DATE] [datetime] NULL,'
      #9'[TOTAL] [decimal](18, 2) NULL,'
      #9'[NUMBER_OF_ITEMS] [int] NULL,'
      #9'[STATE_TAX] [decimal](18, 2) NULL,'
      #9'[MUNICIPAL_TAX] [decimal](18, 2) NULL,'
      #9'[CUSTOMER] [nchar](45) NULL,'
      #9'[TELEFONO] [nchar](13) NULL,'
      #9'[EMAIL] [nchar](80) NULL,'
      #9'[ADDRESS1] [nchar](30) NULL,'
      #9'[ADDRESS2] [nchar](30) NULL,'
      #9'[TOWN] [nchar](20) NULL,'
      #9'[ZIPCODE] [nchar](13) NULL,'
      #9'[STATE] [nchar](2) NULL,'
      #9'[SUBTOTAL] [decimal](18, 2) NULL,'
      #9'[DELIVER] [bit] NULL,'
      #9'[PICKUP_DELIVER_TIME] [datetime] NULL,'
      #9'[TAX_PROCESSED_FOOD] [decimal](18, 2) NULL,'
      #9'[ORDER_STATUS] [int] NULL,'
      #9'[TOTAL_TAX] [decimal](18, 2) NULL,'
      #9'[FOODTOTAL] [decimal](18, 2) NULL,'
      #9'[TAX_FOOD_ESTATAL] [decimal](18, 2) NULL,'
      #9'[TAX_FOOD_MUNICIPAL] [decimal](18, 2) NULL,'
      #9'[TOTAL_DISCOUNT] [decimal](18, 2) NULL,'
      #9'[REGTOTAL] [decimal](18, 2) NULL,'
      ' CONSTRAINT [PK_CART_HEADER] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY];'
      
        'ALTER TABLE [dbo].[CART_HEADER] ADD  CONSTRAINT [DF_CART_HEADER_' +
        'DATE]  DEFAULT (getdate()) FOR [DATE];'
      
        'ALTER TABLE [dbo].[CART_HEADER] ADD  CONSTRAINT [DF_CART_HEADER_' +
        'ORDER_STATUS]  DEFAULT ((0)) FOR [ORDER_STATUS];'
      'END;')
    Left = 2976
    Top = 720
  end
  object ADD_EDIT_CONTROLED_LOG: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[ADD_EDIT_CONTROLED_LOG] '
      '@RX_NUMBER BIGINT, '
      '@patient_supplier nchar(50),'
      '@prescriber nchar(50),'
      '@prescriber_id nchar (15),'
      '@batch nchar(15),'
      '@expires date, '
      '@balance decimal(18, 2), '
      '@drug nchar(30),'
      '@ndc nchar(11),'
      '@employee nchar(3),'
      '@schedule_type nchar(4),'
      '@id integer,'
      '@prescriber_No int,'
      '@patient_no int,'
      '@qty decimal(18,2),'
      '@PATIENT_SUPPLIER_ID INT,'
      '@OTCNUMBER INT,'
      '@QTY_PURCHASED decimal(18,2),'
      '@REFILL_DISPENSED decimal(18,2)'
      'AS'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      #9'if @id = 0 '
      #9'begin'
      #9#9'INSERT INTO [dbo].[CONTROLED_LOG] '
      #9#9#9'(DATE'
      #9#9#9',RX_NUMBER'
      #9#9#9',PATIENT_SUPPLIER'
      #9#9#9',PRESCRIBER'
      #9#9#9',PRESCRIBER_ID'
      #9#9#9',BATCH'
      #9#9#9',EXPIRES'
      #9#9#9',BALANCE'
      #9#9#9',DRUG'
      #9#9#9',NDC'
      #9#9#9',EMPLOYEE'
      #9#9#9',SCHEDULE_TYPE'
      #9#9#9',PRESCRIBER_NUMBER'
      #9#9#9',PATIENT_NUMBER'
      #9#9#9',QTY_SOLD'
      #9#9#9',PATIENT_SUPPLIER_ID'
      #9#9#9',OTCNUMBER'
      #9#9#9',QTY_PURCHASED'
      #9#9#9',REFILL_DISPENSED)'
      #9#9'VALUES'
      #9#9#9'(GETDATE() , '
      #9#9#9'@RX_NUMBER'
      #9#9#9',@patient_supplier'
      #9#9#9',@prescriber'
      #9#9#9',@prescriber_id'
      #9#9#9',@batch'
      #9#9#9',@expires'
      #9#9#9',@balance'
      #9#9#9',@drug'
      #9#9#9',@ndc'
      #9#9#9',@employee'
      #9#9#9',@schedule_type'
      #9#9#9',@prescriber_No'
      #9#9#9',@patient_no'
      #9#9#9',@qty'
      #9#9#9',@PATIENT_SUPPLIER_ID'
      #9#9#9',@OTCNUMBER'
      #9#9#9',@QTY_PURCHASED'
      #9#9#9',@REFILL_DISPENSED)'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'UPDATE CONTROLED_LOG SET RX_NUMBER = @RX_NUMBER, '
      #9#9'PATIENT_SUPPLIER = @patient_supplier, '
      #9#9'PRESCRIBER = @prescriber,'
      #9#9'PRESCRIBER_ID = @prescriber_id, '
      #9#9'BATCH = @batch, '
      #9#9'EXPIRES = @expires, '
      #9#9'BALANCE = @balance, '
      #9#9'DRUG = @drug, '
      #9#9'NDC = @ndc, '
      #9#9'EMPLOYEE = @employee, '
      #9#9'SCHEDULE_TYPE = @schedule_type,'
      #9#9'QTY_SOLD = @qty,'
      #9#9'PATIENT_SUPPLIER_ID = @PATIENT_SUPPLIER_ID,'
      #9#9'OTCNUMBER = @OTCNUMBER,'
      #9#9'QTY_PURCHASED = @QTY_PURCHASED'
      #9#9'WHERE id = @id;'
      #9'end;'
      #9'Commit;'
      'END')
    Left = 2768
    Top = 968
  end
  object CALC_CART_TOTAL: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[CALC_CART_TOTAL] '
      '   ON  [dbo].[CART_DETAIL]'
      '   FOR INSERT,UPDATE,DELETE'
      'AS '
      'DECLARE @TOTAL_VALUE FLOAT;'
      'DECLARE @SUB_TOTAL FLOAT;'
      'DECLARE @CART_ID INT;'
      'DECLARE @NO_ITEMS INT;'
      'set nocount on'
      'BEGIN'
      #9'begin transaction'
      #9'  IF UPDATE (QTY) select @CART_ID = CART_ID FROM INSERTED'
      #9'  ELSE'
      #9'  select @CART_ID = CART_ID FROM deleted;'
      ''
      
        #9'  SELECT  @TOTAL_VALUE = ISNULL(sum(TOTAL_VALUE), 0), @SUB_TOTA' +
        'L = ISNULL(sum(RETAIL_PRICE), 0), @NO_ITEMS = isNull(SUM(QTY), 0' +
        ') FROM CART_DETAIL WHERE CART_ID = @CART_ID;'#9
      
        #9'  Update CART_HEADER set TOTAL = @TOTAL_VALUE, NUMBER_OF_ITEMS ' +
        '= @NO_ITEMS, SUBTOTAL = @SUB_TOTAL WHERE ID = @CART_ID;'
      #9'commit'
      'END')
    Left = 2344
    Top = 608
  end
  object INSERT_EDIT_PRODUCT_IMAGE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_EDIT_PRODUCT_IMAGE] '
      #9'@productId int,'
      '@productImage image'
      'AS'
      'DECLARE @recordCount int'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      
        #9'SELECT @recordcount = COUNT (*) from INVENTORY_IMAGE WHERE (PRO' +
        'DUCT_ID = @productId)'
      #9'IF @recordcount = 0'
      #9'BEGIN'
      
        #9'  INSERT INTO INVENTORY_IMAGE (PRODUCT_ID, PROD_IMAGE) VALUES (' +
        '@productId, @productImage)'
      #9'end'
      #9'else '
      #9'begin'
      
        #9'  Update INVENTORY_IMAGE SET PROD_IMAGE = @productImage WHERE P' +
        'RODUCT_ID = @productId;'
      #9'end; '
      #9'commit;'
      'END')
    Left = 2984
    Top = 440
  end
  object FDQuery5: TFDQuery
    Connection = FDConnection1
    OnError = FDQuery5Error
    Left = 1632
    Top = 464
  end
  object CALC_TOTALS_CART_HEADER: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'Create PROCEDURE [dbo].[CALC_TOTALS_CART_HEADER] @CART_ID INTEGE' +
        'R, @NO_ITEMS INTEGER OUTPUT'
      'AS'
      '  SET NOCOUNT ON'
      #9'DECLARE @TAX_SERVICIO DECIMAL(18,2);'
      #9'DECLARE @TAXABLE_QTY_Servicio DECIMAL(18,2);'
      #9'DECLARE @INTotal DECIMAL(18,2);'
      #9'DECLARE @INRTotal DECIMAL(18,2);'
      #9'DECLARE @INFTotal DECIMAL(18,2);'
      #9'DECLARE @INItems Integer;'
      #9'DECLARE @INTax DECIMAL(18,2);'
      #9'DECLARE @TAXAMOUNT DECIMAL(18,2);'
      #9'DECLARE @TAXABLE_QTY_MUNICIPAL DECIMAL(18,2);'
      #9'DECLARE @TAXABLE_QTY_Estatal DECIMAL(18,2);'
      #9'DECLARE @InTotal_Estatal DECIMAL(18,2);'
      #9'DECLARE @TotalFinal DECIMAL(18,2);'
      #9'DECLARE @Estatal DECIMAL(18,2);'
      #9'DECLARE @Municipal DECIMAL(18,2);'
      #9'DECLARE @TAX_FOOD_MUNICIPAL_QTY DECIMAL(18,2);'
      #9'DECLARE @TAX_FOOD_ESTATAL_QTY DECIMAL(18,2);'
      #9'DECLARE @TMUNICIPAL_FOOD DECIMAL(18,2);'
      #9'DECLARE @TESTATAL_FOOD DECIMAL(18,2);'
      #9'DECLARE @FOOD VARCHAR(1);'
      #9'DECLARE @TOTAL_DISCOUNT DECIMAL(18,2);'
      #9'DECLARE @TAXRATE_Estatal DECIMAL(18,2);'
      #9'DECLARE @TAXRATE_Municipal DECIMAL(18,2);'
      #9'DECLARE @TAXFROM DECIMAL(18,2);'
      #9'DECLARE @SUBTOTAL DECIMAL(18,2);'
      #9'DECLARE @TAX_PROCESSED_FOOD DECIMAL(18,2);'
      #9'DECLARE @NO_RECORDS INTEGER;'
      'begin'
      #9'begin transaction'
      
        #9#9'Select @NO_RECORDS = COUNT(*) from CART_DETAIL where CART_ID =' +
        ' @CART_ID;'
      #9#9'if @NO_RECORDS > 0'
      #9#9'begin'
      
        #9#9#9'SELECT @TAXRATE_Estatal = TAX_RATE_ESTATAL, @TAXRATE_Municipa' +
        'l = TAX_RATE, @TAXFROM = TAX_RATE_FROM, @TAX_PROCESSED_FOOD = TA' +
        'X_PROCESSED_FOOD FROM CREDITDEBITSETUP; '
      
        #9#9#9'select @TAXABLE_QTY_Estatal = ISNULL(sum(TOTAL_VALUE), 0) fro' +
        'm'
      #9#9#9'CART_DETAIL where CART_ID = @CART_ID and Tax_Estatal = 1;'
      #9#9#9'/* Cantidad que se cobrara Tax Municipal*/'
      
        #9#9#9'select @TAXABLE_QTY_MUNICIPAL = ISNULL(sum(TOTAL_VALUE), 0) f' +
        'rom'
      #9#9#9'CART_DETAIL where CART_ID = @CART_ID and Tax_Municipal = 1;'
      ''
      
        #9#9#9'select @TAX_FOOD_MUNICIPAL_QTY = ISNULL(sum(TOTAL_VALUE), 0) ' +
        'from'
      
        #9#9#9'CART_DETAIL where CART_ID = @CART_ID and Tax_Municipal = 1 an' +
        'd Food = 1;'
      
        #9#9#9'select @TAX_FOOD_ESTATAL_QTY = ISNULL(sum(TOTAL_VALUE), 0) fr' +
        'om'
      
        #9#9#9'CART_DETAIL where CART_ID = @CART_ID and Tax_Estatal = 1 and ' +
        'Food = 1;'
      ''
      ''
      #9#9#9'/* Tax por servicios */'
      
        #9#9#9'--select @TAXABLE_QTY_Servicio = ISNULL(sum(TOTAL_VALUE), 0) ' +
        'from'
      #9#9#9'--CART_DETAIL where CART_ID = @CART_ID and TAX_SERVICIO = 1;'
      #9#9#9'if @TAXABLE_QTY_Servicio <> 0'
      #9#9#9'begin'
      
        #9#9#9'select @TAX_SERVICIO = Round(ISNULL(@TAXABLE_QTY_Servicio,0) ' +
        '* .04, 2);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'select @TAX_SERVICIO = 0; '
      ''
      #9#9#9'/*  */'
      ''
      
        #9#9#9'select @InRTotal = sum(regtotal), @InItems = sum(qty), @TOTAL' +
        '_DISCOUNT = sum(DISCOUNT) from'
      #9#9#9'CART_DETAIL where CART_ID = @CART_ID;'
      
        #9#9#9'SELECT  @NO_ITEMS = ISNULL(NUMBER_OF_ITEMS, 0) FROM CART_HEAD' +
        'ER where ID = @CART_ID;'
      #9#9#9'select @InFTotal = sum(TOTAL_VALUE) from CART_DETAIL where'
      #9#9#9'CART_ID = @CART_ID;'
      ''
      #9#9#9'/* CALCULAR TAX */'
      #9#9#9'if (@TAXABLE_QTY_Estatal <> 0) and (@TAXFROM > 0)'
      #9#9#9'begin'
      
        #9#9#9'select @Estatal = Round(ISNULL(@TAXABLE_QTY_Estatal,0) * @TAX' +
        'RATE_Estatal, 2);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'Select @Estatal = 0;'
      ''
      ''
      #9#9#9'if (@TAXABLE_QTY_MUNICIPAL <> 0) and (@TAXFROM > 0)'
      #9#9#9'begin'
      
        #9#9#9'select @MUNICIPAL = Round(ISNULL(@TAXABLE_QTY_MUNICIPAL,0) * ' +
        '@TAXRATE_Municipal, 2);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'select @MUNICIPAL = 0;'
      #9#9#9'/*********************/'
      ' '
      #9#9#9'/*********************/'
      ''
      #9#9#9'/* CALCULAR TAX FOOD */'
      #9#9#9'if (@TAX_FOOD_ESTATAL_QTY > 0)'
      #9#9#9'begin'
      
        #9#9#9'  select @TESTATAL_FOOD = ISNULL(@TAX_FOOD_ESTATAL_QTY,0) * I' +
        'SNULL(@TAX_PROCESSED_FOOD,0);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'  Select @TESTATAL_FOOD = 0;'
      ''
      #9#9#9'if (@TAX_FOOD_MUNICIPAL_QTY > 0)'
      #9#9#9'begin'
      
        #9#9#9#9'select @TMUNICIPAL_FOOD = Round(ISNULL(@TAX_FOOD_MUNICIPAL_Q' +
        'TY,0) * @TAXRATE_Municipal, 2);'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'select @TMUNICIPAL_FOOD = 0;'
      #9#9#9'/************************/'
      #9#9#9'Select @SUBTOTAL = @InFTotal;'
      
        #9#9#9'Select @TotalFinal = @InFTotal + @MUNICIPAL + @ESTATAL + @TAX' +
        '_SERVICIO;'
      #9#9#9
      #9#9#9'UPDATE CART_HEADER'
      
        #9#9#9'set Total = @TotalFinal, RegTotal = @INRTotal, FoodTotal = @I' +
        'nFTotal, '
      #9#9#9'SUBTOTAL = @SUBTOTAL,  '
      #9#9#9'MUNICIPAL_TAX = @MUNICIPAL,  STATE_TAX = @ESTATAL, '
      #9#9#9'--TAX_SERVICIO = Round(@TAX_SERVICIO, 2),'
      
        #9#9#9'TOTAL_TAX = @MUNICIPAL + @ESTATAL + @TESTATAL_FOOD + @TMUNICI' +
        'PAL_FOOD + @TESTATAL_FOOD, '
      #9#9#9'TAX_FOOD_ESTATAL = @TESTATAL_FOOD, '
      
        #9#9#9'TAX_FOOD_MUNICIPAL = @TMUNICIPAL_FOOD, TOTAL_DISCOUNT = @TOTA' +
        'L_DISCOUNT,'
      #9#9#9'NUMBER_OF_ITEMS = @NO_ITEMS'
      #9#9#9'where ID = @CART_ID'
      ''
      #9#9'end;'#9#9
      #9'commit'
      'END;')
    Left = 2520
    Top = 904
  end
  object IdSNTP1: TIdSNTP
    Host = 'se.pool.ntp.org'
    Port = 123
    Left = 832
    Top = 24
  end
  object Index_Directories: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE NONCLUSTERED INDEX [NC_SPI] ON [dbo].[Directory61]'
      '('
      #9'[SPI] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];'
      ''
      'CREATE NONCLUSTERED INDEX [NC_NPI] ON [dbo].[Directory61]'
      '('
      #9'[NPI] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];'
      ''
      'CREATE NONCLUSTERED INDEX [NC_DEA] ON [dbo].[Directory61]'
      '('
      #9'[DEA] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];'
      ''
      
        'CREATE NONCLUSTERED INDEX [NC_StateLicenseNumber] ON [dbo].[Dire' +
        'ctory61]'
      '('
      #9'[StateLicenseNumber] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];'
      ''
      'CREATE NONCLUSTERED INDEX [NC_LastName] ON [dbo].[Directory61]'
      '('
      #9'[LastName] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];')
    Left = 840
    Top = 632
  end
  object INSERT_FROMCART_TOTRANSACTION: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE  procedure [dbo].[INSERT_FROMCART_TOTRANSACTION] @ID INT'
      'AS '
      'declare @NUMBER_OF_ITEMS int;'
      'declare @ADDRESS1 nchar(30)'
      'declare @ADDRESS2 nchar(30)'
      'declare @CITY NCHAR(20)'
      'declare @ZIPCODE NCHAR(13)'
      'declare @STATE NCHAR(2)'
      'declare @CUSTOMER NCHAR(45)'
      'declare @TELEPHONE NCHAR(13)'
      'declare @SUBTOTAL DECIMAL(18,2)'
      'declare @TOTAL DECIMAL(18,2)'
      'declare @STATE_TAX DECIMAL(18,2)'
      'declare @MUNICIPAL_TAX DECIMAL(18,2)'
      'declare @TOTAL_TAX DECIMAL(18,2)'
      'declare @PROCESSEDFOOD_TAX DECIMAL(18,2)'
      'declare @TOTAL_DISCOUNT DECIMAL(18,2)'
      'declare @FOOD_STATE_TAX DECIMAL(18,2)'
      'declare @FOOD_MUNICIPAL_TAX DECIMAL(18,2)'
      'declare @REGTOTAL DECIMAL(18,2)'
      'declare @PRODUCT_DESC NCHAR(35) '
      'declare @PRODUCT_NO INTEGER'
      'declare @RETAIL_PRICE DECIMAL(18,2)'
      'declare @QTY DECIMAL(18,2)'
      'declare @FOOD BIT'
      'declare @TAX_ESTATAL BIT'
      'declare @TAX_MUNICIPAL BIT'
      'declare @TOTAL_VALUE DECIMAL(18,2)'
      'declare @REGTOTAL_DETAIL DECIMAL(18,2)'
      'declare @DISCOUNT DECIMAL(18,2)'
      'declare @TRANSACTIONNUMBER INT'
      'declare @FOOD_DETAIL smallint'
      'declare @SUPLIDOR INT'
      'declare @TAX_ESTATAL_DETAIL CHAR(1)'
      'declare @TAX_MUNICIPAL_DETAIL CHAR(1)'
      'declare @SUBDEPARTAMENTO smallint'
      'declare @COST DECIMAL(18,2)'
      'declare @REGPRICE DECIMAL(18,2)'
      'declare @UPC CHAR(14)'
      'declare @CURRENT_DATE CHAR(10)'
      'declare @DEPARTAMENTO SMALLINT'
      'declare @PRODDEPARTMENT CHAR(20) '
      'begin'
      '  begin transaction'
      '  Update CART_HEADER SET ORDER_STATUS = 1 WHERE ID = @ID;'
      
        '  Select @NUMBER_OF_ITEMS = NUMBER_OF_ITEMS, @ADDRESS1 = ADDRESS' +
        '1, @ADDRESS2 = ADDRESS2, @CITY = TOWN,'
      
        '  @ZIPCODE = ZIPCODE, @SUBTOTAL = SUBTOTAL, @TOTAL = TOTAL, @STA' +
        'TE_TAX = STATE_TAX, @MUNICIPAL_TAX = MUNICIPAL_TAX,'
      
        '  @TOTAL_TAX = TOTAL_TAX, @PROCESSEDFOOD_TAX = TAX_PROCESSED_FOO' +
        'D, @TOTAL_DISCOUNT = TOTAL_DISCOUNT,'
      
        '  @FOOD_STATE_TAX = TAX_FOOD_ESTATAL, @FOOD_MUNICIPAL_TAX = TAX_' +
        'FOOD_MUNICIPAL, @REGTOTAL = REGTOTAL,'
      
        '  @CUSTOMER = CUSTOMER, @TELEPHONE = TELEFONO from CART_HEADER w' +
        'here ID = @ID;'
      
        '  INSERT INTO TRANSACTIONHEADER_TEMP (TRANSACTIONDATE, NUMBERITE' +
        'MS, OPENED, REGISTER, EMPLOYNUMBER, DELIVERYADDRESS1, DELIVERYAD' +
        'DRESS2, DELIVERY_CITY, DELIVERY_ZIPCODE,'
      
        '  DELIVERY_STATE, CUSTOMER, DELIVERYPHONE, TOTAL, SUBTOTAL, TAX_' +
        'ESTATAL, TAX, TOTAL_TAX, TAX_PROCESSED_FOOD, TOTAL_DISCOUNT,'
      
        '  TAX_FOOD_ESTATAL, TAX_FOOD_MUNICIPAL, REGTOTAL, TRANSACTIONTIM' +
        'E) '
      '    VALUES'
      
        #9'(GETDATE(), @NUMBER_OF_ITEMS, '#39'M'#39', 0, '#39'NON'#39', @ADDRESS1, @ADDRES' +
        'S2, @CITY, @ZIPCODE, @STATE, @CUSTOMER, @TELEPHONE, '
      
        #9'@TOTAL, @SUBTOTAL, @STATE_TAX, @MUNICIPAL_TAX, @TOTAL_TAX, @PRO' +
        'CESSEDFOOD_TAX, @TOTAL_DISCOUNT, @FOOD_STATE_TAX,'
      #9'@FOOD_MUNICIPAL_TAX, @REGTOTAL, GETDATE())'
      #9
      #9'SELECT @TRANSACTIONNUMBER = SCOPE_IDENTITY();'
      '    '
      
        #9'DECLARE MyCursor CURSOR FOR  SELECT SUBSTRING(PRODUCT_DESC,1,30' +
        ') as PRODUCT_DESC, PRODUCT_NO, isnull(RETAIL_PRICE,0) as RETAIL_' +
        'PRICE, QTY, '
      #9'FOOD, TAX_ESTATAL, TAX_MUNICIPAL, '
      
        '        isNull(TOTAL_VALUE,0) as TOTAL_VALUE, isnull(REGTOTAL,0)' +
        ' as REGTOTAL, isNull(DISCOUNT,0) AS DISCOUNT  '
      #9'from CART_DETAIL where CART_ID = @ID;'
      #9'SET @CURRENT_DATE = CONVERT(VARCHAR,GETDATE(),101);'
      #9'OPEN MyCursor'
      #9'FETCH NEXT FROM MyCursor'
      
        #9'INTO @PRODUCT_DESC, @PRODUCT_NO, @RETAIL_PRICE, @QTY, @FOOD, @T' +
        'AX_ESTATAL, @TAX_MUNICIPAL, @TOTAL_VALUE, @REGTOTAL, @DISCOUNT'
      #9'WHILE @@FETCH_STATUS = 0'
      #9'BEGIN'#9#9
      
        #9#9'SELECT @FOOD_DETAIL = FOODITEM, @SUPLIDOR = NUMEROSUPLIDOR, @T' +
        'AX_ESTATAL_DETAIL = TAXABLE_ESTATAL,'
      
        #9#9#9'@TAX_MUNICIPAL_DETAIL = TAXABLE, @SUBDEPARTAMENTO = SUB_DEPAR' +
        'TAMENTO, @COST = ISNULL(COSTO,0), @REGPRICE = ISNULL(PRECIO,0),'
      #9#9#9'@UPC = CODIGOBARRA,@DEPARTAMENTO = DEPARTAMENTO '
      #9#9#9'FROM INVENTARIOPISO WHERE PRODUCTNO = @PRODUCT_NO;'
      
        #9#9'SELECT @PRODDEPARTMENT = SUBSTRING(DESCRIPCION,1,20) FROM DEPA' +
        'RTAMENTO WHERE DEPARTAMENTO = @DEPARTAMENTO;'
      
        #9#9'--IF (RTRIM(@PRODDEPARTMENT) = '#39#39') SET @PRODDEPARTMENT = '#39'N/A'#39 +
        ';'
      
        #9#9'Exec INSERT_TRANS @TRANSACTIONNUMBER, @UPC, @QTY, @TOTAL_VALUE' +
        ', 0, '#39#39', @PRODUCT_DESC, @PRODDEPARTMENT, @REGTOTAL, @FOOD, @RETA' +
        'IL_PRICE, '
      
        #9#9#9'@REGPRICE, 0, 0, @COST, @CURRENT_DATE, @SUPLIDOR, @TOTAL_VALU' +
        'E, 0, 0, @PRODUCT_NO, @TAX_ESTATAL_DETAIL, @TAX_MUNICIPAL_DETAIL' +
        ', '#39'F'#39', 0,'#39#39',0,'
      #9#9#9'@SUBDEPARTAMENTO, '#39#39','#39#39',0,0,0,0,'#39#39',1,0,0,0,0,0,0,0,0;  '
      #9#9
      #9#9'FETCH NEXT FROM MyCursor'
      
        #9#9'INTO @PRODUCT_DESC, @PRODUCT_NO, @RETAIL_PRICE, @QTY, @FOOD, @' +
        'TAX_ESTATAL, @TAX_MUNICIPAL, @TOTAL_VALUE, @REGTOTAL, @DISCOUNT'
      #9'END'
      #9'CLOSE MyCursor'
      #9'DEALLOCATE MyCursor '
      
        #9'Exec INSERT_NEWTAB 1, 0, @TRANSACTIONNUMBER, @CUSTOMER, @TELEPH' +
        'ONE, '#39'n/a'#39', @TRANSACTIONNUMBER, @TOTAL, 0,'#39'M'#39'; '
      #9'commit;'
      'end;')
    Left = 1624
    Top = 1112
  end
  object INDEX_LOG: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE NONCLUSTERED INDEX [NC_LOG_USUARIOFECHA] ON [dbo].[LOG]'
      '('
      #9'[USUARIO] ASC,'
      #9'[FECHA] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]')
    Left = 3776
    Top = 848
  end
  object INDEX_PASSWORDS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE NONCLUSTERED INDEX [NC_INICIALES_PASSWORDS] ON [dbo].[PAS' +
        'SWORDS]'
      '('
      #9'[INICIALES] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];'
      
        'CREATE NONCLUSTERED INDEX [NC_USERNAME_PASSWORDS] ON [dbo].[PASS' +
        'WORDS]'
      '('
      #9'[USERNAME] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY];')
    Left = 3744
    Top = 1136
  end
  object INDEX_IMAGES: TFDQuery
    SQL.Strings = (
      
        'CREATE NONCLUSTERED INDEX [NC_IMAGES_SCANNED_RX_LINK] ON [dbo].[' +
        'IMAGES]'
      '('
      #9'[SCANNED_RX_LINK] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TE' +
        'MPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS =' +
        ' ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]')
    Left = 3768
    Top = 744
  end
  object FDQuery6: TFDQuery
    Connection = FDConnection1
    OnError = FDQuery6Error
    SQL.Strings = (
      'SELECT CASE '
      '         WHEN EXISTS (SELECT 1 '
      
        '                      FROM   information_schema.table_constraint' +
        's AS C '
      
        '                             INNER JOIN information_schema.key_c' +
        'olumn_usage AS K'
      
        '                                      ON C.table_name = K.table_' +
        'name '
      
        '                                        AND C.constraint_catalog' +
        ' = '
      
        '                                            K.constraint_catalog' +
        ' '
      
        '                                        AND C.constraint_schema ' +
        '= '
      '                                            K.constraint_schema '
      '                                        AND C.constraint_name = '
      '                                            K.constraint_name '
      '                      WHERE  C.constraint_type = '#39'PRIMARY KEY'#39' '
      '                             AND column_name = '#39'OTCNUMBER'#39' '
      '                             AND C.table_name = '#39'cob_a'#39' '
      '                             --AND C.table_schema = '#39'Production'#39
      #9#9#9#9#9#9#9' ) THEN 1 '
      '         ELSE '
      '         begin'
      '           ALTER TABLE COB_A'
      
        '           ADD CONSTRAINT PK_OTCNUMBER PRIMARY KEY (ID,LastName)' +
        ';  '
      '         end;'
      '       END AS IsPrimaryKey; ')
    Left = 3168
    Top = 80
  end
  object POS_UPDATE_TAX_TFAM: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE POS_UPDATE_TAX_TFAM @TRANS_NO INT '
      'AS'
      'DECLARE @NTOTAL DECIMAL(18,2)'
      'DECLARE @TTAxMunicipal DECIMAL(18,2)'
      'DECLARE @TTaxEstatal DECIMAL(18,2) '
      ''
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      #9'UPDATE TRANSACTIONHEADER_TEMP SET '
      #9'TAX = (ISNULL(TAX,0) - ISNULL(TAX_FOOD_MUNICIPAL,0)), '
      
        #9'TOTAL_TAX = (ISNULL(TAX,0) - ISNULL(TAX_FOOD_MUNICIPAL,0)) + (I' +
        'SNULL(TAX_ESTATAL,0) - ISNULL(TAX_FOOD_ESTATAL,0)), '
      
        #9'TOTAL = TOTAL - (ISNULL(TAX_FOOD_ESTATAL,0) + ISNULL(TAX_FOOD_M' +
        'UNICIPAL,0)),'
      
        #9'TAX_ESTATAL = (ISNULL(TAX_ESTATAL,0)- ISNULL(TAX_FOOD_ESTATAL,0' +
        ')) '
      
        #9'FROM TRANSACTIONHEADER_TEMP where TransactionNumber = @TRANS_NO' +
        ';'
      '        COMMIT;'
      'END')
    Left = 3160
    Top = 176
  end
  object FDQBackup: TFDQuery
    Connection = FDConnectionBackup
    Left = 352
    Top = 168
  end
  object SysColumns: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    c.name '#39'Column Name'#39','
      '    t.Name '#39'Data type'#39','
      '    c.max_length '#39'Max Length'#39','
      '    c.precision ,'
      '    c.scale ,'
      '    c.is_nullable,'
      '    ISNULL(i.is_primary_key, 0) '#39'Primary Key'#39
      'FROM    '
      '    sys.columns c'
      'INNER JOIN '
      '    sys.types t ON c.user_type_id = t.user_type_id'
      'LEFT OUTER JOIN '
      
        '    sys.index_columns ic ON ic.object_id = c.object_id AND ic.co' +
        'lumn_id = c.column_id'
      'LEFT OUTER JOIN '
      
        '    sys.indexes i ON ic.object_id = i.object_id AND ic.index_id ' +
        '= i.index_id'
      'WHERE'
      '    c.object_id = OBJECT_ID('#39'Passwords'#39')')
    Left = 3192
    Top = 296
  end
  object ISAUTHORIZED: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE  [dbo].[ISAUTHORIZED] @USERNO CHAR(4), @Field V' +
        'ARCHAR(MAX), @ResultValue bit OUTPUT,'
      '@USER CHAR(3) OUTPUT'
      'AS'
      'DECLARE @PWRD NCHAR(30)'
      'DECLARE @Query VARCHAR(MAX)'
      ''
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      #9'begin'
      
        #9'    --SELECT ANADIRRECETAS as ResultValue from Passwords WHERE ' +
        'userno= 402;'
      
        #9#9'SET @Query = '#39'SELECT ['#39' + @Field + '#39'] as ResultValue from Pass' +
        'words WHERE userno= '#39#39#39' + @USERNO + '#39#39#39#39
      #9#9'EXECUTE(@Query);'
      
        #9#9'SELECT @USER = INICIALES FROM PASSWORDS WHERE USERNO = @USERNO' +
        ';'
      #9'end;'
      #9'COMMIT'
      'END;')
    Left = 3184
    Top = 416
  end
  object FDQuery7: TFDQuery
    Connection = FDConnection1
    Left = 1640
    Top = 536
  end
  object PWRD_ISAUTHORIZED: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[PWRD_ISAUTHORIZED]  @USERNAME VARCHAR(35' +
        '),'
      
        '@PASSWORD_COL CHAR(30), @PWRDResultValue bit OUTPUT, @INICIALES ' +
        'CHAR(3) OUTPUT, @USERNO INT OUTPUT, @PHARMACIST INT OUTPUT,'
      
        '@ANADIRRECETAS bit output, @HISTORIALRECETAS bit output, @BORRAR' +
        'PACIENTE bit output, @RX_PRESCRIPTION_NOTE bit output,'
      
        '@MAIN_ACCTS bit output, @ACTIVE bit output, @THIRDPARTY bit outp' +
        'ut, @OTC bit output, @RX_CAMBIARPRECIO_RX bit output,'
      
        '@BORRARRECETAS bit output, @BORRARRECETAS_CASH bit output, @RX_C' +
        'HANGE_QTY bit output, @BORRAR_CANTIDA_RX bit output,'
      
        '@EDITAR_NOMBRE bit output, @MERGE_PAT_DOC bit output, @BORRAR_FI' +
        'RMA bit output, @CAPTURAR_FIRMA bit output,'
      
        '@REVERSAL bit output, @LOG_DATA bit output, @BORRAR_PAT_PLAN bit' +
        ' output, @BORRAR_EPRESCRIBE bit output,'
      
        '@RX_CHANGE_REFILL bit output, @DOCTORES bit output, @RX_NO_EDIT_' +
        'HISTORY bit output, @RX_EDIT_SIG bit output,'
      
        '@RX_ATIVE bit output, @OVERRIDE_GENERIC bit output, @WORKFLOW bi' +
        't output, @RECALL_LOCKED_RX bit output,'
      
        '@RX_RECALL_EPRESRIBE_HIST bit output, @INVENTARIORX bit output, ' +
        '@BORRARINVENTARIO bit output, '
      
        '@QUICKENTRY bit output, @RX_UPDATE_INV_BROWSE bit output, @MERGE' +
        '_INV_QTY bit output, '
      
        '@REPORTES bit output, @CAMBIARPASSWORD bit output, @FACTURAS_WES' +
        'COM bit output, @BACKUP_PERMIT bit output,'
      
        '@TIME_CARD bit output, @SETUP bit output, @RX_CONTROLLED_ANOTATE' +
        ' bit output, @RX_CONTROLLED_DELETE bit output,'
      
        '@CONTROLLED_SUBSTANCE bit output, @APPRISS bit output, @RX_COTRO' +
        'LLED_LOG bit output, @DUR bit output, '
      '@PEDIDOSMERCANCIA bit output, @PHARMACY BIT,'
      
        '@MAIN_SETUP bit output, @MAIN_CUST bit output, @MAIN_INV bit out' +
        'put, @MAIN_DEPT bit output, @MAIN_SUPL bit output,'
      
        '@MAIN_TOTAL bit output, @POS_REFUND bit output, @POS_DELPROD bit' +
        ' output, @POS_CHGPRICE bit output, @POS_DELTRANS bit output,'
      
        '@POS_NCGH bit output, @POS_CANCEL bit output, @POS_DISCOUNT bit ' +
        'output, @POS_IVU bit output, @POS_PAYOUT bit output,'
      
        '@POS_OPNDRAWR bit output, @POS_REPRINT bit output, @POS_CREDIT b' +
        'it output, @GUARDAR_TRANSACCIONES bit output,'
      
        '@RECALL_TRANS bit output, @POS_HOLD bit output, @VENTA_MANUAL bi' +
        't output, @CAMBIAR_PRECIO_OTC_RX bit output,'
      
        '@POS_BUTTONS bit output, @REDIMIR_PATROCINIO bit output, @POS_AD' +
        'D_BUTTONS bit output, @POS_TAB_CANCEL bit output,'
      
        '@POS_VER_TOTAL_CASH bit output, @POS_POST_SHOPPER bit output, @P' +
        'OS_REST_DELETEPRODUCT bit output,'
      
        '@POS_LIMITE_CAMBIO_PRECIO bit output, @CUST_IBAL bit output, @CU' +
        'ST_EDIT bit output, @CUST_DEL bit output,'
      
        '@TOT_DEL bit output, @TOT_EDIT bit output, @POS_CUADRE_ADMINISTR' +
        'ADOR bit output,  @MAIN_RECV bit output,'
      
        '@EM_VERQTYORD bit output, @WC_LOAD bit output, @MAIN_TRANS bit o' +
        'utput, @TOT_EDITOLD bit output,'
      
        '@CAMBIARCOSTOYPRECIOVENTA bit output, @Pesc_Sig_isIdentity bit o' +
        'utput, @RX_CONTROLLED_MODIFY bit output,'
      
        '@RPT_RECETARIO bit output,@RPT_RECONCILIACION bit output, @RPT_P' +
        'OS bit output, @RPT_INVENTARIO bit output, '
      
        '@RPT_CLIENTES bit output, @CLASSIC_SIG bit output, @WC_SETUP BIT' +
        ' OUTPUT, @WC_RETREIVE BIT OUTPUT,'
      
        '@WC_RTS BIT OUTPUT, @WC_SENDMESSAGE BIT OUTPUT, @WC_REPORTS BIT ' +
        'OUTPUT, @WILLCALL BIT OUTPUT, '
      
        '@PHARMACIST_NPI varchar(15) OUTPUT, @PHARMACIST_LICENCE varchar(' +
        '15) output, @POS_DELETE_RX bit output,'
      
        '@WC_DELETE_RX bit output, @HOLD_RECALL_EPRESCRIBE bit output, @R' +
        'X_CHANGE_ORIGINCODE bit output,'
      
        '@Change_PriceTable bit output, @ADMINISTRATOR BIT output, @PROCE' +
        'SS_HANDHELD BIT output, @CREATE_INVENTORY BIT output, '
      
        '@EDIT_INVENTORY BIT output, @DELETE_INVENTORY BIT output, @POS_C' +
        'OUPON BIT output, @MODIFY_HELP_FORM bit output, @INV_CHANGE_FACI' +
        'LITY BIT OUTPUT, @LTC BIT OUTPUT,'
      '@SEC_LEVEL varchar(1) Output'
      'AS'
      'DECLARE @PWRD NCHAR(30)'
      'DECLARE @Query VARCHAR(MAX)'
      'DECLARE @CLASSIC_LOGIN BIT'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      #9'begin'
      
        #9'    select @CLASSIC_SIG = isnull(CLASIC_SIG_CODES,0) from CREDI' +
        'TDEBITSETUP;'
      
        #9#9'select @Pesc_Sig_isIdentity = columnproperty(object_id('#39'PRESCR' +
        'IPTION_ESIGNATURE'#39'),'#39'SIGNATURE_LINK'#39','#39'IsIdentity'#39')'
      
        #9#9'select @PWRD = convert(varchar(max),cast(N'#39#39' as xml).value('#39'xs' +
        ':base64Binary(sql:column("t.password_col"))'#39', '#39'varbinary(max)'#39'))' +
        ','
      
        #9#9'@INICIALES = INICIALES, @USERNO = USERNO, @PHARMACIST = isnull' +
        '( PHARMACIST,0)  ,@ACTIVE = isnull(ACTIVE,0),  @ANADIRRECETAS = ' +
        'isnull( ANADIRRECETAS,0) '
      
        #9#9',@ADMINISTRATOR = isnull(ADMINISTRATOR, 0),@INV_CHANGE_FACILIT' +
        'Y = isnull(INV_CHANGE_FACILITY,0) '
      
        #9#9',@HISTORIALRECETAS = isnull( HISTORIALRECETAS,0), @BORRARPACIE' +
        'NTE = isnull( BORRARPACIENTE,0)  ,@RX_PRESCRIPTION_NOTE = isnull' +
        '( RX_PRESCRIPTION_NOTE,0) '
      
        #9#9',@MAIN_ACCTS = isnull( MAIN_ACCTS,0)  ,@THIRDPARTY = isnull( T' +
        'HIRDPARTY,0)  ,@OTC = isnull( OTC,0)  ,@RX_CAMBIARPRECIO_RX = is' +
        'null( RX_CAMBIARPRECIO_RX,0) '
      
        #9#9',@BORRARRECETAS = isnull( BORRARRECETAS,0)  ,@BORRARRECETAS_CA' +
        'SH = isnull( BORRARRECETAS_CASH,0)  ,@RX_CHANGE_QTY = isnull( RX' +
        '_CHANGE_QTY,0) '
      
        #9#9',@BORRAR_CANTIDA_RX = isnull( BORRAR_CANTIDA_RX,0)  ,@EDITAR_N' +
        'OMBRE = isnull( EDITAR_NOMBRE,0)  ,@MERGE_PAT_DOC = isnull( MERG' +
        'E_PAT_DOC,0) '
      
        #9#9',@BORRAR_FIRMA = isnull( BORRAR_FIRMA,0)  ,@CAPTURAR_FIRMA = i' +
        'snull( CAPTURAR_FIRMA,0)  ,@REVERSAL = isnull( REVERSAL,0)  ,@LO' +
        'G_DATA = isnull( LOG_DATA,0) '
      
        #9#9',@BORRAR_PAT_PLAN = isnull( BORRAR_PAT_PLAN,0), @BORRAR_EPRESC' +
        'RIBE = isnull( BORRAR_EPRESCRIBE,0), @HOLD_RECALL_EPRESCRIBE = i' +
        'snull( HOLD_RECALL_EPRESCRIBE,0)'
      #9#9',@RX_CHANGE_REFILL = isnull( RX_CHANGE_REFILL,0) '
      
        #9#9',@DOCTORES = isnull( DOCTORES,0)  ,@RX_NO_EDIT_HISTORY = isnul' +
        'l( RX_NO_EDIT_HISTORY,0)  ,@RX_EDIT_SIG = isnull( RX_EDIT_SIG,0)' +
        '  ,@RX_ATIVE = isnull( RX_ATIVE,0) '
      
        #9#9',@OVERRIDE_GENERIC = isnull( OVERRIDE_GENERIC,0)  ,@WORKFLOW =' +
        ' isnull( WORKFLOW,0)  ,@RECALL_LOCKED_RX = isnull( RECALL_LOCKED' +
        '_RX,0) '
      
        #9#9',@RX_RECALL_EPRESRIBE_HIST = isnull( RX_RECALL_EPRESRIBE_HIST,' +
        '0)  ,@INVENTARIORX = isnull( INVENTARIORX,0)  ,@BORRARINVENTARIO' +
        ' = isnull( BORRARINVENTARIO,0) '
      
        #9#9',@QUICKENTRY = isnull( QUICKENTRY,0)  ,@RX_UPDATE_INV_BROWSE =' +
        ' isnull(RX_UPDATE_INV_BROWSE,0), @MERGE_INV_QTY = isnull( MERGE_' +
        'INV_QTY,0) '
      
        #9#9',@REPORTES = isnull( REPORTES,0)  ,@CAMBIARPASSWORD = isnull( ' +
        'CAMBIARPASSWORD,0)  ,@FACTURAS_WESCOM = isnull( FACTURAS_WESCOM,' +
        '0)  ,@BACKUP_PERMIT = isnull( BACKUP_PERMIT,0) '
      
        #9#9',@TIME_CARD = isnull( TIME_CARD,0)  ,@SETUP = isnull( SETUP,0)' +
        '  ,@RX_CONTROLLED_ANOTATE = isnull( RX_CONTROLLED_ANOTATE,0)  ,@' +
        'RX_CONTROLLED_DELETE = isnull( RX_CONTROLLED_DELETE,0) '
      
        #9#9',@CONTROLLED_SUBSTANCE = isnull( CONTROLLED_SUBSTANCE,0)  ,@AP' +
        'PRISS = isnull( APPRISS,0)  ,@RX_COTROLLED_LOG = isnull( RX_COTR' +
        'OLLED_LOG,0) '
      
        #9#9',@DUR = isnull( DUR,0), @PEDIDOSMERCANCIA = ISNULL(PEDIDOSMERC' +
        'ANCIA,0),'#9#9#9
      
        #9#9'@MAIN_SETUP = isnull( MAIN_SETUP,0), @MAIN_CUST = isnull( MAIN' +
        '_CUST,0), @MAIN_INV = isnull( MAIN_INV,0), @MAIN_DEPT = isnull( ' +
        'MAIN_DEPT,0), @MAIN_SUPL = isnull( MAIN_SUPL,0), @MAIN_TOTAL = i' +
        'snull( MAIN_TOTAL,0),'
      
        #9#9'@POS_REFUND = isnull( POS_REFUND,0), @POS_DELPROD = isnull( PO' +
        'S_DELPROD,0), @POS_CHGPRICE = isnull( POS_CHGPRICE,0), @POS_DELT' +
        'RANS = isnull( POS_DELTRANS,0), @POS_NCGH = isnull( POS_NCGH,0),'
      
        #9#9'@POS_CANCEL = isnull( POS_CANCEL,0), @POS_DISCOUNT = isnull( P' +
        'OS_DISCOUNT,0), @POS_IVU = isnull( POS_IVU,0), @POS_PAYOUT = isn' +
        'ull( POS_PAYOUT,0), @POS_OPNDRAWR = isnull( POS_OPNDRAWR,0),'
      
        #9#9'@POS_REPRINT = isnull( POS_REPRINT,0), @POS_CREDIT = isnull( P' +
        'OS_CREDIT,0), @GUARDAR_TRANSACCIONES = isnull( GUARDAR_TRANSACCI' +
        'ONES,0), @RECALL_TRANS = isnull( RECALL_TRANS,0),'
      
        #9#9'@POS_HOLD = isnull( POS_HOLD,0), @VENTA_MANUAL = isnull( VENTA' +
        '_MANUAL,0), @CAMBIAR_PRECIO_OTC_RX = isnull( CAMBIAR_PRECIO_OTC_' +
        'RX,0), @POS_BUTTONS = isnull( POS_BUTTONS,0),'
      
        #9#9'@REDIMIR_PATROCINIO = isnull( REDIMIR_PATROCINIO,0), @POS_ADD_' +
        'BUTTONS = isnull( POS_ADD_BUTTONS,0), @POS_TAB_CANCEL = isnull( ' +
        'POS_TAB_CANCEL,0),'
      
        #9#9'@POS_VER_TOTAL_CASH = isnull( POS_VER_TOTAL_CASH,0), @POS_POST' +
        '_SHOPPER = isnull( POS_POST_SHOPPER,0), @POS_REST_DELETEPRODUCT ' +
        '= isnull( POS_REST_DELETEPRODUCT,0),'
      
        #9#9'@POS_LIMITE_CAMBIO_PRECIO = isnull( POS_LIMITE_CAMBIO_PRECIO,0' +
        '), @CUST_IBAL = isnull( CUST_IBAL,0), @CUST_EDIT = isnull( CUST_' +
        'EDIT,0), @CUST_DEL = isnull( CUST_DEL,0),'
      
        #9#9'@TOT_DEL = TOT_DEL, @TOT_EDIT = isnull(TOT_EDIT,0), @POS_CUADR' +
        'E_ADMINISTRADOR = isnull(POS_CUADRE_ADMINISTRADOR,0), @MAIN_RECV' +
        ' = isnull(MAIN_RECV,0),'
      
        #9#9'@EM_VERQTYORD = ISNULL(EM_VERQTYORD,0), @WC_LOAD = ISNULL(WC_L' +
        'OAD,0), @MAIN_TRANS = ISNULL(MAIN_TRANS,0), @TOT_EDITOLD = isnul' +
        'l(TOT_EDITOLD,0),'
      
        #9#9'@RX_CONTROLLED_MODIFY = isnull(RX_CONTROLLED_MODIFY,0), @CAMBI' +
        'ARCOSTOYPRECIOVENTA = CAMBIARCOSTOYPRECIOVENTA, @RPT_RECETARIO =' +
        ' isnull(RPT_RECETARIO,0),'
      
        #9#9'@RPT_RECONCILIACION = isnull(RPT_RECONCILIACION,0), @RPT_POS =' +
        ' isnull(RPT_POS,0), @RPT_INVENTARIO = isnull(RPT_INVENTARIO,0),'
      
        #9#9'@RPT_CLIENTES = isnull(RPT_CLIENTES,0), @WC_RETREIVE = ISNULL(' +
        'WC_RETREIVE, 0), @WC_SETUP = ISNULL(WC_SETUP,0), @WC_RTS = ISNUL' +
        'L(WC_RTS,0),'
      
        #9#9'@WC_SENDMESSAGE = ISNULL(WC_SENDMESSAGE,0), @WC_REPORTS = ISNU' +
        'LL(WC_REPORTS, 0), @WILLCALL = ISNULL(WILLCALL,0), @PHARMACIST_N' +
        'PI = PHARMACIST_NPI,'
      
        #9#9'@PHARMACIST_LICENCE = PHARMACIST_LICENCE, @POS_DELETE_RX = isn' +
        'ull(POS_DELETE_RX, 0), @WC_DELETE_RX = isnull(WC_DELETE_RX,0),'#9#9
      
        #9#9'@RX_CHANGE_ORIGINCODE = isnull(RX_CHANGE_ORIGINCODE,0), @Chang' +
        'e_PriceTable = isnull(RX_CHANGE_PRICETABLE, 0), @PROCESS_HANDHEL' +
        'D = isnull(PROCESS_HANDHELD,0),'
      
        #9#9'@CREATE_INVENTORY = isnull(CREATE_INVENTORY,0), @EDIT_INVENTOR' +
        'Y = isnull(EDIT_INVENTORY,0), @DELETE_INVENTORY = isnull(DELETE_' +
        'INVENTORY,0), @POS_COUPON = ISNULL(POS_COUPON, 0),'
      
        #9#9'@MODIFY_HELP_FORM = ISNULL(MODIFY_HELP_FORM, 0), @LTC = ISNULL' +
        '(LTC,0), @SEC_LEVEL = ISNULL(SEC_LEVEL,0)'
      #9#9'from PASSWORDS as t '
      #9#9'where USERNAME =  @USERNAME;   '
      #9#9'if (@PASSWORD_COL = @PWRD) AND (@ACTIVE = 1)'
      #9#9'begin'
      #9#9#9'set @PWRDResultValue = 1;'
      #9#9'end   '
      #9#9'else'
      #9#9'begin'
      #9#9#9'set @PWRDResultValue = 0;'
      #9#9'end;'#9'       '
      #9'end;'
      #9'COMMIT'
      'END;')
    Left = 3752
    Top = 1072
  end
  object CALC_TRIPLES_TAX: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[CALC_TRIPLES_TAX] @transactionnumber INT' +
        ', @TOTAL_BALANCE_PLUS_TAX FLOAT OUTPUT'#9
      'AS'
      'DECLARE @TAXABLE_QTY_MUNICIPAL Float;'
      'DECLARE @TAXABLE_QTY_Estatal Float;'
      'DECLARE @TAXRATE_Estatal Float;'
      'DECLARE @TAXFROM Float;'
      'DECLARE @TAXRATE_Municipal Float;'
      'DECLARE @TAX_PROCESSED_FOOD_RATE Float;'
      'DECLARE @Estatal Float;'
      'DECLARE @MUNICIPAL Float; '#9
      'DECLARE @TRIPLES_BALANCE FLOAT;'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      
        #9'SELECT @TAXRATE_Estatal = TAX_RATE_ESTATAL, @TAXRATE_Municipal ' +
        '= TAX_RATE, @TAXFROM = TAX_RATE_FROM, '
      
        #9'@TAX_PROCESSED_FOOD_RATE = TAX_PROCESSED_FOOD FROM CREDITDEBITS' +
        'ETUP; '
      #9'/**************** CALCULAR TAX ESTATAL ************/'
      #9'select @TAXABLE_QTY_Estatal = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @transactionnu' +
        'mber and Tax_Estatal = '#39'T'#39' and TRIPLES_PRODUCT = 1 and TRIPLES_C' +
        'OVERED = 1;'
      #9'if (@TAXABLE_QTY_Estatal <> 0) and (@TAXFROM > 0)'
      #9'begin'
      
        #9#9'select @Estatal = Round(ISNULL(@TAXABLE_QTY_Estatal,0) * @TAXR' +
        'ATE_Estatal, 2);'
      #9'end'
      #9'else'
      #9#9'Select @Estatal = 0;'
      #9'/********************TAX MUNICIPAL**********************/'
      #9'select @TAXABLE_QTY_MUNICIPAL = ISNULL(sum(total), 0) from'
      
        #9'TRANSACTIONDETAIL_TEMP where transactionnumber = @transactionnu' +
        'mber and Tax_Municipal = '#39'T'#39' and TRIPLES_PRODUCT = 1 and TRIPLES' +
        '_COVERED = 1;'
      #9'if (@TAXABLE_QTY_MUNICIPAL <> 0) and (@TAXFROM > 0)'
      #9'begin'
      
        #9#9'select @MUNICIPAL = Round(ISNULL(@TAXABLE_QTY_MUNICIPAL,0) * @' +
        'TAXRATE_Municipal, 2);'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'select @MUNICIPAL = 0;'
      #9'end;'
      #9'set @TRIPLES_BALANCE = 0;'
      
        #9'SELECT @TRIPLES_BALANCE = COALESCE(sum(TOTAL), 0) FROM TRANSACT' +
        'IONDETAIL_TEMP WHERE TRANSACTIONNUMBER = @transactionnumber AND ' +
        'TRIPLES_PRODUCT = 1 AND TRIPLES_COVERED = 1;'
      
        #9'set @TOTAL_BALANCE_PLUS_TAX = isnull(@Estatal,0) + isnull(@MUNI' +
        'CIPAL,0) + ISNULL(@TRIPLES_BALANCE,0);'
      'END')
    Left = 3184
    Top = 504
  end
  object CALC_PRODUCT_TAX: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[CALC_PRODUCT_TAX] @PRODUCTNO INT, @QTY d' +
        'ecimal(18,2), @TOTAL_TAX decimal(18,2) OUTPUT, '
      
        '@BALANCE_MUNICIPAL_TAX decimal(18,2) OUTPUT, @BALANCE_STATE_TAX ' +
        'decimal(18,2) OUTPUT, @TOTAL_TAX_PLUS_PRICE decimal(18,2) OUTPUT' +
        ','
      '@PRICE decimal(18,2)'
      'AS'
      'DECLARE @TAXRATE_Estatal Float;'
      'DECLARE @TAXFROM Float;'
      'DECLARE @TAXRATE_Municipal Float;'
      'DECLARE @TAX_PROCESSED_FOOD_RATE Float;'
      'DECLARE @TAXABLE_Estatal bit;'
      'DECLARE @TAXABLE_Municipal bit;'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      
        #9'SELECT @TAXRATE_Estatal = TAX_RATE_ESTATAL, @TAXRATE_Municipal ' +
        '= TAX_RATE, @TAXFROM = TAX_RATE_FROM, '
      
        #9'@TAX_PROCESSED_FOOD_RATE = TAX_PROCESSED_FOOD FROM CREDITDEBITS' +
        'ETUP; '
      #9'/**************** CALCULAR TAX ESTATAL ************/'
      
        #9'Select @TAXABLE_Estatal = TAXABLE_ESTATAL, @TAXABLE_Municipal =' +
        ' TAXABLE FROM INVENTARIOPISO WHERE PRODUCTNO = @PRODUCTNO;'
      #9'if (@TAXABLE_Estatal = 1) and (@TAXFROM > 0)'
      #9'begin'
      
        #9'--select @BALANCE_STATE_TAX = @PRICE * Round(ISNULL(@QTY,0) * @' +
        'TAXRATE_Estatal, 2);'
      
        #9#9'select @BALANCE_STATE_TAX = (@PRICE * @QTY) * (@TAXRATE_Estata' +
        'l);'
      #9'end'
      #9'else'
      #9#9'Select @BALANCE_STATE_TAX = 0;'
      #9'/********************TAX MUNICIPAL**********************/'
      #9'if (@TAXABLE_Municipal = 1) and (@TAXFROM > 0)'
      #9'begin'
      
        #9'--select @BALANCE_MUNICIPAL_TAX = @PRICE * Round(ISNULL(@QTY,0)' +
        ' * @TAXRATE_Municipal, 2);'
      
        #9#9'select @BALANCE_MUNICIPAL_TAX = (@PRICE * @QTY) * @TAXRATE_Mun' +
        'icipal;'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'select @BALANCE_MUNICIPAL_TAX = 0;'
      #9'end;'
      #9'if @PRICE > @TAXFROM'
      #9'begin'
      #9#9'set @PRICE = 0;'
      #9#9'set @TOTAL_TAX = @BALANCE_STATE_TAX + @BALANCE_MUNICIPAL_TAX;'
      
        #9#9'set @TOTAL_TAX_PLUS_PRICE = isnull(@BALANCE_STATE_TAX,0) + isn' +
        'ull(@BALANCE_MUNICIPAL_TAX,0) + ISNULL(@PRICE,0);'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'SET @TOTAL_TAX = 0.00;'
      #9#9'SET @TOTAL_TAX_PLUS_PRICE = 0;'
      #9#9'SET @BALANCE_MUNICIPAL_TAX = 0;'
      #9#9'SET @BALANCE_STATE_TAX = 0;'
      #9'end;'
      #9'commit;'
      'END;')
    Left = 3184
    Top = 584
  end
  object POS_INSERT_TRIPLES_PAYMENT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POS_INSERT_TRIPLES_PAYMENT] @TRANSACTION' +
        'NUMBER INT, @AMOUNT FLOAT, '
      
        '@CLAIMNUMBER NCHAR(10), @ITEMCODE NCHAR(14), @CUSTOMERID INT, @U' +
        'NIQUE_ID NCHAR(50), @OLD_TRANSACTION BIT,'
      '@BALANCE FLOAT OUTPUT   '
      'AS'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      #9'if rtrim(@CLAIMNUMBER) > '#39#39
      #9'begin'
      #9'    IF @OLD_TRANSACTION = 0'
      #9#9'BEGIN'
      #9#9#9'if @AMOUNT > 0 '
      #9#9#9'begin'
      
        #9#9#9#9'UPDATE TRANSACTIONDETAIL_TEMP SET  TRIPLES_CLAIM_NUMBER = @C' +
        'LAIMNUMBER, TRIPLES_COVERED = 1 WHERE TRANSACTIONNUMBER = @TRANS' +
        'ACTIONNUMBER AND UPC = @ITEMCODE;'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'begin'
      
        #9#9#9#9'UPDATE TRANSACTIONDETAIL_TEMP SET  TRIPLES_CLAIM_NUMBER = @C' +
        'LAIMNUMBER, TRIPLES_COVERED = 0 WHERE TRANSACTIONNUMBER = @TRANS' +
        'ACTIONNUMBER AND UPC = @ITEMCODE;'
      #9#9#9'end;'
      #9#9'END'
      #9#9'ELSE'
      #9#9'BEGIN'
      
        #9#9#9'UPDATE TRANSACTIONDETAIL SET TRIPLES_COVERED = 0 WHERE TRANSA' +
        'CTIONNUMBER = @TRANSACTIONNUMBER AND UPC = RTRIM(@ITEMCODE);'
      #9#9'END;'
      #9'end'
      #9'else'
      #9'begin '
      
        #9#9'Insert into TRIPLE_S (TRANSACTIONNUMBER, UNIQUE_ID, TRIPLES_CU' +
        'STOMERID) Values (@TRANSACTIONNUMBER, @UNIQUE_ID , @CUSTOMERID);'
      
        #9#9'UPDATE TRANSACTIONHEADER_TEMP SET PAYMENTTYPE1 = '#39'TSSS'#39', PAYAM' +
        'OUNT1 = @AMOUNT WHERE TRANSACTIONNUMBER = @TRANSACTIONNUMBER;'
      
        #9#9'select @BALANCE = TOTAL - PAYAMOUNT1 from TRANSACTIONHEADER_TE' +
        'MP where TRANSACTIONNUMBER = @TRANSACTIONNUMBER;'
      #9'end;'#9
      #9'COMMIT;'
      'END;')
    Left = 3192
    Top = 688
  end
  object WC_BAGPICKUP_UPDATE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[WC_BAGPICKUP_UPDATE] @BAG_NUMBER NCHAR(1' +
        '0),  @DBName NCHAR(20), @USER CHAR(3), @INTERFACE bit '#9
      'AS'
      'DECLARE @OTC_NUMBER INT'
      'DECLARE @TRANSACTION_NUMBER INT'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION    '#9#9
      
        #9#9'DECLARE MyCursor CURSOR FOR Select OTC_NUMBER, TRANSACTION_NUM' +
        'BER from WillCall where BAG_NUMBER = @BAG_NUMBER and POS_PICKUP ' +
        '= 1;'
      #9#9'OPEN MyCursor'
      #9#9'FETCH NEXT FROM MyCursor'
      #9#9'INTO @OTC_NUMBER, @TRANSACTION_NUMBER '
      #9#9'WHILE @@FETCH_STATUS = 0'
      #9#9'BEGIN'
      #9#9#9'if @INTERFACE = 0'
      #9#9#9'begin'
      #9#9#9'  EXEC WF_UPDATE_PICKUP @DBName, @OTC_NUMBER, @USER;'
      #9#9#9'end'
      
        #9#9#9'Update WillCall set Status = 1 where TRANSACTION_NUMBER = @TR' +
        'ANSACTION_NUMBER;'
      #9#9#9'--EXEC WF_UPDATE @OTC_NUMBER, @TOKEN, '#39'S'#39', 0;'#9#9#9
      #9#9#9'FETCH NEXT FROM MyCursor'
      #9#9#9'INTO @OTC_NUMBER, @TRANSACTION_NUMBER '
      #9#9'END'
      #9#9'CLOSE MyCursor'
      #9#9'DEALLOCATE MyCursor'
      #9'COMMIT;'
      'END;')
    Left = 3752
    Top = 976
  end
  object TRIPLE_S: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'TRIPLE_S' +
        #39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[TRIPLE_S]('
      #9'[TRANSACTIONNUMBER] [int] NOT NULL,'
      #9'[UNIQUE_ID] [nchar](50) NOT NULL,'
      #9'[TRIPLES_CUSTOMERID] [int] NOT NULL,'
      ' CONSTRAINT [PK_TRIPLE_S] PRIMARY KEY CLUSTERED '
      '('
      #9'[TRANSACTIONNUMBER] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 3200
    Top = 792
  end
  object BOTONES_MIDIFIERS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'BOTONES_' +
        'MIDIFIERS'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[BOTONES_MIDIFIERS]('
      #9'[BUTTON_NUMBER] [int] IDENTITY(1,1) NOT NULL,'
      #9'[PRODUCT_NO] [int] NULL,'
      #9'[PRICE] [decimal](18, 2) NULL,'
      #9'[DESCRIPTION] [nchar](20) NULL,'
      #9'[QTY] [int] NULL,'
      #9'[BUTTON_NAME] [varchar](20) NULL,'
      #9'[MASTER_BUTTON_NUMBER] [int] NULL,'
      ' CONSTRAINT [PK_BOTONES_MIDIFIERS] PRIMARY KEY CLUSTERED '
      '('
      #9'[BUTTON_NUMBER] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 3200
    Top = 880
  end
  object SIGNATURE_LINK: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[SIGNATURE_LINK] @SIGNATURE_LINK INTEGER ' +
        'OUTPUT'
      'AS'
      'begin'
      '  begin transaction'
      '  Update NEXT_RXNUMBER SET SCANED_RX_LINK = SCANED_RX_LINK + 1;'
      '  Select @SIGNATURE_LINK = (SCANED_RX_LINK) FROM NEXT_RXNUMBER;'
      '  commit'
      'end')
    Left = 3320
    Top = 88
  end
  object FDQuery8: TFDQuery
    Connection = FDConnection1
    Left = 3328
    Top = 176
  end
  object INSERT_ESIGNATURE_AI: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_ESIGNATURE_AI]'
      '('
      '@ENCRIPPTED_SIGNATURE TEXT,'
      '@SIGNATURE_DATE DATE,'
      '@SIGNATURE_USER NCHAR(3),'
      '@PICKEDUP_BY_RELATION SMALLINT,'
      '@PICKEDUP_ID NCHAR(20),'
      '@NUMEROCLIENTE INT,'
      '@SAVE_PAT_SIGNATURE BIT,'
      '@PICKEDUP_BY NCHAR(45),'
      '@NORX BIGINT,'
      '@OTCNUMBER INT,'
      '@INSTANCIA INT,'
      '@SIGNATURE_LINK2 INT,'
      '@SIGNATURE_LINK INT OUTPUT,'
      '@DBName nchar(20)'
      ')'
      'AS'
      'DECLARE @TOKEN NCHAR(30)'
      'declare @Existingdate datetime'
      'DECLARE @SQL NVARCHAR(500);'
      'SET NOCOUNT ON'
      'BEGIN   '
      #9'IF @SIGNATURE_LINK2 = 0'
      #9'BEGIN'
      #9#9'begin transaction'
      #9#9'INSERT INTO [dbo].[PRESCRIPTION_ESIGNATURE]'
      #9#9#9'   ([ENCRIPPTED_SIGNATURE]'
      #9#9#9'   ,[SIGNATURE_DATE]'
      #9#9#9'   ,[SIGNATURE_USER]'
      #9#9#9'   ,[PICKEDUP_BY_RELATION]'
      #9#9#9'   ,[PICKEDUP_ID]'
      #9#9'   ,PICKEDUP_BY)'
      #9#9' VALUES'
      #9#9#9'   (@ENCRIPPTED_SIGNATURE,'
      #9#9#9'   @SIGNATURE_DATE,'
      #9#9#9'   @SIGNATURE_USER,'
      #9#9#9'   @PICKEDUP_BY_RELATION,'
      #9#9#9'   @PICKEDUP_ID,'
      #9#9#9'   @PICKEDUP_BY);'
      #9#9#9'set @SIGNATURE_LINK = SCOPE_IDENTITY();'
      #9#9'commit;'
      #9'END;'
      'END;')
    Left = 3328
    Top = 288
  end
  object INSERT_ESIGNATURE_PICTURE_AI: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_ESIGNATURE_PICTURE_AI]'
      '('
      '@IMAGE_SIGNATURE IMAGE,'
      '@SIGNATURE_DATE DATE,'
      '@SIGNATURE_USER NCHAR(3),'
      '@SIGNATURE_LINK INT OUTPUT,'
      '@PICKEDUP_BY_RELATION SMALLINT,'
      '@PICKEDUP_ID NCHAR(20)'
      ')'
      'AS'
      'SET NOCOUNT ON'
      'BEGIN '
      '  begin transaction'
      '    INSERT INTO [dbo].[PRESCRIPTION_ESIGNATURE]'
      '           ([IMAGE_SIGNATURE]'
      '           ,[SIGNATURE_DATE]'
      '           ,[SIGNATURE_USER]'
      '           ,[PICKEDUP_BY_RELATION]'
      '           ,[PICKEDUP_ID])'
      '     VALUES'
      '           (@IMAGE_SIGNATURE,'
      '           @SIGNATURE_DATE,'
      '           @SIGNATURE_USER,'
      '           @PICKEDUP_BY_RELATION,'
      '           @PICKEDUP_ID);'
      #9'set @SIGNATURE_LINK = SCOPE_IDENTITY();'
      '  commit '
      'END;')
    Left = 3400
    Top = 416
  end
  object INSERT_PICKUP: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[INSERT_PICKUP] @NORX BIGINT, @OTCNUMBER ' +
        'INT, @INSTANCIA INT, @FECHA DATETIME, @ALL BIT, @REGISTER_ID INT' +
        ', @INSERTED BIT OUTPUT'
      'AS'
      'DECLARE @NO_RX INT'
      'DECLARE @OTC_NUMBER INT'
      'DECLARE @FE DATETIME'
      'DECLARE @REC_COUNT INT'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9#9'SELECT @REC_COUNT = COUNT(*) FROM PICK_UP WHERE OTCNUMBER = @O' +
        'TCNUMBER;'
      #9#9'IF @REC_COUNT = 0'
      #9#9'BEGIN'
      
        #9#9#9'Insert Into Pick_Up(NUMERORECETA, OTCNUMBER, INSTANCIA, FECHA' +
        ', REGISTER_ID) values (@NORX, @OTCNUMBER, @INSTANCIA, @FECHA, @R' +
        'EGISTER_ID);'
      #9#9#9'SET @INSERTED = 1;'
      #9#9'END'
      #9#9'ELSE'
      #9#9'BEGIN'
      #9#9#9'SET @INSERTED = 0;'
      #9#9'END;'
      #9'COMMIT'
      'END;')
    Left = 3400
    Top = 504
  end
  object INSERT_ESIGNATURE_STAMP: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_ESIGNATURE_STAMP]'
      '('
      '@OTCNUMBER INT,'
      '@NORX BIGINT,'
      '@SIGNATURE_USER CHAR(3)'
      ')'
      'AS'
      'DECLARE @TOKEN NCHAR(30)'
      'declare @Existingdate datetime'
      'DECLARE @Pesc_Sig_isIdentity BIT'
      'declare @SIGNATURE_LINK_LOCAL INT'
      'SET NOCOUNT ON'
      'BEGIN   '
      #9#9'begin transaction'
      
        #9#9'select @Pesc_Sig_isIdentity = columnproperty(object_id('#39'PRESCR' +
        'IPTION_ESIGNATURE'#39'),'#39'SIGNATURE_LINK'#39','#39'IsIdentity'#39')'
      #9#9'IF @Pesc_Sig_isIdentity = 1'
      #9#9'Begin'
      #9#9#9'INSERT INTO [dbo].[PRESCRIPTION_ESIGNATURE]'
      #9#9#9#9'   ([SIGNATURE_DATE]'
      #9#9#9#9'   ,[SIGNATURE_USER])'
      #9#9#9' VALUES'
      #9#9#9#9'   (GETDATE(),'
      #9#9#9#9'   @SIGNATURE_USER);'
      #9#9#9'set @SIGNATURE_LINK_LOCAL = SCOPE_IDENTITY();'
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      
        #9#9'    Exec SCANED_RX_LINK @SCANED_RX_LINK = @SIGNATURE_LINK_LOCA' +
        'L OUTPUT;'
      #9#9#9'INSERT INTO [dbo].[PRESCRIPTION_ESIGNATURE]'
      #9#9#9#9'   ([SIGNATURE_DATE]'
      #9#9#9#9'   ,[SIGNATURE_LINK] '
      #9#9#9#9'   ,[SIGNATURE_USER])'
      #9#9#9' VALUES'
      #9#9#9#9'   (GETDATE(),'
      #9#9#9#9'   @SIGNATURE_LINK_LOCAL,'
      #9#9#9#9'   @SIGNATURE_USER);'#9#9'  '
      #9#9'end;'
      #9#9'Set @Existingdate=GETDATE()'#9#9
      #9#9'select FORMAT(@Existingdate,'#39'MM/dd/yyyy hh:mm:s tt'#39')'
      #9#9'SELECT @TOKEN = CONCAT(@SIGNATURE_USER, '#39' '#39', @Existingdate);'#9#9
      
        #9#9'Update OTC set Signature_link = @SIGNATURE_LINK_LOCAL, WF_SIGN' +
        'ATURE = @TOKEN where OTCNumber = @OTCNumber;'
      
        #9#9'EXECUTE INSERT_LOG '#39'PRESCRIPTION STAMPED (SINGED)'#39', '#39'A'#39', '#39#39', @' +
        'SIGNATURE_USER, '#39#39', @NORX, @OTCNUMBER,0,0,0,0,0,0,'#39'R'#39','#39'Prescript' +
        'ion was stamped as signed by technician'#39',0,1;'
      #9#9'commit;'
      'END;')
    Left = 3408
    Top = 592
  end
  object INI_VALUES: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[INI_VALUES] @CLASSIC_SIG BIT OUTPUT, @Pe' +
        'sc_Sig_isIdentity BIT OUTPUT, @GSDD_VERSION int output,'
      
        '@BYPASS_PAT_VERIFICATION bit output, @Override_Controled_Rx bit ' +
        'output, @Enforce_rx_Scan bit output,'
      
        '@SILENT_BILLING_NEWRX bit output, @EnforceCustTelUpdate bit outp' +
        'ut, @BYPASS_PRESC_VERIFICATION bit output,'
      
        '@DONOTBILLINACTIVE_PRODUCT bit output, @VerificarTelefonoPacient' +
        'e bit output, @SAVEIMAGETODATABASE bit output,'
      
        '@BYPASS_FIRMA_ELECTRONICA bit output, @WF_ENFORCE_FILL bit outpu' +
        't, @NABP nchar(7) output,'
      
        '@DAW_DEFAULT_VALUE char(1) output, @GoldStandardActive BIT OUTPU' +
        'T, @RX_EXPIRATION_DAYS int output,'
      
        '@RX_CONTROLED_EXPIRATION_DAYS int output, @ENFORCE_LEVEL_OF_SERV' +
        'ICE bit output'
      'AS'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9'select @CLASSIC_SIG = isnull(CLASIC_SIG_CODES,0), @GSDD_VERSION' +
        ' = isnull(GSDD_VERSION,0), '
      #9'@BYPASS_PAT_VERIFICATION = isnull(BYPASS_PAT_VERIFICATION,0), '
      
        #9'@ENFORCE_RX_SCAN = ISNULL(ENFORCE_RX_SCAN,0), @SILENT_BILLING_N' +
        'EWRX = isnull(SILENT_BILLING_NEWRX,0), '
      
        #9'@EnforceCustTelUpdate = isnull(EnforceCustTelUpdate,0), @BYPASS' +
        '_PRESC_VERIFICATION = isnull(BYPASS_PRESC_VERIFICATION,0),'
      
        #9'@DONOTBILLINACTIVE_PRODUCT = isnull(DONOTBILLINACTIVE_PRODUCT,0' +
        '), @VerificarTelefonoPaciente = isnull(VerificarTelefonoPaciente' +
        ',0),'
      
        #9'@SAVEIMAGETODATABASE = isnull(SAVEIMAGETODATABASE,0), @BYPASS_F' +
        'IRMA_ELECTRONICA = isnull(BYPASS_FIRMA_ELECTRONICA,0),'
      
        #9'@WF_ENFORCE_FILL = isnull(WF_ENFORCE_FILL,0), @NABP = NABP, @Ov' +
        'erride_Controled_Rx = isnull(OVERRIDE_CONTROLLED_RX,0),'
      
        #9'@DAW_DEFAULT_VALUE = isnull(DAW_DEFAULT_VALUE,'#39'N'#39'), @GoldStanda' +
        'rdActive = isnull(GoldStandardActive,0),'
      
        #9'@RX_EXPIRATION_DAYS = ISNULL(RX_EXPIRATION_DAYS,0), @RX_CONTROL' +
        'ED_EXPIRATION_DAYS = isnull(RX_CONTROLED_EXPIRATION_DAYS, 0),'
      
        #9'@ENFORCE_LEVEL_OF_SERVICE = isnull(ENFORCE_LEVEL_OF_SERVICE, 0)' +
        ' '
      #9'from CREDITDEBITSETUP;'
      
        #9'select @Pesc_Sig_isIdentity = columnproperty(object_id('#39'PRESCRI' +
        'PTION_ESIGNATURE'#39'),'#39'SIGNATURE_LINK'#39','#39'IsIdentity'#39');'
      #9'COMMIT;'
      'END;')
    Left = 3416
    Top = 688
  end
  object WC_INSERT_NEWPRODUCT_BAG: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[WC_INSERT_NEWPRODUCT_BAG] @BAG_NUMBER NC' +
        'HAR(10), @DRUG_DESCRIPTION NCHAR(35), @CUSTOMER_NUMBER INT,'
      
        '@STATUS INT, @RX_DATE DATE, @NDC NCHAR(11), @PRUDUCT_ID INT, @RX' +
        '_NUMBER BIGINT, @COPAY FLOAT, @COST FLOAT,'
      
        '@PRICE FLOAT, @OTC_ATTENDED_BY NCHAR(5), @USER_NO INT, @CASH_PLA' +
        'N SMALLINT, @QUANTITY FLOAT, @BATCH_NUMBER INT,'
      
        '@OTC_NUMBER INT, @POS_PICKUP BIT, @USER NCHAR(3), @WF_STORAGE NC' +
        'HAR(30), @IS_CONTROLED BIT, @FILL_NUMBER INT, '
      '@DBName NCHAR(20)'
      '--, @NotificationMode smallint'
      'AS'
      'DECLARE @MYREFILL_UPDATE_SMARTPICKUP BIT'
      'DECLARE @NO_RECORDS INT'
      'DECLARE @SQL NVARCHAR(500);'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9#9'SELECT @MYREFILL_UPDATE_SMARTPICKUP = MYREFILL_UPDATE_SMARTPIC' +
        'KUP FROM CREDITDEBITSETUP;'
      
        #9#9'SELECT @NO_RECORDS = COUNT(*) FROM WillCall_Status WHERE BAG_N' +
        'UMBER = @BAG_NUMBER;'
      #9#9'IF @NO_RECORDS = 0'
      #9#9'BEGIN'
      
        #9#9#9'UPDATE WillCall_Status set Date_Created = GETDATE(), TIME_CRE' +
        'ATED = GETDATE() where Bag_Number = @BAG_NUMBER;'
      #9#9'END;'
      #9#9'INSERT INTO[dbo].[WILLCALL]'
      #9#9#9'([BAG_NUMBER],[DRUG_DESCRIPTION],[CUSTOMER_NUMBER],[STATUS]'
      #9#9#9',[RX_DATE],[NDC],[PRUDUCT_ID],[RX_NUMBER],[COPAY],[COST]'
      #9#9#9',[PRICE],[ATTENDED_BY],[USER_NO],[CASH_PLAN],[QUANTITY]'
      #9#9#9',[BATCH_NUMBER],[OTC_NUMBER] ,[WILLCALL_DATE_ENTERED]'
      #9#9#9',[POS_PICKUP], [FILL_NUMBER])'
      #9#9'VALUES'
      
        #9#9#9'(@BAG_NUMBER, @DRUG_DESCRIPTION, @CUSTOMER_NUMBER, @STATUS, @' +
        'RX_DATE, @NDC, @PRUDUCT_ID, '
      
        #9#9#9'@RX_NUMBER, @COPAY, @COST, @PRICE, @OTC_ATTENDED_BY, @USER_NO' +
        ', @CASH_PLAN, @QUANTITY, @BATCH_NUMBER,'
      #9#9#9'@OTC_NUMBER, GETDATE(), @POS_PICKUP,@FILL_NUMBER);        '
      
        #9#9'UPDATE WILLCALL_STATUS SET CUSTOMER_NUMBER = @CUSTOMER_NUMBER ' +
        'WHERE BAG_NUMBER = @BAG_NUMBER;'
      
        #9#9'--Exec WC_UPDATE_NOTIFICATION_MODE @CUSTOMER_NUMBER, @BAG_NUMB' +
        'ER, @DBName;'
      #9#9'/*'
      #9#9'IF @MYREFILL_UPDATE_SMARTPICKUP = 1'
      #9#9'BEGIN'
      #9#9#9'EXEC RX_UPDATE_REFILL_QUERY @RX_NUMBER;'
      
        #9#9#9'SET @SQL = '#39'UPDATE ['#39' + @DBName + '#39'].dbo.REFILL_QUERY SET RX_' +
        'STATUS = 3 WHERE OTCNUMBER = @OTC_NUMBER;'#39
      #9#9#9'Exec sp_executesql @SQL, N'#39'@OTC_NUMBER INT'#39', @OTC_NUMBER;'
      #9#9'END'
      
        #9#9'SET @SQL = '#39'UPDATE ['#39' + @DBName + '#39'].dbo. OTC SET WF_STORAGE =' +
        ' @WF_STORAGE WHERE OTCNUMBER = @OTC_NUMBER;'#39
      
        #9#9'Exec sp_executesql @SQL, N'#39'@WF_STORAGE NCHAR(30, @OTC_NUMBER I' +
        'N'#39', @WF_STORAGE, @OTC_NUMBER;'
      
        #9#9'--UPDATE OTC SET WF_STORAGE = @WF_STORAGE WHERE OTCNUMBER = @O' +
        'TC_NUMBER;'#9'  '
      
        #9#9'--EXEC INSERT_LOG '#39'SmartPickup Rx. Stored'#39', '#39'A'#39', '#39#39', @USER, '#39#39 +
        ', @RX_NUMBER, @OTC_NUMBER, 0, @CUSTOMER_NUMBER, 0, 0,0,@PRUDUCT_' +
        'ID, '#39'R'#39', '#39#39', @IS_CONTROLED, 1;'
      #9#9
      
        #9#9'SET @SQL = '#39'INSERT INTO ['#39' + @DBName + '#39'].dbo.LOG(CODIGO, USUA' +
        'RIO, FECHA, DESCRIPCION, NO_RX, OTCNUMBER, CUSTOMER_ID, DRUG_ID)' +
        ' '
      
        #9#9'            VALUES ('#39' + '#39'A'#39' + '#39', @USER, GETDATE(), '#39' + '#39'SmartP' +
        'ickup Rx. Stored'#39'+'#39', @RX_NUMBER, @OTC_NUMBER, @CUSTOMER_NUMBER, ' +
        '@PRUDUCT_ID);'#39';'#9' '
      
        '        Exec sp_executesql @SQL, N'#39'@USER NCHAR(3),@RX_NUMBER INT' +
        ', @OTC_NUMBER INT, @CUSTOMER_NUMBER INT, @PRUDUCT_ID, INT'#39',@USER' +
        ', @RX_NUMBER, @OTC_NUMBER, @CUSTOMER_NUMBER, @PRUDUCT_ID'
      '*/'
      
        #9#9'Insert into WILLCALL_LOG (user_no, Log_Date, Description, Modu' +
        'le, BAG_NUMBER, RX_NUMBER) '
      
        #9#9'Values (@USER_NO, GETDATE(), concat('#39'Insert Prescription : '#39', ' +
        '@RX_NUMBER) , '#39'Load'#39', @BAG_NUMBER, @RX_NUMBER);'
      #9'COMMIT'
      'END')
    Left = 3416
    Top = 792
  end
  object CUSTOMER_CLASSIFICATION: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'CUSTOMER' +
        '_CLASSIFICATION'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[CUSTOMER_CLASSIFICATION]('
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[CLIENT_CASSIFICATION] [nchar](20) NULL,'
      ' CONSTRAINT [PK_CUSTOMER_CLASSIFICATION] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 2512
    Top = 968
  end
  object INVENTORY_INOUT_REPORT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'INVENTOR' +
        'Y_INOUT_REPORT'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[INVENTORY_INOUT_REPORT]('
      #9'[description] [nchar](35) NULL,'
      #9'[strenght] [nchar](25) NULL,'
      #9'[form] [nchar](3) NULL,'
      #9'[size] [decimal](18, 2) NULL,'
      #9'[qty_orderd] [decimal](18, 2) NULL,'
      #9'[qty_received] [decimal](18, 2) NULL,'
      #9'[qty_sold] [decimal](18, 2) NULL,'
      #9'[unit_cost] [decimal](18, 2) NULL,'
      #9'[extended_cost] [decimal](18, 2) NULL,'
      #9'[invoice_number] [nchar](30) NULL,'
      #9'[rx_number] [bigint] NULL,'
      #9'[id] [int] IDENTITY(1,1) NOT NULL,'
      #9'[transaction_date] [date] NULL,'
      #9'[po] [nchar](15) NULL,'
      #9'[customer_supplier] [nchar](45) NULL,'
      #9'[expiration_date] [date] NULL,'
      #9'[inventory] [decimal](18, 2) NULL,'
      ' CONSTRAINT [PK_INVENTORY_INOUT_REPORT] PRIMARY KEY CLUSTERED '
      '('
      #9'[id] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 2512
    Top = 1080
  end
  object INV_INOUT_RPT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[INV_INOUT_RPT]'
      'AS'
      
        'SELECT        dbo.INVENTARIOPISO.TIPO, dbo.INVENTARIOPISO.PRODUC' +
        'TNO, dbo.INVENTARIOPISO.COSTO, dbo.INVENTARIOPISO.DESCRIPCION, d' +
        'bo.ORDER_HEADER.ORDERDATE, dbo.ORDER_DETAIL.QTYRECEIVED, '
      
        '                         dbo.ORDER_DETAIL.QTYORDERED, dbo.INVENT' +
        'ARIOPISO.METRICSIZE, dbo.ORDER_HEADER.ORDERNUMBER, dbo.INVENTARI' +
        'OPISO.STRENGTH, dbo.INVENTARIOPISO.NDC, dbo.ORDER_HEADER.PO_NO, '
      
        '                         dbo.ORDER_DETAIL.PAQUETES_FRASCOS, dbo.' +
        'INVENTARIOPISO.PACKAGESIZE, dbo.ORDER_HEADER.SUPPLIER'
      'FROM            dbo.ORDER_HEADER INNER JOIN'
      
        '                         dbo.ORDER_DETAIL ON dbo.ORDER_HEADER.OR' +
        'DERID = dbo.ORDER_DETAIL.ORDERID INNER JOIN'
      
        '                         dbo.INVENTARIOPISO ON dbo.ORDER_DETAIL.' +
        'PRODUCTID = dbo.INVENTARIOPISO.PRODUCTNO')
    Left = 3200
    Top = 968
  end
  object inout_report: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE procedure [dbo].[inout_report] '
      ' @DESCRIPTION NCHAR(35),'
      ' @STRENGHT NCHAR(25),'
      ' @form nchar(3),'
      ' @size decimal(18,2),'
      ' @qty_orderd decimal(18,2),'
      ' @qty_received decimal(18,2),'
      ' @qty_sold decimal(18,2),'
      ' @unit_cost decimal(18,2), '
      ' @extended_cost decimal(18,2),'
      ' @invoice_number nchar(30),'
      ' @rx_number bigint,'
      ' @transaction_date date,'
      ' @po nchar(15),'
      ' @customer_supplier nchar(45),'
      ' @expiration_date date,'
      ' @inventory decimal(18,2),'
      ' @NDC NCHAR(11),'
      ' @qty_max decimal(18,2),'
      ' @qty_min decimal(18,2),'
      ' @retail_price decimal(18,2),'
      ' @inv_qty_todate decimal(18,2)'
      'as'
      'begin'
      '  begin tran;'
      #9' INSERT INTO [dbo].[INVENTORY_INOUT_REPORT]'
      '           ([description]'
      '           ,[strenght]'
      '           ,[form]'
      '           ,[size]'
      '           ,[qty_orderd]'
      '           ,[qty_received]'
      '           ,[qty_sold]'
      '           ,[unit_cost]'
      '           ,[extended_cost]'
      '           ,[invoice_number]'
      '           ,[rx_number]'
      '           ,[transaction_date]'
      '           ,[po]'
      '           ,[customer_supplier]'
      #9#9'   ,[expiration_date]'
      #9#9'   ,[inventory]'
      #9#9'   ,[NDC]'
      #9#9'   ,[qty_max]'
      #9#9'   ,[qty_min]'
      #9#9'   ,[retail_price]'
      #9#9'   ,[inv_qty_todate])'
      '     VALUES'
      #9#9'(@description,'
      #9#9'@strenght,'
      #9#9'@form,'
      #9#9'isnull(@size,0), '
      #9#9'isnull(@qty_orderd,0), '
      #9#9'isnull(@qty_received,0),'
      #9#9'isnull(@qty_sold,0),'
      #9#9'isnull(@unit_cost,0),'
      #9#9'isnull(@extended_cost,0),'
      #9#9'@invoice_number,'
      #9#9'@rx_number,'
      #9#9'@transaction_date,'
      #9#9'@po,'
      #9#9'@customer_supplier,'
      #9#9'@expiration_date,'
      #9#9'@inventory,'
      #9#9'@NDC,'
      #9#9'@qty_max,'
      #9#9'@qty_min,'
      #9#9'@retail_price,'
      #9#9'@inv_qty_todate);'
      #9'   commit;'
      'end;')
    Left = 3192
    Top = 1048
  end
  object ADD_EDIT_MOBILE_BUTTONS_DETAIL: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE procedure [dbo].[ADD_EDIT_MOBILE_BUTTONS_DETAIL] (@descri' +
        'ption nchar(20)'
      '           ,@product_no int'
      '           ,@qty float'
      '           ,@btn_image image'
      '           ,@modifier bit'
      '           ,@category_id int'
      #9#9'   ,@id int'
      #9#9'   ,@row int'
      #9#9'   ,@col int'
      #9#9'   ,@add_on nchar(20)'
      #9#9'   ,@recipe bit)'
      'AS'
      'begin'
      #9'begin transaction'
      #9'if @id = 0 '
      #9'begin'
      #9#9'INSERT INTO [dbo].[BUTTONS_MOBILE_DETAIL]'
      #9#9#9'([description]'
      #9#9#9',[product_no]'
      #9#9#9',[qty]'
      #9#9#9',[btn_image]'
      #9#9#9',[modifier]'
      #9#9#9',[category_id]'
      #9#9#9',[row]'
      #9#9#9',[col]'
      #9#9#9',[add_on]'
      #9#9#9',[recipe]'
      #9#9#9',[tab_id])'
      #9#9'VALUES'
      #9#9#9'(@description, '
      #9#9#9'@product_no,'
      #9#9#9'@qty,'
      #9#9#9'@btn_image, '
      #9#9#9'@modifier, '
      #9#9#9'@category_id,'
      #9#9#9'@row,'
      #9#9#9'@col,'
      #9#9#9'@add_on,'
      #9#9#9'@recipe,'
      #9#9#9'0);'
      #9#9#9'set @id = SCOPE_IDENTITY();'
      '    end'
      #9'else'
      #9'begin'
      #9#9'UPDATE [dbo].[BUTTONS_MOBILE_DETAIL]'
      #9#9'   SET [description] = @description'
      #9#9#9'  ,[product_no] = @product_no'
      #9#9#9'  ,[qty] = @qty'
      #9#9#9'  ,[btn_image] = @btn_image'
      #9#9#9'  ,[modifier] = @modifier'
      #9#9#9'  ,[category_id] = @category_id'
      #9#9#9'  ,[row] = @row'
      #9#9#9'  ,[col] = @col'
      #9#9#9'  ,[add_on] = @add_on'
      #9#9#9'  ,[recipe] = @recipe'
      #9#9' WHERE id = @id;'
      #9'end;'
      #9'commit;'
      'end;')
    Left = 2976
    Top = 968
  end
  object ADD_EDIT_BUTTONS_MOBILE_HEADER: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'create procedure [dbo].[ADD_EDIT_BUTTONS_MOBILE_HEADER] (@descri' +
        'ption nchar(20), @button_category int, @category_id int output)'
      'as'
      'begin'
      '  if @category_id = 0 '
      '  begin'
      '    INSERT INTO [dbo].[BUTTONS_MOBILE_HEADER]'
      '           ([description]'
      '           ,[button_category])'
      '     VALUES'
      '           (@description'
      '           ,@button_category)'
      '     set @category_id = SCOPE_IDENTITY();'
      '  end'
      '  else'
      '  begin'
      #9'UPDATE [dbo].[BUTTONS_MOBILE_HEADER]'
      #9'   SET [description] = @description'
      #9#9'  ,[button_category] = @button_category'
      #9' WHERE category_id = @category_id;'
      '  end;'
      'end;')
    Left = 3960
    Top = 936
  end
  object BUTTONS_MOBILE_DETAIL: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'BUTTONS_' +
        'MOBILE_DETAIL'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[BUTTONS_MOBILE_DETAIL]('
      #9'[id] [int] IDENTITY(1,1) NOT NULL,'
      #9'[description] [nchar](20) NULL,'
      #9'[product_no] [int] NULL,'
      #9'[qty] [float] NULL,'
      #9'[btn_image] [image] NULL,'
      #9'[modifier] [bit] NULL,'
      #9'[category_id] [int] NULL,'
      #9'[row] [int] NULL,'
      #9'[col] [int] NULL,'
      ' CONSTRAINT [PK_BUTTONS_MOBILE] PRIMARY KEY CLUSTERED '
      '('
      #9'[id] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];'
      
        'ALTER TABLE [dbo].[BUTTONS_MOBILE_DETAIL] ADD  CONSTRAINT [DF_BU' +
        'TTONS_MOBILE_qty]  DEFAULT ((1)) FOR [qty];'
      
        'ALTER TABLE [dbo].[BUTTONS_MOBILE_DETAIL] ADD  CONSTRAINT [DF_BU' +
        'TTONS_MOBILE_modifier]  DEFAULT ((0)) FOR [modifier];'
      'END;')
    Left = 2976
    Top = 872
  end
  object BUTTONS_MOBILE_HEADER: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'BUTTONS_' +
        'MOBILE_HEADER'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[BUTTONS_MOBILE_HEADER]('
      #9'[category_id] [int] IDENTITY(1,1) NOT NULL,'
      #9'[description] [nchar](20) NULL,'
      #9'[button_category] [int] NULL,'
      ' CONSTRAINT [PK_BUTTONS_MOBILE_HEADER] PRIMARY KEY CLUSTERED '
      '('
      #9'[category_id] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 2976
    Top = 808
  end
  object UPDATE_BALANCE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER UPDATE_BALANCE ON TRANSACTIONHEADER_TEMP '
      '   AFTER UPDATE  --INSERT,'
      'AS '
      'DECLARE @TOTAL FLOAT;'
      'DECLARE @TOTAL_PAYAMOUNT FLOAT;'
      'DECLARE @TRANS_NO INTEGER;'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'IF ( UPDATE (PAYAMOUNT1) ) or ( UPDATE (PAYAMOUNT2))'
      #9'BEGIN'
      #9#9'SELECT @TOTAL = TOTAL + ISNULL(TIP,0) FROM INSERTED;'
      
        #9#9'SELECT @TOTAL_PAYAMOUNT = ISNULL(PAYAMOUNT1,0) + ISNULL(PAYAMO' +
        'UNT2,0), @TRANS_NO = TRANSACTIONNUMBER FROM inserted;'
      
        #9#9'UPDATE TRANSACTIONHEADER_TEMP SET BALANCE = (@TOTAL - @TOTAL_P' +
        'AYAMOUNT) WHERE TRANSACTIONNUMBER = @TRANS_NO; '
      #9'END;'
      'END;')
    Left = 3600
    Top = 112
  end
  object UPDATE_GBY_ID: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[UPDATE_GBY_ID] ON [dbo].[TABS_HEADER] '
      '   AFTER INSERT'
      'AS'
      'DECLARE @ID INTEGER'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'begin transaction '
      #9'select @ID = ID FROM inserted; '
      #9'UPDATE TABS_HEADER SET GROUP_BY_ID = @ID WHERE ID = @ID;'
      #9'commit;'
      'END;')
    Left = 3616
    Top = 200
  end
  object NOTIFICATION_LOG: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'NOTIFICA' +
        'TION_LOG'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[NOTIFICATION_LOG]('
      #9'[id] [int] IDENTITY(1,1) NOT NULL,'
      #9'[date] [datetime] NULL,'
      #9'[notification_type] [char](1) NULL,'
      #9'[otc_number] [int] NOT NULL,'
      #9'[notification_from] [smallint] NULL,'
      #9'[result] [int] NOT NULL,'
      ' CONSTRAINT [PK_NOTIFICATION_LOG] PRIMARY KEY CLUSTERED '
      '('
      #9'[id] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 3616
    Top = 288
  end
  object INSERT_NOTIFICATION_LOG: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE INSERT_NOTIFICATION_LOG (@notification_type CHA' +
        'R(1), @otc_number INT, '
      '@notification_from SMALLINT, @result INT)'
      'AS'
      'BEGIN'
      #9'begin transaction;'
      #9'INSERT INTO [dbo].[NOTIFICATION_LOG]'
      #9#9'([notification_type]'
      #9#9',[otc_number]'
      #9#9',[notification_from]'
      #9#9',[result])'
      #9'VALUES'
      #9#9'(@notification_type'
      #9#9',@otc_number'
      #9#9',@notification_from'
      #9#9',@result);'
      #9'commit'
      'END;')
    Left = 3616
    Top = 392
  end
  object payment_type: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'Surescri' +
        'pts'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[payment_type]('
      #9'[id] [int] IDENTITY(1,1) NOT NULL,'
      #9'[description] [nchar](20) NOT NULL,'
      #9'[customer_required] [bit] NOT NULL,'
      #9'[active] [bit] NOT NULL,'
      #9'[image] [image] NULL,'
      #9'[abbreviations] [nchar](4) NOT NULL,'
      #9'[cashback] [bit] NOT NULL,'
      #9'[isnegative] [bit] NOT NULL,'
      ' CONSTRAINT [PK_payment_type] PRIMARY KEY CLUSTERED '
      '('
      #9'[id] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];'
      
        'ALTER TABLE [dbo].[payment_type] ADD  CONSTRAINT [DF_payment_typ' +
        'e_call_customer]  DEFAULT ((0)) FOR [customer_required];'
      
        'ALTER TABLE [dbo].[payment_type] ADD  CONSTRAINT [DF_payment_typ' +
        'e_active]  DEFAULT ((1)) FOR [active];'
      
        'ALTER TABLE [dbo].[payment_type] ADD  CONSTRAINT [DF_payment_typ' +
        'e_cashback]  DEFAULT ((0)) FOR [cashback];'
      
        'ALTER TABLE [dbo].[payment_type] ADD  CONSTRAINT [DF_payment_typ' +
        'e_isnegative]  DEFAULT ((0)) FOR [isnegative];'
      'end;')
    Left = 3600
    Top = 40
  end
  object qCreateTables: TFDQuery
    Connection = FDConnection1
    Left = 3752
    Top = 40
  end
  object CODES: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'CODES'#39'  ' +
        ')'
      'BEGIN'
      'CREATE TABLE [dbo].[CODES]('
      #9'[CODE] [nchar](2) NOT NULL,'
      #9'[DESCRIPTION] [nchar](500) NULL,'
      #9'[INSTANCIA] [int] NULL,'
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      ' CONSTRAINT [PK_CODES_1] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZ' +
        'E_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 3608
    Top = 488
  end
  object WC_CREATE_NEWBAG: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[WC_CREATE_NEWBAG] @BAG_NUMBER NCHAR(10)'
      'AS'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      #9'  INSERT INTO [dbo].[WILLCALL_STATUS]'
      #9#9#9'([BAG_NUMBER], DONE)'
      #9#9'VALUES'
      #9#9#9'(@BAG_NUMBER,0);'
      #9'Commit;'
      'END;')
    Left = 3608
    Top = 576
  end
  object RX_AMOUNT_DUE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE RX_AMOUNT_DUE @NUMERO_CLIENTE int, @TOTAL_AMOUN' +
        'TDUE FLOAT OUTPUT '#9
      'AS'
      'DECLARE @TADEUDADO_CASH FLOAT'
      'DECLARE @TADEUDADO_PM FLOAT'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      
        #9'SELECT @TADEUDADO_CASH = ISNULL(SUM(TOTAL),0) FROM RX_AMOUNTDUE' +
        ' WHERE PLAN_MEDICO = '#39'CAS'#39' '
      #9#9'AND (RTRIM(WF_CASHIER) IS NULL OR WF_CASHIER = '#39#39')'
      
        #9#9'AND (RTRIM(PROXIMOREFILL) <> '#39'EXPIRED'#39' AND RTRIM(PROXIMOREFILL' +
        ') <> '#39'INACTIVE RX'#39')'
      #9#9'AND (NUMEROCLIENTE = @NUMERO_CLIENTE);'
      ''
      
        #9'SELECT @TADEUDADO_PM = ISNULL(SUM(DEDUCIBLE),0) FROM RX_AMOUNTD' +
        'UE WHERE PLAN_MEDICO <> '#39'CAS'#39' '
      #9#9'AND (RTRIM(WF_CASHIER) IS NULL OR RTRIM(WF_CASHIER) = '#39#39')'
      
        #9#9'AND (RTRIM(PROXIMOREFILL) <> '#39'EXPIRED'#39' AND RTRIM(PROXIMOREFILL' +
        ') <> '#39'INACTIVE RX'#39')'
      #9#9'AND (NUMEROCLIENTE = @NUMERO_CLIENTE);'
      ''
      
        #9'SET @TOTAL_AMOUNTDUE = isnull(@TADEUDADO_CASH + @TADEUDADO_PM,0' +
        ');'
      'END;')
    Left = 3616
    Top = 672
  end
  object RX_AMOUNTDUE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[RX_AMOUNTDUE]'
      'AS'
      
        'SELECT        dbo.PRESCRIPTIONS.NUMERORECETA, dbo.OTC.DEDUCIBLE,' +
        ' dbo.OTC.TOTAL, dbo.PRESCRIPTIONS.PROXIMOREFILL, dbo.OTC.PLAN_ME' +
        'DICO, dbo.OTC.OTCNUMBER, dbo.OTC.FECHAOTC, dbo.OTC.WF_CASHIER, '
      '                         dbo.OTC.NUMEROCLIENTE'
      'FROM            dbo.PRESCRIPTIONS INNER JOIN'
      
        '                         dbo.OTC ON dbo.PRESCRIPTIONS.NUMERORECE' +
        'TA = dbo.OTC.NUMERORECETA')
    Left = 3616
    Top = 760
  end
  object REFILL_REMINDER_SCHEDULE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name = '#39'REFILL_RE' +
        'MINDER_SCHEDULE'#39')'
      'BEGIN'
      'CREATE TABLE [dbo].[REFILL_REMINDER_SCHEDULE]('
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[SCHEDULE_DATE] [date] NULL,'
      #9'[NUMBER_OF_SMS] [int] NULL,'
      ' CONSTRAINT [PK_REFILL_REMINDER_SCHEDULE] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      ';'
      
        'ALTER TABLE [dbo].[REFILL_REMINDER_SCHEDULE] ADD  CONSTRAINT [DF' +
        '_REFILL_REMINDER_SCHEDULE_SCHEDULE_DATE]  DEFAULT (getdate()) FO' +
        'R [SCHEDULE_DATE]'
      'END;')
    Left = 3608
    Top = 864
  end
  object RX_REFILL_NOTIFIED: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE RX_REFILL_NOTIFIED '
      'AS'
      'DECLARE @DAYS_TO_Q INT'
      'DECLARE @DATE_ DATE'
      'declare @PAT_CLIENT_NUMBER int'
      'declare @RX_NUMBER INT'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'#9'       '
      
        #9#9'SELECT @DAYS_TO_Q = DAYS_TO_REFILL_REMIND FROM CREDITDEBITSETU' +
        'P'
      #9#9'SET @DATE_ = CAST(GETDATE()+@DAYS_TO_Q AS DATE);'#9' '#9
      
        #9#9'DECLARE MyCursor CURSOR FOR SELECT distinct PAT_CLIENT_NUMBER,' +
        ' RX_NUMBER'
      
        #9#9'FROM dbo.PRESCRIPTION_FULL WHERE (RX_NUMBER IS NOT NULL AND RX' +
        '_QTY_AVAILABLE > 0) and '
      
        #9#9'(RX_CONTROL = '#39'RX'#39') and CAST(RX_LAST_REFILL_DATE + DAYS_SUPPLY' +
        ' AS DATE) = @DATE_ and (@DATE_< (RX_DATE + 180)) '
      
        #9#9'and RX_ACTIVE = 1 and RX_REF_AUTHORIZED > 0 and NOTIFICATION_M' +
        'ODE_SMS = 1  '
      #9#9'and (REFILL_NOTIFIED is Null or REFILL_NOTIFIED = 0) and '
      #9#9'Claim_Status = 1 Order by PAT_CLIENT_NUMBER '
      #9#9'OPEN MyCursor'
      #9#9'FETCH NEXT FROM MyCursor'
      #9#9'INTO @PAT_CLIENT_NUMBER, @RX_NUMBER'
      #9#9'WHILE @@FETCH_STATUS = 0'
      #9#9'BEGIN'
      
        #9#9#9'UPDATE OTC SET REFILL_NOTIFIED = 1 WHERE NUMERORECETA = @RX_N' +
        'UMBER;'
      #9#9#9'FETCH NEXT FROM MyCursor'
      #9#9#9'INTO @PAT_CLIENT_NUMBER, @RX_NUMBER'
      #9#9'END'
      #9#9'CLOSE MyCursor'
      #9#9'DEALLOCATE MyCursor  '
      #9'commit;'
      'END')
    Left = 2968
    Top = 1136
  end
  object WC_UPDATE_NOTIFICATION_MODE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE procedure [dbo].[WC_UPDATE_NOTIFICATION_MODE] @CUSTOMER_N' +
        'UMBER INT, @BAG_NUMBER INT'
      'AS'
      'DECLARE @NOTIFICATION_MODE_PHONE INT'
      'DECLARE @NOTIFICATION_MODE_CEL INT'
      'DECLARE @NOTIFICATION_MODE_SMS INT'
      'DECLARE @NOTIFICATION_MODE_EMAIL INT'
      'DECLARE @EMAIL NCHAR(80)'
      'DECLARE @MOBILE NCHAR(11)'
      'DECLARE @HOME_PHONE NCHAR(11)'
      'DECLARE @NOTIFICATION_PHONE NCHAR(11)'
      'DECLARE @NOTIFICATION_MODE1 INT'
      'DECLARE @NOTIFICATION_MODE2 INT'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9'SELECT @NOTIFICATION_MODE_PHONE = NOTIFICATION_MODE_PHONE, @NOT' +
        'IFICATION_MODE_CEL = NOTIFICATION_MODE_CEL,'
      
        #9'@NOTIFICATION_MODE_SMS = NOTIFICATION_MODE_SMS, @NOTIFICATION_M' +
        'ODE_EMAIL = NOTIFICATION_MODE_EMAIL,'
      
        #9'@EMAIL = EMAIL, @MOBILE = '#39'1'#39'+SUBSTRING(CELULAR,2,3)+SUBSTRING(' +
        'CELULAR,6,3)+SUBSTRING(CELULAR,10,4),'
      
        #9'@HOME_PHONE = '#39'1'#39'+SUBSTRING(TELEFONO,2,3)+SUBSTRING(TELEFONO,6,' +
        '3)+SUBSTRING(TELEFONO,10,4)'
      #9'FROM PACIENTES WHERE NUMEROCLIENTE = @CUSTOMER_NUMBER;'#9#9#9#9
      #9
      
        #9'IF (@NOTIFICATION_MODE_PHONE = 1) or (@NOTIFICATION_MODE_CEL = ' +
        '1)'
      #9'begin'
      #9#9'set @NOTIFICATION_MODE1 = 3;'
      #9#9'if @NOTIFICATION_MODE_PHONE = 1'
      #9#9'begin'
      #9#9#9'SET @NOTIFICATION_PHONE = @HOME_PHONE;'
      #9#9'end   '
      #9#9'else'
      #9#9'begin'
      #9#9#9'SET @NOTIFICATION_PHONE = @MOBILE;'
      #9#9'end;'
      #9'end;'
      #9'if @NOTIFICATION_MODE_EMAIL = 1'
      #9'  Set @NOTIFICATION_MODE2 = 2'
      #9'else '
      #9'  Set @NOTIFICATION_MODE2 = 0;'
      #9'if @NOTIFICATION_MODE_SMS = 1'
      #9'begin'
      #9#9'SET @NOTIFICATION_PHONE = @MOBILE;'
      #9#9'set @NOTIFICATION_MODE1 = 1;'
      #9'end'
      #9'else'
      #9'begin'
      #9#9'set @NOTIFICATION_MODE1 = 0;'
      #9#9'SET @NOTIFICATION_PHONE = @HOME_PHONE;'
      #9'end;'
      
        #9'UPDATE WILLCALL_STATUS SET CUSTOMER_NUMBER = @CUSTOMER_NUMBER, ' +
        'NOTIFICATION_MODE1_EMAIL = @EMAIL,'
      
        #9'NOTIFICATION_MODE2_TELEPHONE = @NOTIFICATION_PHONE, NOTIFICATIO' +
        'N_MODE1 = @NOTIFICATION_MODE1,'
      #9'NOTIFICATION_MODE2 = @NOTIFICATION_MODE2'
      #9'WHERE BAG_NUMBER = @BAG_NUMBER;'
      #9'COMMIT;'
      'END;')
    Left = 3184
    Top = 1128
  end
  object PRINTERS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'PRINTERS' +
        #39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[PRINTERS]('
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[LABEL_NAME] [nchar](30) NOT NULL,'
      #9'[LEFT_MARGIN] [float] NOT NULL,'
      #9'[TOP_MARGIN] [float] NOT NULL,'
      #9'[PRINTER_NAME] [nchar](50) NOT NULL,'
      #9'[PAT_EDUCATION] [nchar](5) NULL,'
      #9'[PRINTER_ID] [int] NULL,'
      #9'[PAT_EDUCATION_ONLY] [bit] NULL,'
      #9'[DEFAULT_HISTORY_LABEL] [bit] NULL,'
      #9'[DEFAULT_NEWRX_LABEL] [bit] NULL,'
      #9'[DEFAULT_OTC_LABEL] [bit] NULL,'
      ' CONSTRAINT [PK_PRINTERS] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 2768
    Top = 1056
  end
  object WC_PATIENTS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[WC_PATIENTS]'
      'AS'
      
        'SELECT        dbo.PACIENTES.NUMEROCLIENTE, dbo.PACIENTES.NOMBRE,' +
        ' dbo.PACIENTES.APELLIDOPATERNO, dbo.PACIENTES.APELLIDOMATERNO, d' +
        'bo.PACIENTES.CELULAR, dbo.PACIENTES.DIRECCION1, dbo.PACIENTES.DI' +
        'RECCION2,'
      
        '                          dbo.PACIENTES.CIUDAD, dbo.PACIENTES.CO' +
        'DIGOPOSTAL, dbo.WILLCALL_STATUS.BAG_NUMBER, dbo.WILLCALL_STATUS.' +
        'NOTIFICATION_MODE2_TELEPHONE, dbo.WILLCALL_STATUS.DATE_CREATED, '
      
        '                         dbo.PACIENTES.ESTADO, dbo.PACIENTES.FEC' +
        'HANACIMIENTO, dbo.PACIENTES.TELEFONO, dbo.WILLCALL_STATUS.STATUS' +
        ', dbo.WILLCALL_STATUS.DATE_PICKUP_RTS, dbo.PACIENTES.FAMILY_LINK'
      'FROM            dbo.PACIENTES INNER JOIN'
      
        '                         dbo.WILLCALL_STATUS ON dbo.PACIENTES.NU' +
        'MEROCLIENTE = dbo.WILLCALL_STATUS.CUSTOMER_NUMBER')
    Left = 3904
    Top = 1072
  end
  object OTC_NON_RX: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[OTC_NON_RX]'
      'AS'
      
        'SELECT        dbo.OTC.QTY, dbo.OTC.PRODUCT_ID, dbo.INVENTARIOPIS' +
        'O.TIPO, dbo.OTC.FECHAOTC, dbo.OTC.NUMERORECETA, dbo.OTC.NDC, dbo' +
        '.INVENTARIOPISO.DESCRIPCION AS Medicamento'
      'FROM            dbo.OTC INNER JOIN'
      
        '                         dbo.INVENTARIOPISO ON dbo.OTC.PRODUCT_I' +
        'D = dbo.INVENTARIOPISO.PRODUCTNO')
    Left = 3912
    Top = 1152
  end
  object POS_INSERT_EVERTEC_TRANS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POS_INSERT_EVERTEC_TRANS] @TRANS_NO INT,' +
        ' @RESPONSE TEXT, @ID INT OUTPUT'
      'AS'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9'INSERT INTO EVERTEC (TRANSACTIONNUMBER, RESPONSE) VALUES (@TRAN' +
        'S_NO, @RESPONSE);'
      #9'SET @ID=SCOPE_IDENTITY();'
      #9'COMMIT;'#9
      'END;')
    Left = 3760
    Top = 184
  end
  object EVERTEC: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'EVERTEC'#39 +
        '  )'
      'BEGIN'
      'CREATE TABLE [dbo].[EVERTEC]('
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[TRANSACTIONNUMBER] [int] NULL,'
      #9'[RESPONSE] [text] NULL,'
      ' CONSTRAINT [PK_EVERTEC] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]'
      'END;')
    Left = 3760
    Top = 264
  end
  object PAYMENT_TYPES: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'PAYMENT_' +
        'TYPES'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[PAYMENT_TYPES]('
      #9'[id] [int] IDENTITY(1,1) NOT NULL,'
      #9'[payment_name] [nchar](20) NULL,'
      #9'[payment_type] [nchar](4) NULL,'
      ' CONSTRAINT [PK_PAYMENT_TYPES] PRIMARY KEY CLUSTERED '
      '('
      #9'[id] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 3768
    Top = 360
  end
  object CALC_DAILYTOTALS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[CALC_DAILYTOTALS] (@ID INT)'
      'AS'
      'DECLARE @REFUNDREAD FLOAT'
      'DECLARE @REFUNDREAD_PT2 FLOAT'
      'DECLARE @UtilityRead FLOAT'
      'DECLARE @WICREAD FLOAT'
      'DECLARE @WICREAD_PT2 FLOAT'
      'DECLARE @WICCRREAD FLOAT'
      'DECLARE @WICCRREAD_PT2 FLOAT'
      'DECLARE @CashRead FLOAT'
      'DECLARE @CashRead_PT2 FLOAT '
      'DECLARE @CheckRead FLOAT'
      'DECLARE @CheckRead_PT2 FLOAT'
      'DECLARE @CCardRead FLOAT'
      'DECLARE @CCardRead_PT2 FLOAT'
      'DECLARE @ATHRead FLOAT'
      'DECLARE @ATHRead_PT2 FLOAT'
      'DECLARE @ATHMRead FLOAT'
      'DECLARE @ATHMRead_PT2 FLOAT'
      'DECLARE @PORead FLOAT '
      'DECLARE @PORead_PT2 FLOAT '
      'DECLARE @POCOUNT FLOAT'
      'DECLARE @POCOUNT_PT2 FLOAT'
      'DECLARE @PayOutRead FLOAT'
      'DECLARE @PayOutRead_PT2 FLOAT'
      'DECLARE @OtherRead FLOAT'
      'DECLARE @OtherRead_PT2 FLOAT'
      'DECLARE @OTHERCOUNT FLOAT'
      'DECLARE @OTHERCOUNT_PT2 FLOAT'
      'DECLARE @TAX_MUNICIPAL FLOAT'
      'DECLARE @TAX_ESTATAL FLOAT'
      'DECLARE @TAX_SERVICIO FLOAT'
      'DECLARE @TAX_PROC_FOOD FLOAT'
      'DECLARE @EMPLOYEENUMBER CHAR(3)'
      'DECLARE @REGISTER INT'
      'DECLARE @TTIP FLOAT'
      'DECLARE @CASHBACK FLOAT'
      'DECLARE @TRIPLES_Read FLOAT'
      'DECLARE @TRIPLES_ReadT_PT2 FLOAT'
      'DECLARE @PayPal_read FLOAT'
      'DECLARE @PayPal_read_PT2 FLOAT '
      '--NEW'
      'DECLARE @PAYAMOUNT1 FLOAT'
      'DECLARE @PAYAMOUNT2 FLOAT'
      'DECLARE @payment_name NCHAR(20)'
      'DECLARE @payment_type NCHAR(4)'
      'BEGIN'
      '-- SET NOCOUNT ON added to prevent extra result sets from'
      '-- interfering with SELECT statements.'
      'SET NOCOUNT ON;'
      #9'begin transaction;'
      
        #9#9'Select @EMPLOYEENUMBER = EMPLOYNUMBER, @REGISTER = REGISTER FR' +
        'OM DAILYTOTALS WHERE ID = @ID;'
      
        #9#9'SELECT @TTIP = ISNULL(sum(TOTAL_TIP), 0) From TransactionHeade' +
        'r Where (ID = @ID) AND (Voided = 0) and (Register = @REGISTER);'
      
        #9#9'DECLARE MyCursor CURSOR FOR SELECT payment_name, payment_type ' +
        'from PAYMENT_TYPES;'
      #9#9'OPEN MyCursor'
      #9#9'FETCH NEXT FROM MyCursor'
      #9#9'INTO @payment_name, @payment_type'
      #9#9'WHILE @@FETCH_STATUS = 0'
      #9#9'BEGIN'
      '            IF rtrim(@payment_type) = '#39'REF'#39' '
      #9#9#9'begin'
      
        #9#9#9#9'SELECT @PAYAMOUNT1 = ISNULL(sum(PayAmount1), 0) From Transac' +
        'tionHeader Where (ID = @ID)  AND (Voided = 0) AND (PayAmount1 < ' +
        '0) and (Register = @REGISTER);'
      
        #9#9#9#9'SELECT @PAYAMOUNT2 = ISNULL(sum(PayAmount1), 0) From Transac' +
        'tionHeader Where (ID = @ID)  AND (Voided = 0) AND (PayAmount2 < ' +
        '0) and (Register = @REGISTER);'
      '            end'
      #9#9#9'else'
      #9#9#9'begin'
      
        #9#9#9#9'SELECT @PAYAMOUNT1 = ISNULL(sum(PayAmount1), 0) From Transac' +
        'tionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 ' +
        '= rtrim(@payment_type)) and (Register = @REGISTER);'
      
        #9#9#9#9'SELECT @PAYAMOUNT2 = ISNULL(sum(PayAmount2), 0) From Transac' +
        'tionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2 ' +
        '= rtrim(@payment_type)) and (Register = @REGISTER);'
      #9#9#9#9'FETCH NEXT FROM MyCursor'
      #9#9#9#9'INTO @payment_name, @payment_type'
      '            end;'
      #9#9'END'
      #9#9'CLOSE MyCursor'
      #9#9'DEALLOCATE MyCursor'#9#9#9
      ''
      ''
      ''
      
        #9#9'SELECT @REFUNDREAD = ISNULL(sum(PayAmount1), 0)  From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PayAmount1 < 0' +
        ') and (Register = @REGISTER);'
      
        #9#9'SELECT @REFUNDREAD_PT2 = ISNULL(sum(PayAmount2), 0)  From Tran' +
        'sactionHeader Where (ID = @ID)  AND (Voided = 0) AND (PayAmount2' +
        ' < 0) and (Register = @REGISTER);'
      
        #9#9'SELECT @WICREAD = ISNULL(sum(PayAmount1), 0) From TransactionH' +
        'eader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39'WI' +
        'C'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @WICREAD_PT2 = ISNULL(sum(PayAmount2), 0) From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2 =' +
        ' '#39'WIC'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @WICCRREAD = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39 +
        'PICK'#39') and (Register = @REGISTER);'#9
      
        #9#9'SELECT @WICCRREAD_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2' +
        ' = '#39'PICK'#39') and (Register = @REGISTER);'#9
      
        #9#9'SELECT @CheckRead = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39 +
        'CHK'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @CheckRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2' +
        ' = '#39'CHK'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @CCardRead = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39 +
        'VISA'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @CCardRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2' +
        ' = '#39'VISA'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @ATHRead = ISNULL(sum(PayAmount1), 0) From TransactionH' +
        'eader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39'AT' +
        'H'#39' or PAYMENTTYPE1 = '#39'TFAM'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @ATHRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PAYMENTTYPE2 =' +
        ' '#39'ATH'#39' or PAYMENTTYPE2 = '#39'TFAM'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @ATHMRead = ISNULL(sum(PayAmount1), 0) From Transaction' +
        'Header Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39'A' +
        'THM'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @ATHMRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transac' +
        'tionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2 ' +
        '= '#39'ATHM'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @PORead = ISNULL(sum(PayAmount1), 0) From TransactionHe' +
        'ader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39'CRE' +
        'D'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @PORead_PT2 = ISNULL(sum(PayAmount2), 0)  From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2 =' +
        ' '#39'CRED'#39') and (Register = @REGISTER);'
      #9#9
      
        #9#9'SELECT @PayPal_read = ISNULL(sum(PayAmount1), 0) From Transact' +
        'ionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 =' +
        ' '#39'PPAL'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @PayPal_read_PT2 = ISNULL(sum(PayAmount2), 0) From Tran' +
        'sactionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentTyp' +
        'e2 = '#39'PPAL'#39') and (Register = @REGISTER);'
      ''
      
        #9#9'SELECT @TRIPLES_Read = ISNULL(sum(PayAmount1), 0)  From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1' +
        ' = '#39'TSSS'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @TRIPLES_ReadT_PT2 = ISNULL(sum(PayAmount2), 0) From Tr' +
        'ansactionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentT' +
        'ype2 = '#39'TSSS'#39') and (Register = @REGISTER);'
      #9#9
      
        #9#9'SELECT @PayOutRead = ISNULL(sum(PayAmount1), 0) From Transacti' +
        'onHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = ' +
        #39'POUT'#39') and (Register = @REGISTER); '
      
        #9#9'SELECT @PayOutRead_PT2 = ISNULL(sum(PayAmount2), 0) From Trans' +
        'actionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType' +
        '2 = '#39'POUT'#39') and (Register = @REGISTER); '
      ''
      ''
      
        #9#9'SELECT @CashRead = ((ISNULL(sum(PayAmount1), 0)) - (ISNULL(sum' +
        '(CHANGE), 0))) From TransactionHeader Where (ID = @ID)  AND (Voi' +
        'ded = 0) AND (PaymentType1 = '#39'CASH'#39') and (Register = @REGISTER) ' +
        'and (PayAmount1 > TOTAL);'#9
      
        #9#9'SELECT @CashRead = @CashRead + (ISNULL(sum(PayAmount1), 0)) Fr' +
        'om TransactionHeader Where (ID = @ID)  AND (Voided = 0) AND (Pay' +
        'mentType1 = '#39'CASH'#39') and (Register = @REGISTER) and (PayAmount1 <' +
        '= TOTAL);'#9
      
        #9#9'SELECT @CashRead_PT2 = ((ISNULL(sum(PayAmount2), 0)) - (ISNULL' +
        '(sum(CHANGE), 0))) From TransactionHeader Where (ID = @ID)  AND ' +
        '(Voided = 0) AND (PaymentType2 = '#39'CASH'#39') and (Register = @REGIST' +
        'ER);'
      
        #9#9'SELECT @CASHBACK = ISNULL(SUM(CASHBACK), 0) From TransactionHe' +
        'ader Where (ID = @ID)  AND (Voided = 0) AND (Register = @REGISTE' +
        'R);'
      ''
      ''
      
        #9#9'SELECT @OtherRead = ISNULL(sum(PayAmount1), 0) From Transactio' +
        'nHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = '#39 +
        'NCHG'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @OtherRead_PT2 = ISNULL(sum(PayAmount2), 0) From Transa' +
        'ctionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType2' +
        ' = '#39'NCHG'#39') and (Register = @REGISTER);'
      
        #9#9'SELECT @OTHERCOUNT = ISNULL(sum(PayAmount1), 0) From Transacti' +
        'onHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType1 = ' +
        #39'NCHG'#39') and (Register = @REGISTER);  '
      
        #9#9'SELECT @OTHERCOUNT_PT2 = ISNULL(sum(PayAmount2), 0) From Trans' +
        'actionHeader Where (ID = @ID)  AND (Voided = 0) AND (PaymentType' +
        '2 = '#39'NCHG'#39') and (Register = @REGISTER);  '
      
        #9#9'SELECT @UtilityRead = (ISNULL(sum(transactiondetail.total),0))' +
        ' From transactiondetail inner join transactionheader on transact' +
        'iondetail.transactionnumber = transactionheader.transactionnumbe' +
        'r '
      #9#9#9#9'Where transactiondetail.upc like '#39'99999999995%'#39
      #9#9#9#9'AND (transactionheader.EmployNumber = @EMPLOYEENUMBER'
      #9#9#9#9'AND (transactionheader.Voided = 0) '
      #9#9#9#9'AND (transactionheader.ID = @ID)'
      #9#9#9#9'AND (transactionheader.Register = @REGISTER));'
      
        #9#9'SELECT @TAX_MUNICIPAL = ISNULL(sum(TAX), 0)  From TransactionH' +
        'eader Where (ID = @ID) AND (Voided = 0) AND (Register = @REGISTE' +
        'R);'
      
        #9#9'SELECT @TAX_ESTATAL =   ISNULL(sum(TAX_ESTATAL), 0) From Trans' +
        'actionHeader Where (ID = @ID) AND (Voided = 0) AND (Register = @' +
        'REGISTER);'
      
        #9#9'SELECT @TAX_SERVICIO =  ISNULL(sum(TAX_SERVICIO), 0) From Tran' +
        'sactionHeader Where (ID = @ID) AND (Voided = 0) AND (Register = ' +
        '@REGISTER);'
      
        #9#9'SELECT @TAX_PROC_FOOD =  ISNULL(sum(TAX_PROCESSED_FOOD), 0) Fr' +
        'om TransactionHeader Where (ID = @ID) AND (Voided = 0) AND (Regi' +
        'ster = @REGISTER);'
      #9#9
      
        #9#9'Update DAILYTOTALS set REFUNDREAD = @REFUNDREAD + @REFUNDREAD_' +
        'PT2, WICREAD = @WICREAD + @WICREAD_PT2, WICCRREAD = @WICCRREAD +' +
        ' @WICCRREAD_PT2, '
      
        #9#9'CashRead = (@CashRead + @CashRead_PT2) - (@PayOutRead + @PayOu' +
        'tRead_PT2 + @CASHBACK), CheckRead = @CheckRead + @CheckRead_PT2,'
      
        #9#9'CCardRead = @CCardRead + @CCardRead_PT2, ATHRead = @ATHRead + ' +
        '@ATHRead_PT2, ATHMRead = @ATHMRead + @ATHMRead_PT2, PORead = @PO' +
        'Read + @PORead_PT2, '
      #9#9'TRIPLESREAD = @TRIPLES_Read + @TRIPLES_ReadT_PT2,'
      
        #9#9'PayOutRead = @PayOutRead + @PayOutRead_PT2, OtherRead = @Other' +
        'Read + @OtherRead_PT2, '
      
        #9#9'OTHERCOUNT = @OTHERCOUNT + @OTHERCOUNT_PT2, UTILITYREAD = @Uti' +
        'lityRead,'
      
        #9#9'PAYPALREAD = @PayPal_read + @PayOutRead_PT2, CASHBACK = @CASHB' +
        'ACK,'
      
        #9#9'TOTAL_READ =  Cast((ISNULL(@CASHREAD,0)) + ISNULL(@CashRead_PT' +
        '2,0) + '
      
        #9#9'              (ISNULL(@ATHREAD,0)) + (ISNULL(@ATHRead_PT2,0)) ' +
        '+ '
      #9#9#9#9#9'  (ISNULL(@ATHMREAD,0)) + (ISNULL(@ATHMRead_PT2,0)) + '
      #9#9#9#9#9'  (ISNULL(@CCARDREAD,0)) + (ISNULL(@CCardRead_PT2,0)) +'
      #9#9#9#9#9'  (ISNULL(@CHECKREAD,0)) + (ISNULL(@CheckRead_PT2,0)) +'
      #9#9#9#9#9'  (ISNULL(@TRIPLES_Read,0) + (ISNULL(@CheckRead_PT2,0)) +'
      #9#9#9#9#9'  (ISNULL(@WICREAD,0)) + (ISNULL(@TRIPLES_ReadT_PT2,0)) + '
      #9#9#9#9#9'  (ISNULL(@PayPal_read,0)) + (ISNULL(@PayPal_read_PT2,0))) '
      #9#9#9#9#9'  - '
      #9#9#9#9#9'  (ISNULL(@PayOutRead,0) + @CASHBACK) as decimal(18,2)),'
      #9#9#9#9#9'   '
      
        #9#9'TOTAL_COUNT = CAST(isNull(cashcount,0) + isNull(TRIPLESREAD,0)' +
        ' + isNull(ATHCOUNT,0) +  isnull(ATHMCOUNT,0) + ISNULL(PAYPALCOUN' +
        'T, 0) + isNull(CCARDCOUNT,0) + isNull(CHECKCOUNT,0) + isNull(WIC' +
        'COUNT,0)  as decimal(20,2)) -CAST(isNull(STARTBANK,0)   as decim' +
        'al(20,2)),'
      
        #9#9'DIFFERENCE_AMOUNT = CAST(ISNULL(TOTAL_COUNT,0) AS decimal(18,2' +
        ')) - CAST(ISNULL(TOTAL_READ,0) AS decimal(18,2) ),'
      
        #9#9'TAX_ESTATAL = @TAX_ESTATAL, TAX_MUNICIPAL = @TAX_MUNICIPAL, TA' +
        'X_SERVICIO = @TAX_SERVICIO, '
      #9#9'TAX_PROCESSED_FOOD = @TAX_PROC_FOOD, TIPSREAD = @TTIP  '
      #9#9'Where ID = @ID;'
      #9'commit;'
      'END;')
    Left = 3776
    Top = 448
  end
  object CALC_SPLIT_PAYMENT_TAX: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'create procedure CALC_SPLIT_PAYMENT_TAX @TOTALAMOUNT FLOAT, @SPL' +
        'IT_AMOUNT FLOAT,'
      
        '@STATE_TAX decimal(18,2) OUTPUT, @MUNICIPAL_TAX decimal(18,2) OU' +
        'TPUT, @REDUCED_TAX decimal(18,2) OUTPUT, @PROCESS_FOOD_TAX decim' +
        'al(18,2) OUTPUT'
      'AS'
      'DECLARE @SPLIT_PERCENTAGE FLOAT'
      'BEGIN'
      '  SET @SPLIT_PERCENTAGE = @SPLIT_AMOUNT / @TOTALAMOUNT;'
      '  SET @STATE_TAX = @STATE_TAX * @SPLIT_PERCENTAGE;'
      '  SET @MUNICIPAL_TAX = @MUNICIPAL_TAX * @SPLIT_PERCENTAGE;'
      '  SET @REDUCED_TAX = @REDUCED_TAX * @SPLIT_PERCENTAGE;'
      
        '  SET @PROCESS_FOOD_TAX = @PROCESS_FOOD_TAX  * @SPLIT_PERCENTAGE' +
        ';'
      'END;')
    Left = 3776
    Top = 552
  end
  object INSERTPOS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[INSERTPOS] @PRODUCTNO INT, @QTY FLOAT, @' +
        'OTC_NUMBER INT, @TRANS_NO INT, @REGISTER INT,'
      
        '@ID INT, @bag_number int, @utility bit, @sssproduct bit, @note n' +
        'char(30), @PATROCINIO int,'
      '@Current_Identity int output, @percentage_discount float'
      'AS'
      'declare @regprice float'
      'declare @dailySale_Active bit'
      'declare @dailySale_start time'
      'declare @dailySale_end time'
      'declare @dalilySale_price float'
      'declare @start_special datetime'
      'declare @end_special datetime'
      'declare @special_price float'
      'declare @sale_price float'
      'declare @upc nchar(14)'
      'declare @productdescription nchar(30)'
      'declare @productdept smallint'
      'declare @productsubdept smallint'
      'declare @productdept_dec char(20)'
      'declare @fooditem int'
      'declare @cost float'
      'declare @suplier int '
      'declare @isRecepitPrice bit'
      'declare @RecepitPrice float'
      'declare @total float'
      'declare @regtotal float'
      'declare @statetax char(1)'
      'declare @municipaltax char(1)'
      'declare @process_food bit'
      'declare @product_count int'
      'declare @insert_new_product bit'
      'declare @prev_price float'
      'declare @currentqty float'
      'declare @qty_tmp float'
      'declare @ID_ONFILE INT'
      'declare @IS_COMMISSION_ACTIVE bit'
      'declare @COMMISSION_VALUE FLOAT'
      'declare @no_rx bigint'
      'declare @rx_status char(1)'
      'declare @patient_paid_amount float'
      'declare @rx_total float'
      'declare @plan_medico char(3)'
      'declare @discount float'
      'declare @sales_promotion_id int'
      'declare @counter integer'
      'declare @isFree_ bit'
      'BEGIN'
      #9'SET NOCOUNT ON;'
      #9'set @discount = 0;'
      #9'set @qty_tmp = @QTY;'
      #9'if @OTC_NUMBER > 0'
      #9'begin'
      #9#9'set @statetax = 0;'
      #9#9'set @municipaltax = 0;'
      #9#9'set @REGTOTAL = 0;'
      #9#9'set @suplier = 0;'
      
        #9#9'Select @RX_STATUS = RX_STATUS, @NO_RX = NUMERORECETA, @plan_me' +
        'dico = PLAN_MEDICO, @cost = COSTOVENTA,'
      
        #9#9'@patient_paid_amount = DEDUCIBLE, @rx_total = total from OTC w' +
        'here OTCNUMBER = @OTC_NUMBER;'#9
      #9#9'IF @RX_STATUS = '#39'C'#39' '
      #9#9'begin'
      
        #9#9#9'Update TRANSACTIONDETAIL_TEMP set TOTAL = 0 where UPC LIKE co' +
        'ncat('#39'%'#39', CAST(@NO_RX AS varchar), '#39'%'#39');'
      #9#9'end; '
      #9#9'Update OTC set COBRADO = '#39'T'#39' where OTCNUMBER = @OTC_NUMBER;'
      #9#9'if @plan_medico <> '#39'CAS'#39
      #9#9'begin'
      #9#9#9'set @sale_price = @patient_paid_amount;'
      #9#9#9'set @productdept_dec = '#39'RECETASP'#39';'
      #9#9'end;'
      #9#9'else'
      #9#9'begin'
      #9#9#9'set @sale_price = @rx_total;'
      #9#9#9'set @productdept_dec = '#39'RECETASC'#39';'
      #9#9'end;'
      #9'end;'
      #9'if @PRODUCTNO > 0 '
      #9'begin'
      
        #9#9'select @product_count = count(*) from TRANSACTIONDETAIL_TEMP w' +
        'here PRODUCTNO = @PRODUCTNO and TRANSACTIONNUMBER = @TRANS_NO;'#9
      
        #9#9'select @insert_new_product = POS_INSERT_NEW_PRODUCT, @IS_COMMI' +
        'SSION_ACTIVE = ACTIVE_COMMISSIONS from CREDITDEBITSETUP;'
      
        #9#9'select @ID_ONFILE = max(idnumber) from TRANSACTIONDETAIL_TEMP ' +
        'where PRODUCTNO = @PRODUCTNO and TRANSACTIONNUMBER = @TRANS_NO; '
      
        #9#9'select @prev_price = isnull(PRICE,0), @currentqty = isnull(QTY' +
        ',0) from TRANSACTIONDETAIL_TEMP where IDNUMBER = @ID_ONFILE; '
      #9#9'select @regprice = isNull(precio,0),'
      
        #9#9'@statetax = isNull(TAXABLE_ESTATAL,'#39'1'#39'), @municipaltax = isNul' +
        'l(taxable,'#39'1'#39'),'
      
        #9#9'@productdescription = SUBSTRING(DESCRIPCION,1,30), @productdep' +
        't = isNull(DEPARTAMENTO,0), '
      #9#9'@productsubdept = isNull(SUB_DEPARTAMENTO,0),'
      #9#9'@process_food = isNull(PROCESSED_FOOD,0),'
      
        #9#9'@fooditem = fooditem, @cost = isNull(costo,0), @suplier = isNu' +
        'll(NUMEROSUPLIDOR,0), @isRecepitPrice = isNull(RECIPE,0),'
      
        #9#9'@upc = CODIGOBARRA, @sale_price = isNull(PRECIO,0), @start_spe' +
        'cial = isNull(COMESPECIAL,getdate()-30), '
      
        #9#9'@end_special = isNull(TERMINAESPECIAL,getdate()-30), @RecepitP' +
        'rice = isNull(RECIPE_PRICE,0),'
      
        #9#9'@special_price = isNull(especial,0), @dailySale_Active = isNul' +
        'l(DAILY_SALE_ACTIVE,0), '
      
        #9#9'@dailySale_start = DAILY_SALE_START_TIME, @sales_promotion_id ' +
        '= isnull(SALES_PROMOTION_ID,0),'
      
        #9#9'@dailySale_end = DAILY_SALE_END_TIME, @dalilySale_price = isNu' +
        'll(DAILY_SPECIAL_PRICE,0) from INVENTARIOPISO where PRODUCTNO = ' +
        '@PRODUCTNO;'
      ''
      #9#9'if @productdept = 0'
      #9#9#9'set @productdept_dec = '#39'n/a'#39
      #9#9'else'
      
        #9#9#9'SELECT @productdept_dec = isNull(DESCRIPCION,'#39'n/a'#39') FROM DEPA' +
        'RTAMENTO WHERE DEPARTAMENTO = @productdept;  '
      ''
      #9#9'set @regtotal = @regprice * @QTY;'
      
        #9#9'if @statetax = '#39'1'#39' set @statetax = '#39'T'#39' else set @statetax = '#39'F' +
        #39';'
      
        #9#9'if @municipaltax = '#39'1'#39' set @municipaltax = '#39'T'#39' else set @munic' +
        'ipaltax = '#39'F'#39
      #9#9
      
        #9#9'if (getdate() > = @start_special) and (getdate() <= @end_speci' +
        'al)'
      #9#9'begin'
      #9#9#9'--BOGOF-------------------- '
      #9#9#9'if @sales_promotion_id > 0 '
      #9#9#9'begin'
      
        #9#9#9'  exec BOGOF @PRODUCTNO, @sales_promotion_id, @TRANS_NO, @isF' +
        'ree = @isFree_ output, @discount_ = @discount output;  '#9#9#9
      #9#9#9'  if @isFree_ = 1'
      #9#9#9'  begin'
      #9#9#9#9'set @sale_price = @sale_price - (@sale_price * @discount);'
      #9#9#9#9'set @insert_new_product = 1;'
      #9#9#9'  end;'
      #9#9#9'  if @isFree_ = 0'
      #9#9#9'  begin'
      #9#9#9'    if @isRecepitPrice = 1 '
      #9#9#9#9'begin'
      #9#9#9#9'  set @sale_price = @RecepitPrice;'
      #9#9#9#9'end'
      #9#9#9#9'else'
      #9#9#9#9'begin'
      #9#9#9#9#9'set @discount = 0;'
      #9#9#9#9#9'set @sale_price = @sale_price;'
      #9#9#9#9'end;'
      #9#9#9'  end;'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'begin'
      #9#9#9'  set @sale_price = @special_price;  '
      #9#9#9'end;'
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      #9#9#9'if  @percentage_discount > 0 '
      #9#9#9'begin'
      
        #9#9#9#9'set @sale_price = (@sale_price - (@sale_price * @percentage_' +
        'discount));'
      #9#9#9#9'set @discount = @sale_price * @percentage_discount;'
      #9#9#9#9'set @total = @sale_price * @QTY;'
      #9#9#9#9'set @discount =  @discount * @QTY;'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'begin'
      #9#9#9#9'if @isRecepitPrice = 1 '
      #9#9#9#9'begin'
      #9#9#9#9#9'set @sale_price = @RecepitPrice;'
      #9#9#9#9'end;'
      #9#9#9#9'if @dailySale_Active = 1'
      #9#9#9#9'begin'
      
        #9#9#9#9#9'if (CONVERT(VARCHAR, getdate(), 108) >= @dailySale_start) a' +
        'nd (CONVERT(VARCHAR, getdate(), 108) <= @dailySale_end)'
      #9#9#9#9#9'begin'
      #9#9#9#9#9#9'set @sale_price = @dalilySale_price;'
      #9#9#9#9#9'end;'
      #9#9#9#9'end;'
      #9#9#9'end;'
      #9#9'end;'
      
        #9#9'if (@product_count >= 1) and (@insert_new_product = 0) and (@B' +
        'AG_NUMBER = 0) and (@sale_price = @PREV_PRICE)'
      #9#9'begin'#9
      #9#9#9'set @qty = @qty + @currentqty;'
      #9#9'end;    '
      #9#9'set @total = @sale_price * @QTY;'
      #9#9'set @discount = (@regprice * @QTY) - (@sale_price * @QTY);'
      #9#9
      ''
      #9#9'IF @IS_COMMISSION_ACTIVE = 1 '
      #9#9'begin'
      
        #9#9#9'Exec @COMMISSION_VALUE = dbo.CALC_COMMISSION @PRODUCTNO, @tot' +
        'al, @QTY;'
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      #9#9#9'Select @COMMISSION_VALUE = 0; '
      #9#9'end;'
      #9'end;'
      
        #9'if (@product_count >= 1) and (@insert_new_product = 0) and (@BA' +
        'G_NUMBER = 0)  and (@OTC_NUMBER = 0) and (@sale_price = @PREV_PR' +
        'ICE)'
      #9'begin'#9
      
        #9'  update TRANSACTIONDETAIL_TEMP set QTY = @QTY, COSTO = @cost, ' +
        'DISCOUNT = @discount, TOTAL = @total where PRODUCTNO = @PRODUCTN' +
        'O'
      #9'  and IDNUMBER = @ID_ONFILE and TRANSACTIONNUMBER = @TRANS_NO;'
      #9'  set @Current_Identity = @TRANS_NO;'
      #9'end'
      #9'else'
      #9'begin'
      
        #9#9'Insert into TRANSACTIONDETAIL_TEMP(TRANSACTIONNUMBER, UPC, QTY' +
        ', TOTAL,VOIDED,SUBDETAIL,'
      
        #9#9'PRODDESCRIPTION, PRODDEPARTMENT, REGTOTAL, FOOD, PRICE, REGPRI' +
        'CE,MODIFIED, DISCOUNT, COSTO,'
      
        #9#9'FECHAVENTA, SUPLIDOR, TOTAL_VALUE, AWP, ID, PRODUCTNO, TAX_EST' +
        'ATAL,TAX_MUNICIPAL, OPENED,'
      
        #9#9'GROUP_PROD, REGISTER, SUPERVISOR, PATROCINIO, SUBDEPARTAMENTO,' +
        ' BARCODEALTERNO1, BARCODEALTERNO2,BAG_NUMBER,'
      
        #9#9'OTC_NUMBER, UTILIDAD, TAX_SERVICIO, NOTE, KITCHEN, MAIN_COURSE' +
        '_ID, MAIN_COURSE, INVCONTROL_RECIPE, BUTTON_QTY,'
      
        #9#9'COMMISSION, TAX_PROCESSED_FOOD, TRIPLES_PRODUCT, TRIPLES_COVER' +
        'ED) '
      #9#9'Values (@TRANS_NO, @UPC, @QTY, @TOTAL, 0, '#39'N'#39','
      
        #9#9'@productdescription, @productdept_dec, @REGTOTAL, CAST(@foodit' +
        'em AS varchar), @sale_price,@regprice , 0,'
      #9#9'@DISCOUNT, @cost, GETDATE(), @suplier, 0, 0, @ID, @PRODUCTNO,'
      
        #9#9'@statetax, @municipaltax, '#39'T'#39', '#39#39', @REGISTER, '#39#39', @PATROCINIO,' +
        ' @productsubdept, '
      #9#9#39#39', '#39#39', @bag_number, @OTC_NUMBER, @utility, 0, @NOTE, '
      #9#9'0, 0, 0, @isRecepitPrice, @QTY,'
      #9#9'@COMMISSION_VALUE, @process_food, @sssproduct, @sssproduct);'
      #9#9'SET @Current_Identity = SCOPE_IDENTITY()'
      '    end;'
      'END'
      '')
    Left = 3904
    Top = 128
  end
  object SOFTWARE_VERSION: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'SOFTWARE' +
        '_VERSION'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[SOFTWARE_VERSION]('
      #9'[version] [nchar](30) NULL,'
      #9'[date_updated] [datetime] NULL,'
      #9'[id] [int] IDENTITY(1,1) NOT NULL,'
      ' CONSTRAINT [PK_SOFTWARE_VERSION] PRIMARY KEY CLUSTERED '
      '('
      #9'[id] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 3912
    Top = 208
  end
  object POS_DISCOUNT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CREATE PROCEDURE [dbo].[POS_DISCOUNT] @TRANS_NO INT, @PERCENTAGE' +
        '_DISCOUNT FLOAT'
      'AS'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'begin transaction'
      
        #9#9'Update TransactionDetail_temp Set Total = Total * 1-(@PERCENTA' +
        'GE_DISCOUNT/100), Price = Price * 1-(@PERCENTAGE_DISCOUNT/100), ' +
        'Discount = @PERCENTAGE_DISCOUNT Where TransactionNumber = @TRANS' +
        '_NO and DISCOUNT = 0;'
      #9'commit transaction;'
      'END;')
    Left = 3912
    Top = 288
  end
  object BOGOF: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'create procedure BOGOF @PRODUCTID INT, @sales_promotion_id INT, ' +
        '@trans_no int, @isFree bit output, @discount_ float output'
      'as'
      'declare @counter int'
      'declare @qty float'
      'declare @qty_discount int'
      'declare @promo_qty int'
      'begin'
      #9'set @counter = 1;'
      #9'set @isFree = 0;'
      #9'set @discount_ = 0;'
      
        #9'Select @promo_qty = QTY, @qty_discount = QTY_DISCOUT, @discount' +
        '_ = DISCOUNT from Sales_Promotion where ID = @sales_promotion_id' +
        ';'#9
      
        #9'DECLARE MyCursorComp CURSOR FOR Select QTY from TransactionDeta' +
        'il_Temp where TRANSACTIONNUMBER = @TRANS_NO and ProductNo = @PRO' +
        'DUCTID;'
      #9'OPEN MyCursorComp'
      #9'FETCH NEXT FROM MyCursorComp'
      #9'INTO @qty'
      #9'WHILE @@FETCH_STATUS = 0'
      #9'begin'#9
      #9#9'set @counter = @counter + @qty;'
      #9#9'if @counter > (@qty_discount+@promo_qty) set @counter = 1;'
      #9#9'if (@counter > @promo_qty) '
      #9#9'begin'
      
        #9#9#9'if (@counter+1 >= (@qty_discount+@promo_qty)) and (@counter <' +
        '= (@qty_discount+@promo_qty)) '
      #9#9#9'begin'
      #9#9#9#9'set @isFree = 1;'
      #9#9#9'end'
      #9#9#9'else'
      #9#9#9'begin'
      #9#9#9#9'set @isFree = 0;'
      #9#9#9'end;'
      #9#9'end'
      #9#9'else'
      #9#9'begin'
      #9#9#9'set @isFree = 0;'
      #9#9'end;'
      #9#9'FETCH NEXT FROM MyCursorComp'
      #9#9'INTO @qty'#9#9' '
      #9'end;'
      #9'CLOSE MyCursorComp'
      #9'DEALLOCATE MyCursorComp'#9
      'end;'
      '')
    Left = 3912
    Top = 376
  end
  object WC_PATIENTS_HISTORY: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[WC_PATIENTS_HISTORY]'
      'AS'
      
        'SELECT     dbo.PACIENTES.NUMEROCLIENTE, dbo.PACIENTES.NOMBRE, db' +
        'o.PACIENTES.APELLIDOPATERNO, dbo.PACIENTES.APELLIDOMATERNO, dbo.' +
        'PACIENTES.CELULAR, dbo.PACIENTES.DIRECCION1, dbo.PACIENTES.DIREC' +
        'CION2, dbo.PACIENTES.CIUDAD, dbo.PACIENTES.CODIGOPOSTAL, '
      
        '                  dbo.WILLCALL_STATUS_HISTORY.BAG_NUMBER, dbo.WI' +
        'LLCALL_STATUS_HISTORY.NOTIFICATION_MODE2_TELEPHONE, dbo.WILLCALL' +
        '_STATUS_HISTORY.DATE_CREATED, dbo.PACIENTES.ESTADO, dbo.PACIENTE' +
        'S.FECHANACIMIENTO, dbo.PACIENTES.TELEFONO, '
      
        '                  dbo.WILLCALL_STATUS_HISTORY.STATUS, dbo.WILLCA' +
        'LL_STATUS_HISTORY.DATE_PICKUP_RTS'
      'FROM        dbo.PACIENTES INNER JOIN'
      
        '                  dbo.WILLCALL_STATUS_HISTORY ON dbo.PACIENTES.N' +
        'UMEROCLIENTE = dbo.WILLCALL_STATUS_HISTORY.CUSTOMER_NUMBER')
    Left = 3904
    Top = 40
  end
  object RELATIONFACILITY_PAT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'RELATION' +
        'FACILITY_PAT'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[RELATIONFACILITY_PAT]('
      #9'[FACILITY_ID] [int] NOT NULL,'
      #9'[NUMEROCLIENTE] [int] NOT NULL,'
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[BILLING] [bit] NULL,'
      ' CONSTRAINT [PK_PAT_FACILITIES_1] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 3768
    Top = 624
  end
  object RELATIONFACILITY_PRESC: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'RELATION' +
        'FACILITY_PRESC'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[RELATIONFACILITY_PRESC]('
      #9'[FACILITY_ID] [int] NOT NULL,'
      #9'[PRESCRIBERID] [int] NOT NULL,'
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[BILLING] [bit] NULL,'
      ' CONSTRAINT [PK_PRESC_FACILITIES_1] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 3568
    Top = 952
  end
  object Drug_Facilities: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'Drug_Fac' +
        'ilities'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[Drug_Facilities]('
      #9'[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,'
      #9'[ID_DRUG] [int] NOT NULL,'
      #9'[ID_FAC] [int] NOT NULL,'
      #9'[BILLING] [bit] NOT NULL,'
      #9'[Eleg] [bit] NOT NULL,'
      ' CONSTRAINT [PK_Drug_Facilities] PRIMARY KEY NONCLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 80) ON [PRIMARY]'
      ') ON [PRIMARY]'
      'END;                                         ')
    Left = 3576
    Top = 1040
  end
  object Prescriptions_ByPhone: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'Prescrip' +
        'tions_ByPhone'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[Prescriptions_ByPhone]('
      #9'[RXNUM] [bigint] NOT NULL,'
      #9'[PH_DATE] [smalldatetime] NOT NULL,'
      #9'[PH_TIME] [varchar](15) NOT NULL,'
      #9'[ID_PATIENT] [int] NOT NULL,'
      #9'[ID_DOCTOR] [int] NOT NULL,'
      #9'[ID_DRUG] [int] NOT NULL,'
      #9'[OTAKENBY] [varchar](30) NOT NULL,'
      #9'[OGIVENBY] [varchar](30) NOT NULL,'
      #9'[NOTES] [varchar](300) NOT NULL,'
      ' CONSTRAINT [PK_Prescriptions_ByPhone] PRIMARY KEY CLUSTERED '
      '('
      #9'[RXNUM] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY]'
      'END;')
    Left = 3576
    Top = 1128
  end
  object qryCreate: TFDQuery
    Connection = FDConnection1
    OnError = qryCreateError
    Left = 3912
    Top = 448
  end
  object INVENTARIO_ITEM: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'INVENTAR' +
        'IO_ITEM'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[INVENTARIO_ITEM]('
      #9'[PRODUCTNO] [int] NOT NULL,'
      #9'[INVREG_QT] [numeric](18, 3) NOT NULL,'
      #9'[INVMODIFY] [char](3) NULL,'
      #9'[INVUPDATE] [datetime] NULL,'
      #9'[Qty_Min] [numeric](18, 3) NOT NULL,'
      #9'[Qty_Max] [numeric](18, 3) NOT NULL,'
      #9'[INV340B_QT] [numeric](18, 3) NOT NULL,'
      #9'[340BMODIFY] [char](3) NULL,'
      #9'[340BUPDATE] [datetime] NULL,'
      #9'[INVLTC_QT] [numeric](18, 3) NOT NULL,'
      #9'[LTCQty_Min] [numeric](18, 3) NOT NULL,'
      #9'[LTCQty_Max] [numeric](18, 3) NOT NULL,'
      #9'[LTCMODIFY] [char](3) NULL,'
      #9'[LTCUPDATE] [datetime] NULL,'
      ' CONSTRAINT [PK_Inventory_ITEM] PRIMARY KEY NONCLUSTERED '
      '('
      #9'[PRODUCTNO] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFAC' +
        'TOR = 90) ON [PRIMARY]'
      ') ON [PRIMARY];'
      
        'ALTER TABLE [dbo].[INVENTARIO_ITEM] ADD  CONSTRAINT [DF_Inventor' +
        'y_ITEM_ON_HAND_QT]  DEFAULT ((0)) FOR [INVREG_QT];'
      
        'ALTER TABLE [dbo].[INVENTARIO_ITEM] ADD  CONSTRAINT [DF_Inventor' +
        'y_ITEM_Qty_Min]  DEFAULT ((0)) FOR [Qty_Min];'
      
        'ALTER TABLE [dbo].[INVENTARIO_ITEM] ADD  CONSTRAINT [DF_Inventor' +
        'y_ITEM_Qty_Max]  DEFAULT ((0)) FOR [Qty_Max];'
      
        'ALTER TABLE [dbo].[INVENTARIO_ITEM] ADD  CONSTRAINT [DF__Invento' +
        'ry_ITEM__INV34__244C51F8]  DEFAULT ((0)) FOR [INV340B_QT];'
      
        'ALTER TABLE [dbo].[INVENTARIO_ITEM] ADD  CONSTRAINT [DF__Invento' +
        'ry_ITEM__INVLT__46830519]  DEFAULT ((0)) FOR [INVLTC_QT];'
      
        'ALTER TABLE [dbo].[INVENTARIO_ITEM] ADD  CONSTRAINT [DF__Invento' +
        'ry_ITEM__LTCQt__5A624299]  DEFAULT ((0)) FOR [LTCQty_Min];'
      
        'ALTER TABLE [dbo].[INVENTARIO_ITEM] ADD  CONSTRAINT [DF__Invento' +
        'ry_ITEM__LTCQt__5B5666D2]  DEFAULT ((0)) FOR [LTCQty_Max];'
      'end;'
      ''
      ''
      '')
    Left = 3920
    Top = 528
  end
  object INVENTORY_ERX: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INVENTORY_ERX]'
      #9#9'@sRXNum  VARCHAR(12),'
      #9#9'@NDC VARCHAR(15),'
      #9#9'@InvReg BIT,'
      #9#9'@Inv340B BIT,'
      #9#9'@InvLTC BIT,'
      #9#9'@QTY NUMERIC(18,3)'
      'AS'
      'BEGIN'
      #9'    DECLARE @iIDDrug INTEGER=0,'
      #9#9#9#9'@sInvREG NUMERIC(18,3)=0,'
      #9#9#9#9'@sInv340B NUMERIC(18,3)=0,'
      #9#9#9#9'@sInvLTC NUMERIC(18,3)=0,'
      #9#9#9#9'@SQL VARCHAR(MAX)'
      ''
      #9#9'SET NOCOUNT ON;'
      ''
      #9#9'SELECT @QTY = @QTY*(-1);'
      ''
      
        #9#9'SELECT @iIDDrug=IV.ID_DRUG,@sInvREG=ON_HAND_QT,@sInv340B=INVLT' +
        'C_QT,@sInvLTC=INV340B_QT '
      '        FROM [EasyRx].[DBO].[drugs] DR'
      
        #9#9#9'INNER JOIN [EasyRx].[DBO].[INVENTORY] IV on IV.ID_DRUG=DR.GEN' +
        'ERIC_LNK'
      '        WHERE DR.NDC=@NDC'
      ''
      #9#9'--actualiza el inventario'
      #9#9'UPDATE IV SET '
      #9#9#9' INVLTC_QT = INVLTC_QT + IIF(@InvLTC=1 ,@QTY,0)'
      #9#9#9',INV340B_QT = INV340B_QT + IIF(@Inv340B=1, @QTY,0)'
      #9#9#9',ON_HAND_QT = ON_HAND_QT + IIF(@InvReg=1, @QTY,0)'
      #9#9'FROM [EasyRx].[DBO].[INVENTORY] IV WHERE ID_DRUG = @iIDDrug'
      ''
      
        #9#9'INSERT INTO [EasyRx].[DBO].[InvModHist] (ID_DRUG,DateHist,QTYH' +
        'ist,ModifHist,NotesHist,RX,TypeInv,PrevInv)'
      
        #9#9'SELECT @iIDDrug ,GETDATE(),@QTY,'#39'SRV'#39',IIF(@QTY>0,'#39'Others Rec.'#39 +
        ','#39'Others'#39'),@sRXNum ,'
      
        #9#9'IIF(@InvLTC=1,'#39'LTC'#39',IIF(@Inv340B=1,'#39'340B'#39','#39'REG'#39')),IIF(@InvLTC=' +
        '1,@sInvLTC,IIF(@Inv340B=1,@sInv340B,@sInvREG))      '
      'END')
    Left = 3928
    Top = 616
  end
  object PRODUCT_SIGNATURE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'PRODUCT_' +
        'SIGNATURE'#39'  )'
      'BEGIN'
      'CREATE TABLE [dbo].[PRODUCT_SIGNATURE]('
      #9'[ENCRYPTED_SIGNATURE] [text] NULL,'
      '      [SIGNATURE_DATE] [date] NULL,'
      '      [SIGNATURE_USER] [nchar](3) NULL,'
      '      [TRANSACTIONNUMBER] [int] NOT NULL,'
      '      [PICKEDUP_BY] [nchar](45) NULL,'
      '      [PICKEDUP_ID] [nchar](20) NULL,'
      '      [IMAGE_SIGNATURE] [image] NULL,'
      '      [PICKEDUP_ADDRESS] [text] NULL,'
      '      [PICKEDUP_ID_TYPE] [nchar](30) NULL,'
      'PRIMARY KEY CLUSTERED '
      '('
      #9'[TRANSACTIONNUMBER] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]    '
      'END;          ')
    Left = 3368
    Top = 1088
  end
  object INSERT_PRODUCT_SIGNATURE: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[INSERT_PRODUCT_SIGNATURE]'
      '('
      '@IMAGE_SIGNATURE image,'
      '@SIGNATURE_DATE DATE,'
      '@SIGNATURE_USER NCHAR(3),'
      '@PICKEDUP_ID NCHAR(20),'
      '@PICKEDUP_BY NCHAR(45),'
      '@TRANSACTIONNUMBER INT,'
      '@PICKEDUP_ADDRESS nchar(80),'
      '@PICKEDUP_ID_TYPE nchar(15)'
      ')'
      'AS'
      'DECLARE @TOKEN NCHAR(30)'
      'declare @Existingdate datetime'
      'SET NOCOUNT ON'
      'BEGIN   '
      #9'begin transaction'
      #9'INSERT INTO [dbo].[PRODUCT_SIGNATURE]'
      #9#9#9'([IMAGE_SIGNATURE]'
      #9#9#9',[SIGNATURE_DATE]'
      #9#9#9',[SIGNATURE_USER]'
      #9#9#9',[PICKEDUP_ID]'
      #9#9'    ,[PICKEDUP_BY]'
      #9#9#9',[TRANSACTIONNUMBER]'
      #9#9#9',[PICKEDUP_ADDRESS]'
      #9#9#9',[PICKEDUP_ID_TYPE])'
      #9#9'VALUES'
      #9#9#9'(@IMAGE_SIGNATURE,'
      #9#9#9'@SIGNATURE_DATE,'
      #9#9#9'@SIGNATURE_USER,'
      #9#9#9'@PICKEDUP_ID,'
      #9#9#9'@PICKEDUP_BY,'
      #9#9#9'@TRANSACTIONNUMBER,'
      #9#9#9'@PICKEDUP_ADDRESS,'
      #9#9#9'@PICKEDUP_ID_TYPE);'
      #9'commit;'
      'END;')
    Left = 2976
    Top = 1056
  end
  object PSEUDO_SALES_LOG: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE VIEW [dbo].[PSEUDO_SALES_LOG]'
      'AS'
      
        'SELECT     dbo.PRODUCT_SIGNATURE.ENCRYPTED_SIGNATURE, dbo.PRODUC' +
        'T_SIGNATURE.SIGNATURE_DATE, dbo.PRODUCT_SIGNATURE.SIGNATURE_USER' +
        ', dbo.PRODUCT_SIGNATURE.TRANSACTIONNUMBER, '
      
        '                         dbo.PRODUCT_SIGNATURE.PICKEDUP_BY, dbo.' +
        'PRODUCT_SIGNATURE.PICKEDUP_ID, dbo.TRANSACTIONDETAIL.PRODDESCRIP' +
        'TION, dbo.TRANSACTIONDETAIL.QTY, dbo.TRANSACTIONDETAIL.UPC, '
      
        '                         dbo.TRANSACTIONDETAIL.pseudo, dbo.TRANS' +
        'ACTIONDETAIL.pep_spray, dbo.PRODUCT_SIGNATURE.IMAGE_SIGNATURE, d' +
        'bo.PRODUCT_SIGNATURE.PICKEDUP_ADDRESS, '
      '                         dbo.PRODUCT_SIGNATURE.PICKEDUP_ID_TYPE'
      'FROM        dbo.PRODUCT_SIGNATURE INNER JOIN'
      
        '                  dbo.TRANSACTIONDETAIL ON dbo.PRODUCT_SIGNATURE' +
        '.TRANSACTIONNUMBER = dbo.TRANSACTIONDETAIL.TRANSACTIONNUMBER')
    Left = 3952
    Top = 856
  end
  object WF_UPDATE_PICKUP: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE  PROCEDURE dbo.WF_UPDATE_PICKUP ('
      #9'@DBName nchar(20),'
      #9'@OTCNUMBER integer,'
      #9'@USER CHAR(3))'
      'as'
      'BEGIN'
      '    DECLARE @SQL NVARCHAR(500);'
      #9'DECLARE @NUMEROCLIENTE integer;'
      #9'DECLARE @RXNO int;'
      #9'DECLARE @PRODUCTNO integer;'
      #9'DECLARE @DESCRIPTION NCHAR(30);'
      #9'DECLARE @ISCONTROLLED BIT;'
      #9'DECLARE @DATE_ DATETIME;'
      #9'DECLARE @TIME_ DATETIME;'
      #9'DECLARE @CODE CHAR(1);'
      #9'DECLARE @ISCONTROLED BIT;'
      #9'DECLARE @TOKEN NCHAR(30);'
      #9'DECLARE @COBRADO CHAR(1)'
      #9'SET @CODE = '#39'U'#39';'
      #9'SET @COBRADO = '#39'T'#39';'
      
        #9'SELECT @RXNO = RX_NUMBER, @PRODUCTNO = PRUDUCT_ID  FROM WILLCAL' +
        'L WHERE OTC_NUMBER = @OTCNUMBER;'
      
        #9'SET @TOKEN = @USER + '#39' '#39' + convert(varchar,  getdate(), 101) + ' +
        #39' '#39' + convert(varchar,  getdate(), 114) '
      
        #9'---------------------------------------------------------------' +
        '----------------------------------------------------------'
      
        #9'set @SQL = '#39'Update ['#39' + @DBName + '#39'].dbo.OTC set WF_CASHIER = @' +
        'TOKEN, WC_PICKUP = 1, COBRADO = @COBRADO Where OTCNUMBER = @OTCN' +
        'UMBER'#39';'
      
        #9'exec sp_executesql @SQL, N'#39'@TOKEN NCHAR(30), @COBRADO CHAR(1), ' +
        '@OTCNUMBER INTEGER'#39', @TOKEN, @COBRADO, @OTCNUMBER;'
      
        #9'set @SQL = '#39'insert into ['#39' + @DBName + '#39'].dbo.log (DESCRIPCION,' +
        ' CODIGO, USUARIO,NO_RX, OTCNUMBER, CUSTOMER_ID, DRUG_ID, FECHA, ' +
        'HORA)  '
      
        #9'VALUES ( @DESCRIPTION, @CODE, @USER, @NORX, @OTCNUMBER, @NUMERO' +
        'CLIENTE, @PRODUCTNO, @DATE_, @TIME_)'#39';'
      #9'set @DESCRIPTION = '#39'RX PICKED UP BY SMARTPICKUP'#39';'
      #9'set @DATE_ = getdate();'
      #9'set @TIME_ = GETDATE();'
      
        #9'exec sp_executesql @SQL, N'#39'@DESCRIPTION NCHAR(30), @CODE CHAR(1' +
        '),@USER CHAR(3),@NORX integer, @OTCNUMBER integer, @NUMEROCLIENT' +
        'E integer, @PRODUCTNO integer, @DATE_ datetime, @TIME_ datetime'#39 +
        ',  '
      
        #9'@DESCRIPTION, @CODE, @user, @RXNO, @OTCNUMBER, @NUMEROCLIENTE, ' +
        '@PRODUCTNO, @DATE_, @TIME_; '
      #9'set @DESCRIPTION = '#39'RX POS PAID FOR'#39';'
      
        #9'exec sp_executesql @SQL, N'#39'@DESCRIPTION NCHAR(30), @CODE CHAR(1' +
        '),@USER CHAR(3),@NORX integer, @OTCNUMBER integer, @NUMEROCLIENT' +
        'E integer, @PRODUCTNO integer, @DATE_ datetime, @TIME_ datetime'#39 +
        ',  '
      
        #9'@DESCRIPTION, @CODE, @user, @RXNO, @OTCNUMBER, @NUMEROCLIENTE, ' +
        '@PRODUCTNO, @DATE_, @TIME_; '
      'END'
      '')
    Left = 3944
    Top = 768
  end
  object POS_UPDATE_DEPART_ATTRIB: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE   PROCEDURE [dbo].[POS_UPDATE_DEPART_ATTRIB]('
      #9#9'@pOPC INT = 0'
      #9',@pType VARCHAR(1)'
      #9',@DEPARTAMENTO varchar(20) '
      #9',@ALWDISC bit=0'
      #9',@ROUND bit=0'
      #9',@DepL varchar(4)='#39#39
      #9',@DepS varchar(4)='#39#39
      #9',@NLINE bit=0'
      #9',@EBT bit=0'
      #9',@Sigis bit=0'
      #9',@OTCCard bit=0'
      #9',@Pseudo bit=0'
      #9',@pseudoMgD int=0'
      #9',@PseudoMgP int=0'
      #9',@NonRefund bit=0'
      #9',@bogodate datetime=NULL'
      #9',@BOGODatetmp datetime=NULL'
      #9',@BOGOEndtmp datetime=NULL'
      #9',@BOGOOffertmp int=0'
      #9',@BOGOEnd datetime=NULL'
      #9',@BOGOOffer int=0'
      #9',@PepSpray bit=0'
      #9',@MaxPerTx int=0'
      #9',@SkipPriceUpd bit=0'
      #9'--,@DtSkipPriceUpd datetime=NULL'
      #9'--,@SkipPriceUpdInit varchar(10)='#39#39
      #9',@SkipPriceDistUpd bit=0'
      #9',@Taxable bit=0'
      #9',@txtgm float=0'
      #9',@userini varchar(10)='#39#39
      #9',@AskId int=0'
      ')'
      'AS'
      'BEGIN'
      #9'DECLARE @SQL VARCHAR(MAX)'
      ''
      #9'if @pOPC=1'
      #9'BEGIN'
      #9#9'UPDATE INVENTARIOPISO SET '
      #9#9#9'ALWDISC = @ALWDISC '
      #9#9#9',[ROUND] = @ROUND '
      #9#9#9'--,@DepL'#9',@DepS'
      #9#9#9',NLINE = @NLINE '
      #9#9#9',EBT = @EBT '
      #9#9#9',Sigis = @Sigis '
      #9#9#9',OTCCard = @OTCCard '
      #9#9#9',Pseudo = @Pseudo '
      #9#9#9'--,@pseudoMgD '
      #9#9#9'--,@PseudoMgP '
      #9#9#9',NonRefund = @NonRefund '
      #9#9#9'--,@bogodate '
      #9#9#9'--,@BOGODatetmp '
      #9#9#9'--,@BOGOEndtmp '
      #9#9#9'--,@BOGOOffertmp '
      #9#9#9'--,@BOGOEnd '
      #9#9#9'--,@BOGOOffer '
      #9#9#9',PepSpray = @PepSpray '
      #9#9#9'--,@MaxPerTx '
      #9#9#9',SkipPriceUpd = @SkipPriceUpd '
      #9#9#9',DtSkipPriceUpd = GETDATE()'#9'--@DtSkipPriceUpd '
      #9#9#9',SkipPriceUpdInit = @userini --@SkipPriceUpdInit'
      #9#9#9',Taxable = @Taxable'
      #9#9#9',AskId = @AskId'
      
        #9#9'WHERE @DEPARTAMENTO=IIF(@pType='#39'D'#39' ,DEPARTAMENTO,SUB_DEPARTAME' +
        'NTO);'
      #9#9
      
        #9#9'SET @SQL='#39'UPDATE '#39'+IIF(@pType='#39'D'#39' ,'#39'DEPARTAMENTO'#39','#39'SUB_DEPARTA' +
        'MENTO'#39')+'#39' SET '
      #9#9#9'ALWDISC = '#39' + CONVERT(VARCHAR(1),@ALWDISC )'
      #9#9#9'+ '#39',[ROUND] = '#39' + CONVERT(VARCHAR(1),@ROUND  )'
      #9#9#9'+ '#39',NLINE = '#39' + CONVERT(VARCHAR(1),@NLINE  )'
      #9#9#9'+ '#39',EBT = '#39' + CONVERT(VARCHAR(1),@EBT  )'
      #9#9#9'+ '#39',Sigis = '#39' + CONVERT(VARCHAR(1),@Sigis  )'
      #9#9#9'+ '#39',OTCCard = '#39' + CONVERT(VARCHAR(1),@OTCCard  )'
      #9#9#9'+ '#39',Pseudo = '#39' + CONVERT(VARCHAR(1),@Pseudo  )'
      #9#9#9'--,@pseudoMgD '
      #9#9#9'--,@PseudoMgP '
      #9#9#9'+ '#39',NonRefund = '#39' + CONVERT(VARCHAR(1),@NonRefund ) '
      #9#9#9'+ '#39',PepSpray = '#39' + CONVERT(VARCHAR(1),@PepSpray  )'
      #9#9#9'--,@MaxPerTx '
      #9#9#9'+ '#39',SkipPriceUpd = '#39' + CONVERT(VARCHAR(1),@SkipPriceUpd  )'
      
        #9#9#9'+ '#39',SkipPriceDistUpd = '#39' + CONVERT(VARCHAR(1),@SkipPriceDistU' +
        'pd )'
      #9#9#9'+ '#39',Taxable = '#39' + CONVERT(VARCHAR(1),@Taxable )'
      #9#9#9'+ '#39',AskId = '#39' + CONVERT(VARCHAR(2),@AskId)'
      #9#9#9'+ '#39' WHERE DEPARTAMENTO='#39'+CONVERT(VARCHAR(20),@DEPARTAMENTO );'
      #9#9#9'EXEC (@SQL);'
      ''
      #9#9#9'IF @pType='#39'D'#39
      #9#9#9'begin'
      #9#9#9#9'SET @SQL='#39'UPDATE SUB_DEPARTAMENTO SET '
      #9#9#9#9#9'ALWDISC = '#39' + CONVERT(VARCHAR(1),@ALWDISC )'
      #9#9#9#9#9'+ '#39',[ROUND] = '#39' + CONVERT(VARCHAR(1),@ROUND  )'
      #9#9#9#9#9'+ '#39',NLINE = '#39' + CONVERT(VARCHAR(1),@NLINE  )'
      #9#9#9#9#9'+ '#39',EBT = '#39' + CONVERT(VARCHAR(1),@EBT  )'
      #9#9#9#9#9'+ '#39',Sigis = '#39' + CONVERT(VARCHAR(1),@Sigis  )'
      #9#9#9#9#9'+ '#39',OTCCard = '#39' + CONVERT(VARCHAR(1),@OTCCard  )'
      #9#9#9#9#9'+ '#39',Pseudo = '#39' + CONVERT(VARCHAR(1),@Pseudo  )'
      #9#9#9#9#9'--,@pseudoMgD '
      #9#9#9#9#9'--,@PseudoMgP '
      #9#9#9#9#9'+ '#39',NonRefund = '#39' + CONVERT(VARCHAR(1),@NonRefund ) '
      #9#9#9#9#9'+ '#39',PepSpray = '#39' + CONVERT(VARCHAR(1),@PepSpray  )'
      #9#9#9#9#9'--,@MaxPerTx '
      #9#9#9#9#9'+ '#39',SkipPriceUpd = '#39' + CONVERT(VARCHAR(1),@SkipPriceUpd  )'
      
        #9#9#9#9#9'+ '#39',SkipPriceDistUpd = '#39' + CONVERT(VARCHAR(1),@SkipPriceDis' +
        'tUpd )'
      #9#9#9#9#9'+ '#39',Taxable = '#39' + CONVERT(VARCHAR(1),@Taxable )'
      #9#9#9#9#9'+ '#39',AskId = '#39' + CONVERT(VARCHAR(2),@AskId)'
      
        #9#9#9#9#9'+ '#39' WHERE LINK_SUBDPT='#39'+CONVERT(VARCHAR(20),@DEPARTAMENTO )' +
        ';'
      #9#9#9#9'EXEC (@SQL);'
      #9#9#9'end;'
      #9'END'
      #9'if @pOPC=2'
      #9'BEGIN'
      #9#9' if @txtgm>0'
      #9#9' begin'
      #9#9#9#9'UPDATE INVENTARIOPISO SET '
      '                precio = Round(costo * (1 + @txtgm / 100), 2)'
      '                ,gm1 = @txtgm'
      '                ,LST_MODIF_PR = GetDate()'
      '                ,ULTIMOCAMBIO = @userini'
      
        #9#9#9#9'WHERE @DEPARTAMENTO=IIF(@pType='#39'D'#39' ,DEPARTAMENTO,SUB_DEPARTA' +
        'MENTO);'
      ''
      
        #9#9#9#9'SET @SQL='#39'UPDATE '#39'+IIF(@pType='#39'D'#39' ,'#39'DEPARTAMENTO'#39','#39'SUB_DEPAR' +
        'TAMENTO'#39')+'
      #9#9#9#9#39' SET GM1 = '#39#39#39' + CONVERT(VARCHAR(20),@txtgm )'
      
        #9#9#9#9'+ '#39#39#39' WHERE DEPARTAMENTO='#39'+CONVERT(VARCHAR(20),@DEPARTAMENTO' +
        ' );'
      #9#9#9#9'--print @SQL;'
      #9#9#9#9'EXEC (@SQL);'
      ''
      #9#9#9#9'IF @pType='#39'D'#39
      #9#9#9#9'begin'
      #9#9#9#9#9#9'SET @SQL='#39'UPDATE SUB_DEPARTAMENTO '#39'+'
      #9#9#9#9#9#9#39' SET GM1 = '#39#39#39' + CONVERT(VARCHAR(20),@txtgm )'
      
        #9#9#9#9#9#9'+ '#39#39#39' WHERE LINK_SUBDPT='#39'+CONVERT(VARCHAR(20),@DEPARTAMENT' +
        'O );'
      #9#9#9#9#9#9'EXEC (@SQL);'
      #9#9#9#9'end;'
      #9#9'end'
      #9'END'
      #9'IF @pOPC=3'#9'--GET PARAMETERS FOR DEPARTMENT/SUBDEPARTMENT'
      #9'BEGIN'
      #9#9'SET @SQL='#39'SELECT '
      
        #9#9#9'ALWDISC,[ROUND],NLINE,EBT,Sigis,OTCCard,Pseudo,pseudoMgD ,Pse' +
        'udoMgP ,NonRefund,PepSpray,MaxPerTx ,SkipPriceUpd,SkipPriceDistU' +
        'pd,Taxable,gm1,AskId '
      
        #9#9#9'FROM '#39'+IIF(@pType='#39'D'#39' ,'#39'DEPARTAMENTO'#39','#39'SUB_DEPARTAMENTO'#39') + '#39 +
        ' '
      #9#9#9'WHERE DEPARTAMENTO='#39'+@DEPARTAMENTO;'
      #9#9'EXEC (@SQL);'
      #9'END'
      'END')
    Left = 3368
    Top = 896
  end
  object POS_GET_HANDHELDINFO: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[POS_GET_HANDHELDINFO] ('
      #9'@pType INT'
      #9',@pUPC varchar(15)='#39#39
      #9',@pID INTEGER=0'
      #9',@pTypeProcess INT =0'
      #9',@pQtyInv INT=0'#9'-- numeric(18,2)=0'
      #9',@pDevices varchar(20)='#39#39
      #9',@pUsers varchar(20)='#39#39
      #9',@pStickers BIT=0'
      #9',@pNUM NUMERIC(18,0)=0'
      #9',@pVENDID VARCHAR(20)='#39#39
      #9',@pDATE VARCHAR(20)=NULL'
      #9',@pQty FLOAT=0'
      ')'
      'AS'
      ''
      'BEGIN'
      'SET NOCOUNT ON;'
      #9'IF @pType=1'#9'--DEVICES'
      #9'BEGIN'
      #9#9'SELECT '#39'ALL'#39' DESCRIPTION UNION ALL'
      
        #9#9'SELECT DISTINCT DeviceID DESCRIPTION FROM HANDHELD WHERE Proce' +
        'ssed=0'
      #9'END;'
      #9'IF @pType=2'#9'--USERS'
      #9'BEGIN'
      #9#9'SELECT '#39'ALL'#39' DESCRIPTION  UNION ALL'
      
        #9#9'SELECT DISTINCT rtrim(UPPER(PASSWORDS.USERNAME)) DESCRIPTION F' +
        'ROM HANDHELD'
      #9#9'INNER JOIN PASSWORDS ON HANDHELD.USERNAME=PASSWORDS.INICIALES '
      #9#9'WHERE Processed=0'
      #9'END;'
      #9'IF @pType=3'#9'--counters'
      #9'BEGIN;'
      #9#9'SELECT '
      #9#9#9'COUNT(*) AS TTOTAL'
      #9#9#9',COUNT(CASE WHEN TYPE=0 THEN 1 END) AS TSTICKERS'
      #9#9#9',COUNT(CASE WHEN TYPE=1 THEN 1 END) AS TINVENTORY'
      #9#9#9'--,COUNT(CASE WHEN TYPE=2 THEN 1 END) AS TYPE1'
      #9#9#9',COUNT(CASE WHEN TYPE=3 THEN 1 END) AS TRETURNS'
      #9#9#9',COUNT(CASE WHEN TYPE=4 THEN 1 END) AS TRECEIVING'
      #9#9#9',COUNT(CASE WHEN TYPE=5 THEN 1 END) AS TQUICKORDER'
      #9#9#9',COUNT(CASE WHEN TYPE=6 THEN 1 END) AS TTRANSFER'
      #9#9#9',COUNT(CASE WHEN TYPE=7 THEN 1 END) AS TTRASFPHARM'
      #9#9'FROM HANDHELD '
      #9#9'INNER JOIN PASSWORDS ON HANDHELD.USERNAME=PASSWORDS.INICIALES '
      #9#9'WHERE Processed=0 '
      #9#9'and DeviceID=iif(rtrim(@pDevices)='#39'ALL'#39',DeviceID,@pDevices)'
      
        #9#9'and PASSWORDS.USERNAME =iif(rtrim(@pUsers)='#39'ALL'#39',PASSWORDS.USE' +
        'RNAME,@pUsers)'
      #9'END;'
      #9'IF @pType=4'#9'--REMOVE ITEM'
      #9'BEGIN'
      #9#9'UPDATE HANDHELD SET Processed = 2 WHERE ID=@pID'
      #9'END;'
      #9'IF @pType=5'#9'--UPDATE INVENTORY ITEM'
      #9'BEGIN;'
      
        #9#9'IF @pTypeProcess=1'#9'OR @pTypeProcess=4'#9#9'--MODIF INVENTORY, --RE' +
        'CEIVINGS '
      #9#9'BEGIN'
      #9#9#9'declare @iPosition int=0'
      #9#9#9#9#9',@iId numeric(18,0)'
      #9#9#9#9#9',@sORDERNUM VARCHAR(20)'
      #9#9#9#9#9',@iFilasAfectadas Int'
      ''
      #9#9#9#9'IF @pTypeProcess=1'
      
        #9#9#9#9#9'UPDATE INVENTARIOPISO SET QTYINVENTARIO=@pQtyInv WHERE CODI' +
        'GOBARRA=@pUPC ;'
      #9#9#9#9'IF @pTypeProcess=4'
      
        #9#9#9#9#9'UPDATE INVENTARIOPISO SET QTYINVENTARIO=isnull(QTYINVENTARI' +
        'O,0)+@pQtyInv WHERE CODIGOBARRA=@pUPC ;'
      ''
      #9#9#9#9'UPDATE HANDHELD SET Processed = 1 WHERE ID=@pID;'
      #9#9#9#9'SELECT @iFilasAfectadas=@@ROWCOUNT ;'
      ''
      #9#9#9#9'-- create stickers'
      #9#9#9#9'IF @pStickers=1 and @iFilasAfectadas>0'
      #9#9#9#9'BEGIN'
      
        #9#9#9#9#9'SELECT TOP 1 @iPosition=(CONVERT(VARCHAR, iif(rtrim(isnull(' +
        'UPC1,'#39#39'))<>'#39#39',1,0)+iif(rtrim(isnull(UPC2,'#39#39'))<>'#39#39',1,0)+iif(rtrim' +
        '(isnull(UPC3,'#39#39'))<>'#39#39',1,0)+iif(rtrim(isnull(UPC4,'#39#39'))<>'#39#39',1,0)+i' +
        'if(rtrim(isnull(UPC5,'#39#39'))<>'#39#39',1,0)+iif(rtrim(isnull(UPC6,'#39#39'))<>'#39 +
        #39',1,0)+iif(rtrim(isnull(UPC7,'#39#39'))<>'#39#39',1,0)+iif(rtrim(isnull(UPC8' +
        ','#39#39'))<>'#39#39',1,0)))'
      #9#9#9#9#9',@iId=ISNULL(ID,0),@sORDERNUM=ISNULL(ORDERNUM,'#39#39')'
      #9#9#9#9#9'FROM Stickers '
      #9#9#9#9#9'WHERE Work_no='#39'SP00'#39' '
      #9#9#9#9#9#9'and DATEPO = @pDATE '
      #9#9#9#9#9#9'and VENDID = @pVENDID '
      #9#9#9#9#9'order by id desc;'
      ''
      #9#9#9#9#9'if isnull(@sORDERNUM,'#39#39')='#39#39' '
      #9#9#9#9#9'begin'
      #9#9#9#9#9#9'SET @sORDERNUM=(SELECT ISNULL(STICKER,0) FROM COUNTERS)+1;'
      #9#9#9#9#9#9'UPDATE COUNTERS SET STICKER=@sORDERNUM;'
      #9#9#9#9#9'end'
      ''
      #9#9#9#9#9'IF @iPosition=0 OR @iPosition=8 '
      
        #9#9#9#9#9#9'INSERT INTO [dbo].[Stickers] ([Work_no],[UPC1],[ORDERNUM],' +
        '[DATEPO],[VENDID]) VALUES ('#39'SP00'#39',@pUPC, @sORDERNUM, @pDATE,@pVE' +
        'NDID )'
      #9#9#9#9#9'else IF @iPosition=1'
      #9#9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC2] = @pUPC  WHERE id=@iId'
      #9#9#9#9#9'else IF @iPosition=2'
      #9#9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC3] = @pUPC  WHERE id=@iId'
      #9#9#9#9#9'else IF @iPosition=3'
      #9#9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC4] = @pUPC  WHERE id=@iId'
      #9#9#9#9#9'else IF @iPosition=4'
      #9#9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC5] = @pUPC  WHERE id=@iId'
      #9#9#9#9#9'else IF @iPosition=5'
      #9#9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC6] = @pUPC  WHERE id=@iId'
      #9#9#9#9#9'else IF @iPosition=6'
      #9#9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC7] = @pUPC  WHERE id=@iId'
      #9#9#9#9#9'else IF @iPosition=7'
      #9#9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC8] = @pUPC  WHERE id=@iId'
      #9#9#9#9'END'
      #9#9#9#9'--'
      #9#9'END;'
      #9#9'IF @pTypeProcess=3'#9#9'--RECEIVINGS'
      #9#9'BEGIN'
      
        #9#9#9#9'UPDATE INVENTARIOPISO SET QTYINVENTARIO=isnull(QTYINVENTARIO' +
        ',0)-@pQtyInv WHERE CODIGOBARRA=@pUPC ;'
      #9#9#9#9'UPDATE HANDHELD SET Processed = 1 WHERE ID=@pID;'
      #9#9'END;'
      #9'END;'
      #9'IF @pType=6'#9'--COUNTER STICKER'
      #9'BEGIN'
      #9#9'SET @pNUM=(SELECT ISNULL(STICKER,0) FROM COUNTERS)+1;'
      #9#9'UPDATE COUNTERS SET STICKER=@pNUM;'
      #9#9'SELECT @pNUM AS SNUM;'
      #9'END;'
      #9'IF @pType=7'#9'--UPDATE QTY'
      #9'BEGIN'
      #9#9'UPDATE HANDHELD SET QTY=@pQty WHERE ID=@pID'
      #9'END;'
      'END;')
    Left = 3368
    Top = 976
  end
  object PAYMENT_CARD_LOG: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'PAYMENT_' +
        'CARD_LOG'#39')'
      'BEGIN'
      'CREATE TABLE [dbo].[PAYMENT_CARD_LOG]('
      #9'[ID] [int] IDENTITY(1,1) NOT NULL,'
      #9'[transNo] [int] NOT NULL,'
      #9'[cardType] [nchar](15) NULL,'
      #9'[lastFour] [int] NULL,'
      #9'[authNo] [nchar](30) NULL,'
      ' CONSTRAINT [PK_PAYMENT_CARD_LOG] PRIMARY KEY CLUSTERED '
      '('
      #9'[ID] ASC'
      
        ')WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP' +
        '_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRI' +
        'MARY]'
      ') ON [PRIMARY];'
      'END')
    Left = 32
    Top = 896
  end
  object Counters: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'IF NOT EXISTS (SELECT * FROM sys.objects WHERE name =  '#39'COUNTERS' +
        #39')'
      'BEGIN'
      '  CREATE TABLE [dbo].[COUNTERS]('
      #9'[STICKER] [bigint] NOT NULL,'
      #9'[titulo1] [varchar](40) NULL,'
      #9'[titulo2] [varchar](40) NULL,'
      #9'[titulo3] [varchar](40) NULL,'
      #9'[titulo4] [varchar](40) NULL,'
      #9'[ReceiptMessage] [varchar](1600) NULL'
      ') ON [PRIMARY];'
      'END')
    Left = 160
    Top = 896
  end
  object CALC_PERCENTAGE_DISCOUNT: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE TRIGGER [dbo].[CALC_PERCENTAGE_DISCOUNT]'
      'ON [dbo].[TRANSACTIONDETAIL_TEMP]'
      'AFTER INSERT, UPDATE'
      'AS'
      'BEGIN'
      '    SET NOCOUNT ON;'
      '    BEGIN TRANSACTION;'
      ''
      '    UPDATE td'
      '    SET'
      
        '        -- Calculate discounted unit price with proper decimal c' +
        'asting and rounding'
      
        '        Price = ROUND(i.REGPRICE - (i.REGPRICE * ISNULL(i.DISCOU' +
        'NT_PERCENTAGE, 0)), 2),'
      
        '        -- Compute total as quantity times discounted price, cas' +
        't to decimal for precision'
      
        '        TOTAL = ROUND(CAST(i.QTY AS DECIMAL(18,2)) * ROUND(i.REG' +
        'PRICE - (i.REGPRICE * ISNULL(i.DISCOUNT_PERCENTAGE, 0)), 2), 2),'
      '        -- Calculate total discount amount'
      
        '        DISCOUNT = ROUND(i.QTY * i.REGPRICE * ISNULL(i.DISCOUNT_' +
        'PERCENTAGE, 0), 2)'
      '    FROM TRANSACTIONDETAIL_TEMP td'
      '    INNER JOIN inserted i ON td.IDNUMBER = i.IDNUMBER'
      '    WHERE ISNULL(i.DISCOUNT_PERCENTAGE, 0) > 0;'
      ''
      '    COMMIT TRANSACTION;'
      'END;')
    Left = 2336
    Top = 528
  end
  object POS_GET_Stickers: TFDQuery
    AfterExecute = DELETE_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[POS_GET_Stickers]('
      #9'@pReportType INT = 0,'
      #9'@pFilterType1 INT = 0,'
      #9'@pFilterValue1 VARCHAR(50) = '#39#39
      ')'
      'AS'
      'BEGIN'
      #9'DECLARE @WorkNo VARCHAR(5)'
      #9'SELECT @WorkNo = '#39#39
      
        #9'SELECT @WorkNo = 0'#9'--CONVERT(VARCHAR, [STICK]) FROM [dbo].[Coun' +
        'ter]'
      ''
      #9'DECLARE'
      #9'@SQL'#9'VARCHAR(MAX),'
      #9'@Count'#9'INT,'
      #9'@Loop'#9'INT,'
      #9'@ID'#9#9'INT,'
      #9'@pWorkNoU VARCHAR(5)='#39'SC48'#39','
      #9'@pWorkNo VARCHAR(5)='#39'SC810'#39
      ''
      #9'DECLARE'
      
        #9'@Items TABLE (SNo INT IDENTITY(1,1), UPC VARCHAR(15), DESCRIPT ' +
        'VARCHAR(50), LP1 DECIMAL(18,2), VEND  VARCHAR(40), '
      
        #9'VENDID  VARCHAR(40), LINE_LOC VARCHAR(10), SHELF_LOC  VARCHAR(1' +
        '0), UPCA VARCHAR(50), '
      
        #9'SIZE_IT VARCHAR(10), UPC_TYPE VARCHAR(11),'#9'ORDERNUM VARCHAR(20)' +
        ',DATEPO DATETIME)'
      ''
      #9'DECLARE @Stickers_tp TABLE (ID INT IDENTITY(1,1), '
      
        #9#9'UPC1 varchar(15),DESC1 varchar(50),PRIC1 DECIMAL(18,2),VEND1 v' +
        'archar(20),VENID1 varchar(20),LINE_LOC1 varchar(10),SHELF_LOC1 v' +
        'archar(20),UPCA1 varchar(20),SIZE_IT1 varchar(10),UPC1_TYPE varc' +
        'har(11),'
      
        #9#9'UPC2 varchar(15),DESC2 varchar(50),PRIC2 DECIMAL(18,2),VEND2 v' +
        'archar(20),VENID2 varchar(20),LINE_LOC2 varchar(10),SHELF_LOC2 v' +
        'archar(20),UPCA2 varchar(20),SIZE_IT2 varchar(10),UPC2_TYPE varc' +
        'har(11),'
      
        #9#9'UPC3 varchar(15),DESC3 varchar(50),PRIC3 DECIMAL(18,2),VEND3 v' +
        'archar(20),VENID3 varchar(20),LINE_LOC3 varchar(10),SHELF_LOC3 v' +
        'archar(20),UPCA3 varchar(20),SIZE_IT3 varchar(10),UPC3_TYPE varc' +
        'har(11),'
      
        #9#9'UPC4 varchar(15),DESC4 varchar(50),PRIC4 DECIMAL(18,2),VEND4 v' +
        'archar(20),VENID4 varchar(20),LINE_LOC4 varchar(10),SHELF_LOC4 v' +
        'archar(20),UPCA4 varchar(20),SIZE_IT4 varchar(10),UPC4_TYPE varc' +
        'har(11),'
      
        #9#9'UPC5 varchar(15),DESC5 varchar(50),PRIC5 DECIMAL(18,2),VEND5 v' +
        'archar(20),VENID5 varchar(20),LINE_LOC5 varchar(10),SHELF_LOC5 v' +
        'archar(20),UPCA5 varchar(20),SIZE_IT5 varchar(10),UPC5_TYPE varc' +
        'har(11),'
      
        #9#9'UPC6 varchar(15),DESC6 varchar(50),PRIC6 DECIMAL(18,2),VEND6 v' +
        'archar(20),VENID6 varchar(20),LINE_LOC6 varchar(10),SHELF_LOC6 v' +
        'archar(20),UPCA6 varchar(20),SIZE_IT6 varchar(10),UPC6_TYPE varc' +
        'har(11),'
      
        #9#9'UPC7 varchar(15),DESC7 varchar(50),PRIC7 DECIMAL(18,2),VEND7 v' +
        'archar(20),VENID7 varchar(20),LINE_LOC7 varchar(10),SHELF_LOC7 v' +
        'archar(20),UPCA7 varchar(20),SIZE_IT7 varchar(10),UPC7_TYPE varc' +
        'har(11),'
      
        #9#9'UPC8 varchar(15),DESC8 varchar(50),PRIC8 DECIMAL(18,2),VEND8 v' +
        'archar(20),VENID8 varchar(20),LINE_LOC8 varchar(10),SHELF_LOC8 v' +
        'archar(20),UPCA8 varchar(20),SIZE_IT8 varchar(10),UPC8_TYPE varc' +
        'har(11)'
      #9#9')'
      '  END'
      '')
    Left = 288
    Top = 904
  end
  object POS_EDIT_INVENTORY: TFDQuery
    AfterExecute = DELETE_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE   PROCEDURE [dbo].[POS_EDIT_INVENTORY]'
      #9#9'@PRODUCTNO INT = 0'
      #9#9', @COSTO REAL'
      #9#9', @RBP REAL'
      #9#9', @DEPARTAMENTO INT'
      #9#9', @PRECIO REAL'
      #9#9', @COMESPECIAL datetime'
      #9#9', @TERMINAESPECIAL datetime'
      #9#9'--, @PORCIENTODESCUENTO'
      #9#9', @CMAXINVENTARIO REAL'
      #9#9', @CMININVENTARIO REAL'
      #9#9', @CODIGOBARRA char(14)'
      #9#9', @FOODITEM INT'
      #9#9'--, @NONEBC INT'
      #9#9', @NUMEROSUPLIDOR INT'
      #9#9', @SUB_DEPARTAMENTO INT'
      #9#9', @DESCRIPCION VARCHAR(35)'
      #9#9', @GROUP_QTY INT'
      #9#9', @PRECIO_CAJA REAL'
      #9#9', @QTY_CAJA REAL'
      #9#9'--, @DESCUENTO REAL'
      #9#9', @TAXABLE CHAR(1)'
      #9#9', @TAXABLE_ESTATAL CHAR(1)'
      #9#9', @PATROCINIO INT'
      #9#9'--, @COBRAR_TAX INT'
      #9#9', @PRECIOVENTA2 REAL'
      #9#9'--, @MAC_PRICE REAL'
      #9#9'--, @DIRECT_PRICE REAL'
      #9#9', @QTYINVENTARIO REAL'
      #9#9'--, @SALES_PROMOTION_ID INT'
      #9#9', @KITCHEN INT'
      #9#9'--, @MODIFIER_QTY INT'
      #9#9', @HAS_MODIFIER BIT'
      #9#9', @RECIPE_PRICE REAL'
      #9#9', @SHOWINDIVIDUAL BIT'
      #9#9', @DAILY_SALE_START_TIME TIME(7)'
      #9#9', @DAILY_SALE_END_TIME TIME(7)'
      #9#9', @DAILY_SALE_ACTIVE BIT'
      #9#9', @DAILY_SPECIAL_PRICE REAL'
      #9#9', @PROCESSED_FOOD BIT'
      #9#9', @PRECIOVENTA3 REAL'
      #9#9', @SHOW_ON_ECOMM INT'
      #9#9', @CUSTOMER_ID_REQUIRED INT'
      #9#9', @TRIPLES_PRODUCT INT'
      #9#9', @EDITAR_PRECIO BIT'
      #9#9', @ALWDISC BIT'
      #9#9', @ROUND BIT'
      #9#9', @NLINE BIT'
      #9#9', @EBT BIT'
      #9#9', @Sigis BIT'
      #9#9', @OTCCard BIT'
      #9#9', @Pseudo BIT'
      #9#9', @NonRefund BIT'
      #9#9', @PepSpray BIT'
      #9#9', @SkipPriceUpd BIT'
      #9#9', @SkipPriceDistUpd BIT'
      #9#9', @GM1 REAL'
      #9#9', @GM2 REAL'
      #9#9', @GM3 REAL'
      #9#9', @line_loc VARCHAR(10)'
      #9#9', @shelf_loc VARCHAR(10)'
      #9#9', @stock_loc VARCHAR(10)'
      #9#9', @ITEM_NUM VARCHAR(20)'
      #9#9', @SIZE_IT VARCHAR(20)'
      #9#9', @especial REAL'
      ''
      'AS'
      'DECLARE @ISCONTROLLED BIT'
      ''
      'BEGIN'
      '  begin transaction'
      '  IF @PRODUCTNO > 0  '
      '  BEGIN'
      #9'   UPDATE [dbo].[INVENTARIOPISO]'
      #9'   SET '
      #9#9#9'COSTO'#9'= @COSTO'
      #9#9#9',RBP'#9'= @RBP'
      #9#9#9',DEPARTAMENTO'#9'= @DEPARTAMENTO'
      #9#9#9',PRECIO'#9'= @PRECIO'
      #9#9#9',COMESPECIAL'#9'= @COMESPECIAL'
      #9#9#9',TERMINAESPECIAL'#9'= @TERMINAESPECIAL'
      #9#9#9',CMAXINVENTARIO'#9'= @CMAXINVENTARIO'
      #9#9#9',CMININVENTARIO'#9'= @CMININVENTARIO'
      #9#9#9',CODIGOBARRA'#9'= @CODIGOBARRA'
      #9#9#9',FOODITEM'#9'= @FOODITEM'
      #9#9#9'--,NONEBC'#9'= @NONEBC'
      #9#9#9',NUMEROSUPLIDOR'#9'= @NUMEROSUPLIDOR'
      #9#9#9',SUB_DEPARTAMENTO'#9'= @SUB_DEPARTAMENTO'
      #9#9#9',DESCRIPCION'#9'= @DESCRIPCION'
      #9#9#9',GROUP_QTY'#9'= @GROUP_QTY'
      #9#9#9',PRECIO_CAJA'#9'= @PRECIO_CAJA'
      #9#9#9',QTY_CAJA'#9'= @QTY_CAJA'
      #9#9#9'--,DESCUENTO'#9'= @DESCUENTO'
      #9#9#9',TAXABLE'#9'= @TAXABLE'
      #9#9#9',TAXABLE_ESTATAL'#9'= @TAXABLE_ESTATAL'
      #9#9#9',PATROCINIO'#9'= @PATROCINIO'
      #9#9#9',PRECIOVENTA2'#9'= @PRECIOVENTA2'
      #9#9#9',QTYINVENTARIO'#9'= @QTYINVENTARIO'
      #9#9#9'--,SALES_PROMOTION_ID'#9'= @SALES_PROMOTION_ID'
      #9#9#9',KITCHEN'#9'= @KITCHEN'
      #9#9#9'--,MODIFIER_QTY'#9'= @MODIFIER_QTY'
      #9#9#9',HAS_MODIFIER'#9'= @HAS_MODIFIER'
      #9#9#9',RECIPE_PRICE'#9'= @RECIPE_PRICE'
      #9#9#9',SHOWINDIVIDUAL'#9'= @SHOWINDIVIDUAL'
      #9#9#9',DAILY_SALE_START_TIME'#9'= @DAILY_SALE_START_TIME'
      #9#9#9',DAILY_SALE_END_TIME'#9'= @DAILY_SALE_END_TIME'
      #9#9#9',DAILY_SALE_ACTIVE'#9'= @DAILY_SALE_ACTIVE'
      #9#9#9',DAILY_SPECIAL_PRICE'#9'= @DAILY_SPECIAL_PRICE'
      #9#9#9',PROCESSED_FOOD'#9'= @PROCESSED_FOOD'
      #9#9#9',PRECIOVENTA3'#9'= @PRECIOVENTA3'
      #9#9#9',SHOW_ON_ECOMM'#9'= @SHOW_ON_ECOMM'
      #9#9#9',CUSTOMER_ID_REQUIRED'#9'= @CUSTOMER_ID_REQUIRED'
      #9#9#9',TRIPLES_PRODUCT'#9'= @TRIPLES_PRODUCT'
      #9#9#9',EDITAR_PRECIO = @EDITAR_PRECIO'
      #9#9#9',ALWDISC = @ALWDISC '
      #9#9#9',[ROUND]= @ROUND'
      #9#9#9',NLINE = @NLINE '
      #9#9#9',EBT = @EBT '
      #9#9#9',Sigis = @Sigis '
      #9#9#9',OTCCard = @OTCCard '
      #9#9#9',Pseudo = @Pseudo '
      #9#9#9',NonRefund = @NonRefund '
      #9#9#9',PepSpray = @PepSpray '
      #9#9#9',SkipPriceUpd = @SkipPriceUpd '
      #9#9#9',SkipPriceDistUpd = @SkipPriceDistUpd '
      #9#9#9',GM1 = @GM1'
      #9#9#9',GM2 = @GM2'
      #9#9#9',GM3 = @GM3'
      #9#9#9',line_loc = @line_loc'
      #9#9#9',shelf_loc = @shelf_loc'
      #9#9#9',stock_loc = @stock_loc'
      #9#9#9',ITEM_NUM = @ITEM_NUM'
      #9#9#9',SIZE_IT = @SIZE_IT'
      #9#9#9',especial = @especial'
      #9'   WHERE PRODUCTNO = @PRODUCTNO;'
      
        #9'   --EXECUTE INSERT_LOG '#39'Inventory Modification'#39', '#39'M'#39', @NDC, @A' +
        'TENDIDAPOR, @PHARMACIST, 0, 0,0,0,0,0,0,@PRODUCTNO,'#39'R'#39',@NOTE,@IS' +
        'CONTROLLED,1;'
      '  END'
      '  else'
      '  begin'
      '    insert into INVENTARIOPISO ('
      #9#9#9'COSTO'
      #9#9#9',RBP'
      #9#9#9',DEPARTAMENTO'
      #9#9#9',PRECIO'
      #9#9#9',COMESPECIAL'
      #9#9#9',TERMINAESPECIAL'
      #9#9#9',CMAXINVENTARIO'
      #9#9#9',CMININVENTARIO'
      #9#9#9',CODIGOBARRA'
      #9#9#9',FOODITEM'
      #9#9#9'--,NONEBC'
      #9#9#9',NUMEROSUPLIDOR'
      #9#9#9',SUB_DEPARTAMENTO'
      #9#9#9',DESCRIPCION'
      #9#9#9',GROUP_QTY'
      #9#9#9',PRECIO_CAJA'
      #9#9#9',QTY_CAJA'
      #9#9#9'--,DESCUENTO'
      #9#9#9',TAXABLE'
      #9#9#9',TAXABLE_ESTATAL'
      #9#9#9',PATROCINIO'
      #9#9#9',PRECIOVENTA2'
      #9#9#9',QTYINVENTARIO'
      #9#9#9'--,SALES_PROMOTION_ID'
      #9#9#9',KITCHEN'
      #9#9#9'--,MODIFIER_QTY'
      #9#9#9',HAS_MODIFIER'
      #9#9#9',RECIPE_PRICE'
      #9#9#9',SHOWINDIVIDUAL'
      #9#9#9',DAILY_SALE_START_TIME'
      #9#9#9',DAILY_SALE_END_TIME'
      #9#9#9',DAILY_SALE_ACTIVE'
      #9#9#9',DAILY_SPECIAL_PRICE'
      #9#9#9',PROCESSED_FOOD'
      #9#9#9',PRECIOVENTA3'
      #9#9#9',SHOW_ON_ECOMM'
      #9#9#9',CUSTOMER_ID_REQUIRED'
      #9#9#9',TRIPLES_PRODUCT'
      #9#9#9',EDITAR_PRECIO'
      #9#9#9',ALWDISC'
      #9#9#9',[ROUND]'
      #9#9#9',NLINE'
      #9#9#9',EBT'
      #9#9#9',Sigis'
      #9#9#9',OTCCard'
      #9#9#9',Pseudo'
      #9#9#9',NonRefund'
      #9#9#9',PepSpray'
      #9#9#9',SkipPriceUpd'
      #9#9#9',SkipPriceDistUpd'
      #9#9#9',GM1 ,GM2 ,GM3'
      #9#9#9',line_loc'
      #9#9#9',shelf_loc'
      #9#9#9',stock_loc'
      #9#9#9',ITEM_NUM'
      #9#9#9',SIZE_IT'
      #9#9#9',especial'
      #9#9#9') '
      #9#9'  Values'
      #9#9#9'( @COSTO'
      #9#9#9', @RBP'
      #9#9#9', @DEPARTAMENTO'
      #9#9#9', @PRECIO'
      #9#9#9', @COMESPECIAL'
      #9#9#9', @TERMINAESPECIAL'
      #9#9#9', @CMAXINVENTARIO'
      #9#9#9', @CMININVENTARIO'
      #9#9#9', @CODIGOBARRA'
      #9#9#9', @FOODITEM'
      #9#9#9'--, @NONEBC'
      #9#9#9', @NUMEROSUPLIDOR'
      #9#9#9', @SUB_DEPARTAMENTO'
      #9#9#9', @DESCRIPCION'
      #9#9#9', @GROUP_QTY'
      #9#9#9', @PRECIO_CAJA'
      #9#9#9', @QTY_CAJA'
      #9#9#9'--, @DESCUENTO'
      #9#9#9', @TAXABLE'
      #9#9#9', @TAXABLE_ESTATAL'
      #9#9#9', @PATROCINIO'
      #9#9#9', @PRECIOVENTA2'
      #9#9#9', @QTYINVENTARIO'
      #9#9#9'--, @SALES_PROMOTION_ID'
      #9#9#9', @KITCHEN'
      #9#9#9'--, @MODIFIER_QTY'
      #9#9#9', @HAS_MODIFIER'
      #9#9#9', @RECIPE_PRICE'
      #9#9#9', @SHOWINDIVIDUAL'
      #9#9#9', @DAILY_SALE_START_TIME'
      #9#9#9', @DAILY_SALE_END_TIME'
      #9#9#9', @DAILY_SALE_ACTIVE'
      #9#9#9', @DAILY_SPECIAL_PRICE'
      #9#9#9', @PROCESSED_FOOD'
      #9#9#9', @PRECIOVENTA3'
      #9#9#9', @SHOW_ON_ECOMM'
      #9#9#9', @CUSTOMER_ID_REQUIRED'
      #9#9#9', @TRIPLES_PRODUCT'
      #9#9#9', @EDITAR_PRECIO'
      #9#9#9',@ALWDISC '
      #9#9#9',@ROUND'
      #9#9#9',@NLINE '
      #9#9#9',@EBT '
      #9#9#9',@Sigis '
      #9#9#9',@OTCCard '
      #9#9#9',@Pseudo '
      #9#9#9',@NonRefund '
      #9#9#9',@PepSpray '
      #9#9#9',@SkipPriceUpd '
      #9#9#9',@SkipPriceDistUpd '
      #9#9#9',@GM1,@GM2,@GM3'
      #9#9#9',@line_loc '
      #9#9#9',@shelf_loc '
      #9#9#9',@stock_loc '
      #9#9#9',@ITEM_NUM'
      #9#9#9',@SIZE_IT'
      #9#9#9',@especial'
      #9#9#9');'
      #9#9'  set @PRODUCTNO = SCOPE_IDENTITY();'
      
        #9#9' -- EXECUTE INSERT_LOG '#39'Inventory, Drug inserted'#39', '#39'A'#39', @NDC, ' +
        '@ATENDIDAPOR, @PHARMACIST, 0, 0,0,0,0,0,0,@PRODUCTNO,'#39'R'#39','#39#39',@ISC' +
        'ONTROLLED,1;'
      '  end;'
      '  commit;'
      'END;')
    Left = 416
    Top = 904
  end
  object usp_POSStickersSave: TFDQuery
    AfterExecute = DELETE_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[usp_POSStickersSave]('
      #9'@pReportType INT = 0,'
      #9'@pFilterType1 INT = 0,'
      #9'@pFilterValue1 VARCHAR(50) = '#39#39
      ')'
      'AS'
      'BEGIN'
      #9'DECLARE '
      #9'@pWorkNo VARCHAR(5)='#39#39','
      #9'@pDATE1 DATETIME'
      ''
      
        #9'DECLARE @Items TABLE (SNo INT IDENTITY(1,1), UPC VARCHAR(15), L' +
        'P1 DECIMAL(18,2), COST1 DECIMAL(18,2), GM1 DECIMAL(18,2), ORDERN' +
        'UM VARCHAR(20),DATEPO DATETIME)'
      ''
      #9#9'if (@pReportType=4 and @pFilterType1=9)'
      #9#9'BEGIN'
      
        #9#9#9#9#9#9#9'SET @pWorkNo = iif(@pFilterType1=9,'#39'SP48F'#39',iif(@pReportTy' +
        'pe=4 and @pFilterType1=8,'#39'SP48'#39','#39'SC810'#39'));'
      #9#9#9#9#9#9#9'SET @pDATE1= CONVERT(DATETIME,@pFilterValue1)'
      ''
      #9#9#9#9#9#9#9'INSERT @Items(UPC, LP1, COST1, GM1, ORDERNUM, DATEPO)'
      
        #9#9#9#9#9#9#9'SELECT RTRIM(c.UPC1),isnull(C.PRICE1,0),isnull(C.COST1,0)' +
        ',isnull(C.GM1,0),0,DATEPO'
      #9#9#9#9#9#9#9#9#9'FROM '
      #9#9#9#9#9#9#9#9#9'('
      
        #9#9#9#9#9#9#9#9#9'SELECT [UPC1],[PRICE1],COST1,GM1,[DATEPO] FROM [dbo].[S' +
        'tickers] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101' +
        ')=@pDATE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9'SELECT [UPC2],[PRICE2],COST2,GM2,[DATEPO] FROM [dbo].[S' +
        'tickers] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101' +
        ')=@pDATE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9'SELECT [UPC3],[PRICE3],COST3,GM3,[DATEPO] FROM [dbo].[S' +
        'tickers] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101' +
        ')=@pDATE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9'SELECT [UPC4],[PRICE4],COST4,GM4,[DATEPO] FROM [dbo].[S' +
        'tickers] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101' +
        ')=@pDATE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9'SELECT [UPC5],[PRICE5],COST5,GM5,[DATEPO] FROM [dbo].[S' +
        'tickers] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101' +
        ')=@pDATE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9'SELECT [UPC6],[PRICE6],COST6,GM6,[DATEPO] FROM [dbo].[S' +
        'tickers] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101' +
        ')=@pDATE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9'SELECT [UPC7],[PRICE7],COST7,GM7,[DATEPO] FROM [dbo].[S' +
        'tickers] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101' +
        ')=@pDATE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9'SELECT [UPC8],[PRICE8],COST8,GM8,[DATEPO] FROM [dbo].[S' +
        'tickers] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101' +
        ')=@pDATE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9')  C'
      #9#9#9#9#9#9#9#9#9#9'WHERE ISNULL(C.UPC1,'#39#39') <>'#39#39';'
      ''
      #9#9#9#9#9#9#9'-- UPDATE PRECIO/COST/GM'
      #9#9#9#9#9#9#9'UPDATE IP  SET COSTO = IT.COST1'
      #9#9#9#9#9#9#9#9',Lst_price = IP.PRECIO'
      #9#9#9#9#9#9#9#9',PRECIO = IT.LP1'
      #9#9#9#9#9#9#9#9',gm1 = IT.GM1'
      #9#9#9#9#9#9#9#9',LST_MODIF_PR = convert(varchar,getdate(),101)'
      #9#9#9#9#9#9#9#9',WHO_LST_MD_PR = '#39'SVR'#39
      #9#9#9#9#9#9#9'FROM INVENTARIOPISO IP '
      #9#9#9#9#9#9#9'INNER JOIN @Items IT ON IP.CODIGOBARRA=IT.UPC;'
      ''
      #9#9#9#9#9#9#9'-- CHANGE TO STATUS PROCESSED EN STICKERS'
      
        #9#9#9#9#9#9#9'UPDATE ST SET STATUS=1 FROM [Stickers] ST WHERE [Work_no]' +
        '=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDATE1'
      ''
      ''
      #9#9#9#9#9#9
      #9#9'END'
      
        #9#9'if (@pReportType=4 and @pFilterType1=8) or (@pReportType=4 and' +
        ' @pFilterType1=15)'
      #9#9'BEGIN'
      #9#9#9#9#9#9#9'SET @pWorkNo = '#39'SP00'#39
      #9#9#9#9#9#9#9'SET @pDATE1= CONVERT(DATETIME,@pFilterValue1)'
      ''
      #9#9#9#9#9#9#9'-- CHANGE TO STATUS PROCESSED EN STICKERS'
      
        #9#9#9#9#9#9#9'UPDATE ST SET STATUS=1 FROM [Stickers] ST WHERE [Work_no]' +
        '=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDATE1'
      ''
      ''
      #9#9#9#9#9#9
      #9#9'END'
      'END'
      '')
    Left = 288
    Top = 992
  end
  object POS_GET_PROCESS832INFO: TFDQuery
    AfterExecute = DELETE_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[POS_GET_PROCESS832INFO] ('
      #9'@pType INT'
      #9',@pUPC varchar(15)='#39#39
      #9',@pID INTEGER=0'
      #9',@pTypeProcess INT =0'
      #9',@pQtyInv INT=0'#9'-- numeric(18,2)=0'
      #9',@pDevices varchar(30)='#39#39
      #9',@pUsers varchar(30)='#39#39
      #9',@pStickers BIT=0'
      #9',@pNUM NUMERIC(18,0)=0'
      #9',@pVENDID VARCHAR(20)='#39#39
      #9',@pDATE VARCHAR(20)=NULL'
      #9',@pNewCost REAL=0'#9'--NUMERIC(18,2)=0'
      '    ,@pNewRetail REAL=0'#9'--NUMERIC(18,2)=0'
      '    ,@pNewGM REAL=0'#9'--NUMERIC(18,2)=0'
      ')'
      'AS'
      ''
      'BEGIN'
      'SET NOCOUNT ON;'
      #9'IF @pType=1'#9'--LIST FILES DATE'
      #9'BEGIN'
      
        #9#9'select distinct format(DtCreated,'#39'MM/dd/yy'#39') DESCRIPCION from ' +
        'Items832spool where Process=0'
      #9'END;'
      #9'IF @pType=2'#9'--DEPARTMENTS'
      #9'BEGIN'
      #9#9'--SELECT 0 id,'#39'ALL'#39' DESCRIPTION  UNION ALL'
      #9#9'SELECT DISTINCT dp2.DEPARTAMENTO ID,dp2.DESCRIPCION '
      #9#9'FROM [dbo].[Items832spool] it1'
      #9#9' INNER join INVENTARIOPISO INP on It1.upc=INP.CODIGOBARRA'
      
        #9#9' inner join DEPARTAMENTO dp2 on INP.DEPARTAMENTO=dp2.DEPARTAME' +
        'NTO'
      
        #9#9' Where Process=0 and DtProcessed is null --AND DtCreated=@pDAT' +
        'E'
      #9#9' order by 2'
      #9'END;'
      #9'IF @pType=3'#9'--counters'
      #9'BEGIN'
      #9#9' SELECT COUNT(*) AS TTOTAL'
      #9#9#9#9',isnull(SUM(iif(inactive=0,1,0)),0) tActive'
      #9#9#9#9',isnull(SUM(iif(inactive=1,1,0)),0) tInactive'
      #9#9' FROM [dbo].[Items832spool] it1 '
      #9#9' INNER join INVENTARIOPISO INP on It1.upc=INP.CODIGOBARRA'
      
        #9#9' inner join DEPARTAMENTO dp2 on INP.DEPARTAMENTO=dp2.DEPARTAME' +
        'NTO'
      #9#9' Where Process=0 and DtProcessed is null'
      #9#9' and DtCreated = @pDATE'
      
        #9#9' and dp2.DESCRIPCION=iif(rtrim(@pDevices)='#39'ALL'#39',dp2.DESCRIPCIO' +
        'N,@pDevices)'
      #9'END;'
      #9'IF @pType=4'#9'--REMOVE ITEM'
      #9'BEGIN'
      
        #9#9'UPDATE Items832spool SET Process = 2,DtProcessed=convert(varch' +
        'ar,getdate(),101) WHERE ID=@pID'
      #9'END;'
      #9'IF @pType=5'#9'--UPDATE INVENTORY ITEM'
      #9'BEGIN'
      #9#9#9'declare @iPosition int=0'
      #9#9#9#9#9',@iId numeric(18,0)'
      #9#9#9#9#9',@sORDERNUM VARCHAR(20)'
      #9#9#9#9#9',@iFilasAfectadas Int'
      #9#9#9#9#9',@ebt int'
      #9#9#9#9#9',@sigis int'
      #9#9#9#9#9',@OTCCard int'
      #9#9#9#9#9',@sFlags varchar(11)'
      ''
      
        #9#9#9' /* COMENTA PORQUE NO ACTUALIZA AQUI SINO DESPUES DE IMPRIMIR' +
        ' LOS LABELS'
      #9#9#9' UPDATE INV  SET '
      '                    COSTO = @pNewCost'
      '                    ,Lst_price = INV.PRECIO'
      '                    ,PRECIO = @pNewRetail'
      '                    ,gm1 = @pNewGM'
      
        '                    ,LST_MODIF_PR = convert(varchar,getdate(),10' +
        '1)'
      '                    ,WHO_LST_MD_PR = '#39'SVR'#39
      #9#9#9' FROM INVENTARIOPISO INV WHERE CODIGOBARRA=@pUPC ;'
      #9#9#9' SELECT @iFilasAfectadas=@@ROWCOUNT ;'
      #9#9#9' */'
      #9#9#9' '
      
        #9#9#9' SELECT @iFilasAfectadas=IIF(ISNULL(CODIGOBARRA,'#39#39')='#39#39',0,1) ,' +
        '@ebt=isnull(INV.ebt,0),@sigis=isnull(INV.sigis,0),@OTCCard =isnu' +
        'll(INV.OTCCard,0) FROM INVENTARIOPISO INV WHERE CODIGOBARRA=@pUP' +
        'C  ;'#9'--ESTO SOLO VALIDA SI EXISTE EL ITEM EN PRODUCTOS'
      ''
      
        #9#9#9' UPDATE Items832spool SET Process = 1,DtProcessed=convert(var' +
        'char,getdate(),101),UpdateItem=1 WHERE ID=@pID'
      ''
      #9#9#9'-- create stickers'
      #9#9#9'IF @pStickers=1 and @iFilasAfectadas>0'
      #9#9#9'BEGIN'
      
        #9#9#9#9'SET @sFlags = iIf(@sigis = 1 Or @OTCCard = 1 Or @EBT = 1, '#39'F' +
        'SA OTC EBT'#39','#39#39')'
      
        '                SET @sFlags = iIf(@sigis = 1 Or @OTCCard = 0 Or ' +
        '@EBT = 0, '#39'FSA'#39',@sFlags)'
      
        '                SET @sFlags = iIf(@sigis = 0 Or @OTCCard = 1 Or ' +
        '@EBT = 0, '#39'OTC'#39',@sFlags)'
      
        '                SET @sFlags = iIf(@sigis = 0 Or @OTCCard = 0 Or ' +
        '@EBT = 1, '#39'EBT'#39',@sFlags)'
      
        '                SET @sFlags = iIf(@sigis = 1 Or @OTCCard = 1 Or ' +
        '@EBT = 0, '#39'FSA OTC'#39',@sFlags)'
      
        '                SET @sFlags = iIf(@sigis = 1 Or @OTCCard = 0 Or ' +
        '@EBT = 1, '#39'FSA     EBT'#39',@sFlags)'
      
        '                SET @sFlags = iIf(@sigis = 0 Or @OTCCard = 1 Or ' +
        '@EBT = 1, '#39'    OTC EBT'#39',@sFlags)'
      ''
      ''
      
        #9#9#9#9'SELECT TOP 1 @iPosition=(CONVERT(VARCHAR, iif(rtrim(isnull(U' +
        'PC1,'#39#39'))<>'#39#39',1,0)+iif(rtrim(isnull(UPC2,'#39#39'))<>'#39#39',1,0)+iif(rtrim(' +
        'isnull(UPC3,'#39#39'))<>'#39#39',1,0)+iif(rtrim(isnull(UPC4,'#39#39'))<>'#39#39',1,0)+ii' +
        'f(rtrim(isnull(UPC5,'#39#39'))<>'#39#39',1,0)+iif(rtrim(isnull(UPC6,'#39#39'))<>'#39#39 +
        ',1,0)+iif(rtrim(isnull(UPC7,'#39#39'))<>'#39#39',1,0)+iif(rtrim(isnull(UPC8,' +
        #39#39'))<>'#39#39',1,0)))'
      #9#9#9#9',@iId=ISNULL(ID,0),@sORDERNUM=ISNULL(ORDERNUM,'#39#39')'
      #9#9#9#9'FROM Stickers '
      #9#9#9#9'WHERE Work_no='#39'SP48F'#39' '
      #9#9#9#9#9'and DATEPO = @pDATE '
      #9#9#9#9#9'--and VENDID = @pVENDID '
      #9#9#9#9'order by id desc;'
      ''
      #9#9#9#9'if isnull(@sORDERNUM,'#39#39')='#39#39' '
      #9#9#9#9'begin'
      #9#9#9#9#9'SET @sORDERNUM=(SELECT ISNULL(STICKER,0) FROM COUNTERS)+1;'
      #9#9#9#9#9'UPDATE COUNTERS SET STICKER=@sORDERNUM;'
      #9#9#9#9'end'
      ''
      #9#9#9#9'IF @iPosition=0 OR @iPosition=8 '
      
        #9#9#9#9#9'INSERT INTO [dbo].[Stickers] ([Work_no],[UPC1],[ORDERNUM],[' +
        'DATEPO],[VENDID],COST1,PRICE1,GM1,UPC1_TYPE,DATEPR) VALUES ('#39'SP4' +
        '8F'#39',@pUPC, @sORDERNUM, @pDATE,@pVENDID,@pNewCost,@pNewRetail,@pN' +
        'ewGM,@sFlags,convert(varchar,getdate(),101) )'
      #9#9#9#9'else IF @iPosition=1'
      
        #9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC2] = @pUPC,COST2=@pNewCost,' +
        'PRICE2=@pNewRetail,GM2=@pNewGM,UPC2_TYPE=@sFlags  WHERE id=@iId'
      #9#9#9#9'else IF @iPosition=2'
      
        #9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC3] = @pUPC,COST3=@pNewCost,' +
        'PRICE3=@pNewRetail,GM3=@pNewGM,UPC3_TYPE=@sFlags  WHERE id=@iId'
      #9#9#9#9'else IF @iPosition=3'
      
        #9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC4] = @pUPC,COST4=@pNewCost,' +
        'PRICE4=@pNewRetail,GM4=@pNewGM,UPC4_TYPE=@sFlags  WHERE id=@iId'
      #9#9#9#9'else IF @iPosition=4'
      
        #9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC5] = @pUPC,COST5=@pNewCost,' +
        'PRICE5=@pNewRetail,GM5=@pNewGM,UPC5_TYPE=@sFlags  WHERE id=@iId'
      #9#9#9#9'else IF @iPosition=5'
      
        #9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC6] = @pUPC,COST6=@pNewCost,' +
        'PRICE6=@pNewRetail,GM6=@pNewGM,UPC6_TYPE=@sFlags  WHERE id=@iId'
      #9#9#9#9'else IF @iPosition=6'
      
        #9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC7] = @pUPC,COST7=@pNewCost,' +
        'PRICE7=@pNewRetail,GM7=@pNewGM,UPC7_TYPE=@sFlags  WHERE id=@iId'
      #9#9#9#9'else IF @iPosition=7'
      
        #9#9#9#9#9'UPDATE [dbo].[Stickers] SET [UPC8] = @pUPC,COST8=@pNewCost,' +
        'PRICE8=@pNewRetail,GM8=@pNewGM,UPC8_TYPE=@sFlags  WHERE id=@iId'
      #9#9#9'END'
      #9'END;'
      #9'IF @pType=6'#9'--COUNTER STICKER'
      #9'BEGIN'
      #9#9'SET @pNUM=(SELECT ISNULL(STICKER,0) FROM COUNTERS)+1;'
      #9#9'UPDATE COUNTERS SET STICKER=@pNUM;'
      #9#9'SELECT @pNUM AS SNUM;'
      #9'END;'
      'END;')
    Left = 424
    Top = 992
  end
  object usp_POSStickersFilter: TFDQuery
    AfterExecute = DELETE_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[usp_POSStickersFilter] ('
      #9'@WorkNo VARCHAR(5) = '#39#39','
      #9'@pFromDate VARCHAR(20) = NULL,'
      #9'@pToDate VARCHAR(20) = NULL'
      ')'
      'AS'
      ''
      'BEGIN'
      'SET NOCOUNT ON;'
      #9'DECLARE'#9'@SQL'#9'VARCHAR(MAX)'
      ''
      ''
      #9'SELECT @SQL = '#39#39
      
        #9'DECLARE @Items1 TABLE (SNo INT IDENTITY(1,1), UPC VARCHAR(15), ' +
        'DESCRIPT VARCHAR(150), VEND_ID  VARCHAR(20), ORDERNUM VARCHAR(40' +
        '), QTY INT, DATEPR VARCHAR(40))'
      ''
      #9'IF @WorkNo='#39'SP48F'#39
      #9'BEGIN'
      
        #9'--SELECT UPC1 AS UPC,VENDID VEND_ID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39')' +
        ' ORDERNUM,COUNT(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39 +
        #39#39') DATEPRO  FROM STICKERS WHERE WORK_NO='#39#39'SP48F'#39#39' AND UPC1<>'#39#39#39 +
        #39'  GROUP BY UPC1,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMA' +
        'T(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'SET @SQL = '#39' '
      
        #9#9#9'SELECT UPC1 AS UPC,VENDID VEND_ID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39')' +
        ' ORDERNUM,COUNT(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39 +
        #39#39') DATEPRO  FROM STICKERS WHERE WORK_NO='#39#39'SP48F'#39#39' AND UPC1<>'#39#39#39 +
        #39' AND STATUS=0  GROUP BY UPC1,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39')' +
        ',ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC2,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP48F'#39#39' AND UPC2<>'#39#39#39#39' AND STATUS=0 ' +
        ' GROUP BY UPC2,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(' +
        'DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC3,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP48F'#39#39' AND UPC3<>'#39#39#39#39' AND STATUS=0 ' +
        ' GROUP BY UPC3,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(' +
        'DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC4,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP48F'#39#39' AND UPC4<>'#39#39#39#39' AND STATUS=0 ' +
        ' GROUP BY UPC4,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(' +
        'DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC5,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP48F'#39#39' AND UPC2<>'#39#39#39#39' AND STATUS=0 ' +
        ' GROUP BY UPC5,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(' +
        'DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC6,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP48F'#39#39' AND UPC3<>'#39#39#39#39' AND STATUS=0 ' +
        ' GROUP BY UPC6,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(' +
        'DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC7,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP48F'#39#39' AND UPC4<>'#39#39#39#39' AND STATUS=0 ' +
        ' GROUP BY UPC7,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(' +
        'DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC8,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP48F'#39#39' AND UPC4<>'#39#39#39#39' AND STATUS=0 ' +
        ' GROUP BY UPC8,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(' +
        'DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9#39
      #9#9#9'--print @sql'
      #9#9#9'INSERT @Items1(UPC, VEND_ID, ORDERNUM,QTY,DATEPR)'
      #9#9#9'EXEC(@SQL)'
      #9'END'
      #9
      #9'IF @WorkNo='#39'SP00'#39
      #9'BEGIN'
      #9#9#9'SET @SQL = '#39' '
      
        #9#9#9'SELECT UPC1 AS UPC,VENDID VEND_ID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39')' +
        ' ORDERNUM,COUNT(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39 +
        #39#39') DATEPRO  FROM STICKERS WHERE WORK_NO='#39#39'SP00'#39#39' AND UPC1<>'#39#39#39#39 +
        ' AND STATUS=0  GROUP BY UPC1,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),' +
        'ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC2,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP00'#39#39' AND UPC2<>'#39#39#39#39' AND STATUS=0  ' +
        'GROUP BY UPC2,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(D' +
        'ATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC3,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP00'#39#39' AND UPC3<>'#39#39#39#39' AND STATUS=0  ' +
        'GROUP BY UPC3,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(D' +
        'ATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC4,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP00'#39#39' AND UPC4<>'#39#39#39#39' AND STATUS=0  ' +
        'GROUP BY UPC4,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(D' +
        'ATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC5,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP00'#39#39' AND UPC2<>'#39#39#39#39' AND STATUS=0  ' +
        'GROUP BY UPC5,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(D' +
        'ATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC6,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP00'#39#39' AND UPC3<>'#39#39#39#39' AND STATUS=0  ' +
        'GROUP BY UPC6,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(D' +
        'ATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC7,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP00'#39#39' AND UPC4<>'#39#39#39#39' AND STATUS=0  ' +
        'GROUP BY UPC7,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(D' +
        'ATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9'UNION ALL'
      
        #9#9#9'SELECT UPC8,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39') ORDERNUM,COUNT' +
        '(id) AS QTY,ISNULL(FORMAT(DATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39') DATEPRO  FR' +
        'OM STICKERS WHERE WORK_NO='#39#39'SP00'#39#39' AND UPC4<>'#39#39#39#39' AND STATUS=0  ' +
        'GROUP BY UPC8,VENDID,FORMAT(DATEPO,'#39#39'MM/dd/yy'#39#39'),ISNULL(FORMAT(D' +
        'ATEPR,'#39#39'MM/dd/yy'#39#39'),'#39#39#39#39')'
      #9#9#9#39
      #9#9#9'--print @sql'
      #9#9#9'INSERT @Items1(UPC, VEND_ID, ORDERNUM,QTY,DATEPR)'
      #9#9#9'EXEC(@SQL)'
      #9'END'
      #9'IF @WorkNo='#39'SPOP'#39
      #9'BEGIN'
      #9#9#9'INSERT @Items1(UPC, VEND_ID, ORDERNUM,QTY,DATEPR)'
      #9#9#9'SELECT'
      #9#9#9#39#39' UPC'
      #9#9#9',vendor_id VEND_ID'
      #9#9#9',ISNULL([ORDERNUMBER],ORDERID)+'#39' - '#39'+[STATUS] ORDERNUM'
      #9#9#9',[ORDERID]'
      #9#9#9',CONVERT(VARCHAR,[ORDERDATE],101) DATEPRO'
      #9#9#9'  FROM [dbo].[ORDER_HEADER]'
      
        #9#9#9'  INNER JOIN SUPLIDORES on SUPLIDORES.NUMEROSUPLIDOR = ORDER_' +
        'HEADER.SUPPLIER'
      #9#9#9'  WHERE ORDERDATE>=@pFromDate AND ORDERDATE<=@pToDate'
      #9#9#9'  ORDER BY ORDERID DESC'
      #9'END'
      ''
      #9'IF @WorkNo='#39'SP48F'#39
      
        #9#9'SELECT '#39'#'#39'+ORDERNUM +'#39'#PRC:'#39'+DATEPR +'#39' #Stickers = '#39'+CONVERT(V' +
        'ARCHAR,SUM(QTY)) AS DESCRIPTION FROM @Items1 group by ORDERNUM,D' +
        'ATEPR'
      #9'IF @WorkNo='#39'SP00'#39
      
        #9#9'SELECT '#39'#'#39'+ORDERNUM +'#39' #Stickers = '#39'+CONVERT(VARCHAR,SUM(QTY))' +
        ' AS DESCRIPTION FROM @Items1 group by ORDERNUM,DATEPR'
      #9'IF @WorkNo='#39'SPOP'#39
      
        #9#9'SELECT '#39'#'#39'+ORDERNUM +'#39' #'#39'+VEND_ID +'#39' #PRC:'#39'+DATEPR +'#39' #ID:'#39'+CO' +
        'NVERT(VARCHAR,QTY) AS DESCRIPTION FROM @Items1 order by qty desc' +
        '--group by ORDERNUM,VEND_ID,DATEPR'
      #9
      'END;'
      '')
    Left = 576
    Top = 904
  end
  object usp_POSStickersPrintReport: TFDQuery
    AfterExecute = DELETE_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[usp_POSStickersPrintReport]('
      #9'@pReportType INT = 0,'
      #9'@pFilterType1 INT = 0,'
      #9'@pFilterValue1 VARCHAR(50) = '#39#39','
      #9'@pLocation INT = 0,'
      #9'@pFSA INT = 0,'
      #9'@pOTC INT = 0,'
      #9'@pEBT INT = 0,'
      #9'@pInactives INT = 0'
      ''
      ')'
      'AS'
      'BEGIN'
      #9'DECLARE @WorkNo VARCHAR(5)'
      #9'SELECT @WorkNo = '#39#39
      
        #9'--SELECT @WorkNo = CONVERT(VARCHAR, [STICKER]) FROM [dbo].[Coun' +
        'terS]'
      ''
      #9'DECLARE'
      #9'@SQL'#9'VARCHAR(MAX),'
      #9'@Count'#9'INT,'
      #9'@Loop'#9'INT,'
      #9'@ID'#9#9'INT,'
      #9'@pWorkNoU VARCHAR(5)='#39'SC48'#39','
      #9'@pWorkNo VARCHAR(5)='#39'SC810'#39','
      #9'@pDATE1 DATETIME'
      ''
      #9'DECLARE'
      
        #9'@Items TABLE (SNo INT IDENTITY(1,1), UPC VARCHAR(15), DESCRIPT ' +
        'VARCHAR(50), LP1 DECIMAL(18,2), VEND  VARCHAR(40), '
      
        #9'VENDID  VARCHAR(40), LINE_LOC VARCHAR(10), SHELF_LOC  VARCHAR(1' +
        '0), STOCK_LOC  VARCHAR(20), UPCA VARCHAR(50), '
      
        #9'SIZE_IT VARCHAR(10), UPC_TYPE VARCHAR(11),'#9'ORDERNUM VARCHAR(20)' +
        ',DATEPO DATETIME)'
      ''
      #9'DECLARE @Stickers_tp TABLE (ID INT IDENTITY(1,1), '
      
        #9#9'UPC1 varchar(15),DESC1 varchar(50),PRIC1 VARCHAR(18),VEND1 var' +
        'char(20),VENID1 varchar(20),LINE_LOC1 varchar(10),SHELF_LOC1 var' +
        'char(20),STOCK_LOC1 varchar(20),UPCA1 varchar(20),SIZE_IT1 varch' +
        'ar(10),UPC1_TYPE varchar(11),'
      
        #9#9'UPC2 varchar(15),DESC2 varchar(50),PRIC2 VARCHAR(18),VEND2 var' +
        'char(20),VENID2 varchar(20),LINE_LOC2 varchar(10),SHELF_LOC2 var' +
        'char(20),STOCK_LOC2 varchar(20),UPCA2 varchar(20),SIZE_IT2 varch' +
        'ar(10),UPC2_TYPE varchar(11),'
      
        #9#9'UPC3 varchar(15),DESC3 varchar(50),PRIC3 VARCHAR(18),VEND3 var' +
        'char(20),VENID3 varchar(20),LINE_LOC3 varchar(10),SHELF_LOC3 var' +
        'char(20),STOCK_LOC3 varchar(20),UPCA3 varchar(20),SIZE_IT3 varch' +
        'ar(10),UPC3_TYPE varchar(11),'
      
        #9#9'UPC4 varchar(15),DESC4 varchar(50),PRIC4 VARCHAR(18),VEND4 var' +
        'char(20),VENID4 varchar(20),LINE_LOC4 varchar(10),SHELF_LOC4 var' +
        'char(20),STOCK_LOC4 varchar(20),UPCA4 varchar(20),SIZE_IT4 varch' +
        'ar(10),UPC4_TYPE varchar(11),'
      
        #9#9'UPC5 varchar(15),DESC5 varchar(50),PRIC5 VARCHAR(18),VEND5 var' +
        'char(20),VENID5 varchar(20),LINE_LOC5 varchar(10),SHELF_LOC5 var' +
        'char(20),STOCK_LOC5 varchar(20),UPCA5 varchar(20),SIZE_IT5 varch' +
        'ar(10),UPC5_TYPE varchar(11),'
      
        #9#9'UPC6 varchar(15),DESC6 varchar(50),PRIC6 VARCHAR(18),VEND6 var' +
        'char(20),VENID6 varchar(20),LINE_LOC6 varchar(10),SHELF_LOC6 var' +
        'char(20),STOCK_LOC6 varchar(20),UPCA6 varchar(20),SIZE_IT6 varch' +
        'ar(10),UPC6_TYPE varchar(11),'
      
        #9#9'UPC7 varchar(15),DESC7 varchar(50),PRIC7 VARCHAR(18),VEND7 var' +
        'char(20),VENID7 varchar(20),LINE_LOC7 varchar(10),SHELF_LOC7 var' +
        'char(20),STOCK_LOC7 varchar(20),UPCA7 varchar(20),SIZE_IT7 varch' +
        'ar(10),UPC7_TYPE varchar(11),'
      
        #9#9'UPC8 varchar(15),DESC8 varchar(50),PRIC8 VARCHAR(18),VEND8 var' +
        'char(20),VENID8 varchar(20),LINE_LOC8 varchar(10),SHELF_LOC8 var' +
        'char(20),STOCK_LOC8 varchar(20),UPCA8 varchar(20),SIZE_IT8 varch' +
        'ar(10),UPC8_TYPE varchar(11)'
      #9#9')'
      #9#9'if (@pReportType=0 and @pFilterType1=0)'
      #9#9'BEGIN'
      #9#9#9'SELECT * FROM @Stickers_tp; '
      #9#9'END;'
      
        #9#9'else if @pReportType=4 and (@pFilterType1=9 or @pFilterType1=8' +
        ' or @pFilterType1=7 or @pFilterType1=4 or @pFilterType1=3 or @pF' +
        'ilterType1=2)'
      #9#9'BEGIN'
      #9#9#9#9#9#9'DELETE @Items'
      ''
      #9#9#9#9#9#9'IF @pFilterType1=4'#9'-- BY SUPLIER'
      #9#9#9#9#9#9#9'BEGIN'
      
        #9#9#9#9#9#9#9#9'INSERT @Items(UPC, DESCRIPT, LP1, VEND ,VENDID,LINE_LOC,' +
        'SHELF_LOC,STOCK_LOC,UPCA,SIZE_IT,UPC_TYPE)'
      
        #9#9#9#9#9#9#9#9'SELECT RTRIM(ITM.CODIGOBARRA),isnull(ITM.DESCRIPCION,'#39#39')' +
        ',isnull(ITM.PRECIO,0),isnull(ITM.ITEM_NUM,'#39#39') ,isnull(ITM.vendor' +
        '_ide,'#39#39')'
      
        #9#9#9#9#9#9#9#9',isnull(ITM.line_loc,'#39#39'),isnull(ITM.shelf_loc,'#39#39'),isnull' +
        '(ITM.stock_loc,'#39#39'),dbo.ufn_GETUPCA(isnull(ITM.CODIGOBARRA,'#39#39')),I' +
        'IF(LEN(isnull(ITM.SIZE_IT,'#39#39'))<=10,isnull(ITM.SIZE_IT,'#39#39'),LEFT(I' +
        'TM.SIZE_IT,10))'
      
        #9#9#9#9#9#9#9#9',iif(ISNULL(ITM.Sigis, 0)=1,'#39'FSA'#39','#39'   '#39')+'#39' '#39'+iif(ISNULL(' +
        'ITM.EBT, 0)=1,'#39'EBT'#39','#39'   '#39')+'#39' '#39'+iif(ISNULL(ITM.OTCCard, 0)=1,'#39'OTC' +
        #39','#39'   '#39')'
      #9#9#9#9#9#9#9#9#9#9'FROM INVENTARIOPISO ITM '
      
        #9#9#9#9#9#9#9#9#9#9'WHERE CONVERT(VARCHAR,NUMEROSUPLIDOR) =@pFilterValue1 ' +
        ' --'#39'8494'#39'-- '
      #9#9#9#9#9#9#9#9#9#9'AND isnull(ITM.CODIGOBARRA,'#39#39')<>'#39#39
      #9#9#9#9#9#9#9#9#9#9'AND ISNUMERIC(ITM.CODIGOBARRA)=1'
      
        #9#9#9#9#9#9#9#9#9#9'AND LEN(rtrim(isnull(ITM.line_loc,'#39#39')))>=IIF(@pLocatio' +
        'n = 1, 1, 0)'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.Sigis, 0)=IIF(@pFSA = 1, 1 ,ISNULL(ITM.' +
        'Sigis, 0))'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.OTCCard, 0)=IIF(@pOTC = 1, 1 ,ISNULL(IT' +
        'M.OTCCard, 0))'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.EBT, 0)=IIF(@pEBT = 1, 1 ,ISNULL(ITM.EB' +
        'T, 0))'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.INACTIVE, 0)<=IIF(@pInactives = 0, 0 ,1' +
        ')'#9'--INCLUDE INACTIVES'
      #9#9#9#9#9#9#9#9#9#9'ORDER BY 2'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9'ELSE IF @pFilterType1=2'#9'-- BY DEPARTMENT'
      #9#9#9#9#9#9#9'BEGIN'
      
        #9#9#9#9#9#9#9#9'INSERT @Items(UPC, DESCRIPT, LP1, VEND ,VENDID,LINE_LOC,' +
        'SHELF_LOC,STOCK_LOC,UPCA,SIZE_IT,UPC_TYPE)'
      
        #9#9#9#9#9#9#9#9'SELECT RTRIM(ITM.CODIGOBARRA),isnull(ITM.DESCRIPCION,'#39#39')' +
        ',isnull(ITM.PRECIO,0),isnull(ITM.ITEM_NUM,'#39#39') ,isnull(ITM.vendor' +
        '_ide,'#39#39')'
      
        #9#9#9#9#9#9#9#9',isnull(ITM.line_loc,'#39#39'),isnull(ITM.shelf_loc,'#39#39'),isnull' +
        '(ITM.stock_loc,'#39#39'),dbo.ufn_GETUPCA(isnull(ITM.CODIGOBARRA,'#39#39')),I' +
        'IF(LEN(isnull(ITM.SIZE_IT,'#39#39'))<=10,isnull(ITM.SIZE_IT,'#39#39'),LEFT(I' +
        'TM.SIZE_IT,10))'
      
        #9#9#9#9#9#9#9#9',iif(ISNULL(ITM.Sigis, 0)=1,'#39'FSA'#39','#39'   '#39')+'#39' '#39'+iif(ISNULL(' +
        'ITM.EBT, 0)=1,'#39'EBT'#39','#39'   '#39')+'#39' '#39'+iif(ISNULL(ITM.OTCCard, 0)=1,'#39'OTC' +
        #39','#39'   '#39')'
      #9#9#9#9#9#9#9#9#9#9'FROM INVENTARIOPISO ITM '
      #9#9#9#9#9#9#9#9#9#9'WHERE CONVERT(VARCHAR,DEPARTAMENTO) =@pFilterValue1'
      #9#9#9#9#9#9#9#9#9#9'AND isnull(ITM.CODIGOBARRA,'#39#39')<>'#39#39
      #9#9#9#9#9#9#9#9#9#9'AND ISNUMERIC(ITM.CODIGOBARRA)=1'
      
        #9#9#9#9#9#9#9#9#9#9'AND LEN(rtrim(isnull(ITM.line_loc,'#39#39')))>=IIF(@pLocatio' +
        'n = 1, 1, 0)'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.Sigis, 0)=IIF(@pFSA = 1, 1 ,ISNULL(ITM.' +
        'Sigis, 0))'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.OTCCard, 0)=IIF(@pOTC = 1, 1 ,ISNULL(IT' +
        'M.OTCCard, 0))'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.EBT, 0)=IIF(@pEBT = 1, 1 ,ISNULL(ITM.EB' +
        'T, 0))'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.INACTIVE, 0)<=IIF(@pInactives = 0, 0 ,1' +
        ')'#9'--INCLUDE INACTIVES'
      #9#9#9#9#9#9#9#9#9#9'ORDER BY 2'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9'ELSE IF @pFilterType1=3'#9'--BY SUB-DEPARTMENT'
      #9#9#9#9#9#9#9'BEGIN'
      
        #9#9#9#9#9#9#9#9'INSERT @Items(UPC, DESCRIPT, LP1, VEND ,VENDID,LINE_LOC,' +
        'SHELF_LOC,STOCK_LOC,UPCA,SIZE_IT,UPC_TYPE)'
      
        #9#9#9#9#9#9#9#9'SELECT RTRIM(ITM.CODIGOBARRA),isnull(ITM.DESCRIPCION,'#39#39')' +
        ',isnull(ITM.PRECIO,0),isnull(ITM.ITEM_NUM,'#39#39') ,isnull(ITM.vendor' +
        '_ide,'#39#39')'
      
        #9#9#9#9#9#9#9#9',isnull(ITM.line_loc,'#39#39'),isnull(ITM.shelf_loc,'#39#39'),isnull' +
        '(ITM.stock_loc,'#39#39'),dbo.ufn_GETUPCA(isnull(ITM.CODIGOBARRA,'#39#39')),I' +
        'IF(LEN(isnull(ITM.SIZE_IT,'#39#39'))<=10,isnull(ITM.SIZE_IT,'#39#39'),LEFT(I' +
        'TM.SIZE_IT,10))'
      
        #9#9#9#9#9#9#9#9',iif(ISNULL(ITM.Sigis, 0)=1,'#39'FSA'#39','#39'   '#39')+'#39' '#39'+iif(ISNULL(' +
        'ITM.EBT, 0)=1,'#39'EBT'#39','#39'   '#39')+'#39' '#39'+iif(ISNULL(ITM.OTCCard, 0)=1,'#39'OTC' +
        #39','#39'   '#39')'
      #9#9#9#9#9#9#9#9#9#9'FROM INVENTARIOPISO ITM '
      
        #9#9#9#9#9#9#9#9#9#9'WHERE CONVERT(VARCHAR,SUB_DEPARTAMENTO) =@pFilterValue' +
        '1'
      #9#9#9#9#9#9#9#9#9#9'AND isnull(ITM.CODIGOBARRA,'#39#39')<>'#39#39
      #9#9#9#9#9#9#9#9#9#9'AND ISNUMERIC(ITM.CODIGOBARRA)=1'
      
        #9#9#9#9#9#9#9#9#9#9'AND LEN(rtrim(isnull(ITM.line_loc,'#39#39')))>=IIF(@pLocatio' +
        'n = 1, 1, 0)'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.Sigis, 0)=IIF(@pFSA = 1, 1 ,ISNULL(ITM.' +
        'Sigis, 0))'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.OTCCard, 0)=IIF(@pOTC = 1, 1 ,ISNULL(IT' +
        'M.OTCCard, 0))'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.EBT, 0)=IIF(@pEBT = 1, 1 ,ISNULL(ITM.EB' +
        'T, 0))'
      
        #9#9#9#9#9#9#9#9#9#9'AND ISNULL(ITM.INACTIVE, 0)<=IIF(@pInactives = 0, 0 ,1' +
        ')'#9'--INCLUDE INACTIVES'
      #9#9#9#9#9#9#9#9#9#9'ORDER BY 2'
      #9#9#9#9#9#9#9'END'
      ''
      #9#9#9#9#9#9'ELSE IF @pFilterType1=7'#9'--UPDATE 832'
      #9#9#9#9#9#9#9'BEGIN'
      
        #9#9#9#9#9#9#9#9'INSERT @Items(UPC, DESCRIPT, LP1, VEND ,VENDID,LINE_LOC,' +
        'SHELF_LOC,STOCK_LOC,UPCA,SIZE_IT,UPC_TYPE)'
      
        #9#9#9#9#9#9#9#9'SELECT RTRIM(c.UPC),isnull(ITM.DESCRIPCION,'#39#39'),isnull(C.' +
        'PRICE,0),isnull(ITM.ITEM_NUM,'#39#39') ,isnull(ITM.vendor_ide,'#39#39')'
      
        #9#9#9#9#9#9#9#9',isnull(ITM.line_loc,'#39#39'),isnull(ITM.shelf_loc,'#39#39'),isnull' +
        '(ITM.stock_loc,'#39#39'),dbo.ufn_GETUPCA(isnull(c.UPC,'#39#39')),isnull(ITM.' +
        'SIZE_IT,'#39#39'),isnull(c.UPC1_TYPE,'#39#39')'
      #9#9#9#9#9#9#9#9#9#9'FROM '
      #9#9#9#9#9#9#9#9#9#9'('
      
        #9#9#9#9#9#9#9#9#9#9'--SELECT [UPC1],[PRICE1],[UPC1_TYPE] FROM [dbo].[Stick' +
        'ers] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@p' +
        'DATE1 AND STATUS=0'
      
        #9#9#9#9#9#9#9#9#9#9'SELECT UPC, PRICE,'#39#39' UPC1_TYPE FROM ORDER_DETAIL WHERE' +
        ' (CONVERT(VARCHAR,ORDERID) = @pFilterValue1) AND LEN(ISNULL(UPC,' +
        #39#39')) >=10'
      #9#9#9#9#9#9#9#9#9#9') C'
      
        #9#9#9#9#9#9#9#9#9#9'LEFT JOIN INVENTARIOPISO ITM ON RTRIM(c.UPC)=ITM.CODIG' +
        'OBARRA'
      #9#9#9#9#9#9#9#9#9#9'ORDER BY 2'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9'ELSE'#9'-- HANDHELD, ORDERS'
      #9#9#9#9#9#9#9'BEGIN'
      
        #9#9#9#9#9#9#9#9'SET @pWorkNo = iif(@pFilterType1=9,'#39'SP48F'#39',iif(@pReportT' +
        'ype=4 and @pFilterType1=8,'#39'SP00'#39','#39'SC810'#39'));'
      #9#9#9#9#9#9#9#9'SET @pDATE1= CONVERT(DATETIME,@pFilterValue1)'
      ''
      
        #9#9#9#9#9#9#9#9'INSERT @Items(UPC, DESCRIPT, LP1, VEND ,VENDID,LINE_LOC,' +
        'SHELF_LOC,STOCK_LOC,UPCA,SIZE_IT,UPC_TYPE)'
      
        #9#9#9#9#9#9#9#9'SELECT RTRIM(c.UPC1),isnull(ITM.DESCRIPCION,'#39#39'),iif(@pFi' +
        'lterType1=9,isnull(C.PRICE1,0),isnull(ITM.PRECIO,0)),isnull(ITM.' +
        'ITEM_NUM,'#39#39') ,isnull(ITM.vendor_ide,'#39#39')'
      
        #9#9#9#9#9#9#9#9',isnull(ITM.line_loc,'#39#39'),isnull(ITM.shelf_loc,'#39#39'),isnull' +
        '(ITM.stock_loc,'#39#39'),dbo.ufn_GETUPCA(isnull(c.UPC1,'#39#39')),isnull(ITM' +
        '.SIZE_IT,'#39#39'),isnull(c.UPC1_TYPE,'#39#39')'
      #9#9#9#9#9#9#9#9#9#9'FROM '
      #9#9#9#9#9#9#9#9#9#9'('#9'SELECT'
      #9#9#9#9#9#9#9#9#9#9#9#9'FILTERSC.[UPC1]'
      #9#9#9#9#9#9#9#9#9#9#9#9',FILTERSC.[PRICE1]'
      #9#9#9#9#9#9#9#9#9#9#9#9',FILTERSC.[UPC1_TYPE]'
      ''
      #9#9#9#9#9#9#9#9#9#9'FROM '
      #9#9#9#9#9#9#9#9#9#9'('
      
        #9#9#9#9#9#9#9#9#9#9'--SELECT [UPC1],[DESC1],[PRIC1],[VEND1],[VENID1],[LINE' +
        '_LOC1],[SHELF_LOC1],[UPCA1],[SIZE_IT1],[UPC1_TYPE],DATEPO'
      
        #9#9#9#9#9#9#9#9#9#9'SELECT [UPC1],[PRICE1],[UPC1_TYPE] FROM [dbo].[Sticker' +
        's] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDA' +
        'TE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9#9'SELECT [UPC2],[PRICE2],[UPC2_TYPE] FROM [dbo].[Sticker' +
        's] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDA' +
        'TE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9#9'SELECT [UPC3],[PRICE3],[UPC3_TYPE] FROM [dbo].[Sticker' +
        's] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDA' +
        'TE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9#9'SELECT [UPC4],[PRICE4],[UPC4_TYPE] FROM [dbo].[Sticker' +
        's] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDA' +
        'TE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9#9'SELECT [UPC5],[PRICE5],[UPC5_TYPE] FROM [dbo].[Sticker' +
        's] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDA' +
        'TE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9#9'SELECT [UPC6],[PRICE6],[UPC6_TYPE] FROM [dbo].[Sticker' +
        's] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDA' +
        'TE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9#9'SELECT [UPC7],[PRICE7],[UPC7_TYPE] FROM [dbo].[Sticker' +
        's] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDA' +
        'TE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9#9'UNION ALL'
      
        #9#9#9#9#9#9#9#9#9#9'SELECT [UPC8],[PRICE8],[UPC8_TYPE] FROM [dbo].[Sticker' +
        's] WHERE [Work_no]=@pWorkNo and CONVERT(VARCHAR,DATEPO,101)=@pDA' +
        'TE1 AND STATUS=0'
      #9#9#9#9#9#9#9#9#9#9')  FILTERSC'
      #9#9#9#9#9#9#9#9#9#9#9'WHERE ISNULL(FILTERSC.UPC1,'#39#39') <>'#39#39
      #9#9#9#9#9#9#9#9#9#9') C'
      
        #9#9#9#9#9#9#9#9#9#9'LEFT JOIN INVENTARIOPISO ITM ON RTRIM(c.UPC1)=ITM.CODI' +
        'GOBARRA'
      #9#9#9#9#9#9#9#9#9#9'ORDER BY 2'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9#9#9
      #9#9#9#9#9#9'SELECT @Loop = @@ROWCOUNT---1'
      ''
      #9#9#9#9#9#9'SET @ID = @Loop % @pReportType'
      #9#9#9#9#9#9'SELECT @Loop = 1,@Count=1'
      ''
      #9#9#9#9#9#9'WHILE @ID < @pReportType'
      #9#9#9#9#9#9'BEGIN'
      
        #9#9#9#9#9#9#9'INSERT @Items(UPC, DESCRIPT, LP1, VEND ,VENDID,LINE_LOC,S' +
        'HELF_LOC,STOCK_LOC,UPCA,SIZE_IT,UPC_TYPE,ORDERNUM,DATEPO)'
      
        #9#9#9#9#9#9#9'SELECT '#39#39' AS UPC, '#39#39' AS DESCRIPT, 0 AS LP1, '#39#39' as VEND, '#39 +
        #39' AS VENDID, '#39#39' AS LINE_LOC,'#39#39' AS SHELF_LOC,'#39#39' AS STOCK_LOC, '#39#39' ' +
        'AS UPCA,'#39#39' AS SIZE_IT,'#39#39' AS UPC_TYPE,'#39#39' AS ORDERNUM,NULL AS DATE' +
        'PO '
      ''
      #9#9#9#9#9#9#9'SET @ID = @ID + 1'
      #9#9#9#9#9#9'END'
      #9#9#9#9#9#9'--1'
      #9#9#9#9#9#9'--SELECT * FROM @Items'
      #9#9#9#9#9#9'--'
      #9#9#9#9#9#9'--SELECT @Loop = MIN(SNo) FROM @Items'
      #9#9#9#9#9#9'SELECT @SQL = '#39#39
      #9#9#9#9#9#9'--print '#39'11111'#39
      #9#9#9#9#9#9'WHILE @Loop <= (SELECT MAX(SNo) FROM @Items)'
      #9#9#9#9#9#9'BEGIN'
      ''
      #9#9#9#9#9#9#9'IF @Count = 1'
      #9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9
      
        #9#9#9#9#9#9#9#9'--SELECT @SQL = '#39'SELECT '#39#39#39'+@pWorkNo+'#39#39#39' AS Work_no, '#39#39#39 +
        '+ RTRIM(ORDERNUM)+'#39#39#39' AS ORDERNUM, '#39#39#39'+ CONVERT(VARCHAR,DATEPO,1' +
        '01) +'#39#39#39' AS DATEPO,'#39#39#39' +'
      #9#9#9#9#9#9#9#9'SELECT @SQL = '#39'SELECT '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(ISNULL(UPC, '#39#39'))), '#39'.'#39', '#39'0'#39')+'#39#39#39' AS ' +
        'UPC1, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(LEFT(ISNULL(DESCRIPT, '#39#39'), 50))), ' +
        #39#39#39#39', '#39#39#39#39#39#39')+'#39#39#39' AS DESC1, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'IIF(LP1=0,'#39#39','#39'$'#39'+FORMAT(LP1,'#39'##,##0.00'#39'))+'#39#39#39' AS PRIC1' +
        ', '#39#39#39'+'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VEND, '#39#39')))+'#39#39#39' AS VEND1, '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VENDID, '#39#39')))+'#39#39#39' AS VENID1, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(LINE_LOC, '#39#39')))+'#39#39#39' AS LINE_LOC1, '#39 +
        #39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SHELF_LOC, '#39#39')))+'#39#39#39' AS SHELF_LOC1,' +
        ' '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(STOCK_LOC, '#39#39')))+'#39#39#39' AS STOCK_LOC1,' +
        ' '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPCA, '#39#39')))+'#39#39#39' AS UPCA1, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SIZE_IT, '#39#39')))+'#39#39#39' AS SIZE_IT1, '#39#39#39 +
        ' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPC_TYPE, '#39#39')))+'#39#39#39' AS UPC1_TYPE '#39' '
      #9#9#9#9#9#9#9#9'FROM @Items WHERE SNo = @Loop'
      #9#9#9#9#9#9#9#9'--print @SQL'
      #9#9#9#9#9#9#9#9'--EXEC (@SQL)'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9'IF @Count = 2'
      #9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9'SELECT @SQL = @SQL +CHAR(13)+ '#39','#39#39#39'+'
      
        #9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(ISNULL(UPC, '#39#39'))), '#39'.'#39', '#39'0'#39')+'#39#39#39' AS ' +
        'UPC2, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(LEFT(ISNULL(DESCRIPT, '#39#39'), 50))), ' +
        #39#39#39#39', '#39#39#39#39#39#39')+'#39#39#39' AS DESC2, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'IIF(LP1=0,'#39#39','#39'$'#39'+FORMAT(LP1,'#39'##,##0.00'#39'))+'#39#39#39' AS PRIC2' +
        ', '#39#39#39'+'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VEND, '#39#39')))+'#39#39#39' AS VEND2, '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VENDID, '#39#39')))+'#39#39#39' AS VENID2, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(LINE_LOC, '#39#39')))+'#39#39#39' AS LINE_LOC2, '#39 +
        #39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SHELF_LOC, '#39#39')))+'#39#39#39' AS SHELF_LOC2,' +
        ' '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(STOCK_LOC, '#39#39')))+'#39#39#39' AS STOCK_LOC2,' +
        ' '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPCA, '#39#39')))+'#39#39#39' AS UPCA2, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SIZE_IT, '#39#39')))+'#39#39#39' AS SIZE_IT2, '#39#39#39 +
        ' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPC_TYPE, '#39#39')))+'#39#39#39' AS UPC2_TYPE '#39' '
      #9#9#9#9#9#9#9#9'FROM @Items WHERE SNo = @Loop'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9'IF @Count = 3'
      #9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9'SELECT @SQL = @SQL +CHAR(13)+ '#39','#39#39#39'+'
      
        #9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(ISNULL(UPC, '#39#39'))), '#39'.'#39', '#39'0'#39')+'#39#39#39' AS ' +
        'UPC3, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(LEFT(ISNULL(DESCRIPT, '#39#39'), 50))), ' +
        #39#39#39#39', '#39#39#39#39#39#39')+'#39#39#39' AS DESC3, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'IIF(LP1=0,'#39#39','#39'$'#39'+FORMAT(LP1,'#39'##,##0.00'#39'))+'#39#39#39' AS PRIC3' +
        ', '#39#39#39'+'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VEND, '#39#39')))+'#39#39#39' AS VEND3, '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VENDID, '#39#39')))+'#39#39#39' AS VENID3, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(LINE_LOC, '#39#39')))+'#39#39#39' AS LINE_LOC3, '#39 +
        #39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SHELF_LOC, '#39#39')))+'#39#39#39' AS SHELF_LOC3,' +
        ' '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(STOCK_LOC, '#39#39')))+'#39#39#39' AS STOCK_LOC3,' +
        ' '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPCA, '#39#39')))+'#39#39#39' AS UPCA3, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SIZE_IT, '#39#39')))+'#39#39#39' AS SIZE_IT3, '#39#39#39 +
        ' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPC_TYPE, '#39#39')))+'#39#39#39' AS UPC3_TYPE '#39' '
      #9#9#9#9#9#9#9#9'FROM @Items WHERE SNo = @Loop'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9'IF @Count = 4'
      #9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9'SELECT @SQL = @SQL +CHAR(13)+ '#39','#39#39#39'+'
      
        #9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(ISNULL(UPC, '#39#39'))), '#39'.'#39', '#39'0'#39')+'#39#39#39' AS ' +
        'UPC4, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(LEFT(ISNULL(DESCRIPT, '#39#39'), 50))), ' +
        #39#39#39#39', '#39#39#39#39#39#39')+'#39#39#39' AS DESC4,'#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'IIF(LP1=0,'#39#39','#39'$'#39'+FORMAT(LP1,'#39'##,##0.00'#39'))+'#39#39#39' AS PRIC4' +
        ', '#39#39#39'+'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VEND, '#39#39')))+'#39#39#39' AS VEND4, '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VENDID, '#39#39')))+'#39#39#39' AS VENID4, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(LINE_LOC, '#39#39')))+'#39#39#39' AS LINE_LOC4, '#39 +
        #39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SHELF_LOC, '#39#39')))+'#39#39#39' AS SHELF_LOC4,' +
        ' '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(STOCK_LOC, '#39#39')))+'#39#39#39' AS STOCK_LOC4,' +
        ' '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPCA, '#39#39')))+'#39#39#39' AS UPCA4, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SIZE_IT, '#39#39')))+'#39#39#39' AS SIZE_IT4, '#39#39#39 +
        ' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPC_TYPE, '#39#39')))+'#39#39#39' AS UPC4_TYPE '#39' '
      #9#9#9#9#9#9#9#9'FROM @Items WHERE SNo = @Loop'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9'IF @Count = 5'
      #9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9'SELECT @SQL = @SQL +CHAR(13)+ '#39','#39#39#39'+'
      
        #9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(ISNULL(UPC, '#39#39'))), '#39'.'#39', '#39'0'#39')+'#39#39#39' AS ' +
        'UPC5, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(LEFT(ISNULL(DESCRIPT, '#39#39'), 50))), ' +
        #39#39#39#39', '#39#39#39#39#39#39')+'#39#39#39' AS DESC5, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'IIF(LP1=0,'#39#39','#39'$'#39'+FORMAT(LP1,'#39'##,##0.00'#39'))+'#39#39#39' AS PRIC5' +
        ', '#39#39#39'+'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VEND, '#39#39')))+'#39#39#39' AS VEND5, '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VENDID, '#39#39')))+'#39#39#39' AS VENID5, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(LINE_LOC, '#39#39')))+'#39#39#39' AS LINE_LOC5, '#39 +
        #39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SHELF_LOC, '#39#39')))+'#39#39#39' AS SHELF_LOC5,' +
        ' '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(STOCK_LOC, '#39#39')))+'#39#39#39' AS STOCK_LOC5,' +
        ' '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPCA, '#39#39')))+'#39#39#39' AS UPCA5, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SIZE_IT, '#39#39')))+'#39#39#39' AS SIZE_IT5, '#39#39#39 +
        ' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPC_TYPE, '#39#39')))+'#39#39#39' AS UPC5_TYPE '#39' '
      #9#9#9#9#9#9#9#9'FROM @Items WHERE SNo = @Loop'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9'IF @Count = 6'
      #9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9'SELECT @SQL = @SQL +CHAR(13)+ '#39','#39#39#39'+'
      
        #9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(ISNULL(UPC, '#39#39'))), '#39'.'#39', '#39'0'#39')+'#39#39#39' AS ' +
        'UPC6, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(LEFT(ISNULL(DESCRIPT, '#39#39'), 50))), ' +
        #39#39#39#39', '#39#39#39#39#39#39')+'#39#39#39' AS DESC6, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'IIF(LP1=0,'#39#39','#39'$'#39'+FORMAT(LP1,'#39'##,##0.00'#39'))+'#39#39#39' AS PRIC6' +
        ', '#39#39#39'+'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VEND, '#39#39')))+'#39#39#39' AS VEND6, '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VENDID, '#39#39')))+'#39#39#39' AS VENID6, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(LINE_LOC, '#39#39')))+'#39#39#39' AS LINE_LOC6, '#39 +
        #39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SHELF_LOC, '#39#39')))+'#39#39#39' AS SHELF_LOC6,' +
        ' '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(STOCK_LOC, '#39#39')))+'#39#39#39' AS STOCK_LOC6,' +
        ' '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPCA, '#39#39')))+'#39#39#39' AS UPCA6, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SIZE_IT, '#39#39')))+'#39#39#39' AS SIZE_IT6, '#39#39#39 +
        ' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPC_TYPE, '#39#39')))+'#39#39#39' AS UPC6_TYPE '#39' '
      #9#9#9#9#9#9#9#9'FROM @Items WHERE SNo = @Loop'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9'IF @Count = 7'
      #9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9'SELECT @SQL = @SQL +CHAR(13)+ '#39','#39#39#39'+'
      
        #9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(ISNULL(UPC, '#39#39'))), '#39'.'#39', '#39'0'#39')+'#39#39#39' AS ' +
        'UPC7, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(LEFT(ISNULL(DESCRIPT, '#39#39'), 50))), ' +
        #39#39#39#39', '#39#39#39#39#39#39')+'#39#39#39' AS DESC7, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'IIF(LP1=0,'#39#39','#39'$'#39'+FORMAT(LP1,'#39'##,##0.00'#39'))+'#39#39#39' AS PRIC7' +
        ', '#39#39#39'+'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VEND, '#39#39')))+'#39#39#39' AS VEND7, '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VENDID, '#39#39')))+'#39#39#39' AS VENID7, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(LINE_LOC, '#39#39')))+'#39#39#39' AS LINE_LOC7, '#39 +
        #39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SHELF_LOC, '#39#39')))+'#39#39#39' AS SHELF_LOC7,' +
        ' '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(STOCK_LOC, '#39#39')))+'#39#39#39' AS STOCK_LOC7,' +
        ' '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPCA, '#39#39')))+'#39#39#39' AS UPCA7, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SIZE_IT, '#39#39')))+'#39#39#39' AS SIZE_IT7, '#39#39#39 +
        ' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPC_TYPE, '#39#39')))+'#39#39#39' AS UPC7_TYPE '#39' '
      #9#9#9#9#9#9#9#9'FROM @Items WHERE SNo = @Loop'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9'IF @Count = 8'
      #9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9'SELECT @SQL = @SQL +CHAR(13)+ '#39','#39#39#39'+'
      
        #9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(ISNULL(UPC, '#39#39'))), '#39'.'#39', '#39'0'#39')+'#39#39#39' AS ' +
        'UPC8, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'REPLACE(LTRIM(RTRIM(LEFT(ISNULL(DESCRIPT, '#39#39'), 50))), ' +
        #39#39#39#39', '#39#39#39#39#39#39')+'#39#39#39' AS DESC8, '#39#39#39'+'
      
        #9#9#9#9#9#9#9#9#9#9'IIF(LP1=0,'#39#39','#39'$'#39'+FORMAT(LP1,'#39'##,##0.00'#39'))+'#39#39#39' AS PRIC8' +
        ', '#39#39#39'+'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VEND, '#39#39')))+'#39#39#39' AS VEND8, '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(VENDID, '#39#39')))+'#39#39#39' AS VENID8, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(LINE_LOC, '#39#39')))+'#39#39#39' AS LINE_LOC8, '#39 +
        #39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SHELF_LOC, '#39#39')))+'#39#39#39' AS SHELF_LOC8,' +
        ' '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(STOCK_LOC, '#39#39')))+'#39#39#39' AS STOCK_LOC8,' +
        ' '#39#39#39' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPCA, '#39#39')))+'#39#39#39' AS UPCA8, '#39#39#39' +'
      
        #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(SIZE_IT, '#39#39')))+'#39#39#39' AS SIZE_IT8, '#39#39#39 +
        ' +'
      #9#9#9#9#9#9#9#9#9#9'LTRIM(RTRIM(ISNULL(UPC_TYPE, '#39#39')))+'#39#39#39' AS UPC8_TYPE '#39' '
      #9#9#9#9#9#9#9#9'FROM @Items WHERE SNo = @Loop'
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9'PRINT @SQL;'
      #9#9#9#9#9#9#9'IF @Count = @pReportType'
      #9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9'PRINT @SQL;'
      #9#9#9#9#9#9#9#9'SET @Count = 0'
      #9#9#9#9#9#9#9#9'IF @pReportType = 4'
      #9#9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9#9'INSERT @Stickers_tp ('
      
        #9#9#9#9#9#9#9#9#9'UPC1, DESC1, PRIC1, VEND1, VENID1, LINE_LOC1, SHELF_LOC' +
        '1, STOCK_LOC1, UPCA1, SIZE_IT1, UPC1_TYPE,'
      
        #9#9#9#9#9#9#9#9#9'UPC2, DESC2, PRIC2, VEND2, VENID2, LINE_LOC2, SHELF_LOC' +
        '2, STOCK_LOC2, UPCA2, SIZE_IT2, UPC2_TYPE,'
      
        #9#9#9#9#9#9#9#9#9'UPC3, DESC3, PRIC3, VEND3, VENID3, LINE_LOC3, SHELF_LOC' +
        '3, STOCK_LOC3, UPCA3, SIZE_IT3, UPC3_TYPE,'
      
        #9#9#9#9#9#9#9#9#9'UPC4, DESC4, PRIC4, VEND4, VENID4, LINE_LOC4, SHELF_LOC' +
        '4, STOCK_LOC4, UPCA4, SIZE_IT4, UPC4_TYPE'
      #9#9#9#9#9#9#9#9#9') '
      #9#9#9#9#9#9#9#9#9'EXEC (@SQL)'
      #9#9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9#9'IF @pReportType = 8'
      #9#9#9#9#9#9#9#9'BEGIN'
      #9#9#9#9#9#9#9#9#9#9'INSERT @Stickers_tp ('
      
        #9#9#9#9#9#9#9#9#9#9'UPC1, DESC1, PRIC1, VEND1, VENID1, LINE_LOC1, SHELF_LO' +
        'C1, STOCK_LOC1, UPCA1, SIZE_IT1, UPC1_TYPE,'
      
        #9#9#9#9#9#9#9#9#9#9'UPC2, DESC2, PRIC2, VEND2, VENID2, LINE_LOC2, SHELF_LO' +
        'C2, STOCK_LOC2, UPCA2, SIZE_IT2, UPC2_TYPE,'
      
        #9#9#9#9#9#9#9#9#9#9'UPC3, DESC3, PRIC3, VEND3, VENID3, LINE_LOC3, SHELF_LO' +
        'C3, STOCK_LOC3, UPCA3, SIZE_IT3, UPC3_TYPE,'
      
        #9#9#9#9#9#9#9#9#9#9'UPC4, DESC4, PRIC4, VEND4, VENID4, LINE_LOC4, SHELF_LO' +
        'C4, STOCK_LOC4, UPCA4, SIZE_IT4, UPC4_TYPE,'
      
        #9#9#9#9#9#9#9#9#9#9'UPC5, DESC5, PRIC5, VEND5, VENID5, LINE_LOC5, SHELF_LO' +
        'C5, STOCK_LOC5, UPCA5, SIZE_IT5, UPC5_TYPE,'
      
        #9#9#9#9#9#9#9#9#9#9'UPC6, DESC6, PRIC6, VEND6, VENID6, LINE_LOC6, SHELF_LO' +
        'C6, STOCK_LOC6, UPCA6, SIZE_IT6, UPC6_TYPE,'
      
        #9#9#9#9#9#9#9#9#9#9'UPC7, DESC7, PRIC7, VEND7, VENID7, LINE_LOC7, SHELF_LO' +
        'C7, STOCK_LOC7, UPCA7, SIZE_IT7, UPC7_TYPE,'
      
        #9#9#9#9#9#9#9#9#9#9'UPC8, DESC8, PRIC8, VEND8, VENID8, LINE_LOC8, SHELF_LO' +
        'C8, STOCK_LOC8, UPCA8, SIZE_IT8, UPC8_TYPE'
      #9#9#9#9#9#9#9#9#9#9') '
      #9#9#9#9#9#9#9#9#9#9'EXEC (@SQL)'
      #9#9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9#9'SET @Count = 0'
      #9#9#9#9#9#9#9#9'SELECT @SQL = '#39#39
      ''
      #9#9#9#9#9#9#9'END'
      #9#9#9#9#9#9#9'SET @Count = @Count + 1'
      #9#9#9#9#9#9#9'SELECT @Loop = MIN(SNo) FROM @Items WHERE SNo > @Loop'
      #9#9#9#9#9#9'END'
      ''
      #9#9#9#9#9#9'SELECT * FROM @Stickers_tp '
      ''
      #9#9#9#9#9#9
      #9#9'END'
      'END'
      '')
    Left = 584
    Top = 992
  end
  object ufn_GetUPCA: TFDQuery
    AfterExecute = DELETE_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE FUNCTION [dbo].[ufn_GetUPCA]('
      '@UPC varchar(20)'
      ''
      ')'
      'RETURNS VARCHAR(20)'
      ''
      'AS'
      ''
      'BEGIN'
      #9'DECLARE '
      #9#9'@Response  VARCHAR(20) = '#39#39','
      #9#9'@UPC_   VARCHAR(20) = '#39#39
      ''
      #9#9'SET @UPC_=RTRIM(ISNULL(@UPC,'#39#39'))'
      ''
      #9#9'IF @UPC_ != '#39#39
      #9#9'BEGIN'
      #9#9#9'IF LEN(@UPC_) < 12 SET @UPC_=dbo.ufn_ChecksumDigit(@UPC_)'
      #9#9#9
      #9#9#9'IF LEN(@UPC_) = 12 '
      #9#9#9'BEGIN'
      #9#9#9#9'SET @Response = '
      #9#9#9#9#9'CHAR(SUBSTRING(@UPC_,1,1)+80) + '
      #9#9#9#9#9'SUBSTRING(@UPC_,2,5) + '#39'p'#39' +'
      #9#9#9#9#9'CHAR(SUBSTRING(@UPC_,7,1)+64) + '
      #9#9#9#9#9'CHAR(SUBSTRING(@UPC_,8,1)+64) + '
      #9#9#9#9#9'CHAR(SUBSTRING(@UPC_,9,1)+64) + '
      #9#9#9#9#9'CHAR(SUBSTRING(@UPC_,10,1)+64) + '
      #9#9#9#9#9'CHAR(SUBSTRING(@UPC_,11,1)+64) + '
      #9#9#9#9#9'CHAR(SUBSTRING(@UPC_,12,1)+96) '
      #9#9#9'END'
      #9#9#9
      #9#9'END'
      ''
      '        RETURN @Response'
      'END')
    Left = 712
    Top = 904
  end
  object ufn_ChecksumDigit: TFDQuery
    AfterExecute = DELETE_PRINT_QUERIESAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE  FUNCTION [dbo].[ufn_ChecksumDigit](@UPC varchar(20))'
      'RETURNS VARCHAR(20)'
      ''
      'AS'
      ''
      'BEGIN'
      'DECLARE @I INT = 0, '
      #9#9'@X INT = 0,'
      #9#9'@Y INT = 0, '
      #9#9'@Check INT = 0,'
      #9#9'@Digit INT = 0,'
      #9#9'@Barcode VARCHAR(20) = '#39#39','
      #9#9'@Checksum bit = 0,'
      #9#9'@UPC_MODIFIED VARCHAR(20) = '#39#39
      ''
      '  '#9#9'IF LEN(LTRIM(RTRIM(@UPC))) > 11'
      #9#9'BEGIN'
      '           SET @Barcode = SUBSTRING(@UPC, 0, LEN(@UPC)) '
      '        END'
      '        ELSE'
      '        BEGIN'
      #9#9#9'SET @Barcode = @UPC'
      '        END'
      #9#9'--SELECT @Barcode as Barcode'
      #9#9
      #9#9'SET @I = LEN(@Barcode)'
      #9#9'WHILE @I > 0'
      '        BEGIN'
      #9#9#9'SET @Y = @Y + SUBSTRING(@Barcode, @I, 1)'
      #9#9#9'SET @I = @I - 2'
      #9#9'END'
      #9#9'--SELECT @Y as Y'
      #9#9'SET @I = LEN(@Barcode)-1'
      #9#9'WHILE @I >= 0'
      #9#9'BEGIN'
      #9#9#9'SET @X = @X + SUBSTRING(@Barcode, @I, 1)'
      #9#9#9'SET @I = @I - 2'
      #9#9'END'
      #9#9'--SELECT @X as X'
      #9#9'SET @Check = @X + (@Y * 3)'
      #9#9'SET @Digit = (10 - (@Check % 10)) % 10'
      #9#9
      #9#9'IF LEN(LTRIM(RTRIM(@UPC))) = 11'
      #9#9'BEGIN'
      '            SET @Checksum = 0'
      
        #9#9#9'SET @UPC_MODIFIED = @UPC + LTRIM(RTRIM(CONVERT(VARCHAR, @Digi' +
        't)))'
      '        End'
      '        ELSE IF LEN(LTRIM(RTRIM(@UPC))) < 11'
      #9#9'BEGIN'
      #9#9#9'SET @Checksum = 0'
      #9#9#9'SET @UPC_MODIFIED = '#39'INVALID_UPC'#39#9
      '        End'
      #9#9'ELSE '
      #9#9'BEGIN'
      #9#9#9'IF RIGHT(LTRIM(RTRIM(@UPC)), 1) = @Digit'
      #9#9#9'BEGIN'
      '            SET @Checksum = 1'
      '            END'
      '            SET @UPC_MODIFIED = LEFT(LTRIM(RTRIM(@UPC)), 12)'
      '        End'
      
        #9#9'-- SELECT @Checksum as CheckSum, @Y as Y, @X as X, @Check as C' +
        'heck1, @Digit as Digit, @UPC_MODIFIED as UPC_MODIFIED'
      
        '        -- SELECT @Checksum as CheckSum, @UPC_MODIFIED as UPC_MO' +
        'DIFIED'
      '        RETURN @UPC_MODIFIED '
      'END')
    Left = 720
    Top = 992
  end
  object USP_POS_INSERT_SPINPOS_TRANS: TFDQuery
    AfterExecute = USP_POS_INSERT_SPINPOS_TRANSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE  PROCEDURE [dbo].[USP_POS_INSERT_SPINPOS_TRANS] '
      #9'@TRANS_NO INT, '
      #9'@RESPONSE TEXT,'
      #9'@AMOUNT'#9'FLOAT=0,'
      #9'@REFERENCENUM INT,'
      #9'@BatchNum INT,'
      #9'@PaymentType VARCHAR(20),'
      #9'@TransactionType VARCHAR(30),'
      #9'@ID INT OUTPUT'
      'AS'
      'BEGIN'
      #9'-- SET NOCOUNT ON added to prevent extra result sets from'
      #9'-- interfering with SELECT statements.'
      #9'SET NOCOUNT ON;'
      #9'BEGIN TRANSACTION'
      
        #9'INSERT INTO SPINPOS (TRANSACTIONNUMBER, RESPONSE, AMOUNT, REFER' +
        'ENCENUM, BatchNum, PaymentType, TransactionType) '
      
        #9#9#9'VALUES (@TRANS_NO, @RESPONSE, round(@AMOUNT,2), @REFERENCENUM' +
        ', @BatchNum, @PaymentType, @TransactionType);'
      #9'SET @ID=SCOPE_IDENTITY();'
      #9'COMMIT;'#9
      'END;'
      '')
    Left = 56
    Top = 816
  end
  object CALC_PAYOUT: TFDQuery
    AfterExecute = USP_POS_INSERT_SPINPOS_TRANSAfterExecute
    Connection = FDConnection1
    SQL.Strings = (
      'CREATE PROCEDURE [dbo].[CALC_PAYOUT] (@ID INT, @REGISTER INT)'
      'AS'
      'DECLARE '
      '    @t1 DECIMAL(18,2) = 0,'
      '    @t2 DECIMAL(18,2) = 0,'
      '    @tChange DECIMAL(18,2) = 0,'
      '    @startbank DECIMAL(18,2) = 0,'
      '    @tpout DECIMAL(18,2) = 0,'
      '    @tpickUp DECIMAL (18,2) = 0,'
      '    @MaxAmount DECIMAL(18,2) = 0;'
      ''
      'SELECT @t1 = ISNULL(SUM(PayAmount1), 0)'
      'FROM TransactionHeader'
      
        'WHERE ID = @ID AND Voided = 0 AND PaymentType1 = '#39'CASH'#39' AND Regi' +
        'ster = @Register;'
      ''
      'SELECT @t2 = ISNULL(SUM(PayAmount2), 0)'
      'FROM TransactionHeader'
      
        'WHERE ID = @ID AND Voided = 0 AND PaymentType2 = '#39'CASH'#39' AND Regi' +
        'ster = @Register;'
      ''
      'SELECT @tChange = ISNULL(SUM([Change]), 0)'
      'FROM TransactionHeader'
      'WHERE ID = @ID AND Voided = 0 AND Register = @Register;'
      ''
      'SELECT @startbank = ISNULL(STARTBANK, 0)'
      'FROM dailytotals'
      'WHERE ID = @ID;'
      ''
      'SELECT @tpout = ISNULL(SUM(PayAmount1), 0)'
      'FROM TransactionHeader'
      
        'WHERE ID = @ID AND Voided = 0 AND PaymentType1 = '#39'POUT'#39' AND Regi' +
        'ster = @Register;'
      ''
      'SELECT @tpickUp = ISNULL(SUM(PayAmount1), 0)'
      'FROM TransactionHeader'
      
        'WHERE ID = @ID AND Voided = 0 AND PaymentType1 = '#39'PICK'#39' AND Regi' +
        'ster = @Register;'
      ''
      
        'SET @MaxAmount = @t1 + @t2 - @tChange + @startbank - @tpout - @t' +
        'pickUp;'
      ''
      'SELECT MaxAmount = @MaxAmount;')
    Left = 656
    Top = 712
  end
  object tr_SPINPOS_AfterInsert_UpdateTransactionHeader: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        '                               CREATE TRIGGER dbo.tr_SPINPOS_Aft' +
        'erInsert_UpdateTransactionHeader'
      'ON dbo.SPINPOS'
      'AFTER INSERT'
      'AS'
      'BEGIN'
      '    SET NOCOUNT ON;'
      ''
      ''
      
        '-- Update TRANSACTIONHEADER.last4 for inserted rows with Transac' +
        'tionType = '#39'Sale'#39','#39'Void'#39' or '#39'Return'#39
      'UPDATE th'
      'SET th.last4 = i.last4'
      'FROM dbo.TRANSACTIONHEADER AS th'
      'INNER JOIN ('
      '    SELECT DISTINCT transactionnumber, last4'
      '    FROM inserted'
      '    WHERE TransactionType IN ('#39'Sale'#39', '#39'Void'#39', '#39'Return'#39')'
      ') AS i'
      '  ON th.transactionnumber = i.transactionnumber;'
      'END')
    Left = 32
    Top = 976
  end
  object QBorrarNonMatchedNDC: TFDQuery
    Connection = FDConnection1
    Left = 352
    Top = 96
  end
end
