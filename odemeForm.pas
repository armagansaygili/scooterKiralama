unit odemeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, frxClass, frxDBSet;

type
  Todeme = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image2: TImage;
    ADOQuery1: TADOQuery;
    ADOQuery1kullanici_bakiye: TWideStringField;
    ADOQuery1kullanici_id: TAutoIncField;
    ADOQuery1username: TWideStringField;
    ADOQuery1password: TWideStringField;
    ADOQuery1kullanici_tc: TWideStringField;
    ADOQuery1kullanici_ad: TWideStringField;
    ADOQuery1kullanici_sad: TWideStringField;
    ADOQuery1kullanici_tel: TWideStringField;
    ADOQuery1kullanici_mail: TWideStringField;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    ADOQuery2: TADOQuery;
    ADOQuery2kullanici_bakiye: TWideStringField;
    ADOQuery3: TADOQuery;
    frxDBDataset2: TfrxDBDataset;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    kullanici_bakiye,kalan:string;
  end;

var
  odeme: Todeme;

implementation

{$R *.dfm}

uses suruslerim,anasayfa,gizliForm;



procedure Todeme.Button1Click(Sender: TObject);
begin

  ADOQuery1.Close;
  ADOQuery1.SQL.clear;
  ADOQuery1.SQL.add(' select * from kullanici where kullanici_id=' + gizli.kullanici_id.Text + '');
  ADOQuery1.Open;

  kullanici_bakiye := (ADOQuery1kullanici_bakiye.AsString);

  if suruslerimForm.toplam_borc > StrToInt(kullanici_bakiye) then
  begin
    ShowMessage('Bakiyeniz Yetersiz. Lütfen Yükleme Yapınız!');
  end
  else
  begin

  kalan := (StrToInt(kullanici_bakiye) - suruslerimForm.toplam_borc).ToString;

  suruslerimForm.ADOQuery3.Close;
  suruslerimForm.ADOQuery3.SQL.Clear;
  //suruslerimForm.ADOQuery3.SQL.Add('UPDATE kiralama SET kira_ucret="'+ suruslerimForm.toplam_borc.ToString +'",`teslim_tarihi`="' + DateToStr(Now()) +'",`teslim_durumu`="1" WHERE scooter_id=' + suruslerimForm.scooter_id.ToString + ';');
  suruslerimForm.ADOQuery3.SQL.Add('UPDATE kiralama SET kira_ucret="'+ suruslerimForm.toplam_borc.ToString +'",`teslim_tarihi`="24.05.2021",`teslim_durumu`="1" WHERE scooter_id=' + suruslerimForm.scooter_id.ToString + ';');

  suruslerimForm.ADOQuery3.ExecSQL;
  suruslerimForm.ADOQuery3.SQL.Clear;
  suruslerimForm.ADOQuery3.SQL.Add('UPDATE scooter SET `scooter_durum`="0" WHERE scooter_id=' + suruslerimForm.scooter_id.ToString + ';');
  suruslerimForm.ADOQuery3.ExecSQL;


  suruslerimForm.ADOQuery1.Close;
  suruslerimForm.ADOQuery1.SQL.Clear;
  suruslerimForm.ADOQuery1.SQL.Add(' SELECT * FROM scooter INNER JOIN kiralama ON scooter.scooter_id=kiralama.scooter_id where kiralama.kullanici_id='
  + gizli.kullanici_id.Text + ' and kiralama.teslim_durumu="0"');
  suruslerimForm.ADOQuery1.Open;
  suruslerimForm.ADOQuery1.Active := True;

  girisSayfa.ADOQuery2.Close;
  girisSayfa.ADOQuery2.SQL.Clear;
  girisSayfa.ADOQuery2.SQL.Add(' SELECT * FROM scooter INNER JOIN kiralama ON scooter.scooter_id=kiralama.scooter_id where kiralama.kullanici_id=' + gizli.kullanici_id.Text + ' and kiralama.teslim_durumu="1" order by teslim_tarihi desc ');
  girisSayfa.ADOQuery2.Open;
  girisSayfa.ADOQuery2.Active := True;

  ADOQuery1.Close;
  ADOQuery1.SQL.clear;
  ADOQuery1.SQL.add(' Update kullanici set `kullanici_bakiye`="'+ kalan + '" where kullanici_id=' + gizli.kullanici_id.Text + '');
  ADOQuery1.ExecSQL;

  ShowMessage('Ödeme İşleminiz gerçekleşti.');

  ADOQuery2.Close;
  ADOQuery2.SQL.clear;
  ADOQuery2.SQL.add(' SELECT kullanici_bakiye from kullanici where kullanici_id=' + gizli.kullanici_id.Text + '');
  ADOQuery2.Open;

  girissayfa.ADOQuery1.Close;
  girissayfa.ADOQuery1.SQL.Clear;
  girissayfa.ADOQuery1.SQL.Add('SELECT count(kira_ucret) as toplam_kiralama, sum(kira_ucret) as toplam_ucret from kiralama where kiralama.kullanici_id=' + gizli.kullanici_id.Text + ' and kiralama.teslim_durumu="1"');
  girissayfa.ADOQuery1.Open;

  girisSayfa.Label5.Caption := girisSayfa.ADOQuery1toplam_ucret.AsString + '₺';
  girisSayfa.Label6.Caption := girisSayfa.ADOQuery1toplam_kiralama.AsString;
  girisSayfa.Label7.Caption := ADOQuery2kullanici_bakiye.AsString + '₺';

  end;

end;

procedure Todeme.Button2Click(Sender: TObject);
begin

  ADOQuery1.Close;
  ADOQuery1.SQL.clear;
  ADOQuery1.SQL.add(' SELECT * FROM kullanici where kullanici_id=' + gizli.kullanici_id.Text + '');
  ADOQuery1.Open;

  ADOQuery3.Close;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Add('SELECT * FROM scooter INNER JOIN kiralama ON scooter.scooter_id=kiralama.scooter_id where kiralama.kullanici_id=' + gizli.kullanici_id.Text + ' and kiralama.kiralama_no=' + suruslerimForm.kiralama_id.ToString + '');
  ADOQuery3.Open;
  ADOQuery3.Active := True;

  frxReport1.ShowReport();
end;


end.
