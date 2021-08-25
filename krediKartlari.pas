unit krediKartlari;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TkrediKart = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  krediKart: TkrediKart;

implementation

{$R *.dfm}

uses kulGiris;
procedure TkrediKart.Button1Click(Sender: TObject);
begin
  ADOQuery1.Delete;
  ShowMessage('Kayýt Silindi.');
end;



end.
