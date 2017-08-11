unit Unit1;

 interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, MemDS, DBAccess, MSAccess, ExtCtrls,
  DBCtrls, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    MSDataSource1: TMSDataSource;
    TQuery1: TMSQuery;
    TDBGrid2: TDBGrid;
    MSDataSource2: TMSDataSource;
    TQuery2: TMSQuery;
    TDBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    dbnvgr1: TDBNavigator;
    dbnvgr2: TDBNavigator;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    gdfldTQuery1oddNum: TGuidField;
    strngfldTQuery1provider: TStringField;
    strngfldTQuery1warehouse: TStringField;
    dtmfldTQuery1date: TDateTimeField;
    crncyfldTQuery1amount: TCurrencyField;
    strngfldTQuery1staff: TStringField;
    gdfldTQuery2productNum: TGuidField;
    gdfldTQuery2oddNum: TGuidField;
    strngfldTQuery2providerName: TStringField;
    strngfldTQuery2kind: TStringField;
    strngfldTQuery2unit: TStringField;
    strngfldTQuery2specifications: TStringField;
    crncyfldTQuery2price: TCurrencyField;
    intgrfldTQuery2number: TIntegerField;
    strngfldTQuery2remark: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TQuery1AfterInsert(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure TDBGrid1Enter(Sender: TObject);
    procedure TDBGrid2CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  RecNo1,RecNo2: Integer;
  SelectGrid: string;
  MyDBGrid : TDBGrid;
implementation

uses Unit2,Unit3,Unit4,Unit5;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Unit2.DataModule2.con1.Connected:=True;
  Label1.Width:=89;
  Label2.Width:=89;
  TQuery1.Active:=True;
  TQuery2.Active:=True;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Unit2.DataModule2.con1.Connected:=False;
end;

// 修改刷新后並且回到修改行
procedure TForm1.TQuery1AfterInsert(DataSet: TDataSet);
begin

  if (DataSet.Name='TQuery1') then
  begin
     RecNo1 := DataSet.RecNo;
     RecNo2 := TDBGrid1.DataSource.DataSet.RecNo;
     TQuery1.Refresh();
  end else if (DataSet.Name='TQuery2') then
  begin
     RecNo1 := TDBGrid1.DataSource.DataSet.RecNo;
     RecNo2 := DataSet.RecNo;
     TQuery2.Refresh();
  end;
   TDBGrid1.DataSource.DataSet.RecNo:=RecNo1;
   TDBGrid2.DataSource.DataSet.RecNo:=RecNo2;
end;


procedure TForm1.N1Click(Sender: TObject);
begin
  MyDBGrid.DataSource.DataSet.Insert;
  if(MyDBGrid.Name='TDBGrid1') then
    Unit3.Form3.Show
  else
    Unit4.Form4.ShowFrom(TDBGrid1.Fields[0].AsString);
end;

procedure TForm1.N4Click(Sender: TObject);
begin
   Unit5.Form5.ShowForm(MyDBGrid.DataSource.DataSet);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  if MessageDlg('確認刪除?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if(MyDBGrid.Name='TDBGrid1') then
       TQuery1.Delete()
    else
       TQuery2.Delete()
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  MyDBGrid.DataSource.DataSet.Edit;
  if(MyDBGrid.Name='TDBGrid1') then
  begin
     Unit3.flag:=5;
     Unit3.f:=true;
     Unit3.Form3.ShowModal;
  end
  else
  begin
     Unit4.flag:=3;
     Unit4.f:=true;
     Unit4.Form4.ShowFrom(TDBGrid1.Fields[0].AsString);
  end;
end;

procedure TForm1.TDBGrid1Enter(Sender: TObject);
begin
  MyDBGrid:=(Sender as TDBGrid);
  TQuery2.Close;
  TQuery2.SQL.Clear;
  TQuery2.SQL.Add('select * from godownDetail where oddNum=:oddNum');
  TQuery2.Prepare;
  TQuery2.Open;
end;

//定位表一某條數據
procedure TForm1.TDBGrid2CellClick(Column: TColumn);
var i:Integer;
begin
  TQuery1.locate('oddNum',TDBGrid2.Fields[8].Value,[])
end;

end.
