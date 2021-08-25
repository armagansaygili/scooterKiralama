unit perHesapForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TperHesap = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image2: TImage;
    Button1: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
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
    ADOQuery2personel_id: TAutoIncField;
    ADOQuery2username: TWideStringField;
    ADOQuery2password: TWideStringField;
    ADOQuery2personel_ad: TWideStringField;
    ADOQuery2personel_sad: TWideStringField;
    ADOQuery2personel_tel: TWideStringField;
    ADOQuery2personel_mail: TWideStringField;
    ADOQuery2personel_btarihi: TDateTimeField;
    ADOQuery2personel_maas: TWideStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  perHesap: TperHesap;

implementation

{$R *.dfm}

uses kulGiris;

procedure TperHesap.Button1Click(Sender: TObject);
begin
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('UPDATE bakim_personel SET username =' + '"' +
    ADOQuery1username.AsString + '"' + ', personel_ad =' + '"' +
    ADOQuery1personel_ad.AsString + '"' + ', personel_sad =' + '"' +
    ADOQuery1personel_sad.AsString + '"' + ', personel_tel =' + '"' +
    ADOQuery1personel_tel.AsString + '"' + ', personel_mail =' + '"' +
    ADOQuery1personel_mail.AsString + '"' + ' WHERE personel_id =' +
    ADOQuery1personel_id.AsString + '');
  ADOQuery2.ExecSQL;

  ShowMessage('Kayýt Güncellendi.');
end;

end.
