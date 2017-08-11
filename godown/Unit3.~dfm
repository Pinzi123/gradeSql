object Form3: TForm3
  Left = 524
  Top = 206
  Width = 434
  Height = 295
  Caption = #20837#24235#21934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 257
    Align = alClient
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 0
    object Label1: TLabel
      Left = 72
      Top = 32
      Width = 81
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20379#25033#21830
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 72
      Top = 56
      Width = 81
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20837#24235#20489#24235
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 72
      Top = 81
      Width = 81
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20837#24235#26085#26399
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 72
      Top = 105
      Width = 81
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #32317#37329#38989
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 72
      Top = 128
      Width = 81
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #20837#24235#21729
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbedtdate: TDBEdit
      Left = 159
      Top = 166
      Width = 200
      Height = 21
      HelpType = htKeyword
      HelpKeyword = #20837#24235#26085#26399
      DataField = 'date'
      DataSource = Form1.MSDataSource1
      ImeName = '?? (?'#34088') - ?'#57358#57524#57646'?'#58864#29485
      TabOrder = 0
      Visible = False
      OnExit = dbedtdateExit
    end
    object dbedtamount: TDBEdit
      Left = 159
      Top = 102
      Width = 200
      Height = 21
      HelpType = htKeyword
      HelpKeyword = #32317#37329#38989
      DataField = 'amount'
      DataSource = Form1.MSDataSource1
      ImeName = '?? (?'#34088') - ?'#57358#57524#57646'?'#58864#29485
      TabOrder = 1
      OnExit = dbedtdateExit
    end
    object BitBtn1: TBitBtn
      Left = 64
      Top = 192
      Width = 75
      Height = 25
      Caption = #30906#35469
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 272
      Top = 192
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object dbcbbprovider: TDBComboBox
      Left = 160
      Top = 31
      Width = 201
      Height = 21
      HelpType = htKeyword
      HelpKeyword = #20379#25033#21830
      DataField = 'provider'
      DataSource = Form1.MSDataSource1
      ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
      ItemHeight = 13
      TabOrder = 4
      OnExit = dbedtdateExit
    end
    object dbcbbwarehouse: TDBComboBox
      Left = 160
      Top = 56
      Width = 200
      Height = 21
      HelpType = htKeyword
      HelpKeyword = #20837#24235#20489#24235
      DataField = 'warehouse'
      DataSource = Form1.MSDataSource1
      ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
      ItemHeight = 13
      TabOrder = 5
      OnChange = dbcbbwarehouseChange
      OnExit = dbedtdateExit
    end
    object dbcbbstaff: TDBComboBox
      Left = 160
      Top = 128
      Width = 200
      Height = 21
      HelpType = htKeyword
      HelpKeyword = #20837#24235#21729
      DataField = 'staff'
      DataSource = Form1.MSDataSource1
      ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
      ItemHeight = 13
      TabOrder = 6
      OnExit = dbedtdateExit
    end
    object dtp1: TDateTimePicker
      Left = 160
      Top = 79
      Width = 200
      Height = 21
      Date = 42958.372267870370000000
      Format = 'yyyy-MM-dd'
      Time = 42958.372267870370000000
      ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
      TabOrder = 7
      OnExit = dbedtdateExit
    end
  end
  object Query1: TMSQuery
    Connection = DataModule2.con1
    SQL.Strings = (
      'select * from providers')
    Active = True
    Left = 16
    Top = 8
  end
  object MSDataSource1: TMSDataSource
    DataSet = Query1
    Left = 384
    Top = 8
  end
end
