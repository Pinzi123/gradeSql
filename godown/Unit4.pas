unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, DBAccess, MSAccess, MemDS, Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbedtproviderName: TDBEdit;
    dbedtnumber: TDBEdit;
    dbedtspecifications1: TDBEdit;                 
    dbedtprice: TDBEdit;
    dbedtremark: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dbedtoddNum: TDBEdit;
    dbcbbkind: TDBComboBox;
    dbcbbunit: TDBComboBox;
    procedure ShowFrom(odd:string);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  flag: Integer;
  f:Boolean;

implementation
uses Unit1;
{$R *.dfm}

{ TForm4 }

procedure TForm4.ShowFrom(odd: string);
begin
  dbedtoddNum.Text:=odd;
  Form4.Show;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
  if ((flag>=3) and f) then
  begin
     Form1.TQuery2.Post;
     Form4.Close;
  end
  else
    ShowMessage('請輸入完整信息!!!');
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  Form4.Close;
end;


procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  flag:=0;
  Form1.TQuery2.Cancel;
end;

procedure TForm4.editExit(Sender: TObject);
var Name:string;
    Value:String;
begin
  if (Sender is TDBEdit) then
  begin
     Name:=(Sender as TDBEdit).HelpKeyword;
     Value:= (Sender as TDBEdit).Text;
  end;

  if(Value='') then
  begin
    ShowMessage(Name + '不能為空');
    f:=False;
  end
  else
  begin
    flag:=flag+1;
    f:=True;
  end;

end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  flag:=0;
end;

end.
