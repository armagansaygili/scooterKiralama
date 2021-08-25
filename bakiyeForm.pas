unit bakiyeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  Tbakiye = class(TForm)
    Image2: TImage;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery1kullanici_bakiye: TWideStringField;
    ADOQuery2: TADOQuery;
    ADOQuery2kk_id: TAutoIncField;
    ADOQuery2kk_ad_sad: TWideStringField;
    ADOQuery2kk_numara: TWideStringField;
    ADOQuery2kk_cvv: TWideStringField;
    ADOQuery2kk_isim: TWideStringField;
    ADOQuery2kartim_id: TIntegerField;
    ADOQuery2limit: TWideStringField;
    ADOQuery1kullanici_id: TAutoIncField;
    ADOQuery1username: TWideStringField;
    ADOQuery1password: TWideStringField;
    ADOQuery1kullanici_tc: TWideStringField;
    ADOQuery1kullanici_ad: TWideStringField;
    ADOQuery1kullanici_sad: TWideStringField;
    ADOQuery1kullanici_tel: TWideStringField;
    ADOQuery1kullanici_mail: TWideStringField;
    ADOQuery3: TADOQuery;
    AutoIncField1: TAutoIncField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    IntegerField1: TIntegerField;
    WideStringField5: TWideStringField;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  bakiye: Tbakiye;

implementation

{$R *.dfm}

uses gizliForm,anasayfa,kulGiris;

procedure Tbakiye.Button1Click(Sender: TObject);
var kk_ismi,kk_kalan,bakiye,kullanici_bakiye:string;
var yatirilacak,limit:integer;
begin
kk_ismi := ComboBox1.Text;
yatirilacak := StrToInt(Edit1.Text);

  ADOQuery2.Close;
  ADOQuery2.SQL.clear;
  ADOQuery2.SQL.add('select * from kredi_karti where kk_isim="' + ComboBox1.Text + '" and kartim_id=' + gizli.kredi_kart.Text +'');
  ADOQuery2.Open;

limit := StrToInt(ADOQuery2limit.AsString);


if yatirilacak > limit then
begin
  ShowMessage('Limitiniz yetersiz!');
end
else
begin
  //kk_kalan := (StrToInt(limit) - yatirilacak).ToString;

  ADOQuery1.Close;
  ADOQuery1.SQL.clear;
  ADOQuery1.SQL.add(' select * from kullanici where kullanici_id=' + gizli.kullanici_id.Text + '');
  ADOQuery1.Open;

  kullanici_bakiye := (ADOQuery1kullanici_bakiye.AsString);
  bakiye := (StrToInt(kullanici_bakiye) + yatirilacak).ToString;

  ADOQuery1.Close;
  ADOQuery1.SQL.clear;
  ADOQuery1.SQL.add(' Update kullanici set `kullanici_bakiye`="'+ bakiye + '" where kullanici_id=' + gizli.kullanici_id.Text + '');
  ADOQuery1.ExecSQL;

  ADOQuery1.Close;
  ADOQuery1.SQL.clear;
  ADOQuery1.SQL.add(' select * from kullanici where kullanici_id=' + gizli.kullanici_id.Text + '');
  ADOQuery1.Open;
  girisSayfa.Label7.Caption := ADOQuery1kullanici_bakiye.AsString + ' TL';
  ShowMessage('Bakiye Yüklendi');

end;
  Edit1.Text := '';
  ComboBox1.Text := '';




end;




end.
