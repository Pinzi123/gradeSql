object Form1: TForm1
  Left = 176
  Top = 165
  Width = 1020
  Height = 797
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 60
    Height = 16
    AutoSize = False
    Caption = #20837#24235#21934':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 7
    Top = 408
    Width = 100
    Height = 16
    AutoSize = False
    Caption = #20837#24235#21934#32048#38917':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object TDBGrid2: TDBGrid
    Left = 0
    Top = 436
    Width = 1001
    Height = 265
    DataSource = MSDataSource2
    ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = TDBGrid2CellClick
    OnEnter = TDBGrid1Enter
  end
  object TDBGrid1: TDBGrid
    Left = 2
    Top = 52
    Width = 1001
    Height = 305
    DataSource = MSDataSource1
    ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEnter = TDBGrid1Enter
  end
  object dbnvgr1: TDBNavigator
    Left = 0
    Top = 359
    Width = 980
    Height = 18
    DataSource = MSDataSource1
    TabOrder = 2
  end
  object dbnvgr2: TDBNavigator
    Left = 5
    Top = 701
    Width = 980
    Height = 20
    DataSource = MSDataSource2
    TabOrder = 3
  end
  object MSDataSource1: TMSDataSource
    DataSet = TQuery1
    Left = 646
    Top = 300
  end
  object TQuery1: TMSQuery
    Connection = DataModule2.con1
    SQL.Strings = (
      'select * from godown')
    AfterPost = TQuery1AfterInsert
    Active = True
    Left = 550
    Top = 268
    object gdfldTQuery1oddNum: TGuidField
      DisplayLabel = #21934#34399
      FieldName = 'oddNum'
      FixedChar = True
      Size = 38
    end
    object strngfldTQuery1provider: TStringField
      DisplayLabel = #20379#25033#21830
      FieldName = 'provider'
      Size = 30
    end
    object strngfldTQuery1warehouse: TStringField
      DisplayLabel = #20489#24235
      FieldName = 'warehouse'
      Size = 30
    end
    object dtmfldTQuery1date: TDateTimeField
      DisplayLabel = #20837#24235#26178#38291
      FieldName = 'date'
    end
    object crncyfldTQuery1amount: TCurrencyField
      DisplayLabel = #32317#37329#38989
      FieldName = 'amount'
    end
    object strngfldTQuery1staff: TStringField
      DisplayLabel = #20837#24235#21729
      FieldName = 'staff'
      Size = 10
    end
  end
  object MSDataSource2: TMSDataSource
    DataSet = TQuery2
    Left = 694
    Top = 612
  end
  object TQuery2: TMSQuery
    Connection = DataModule2.con1
    SQL.Strings = (
      'select * from godownDetail'
      'where oddNum=:oddNum')
    AfterPost = TQuery1AfterInsert
    MasterSource = MSDataSource1
    DetailFields = 'oddNum'
    Active = True
    Left = 582
    Top = 612
    ParamData = <
      item
        DataType = ftGuid
        Name = 'oddNum'
        ParamType = ptInput
        Value = '{205F80E5-AC13-40C8-B2FD-0AF89B3905FD}'
      end>
    object gdfldTQuery2productNum: TGuidField
      DisplayLabel = #21830#21697#32232#34399
      FieldName = 'productNum'
      FixedChar = True
      Size = 38
    end
    object strngfldTQuery2providerName: TStringField
      DisplayLabel = #36008#21697#21517#31281
      FieldName = 'providerName'
      Size = 30
    end
    object strngfldTQuery2kind: TStringField
      DisplayLabel = #36008#21697#31278#39006
      FieldName = 'kind'
      Size = 30
    end
    object strngfldTQuery2unit: TStringField
      DisplayLabel = #35336#37327#21934#20301
      FieldName = 'unit'
      FixedChar = True
      Size = 10
    end
    object strngfldTQuery2specifications: TStringField
      DisplayLabel = #35215#26684#22411#34399
      FieldName = 'specifications'
      FixedChar = True
      Size = 10
    end
    object crncyfldTQuery2price: TCurrencyField
      DisplayLabel = #36914#36008#21934#20729
      FieldName = 'price'
    end
    object intgrfldTQuery2number: TIntegerField
      DisplayLabel = #25976#37327
      FieldName = 'number'
    end
    object strngfldTQuery2remark: TStringField
      DisplayLabel = #20633#35387
      FieldName = 'remark'
      Size = 50
    end
    object gdfldTQuery2oddNum: TGuidField
      DisplayLabel = #35330#21934#32232#34399
      FieldName = 'oddNum'
      FixedChar = True
      Size = 38
    end
  end
  object mm1: TMainMenu
    Left = 104
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #20462#25913
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #21034#38500
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #26597#35426
      OnClick = N4Click
    end
  end
end
