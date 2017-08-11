unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MSAccess, StdCtrls, Mask, DBCtrls, Buttons,
  ExtCtrls, ComCtrls;

type
  TForm3 = class(TForm)
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbedtdate: TDBEdit;
    dbedtamount: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dbcbbprovider: TDBComboBox;
    Query1: TMSQuery;
    MSDataSource1: TMSDataSource;
    dbcbbwarehouse: TDBComboBox;
    dbcbbstaff: TDBComboBox;
    dtp1: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbcbbwarehouseChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedtdateExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  flag: Integer;
  f:Boolean;

implementation

uses Unit1,Unit2;
{$R *.dfm}



procedure TForm3.BitBtn1Click(Sender: TObject);
begin

  dbedtdate.Text:= DateTimeToStr(dtp1.Date);
  if ((flag>=5) and f) then
  begin
   Form1.TQuery1.Post;
   Form3.Close;
  end
  else
    ShowMessage('�п�J����H��!!!');

end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   flag:=1;
   Form1.TQuery1.Cancel;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  flag:=1;
  MSDataSource1.DataSet.First;
  while not MSDataSource1.DataSet.Eof do
  begin
    dbcbbprovider.Items.Add(MSDataSource1.DataSet.FieldByName('name').AsString);
    MSDataSource1.DataSet.Next;
  end;

  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('select * from warehouses');
  Query1.Prepare;
  Query1.Open;

  MSDataSource1.DataSet.First;
  while not MSDataSource1.DataSet.Eof do
  begin
    dbcbbwarehouse.Items.Add(MSDataSource1.DataSet.FieldByName('name').AsString);
    MSDataSource1.DataSet.Next;
  end;

end;

procedure TForm3.dbcbbwarehouseChange(Sender: TObject);
begin
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.Add('select * from staffs ');
  Query1.SQL.Add('where warehouse = ''' + dbcbbwarehouse.Text + '''');
  Query1.Prepare;
  Query1.Open;

  dbcbbstaff.Items.Clear;
  MSDataSource1.DataSet.First;
  while not MSDataSource1.DataSet.Eof do
  begin
    dbcbbstaff.Items.Add(MSDataSource1.DataSet.FieldByName('name').AsString);
    MSDataSource1.DataSet.Next;
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
   dbcbbwarehouseChange(dbcbbstaff);
   if(dbedtdate.Text<>'') then
   dtp1.Date:=StrToDateTime(dbedtdate.Text);
end;

procedure TForm3.dbedtdateExit(Sender: TObject);
var Name:string;
    Value:String;
begin
  if (Sender is TDBEdit) then
  begin
     Name:=(Sender as TDBEdit).HelpKeyword;
     Value:= (Sender as TDBEdit).Text;
  end
  else if (Sender is TDBComboBox) then
  begin
     Name:=(Sender as TDBComboBox).HelpKeyword;
     Value:= (Sender as TDBComboBox).Text;
  end;

  if(Value='') then
  begin
    ShowMessage(Name + '���ର��');
    f:=False;
  end
  else
  begin
    flag:=flag+1;
    f:=True;
  end;

end;

end.
