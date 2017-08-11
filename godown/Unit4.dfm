object Form4: TForm4
  Left = 330
  Top = 250
  Width = 586
  Height = 243
  Caption = #20837#24235#21934#32048#21063
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    570
    205)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 28
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #36008#21697#21517#31281
  end
  object Label2: TLabel
    Left = 313
    Top = 31
    Width = 65
    Height = 13
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = #36008#21697#31278#39006
  end
  object Label3: TLabel
    Left = 24
    Top = 59
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #35336#37327#21934#20301
  end
  object Label4: TLabel
    Left = 313
    Top = 58
    Width = 65
    Height = 17
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = #25976#37327
  end
  object Label5: TLabel
    Left = 24
    Top = 92
    Width = 65
    Height = 13
    AutoSize = False
    Caption = #35215#26684#22411#34399
  end
  object Label6: TLabel
    Left = 313
    Top = 92
    Width = 65
    Height = 13
    Anchors = [akTop, akRight]
    AutoSize = False
    Caption = #21934#20729
  end
  object Label7: TLabel
    Left = 24
    Top = 120
    Width = 24
    Height = 13
    AutoSize = False
    Caption = #20633#35387
  end
  object dbedtproviderName: TDBEdit
    Left = 90
    Top = 26
    Width = 145
    Height = 21
    DataField = 'providerName'
    DataSource = Form1.MSDataSource2
    ImeName = '?? (?'#34088') - ?'#57358#57524#57646'?'#58864#29485
    TabOrder = 0
    OnExit = editExit
  end
  object dbedtnumber: TDBEdit
    Left = 380
    Top = 56
    Width = 145
    Height = 21
    DataField = 'number'
    DataSource = Form1.MSDataSource2
    ImeName = '?? (?'#34088') - ?'#57358#57524#57646'?'#58864#29485
    TabOrder = 1
    OnExit = editExit
  end
  object dbedtspecifications1: TDBEdit
    Left = 90
    Top = 87
    Width = 145
    Height = 21
    DataField = 'specifications'
    DataSource = Form1.MSDataSource2
    ImeName = '?? (?'#34088') - ?'#57358#57524#57646'?'#58864#29485
    TabOrder = 2
  end
  object dbedtprice: TDBEdit
    Left = 380
    Top = 88
    Width = 145
    Height = 21
    DataField = 'price'
    DataSource = Form1.MSDataSource2
    ImeName = '?? (?'#34088') - ?'#57358#57524#57646'?'#58864#29485
    TabOrder = 3
    OnExit = editExit
  end
  object dbedtremark: TDBEdit
    Left = 90
    Top = 120
    Width = 440
    Height = 21
    DataField = 'remark'
    DataSource = Form1.MSDataSource2
    ImeName = '?? (?'#34088') - ?'#57358#57524#57646'?'#58864#29485
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 88
    Top = 160
    Width = 75
    Height = 25
    Caption = #30906#35469
    TabOrder = 5
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 376
    Top = 160
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object dbedtoddNum: TDBEdit
    Left = 208
    Top = 160
    Width = 121
    Height = 21
    DataField = 'oddNum'
    DataSource = Form1.MSDataSource2
    ImeName = '?? (?'#34088') - ?'#57358#57524#57646'?'#58864#29485
    TabOrder = 7
    Visible = False
  end
  object dbcbbkind: TDBComboBox
    Left = 380
    Top = 28
    Width = 145
    Height = 21
    DataField = 'kind'
    DataSource = Form1.MSDataSource2
    ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
    ItemHeight = 13
    Items.Strings = (
      #38651#23376#29986#21697
      #34915#26381
      #36774#20844#29992#21697)
    TabOrder = 8
  end
  object dbcbbunit: TDBComboBox
    Left = 90
    Top = 56
    Width = 145
    Height = 21
    DataField = 'unit'
    DataSource = Form1.MSDataSource2
    ImeName = #20013#25991' (?'#20307') - '#25628#29399#25340#38899'?'#20837#27861
    ItemHeight = 13
    Items.Strings = (
      #33274
      #24373
      #20214
      #26412
      #20491)
    TabOrder = 9
  end
end
