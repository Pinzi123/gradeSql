unit Unit2;

interface

uses
  SysUtils, Classes, DB, DBAccess, MSAccess, DASQLMonitor, MSSQLMonitor;

type
  TDataModule2 = class(TDataModule)
    con1: TMSConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

end.
