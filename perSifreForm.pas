unit perSifreForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TperSifre = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery1personel_id: TAutoIncField;
    ADOQuery1username: TWideStringField;
    ADOQuery1password: TWideStringField;
    ADOQuery1personel_ad: TWideStringField;
    ADOQuery1personel_sad: TWideStringField;
    ADOQuery1personel_tel: TWideStringField;
    ADOQuery1personel_mail: TWideStringField;
    ADOQuery1personel_btarihi: TDateTimeField;
    ADOQuery1personel_maas: TWideStringField;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  perSifre: TperSifre;

implementation

{$R *.dfm}

uses kulGiris;
procedure TperSifre.Button1Click(Sender: TObject);
begin
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('Select * from bakim_personel WHERE `password`=' + '"' +
    Edit1.Text + '"' + ' AND `personel_id` =' +
    ADOQuery1personel_id.AsString + '');
  ADOQuery2.Open;
  if ADOQuery2.RecordCount > 0 then
  begin

    if Edit3.Text = Edit2.Text then
    begin
      ADOQuery2.Close;
      ADOQuery2.SQL.Clear;
      ADOQuery2.SQL.Add(' UPDATE bakim_personel SET `password`=' + '"' + Edit2.Text +
        '"' + ' WHERE personel_id =' + ADOQuery1personel_id.AsString + '');
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
