unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,DB, Grids, Menus;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    cbb1: TComboBox;
    Label2: TLabel;
    edt1: TEdit;
    Label3: TLabel;
    cbb2: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    cbb3: TComboBox;
    edt2: TEdit;
    Label6: TLabel;
    cbb4: TComboBox;
    procedure ShowForm(MyDataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  DataName: string;
  labelTop:Integer;

implementation
uses Unit1;
{$R *.dfm}

procedure TForm5.ShowForm(MyDataSet: TDataSet);
var J:Integer;
    feildName:string;
begin
  labelTop:=0;
  cbb1.Text:='--請選擇';
  cbb3.Text:='--請選擇';
  edt1.Text:='';
  cbb1.Items.Clear;
  DataName:=MyDataSet.Name;
  with   MyDataSet do
  For   J:=0   to  FieldCount-1   do
        begin
          feildName:= FieldList[j].DisplayLabel;
          cbb1.Items.AddObject(feildName,TObject(NewStr(FieldList[j].FieldName)));
        end;
  cbb3.Items:=cbb1.Items;
  Form5.ShowModal();
end;

procedure TForm5.Button1Click(Sender: TObject);
var sele:string;
    cond:string;
begin
   if(cbb1.Text<>'--請選擇') then
   begin
      cond:=PString(cbb1.Items.Objects[cbb1.ItemIndex])^;
      if (cbb2.Text = '%') then
       sele:='where ' + cond +' like ''%' + edt1.Text + '%'''
      else
       sele:='where ' + cond + cbb2.Text + ' ''' +  edt1.Text + '''';
   end;

   if(cbb3.Text<>'--請選擇') then
   begin
      cond:=PString(cbb3.Items.Objects[cbb3.ItemIndex])^;
      if(cbb1.Text<>'--請選擇') then
        sele:=sele + ' and '
      else
        sele:=' where ';
      if (cbb4.Text = '%') then
       sele:=sele + cond +' like ''%' + edt2.Text + '%'''
      else
       sele:=sele + cond + cbb4.Text + ' ''' +  edt2.Text + '''';
   end;

   if (DataName='TQuery1') then
   begin
       Unit1.Form1.TQuery1.Close;
       Unit1.Form1.TQuery1.SQL.Clear;
       Unit1.Form1.TQuery1.SQL.Add('select * from godown ');
       Unit1.Form1.TQuery1.SQL.Add(sele);
       Unit1.Form1.TQuery1.Prepare;
       Unit1.Form1.TQuery1.Open;
   end
   else
   begin
       Unit1.Form1.TQuery2.Close;
       Unit1.Form1.TQuery2.SQL.Clear;
       Unit1.Form1.TQuery2.SQL.Add('select * from godownDetail ');
       Unit1.Form1.TQuery2.SQL.Add(sele);
       Unit1.Form1.TQuery2.Prepare;
       Unit1.Form1.TQuery2.Open;
   end;

//   ShowMessage(sele);

end;


end.
