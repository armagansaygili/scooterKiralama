unit kulSifreDegis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TkulSifre = class(TForm)
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label4: TLabel;
    ADOQuery2: TADOQuery;
    ADOQuery1password: TWideStringField;
    ADOQuery1kullanici_id: TAutoIncField;
    ADOQuery1username: TWideStringField;
    ADOQuery1kullanici_tc: TWideStringField;
    ADOQuery1kullanici_ad: TWideStringField;
    ADOQuery1kullanici_sad: TWideStringField;
    ADOQuery1kullanici_tel: TWideStringField;
    ADOQuery1kullanici_mail: TWideStringField;
    ADOQuery1kullanici_bakiye: TWideStringField;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kulSifre: TkulSifre;

implementation

{$R *.dfm}

uses kulGiris;
procedure TkulSifre.Button1Click(Sender: TObject);
begin
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('Select * from kullanici WHERE `password`=' + '"' +
    Edit1.Text + '"' + ' AND `kullanici_id` =' +
    ADOQuery1kullanici_id.AsString + '');
  ADOQuery2.Open;
  if ADOQuery2.RecordCount > 0 then
  begin

    if Edit3.Text = Edit2.Text then
    begin
      ADOQuery2.Close;
      ADOQuery2.SQL.Clear;
      ADOQuery2.SQL.Add(' UPDATE kullanici SET `password`=' + '"' + Edit2.Text +
        '"' + ' WHERE kullanici_id =' + ADOQuery1kullanici_id.AsString + '');
      ADOQuery2.ExecSQL;
      ShowMessage('Kullanýcý þifresi deðiþti.');

    end
    else
      ShowMessage('Þifreler eþleþmiyor!');

  end
  else
    ShowMessage('Þifre Yanlýþ!');

end;


end.
