unit kulGiris;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, frxClass;

type
  TkGirisi = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Button3: TButton;
    ADOQuery2: TADOQuery;
    ADOQuery2kartim_id: TAutoIncField;
    ADOQuery2username: TWideStringField;
    ADOQuery1username: TWideStringField;
    ADOQuery1password: TWideStringField;
    ADOQuery1kullanici_tc: TWideStringField;
    ADOQuery1kullanici_ad: TWideStringField;
    ADOQuery1kullanici_sad: TWideStringField;
    ADOQuery1kullanici_tel: TWideStringField;
    ADOQuery1kullanici_mail: TWideStringField;
    ADOQuery1kullanici_bakiye: TWideStringField;
    ADOQuery1kullanici_id: TAutoIncField;
    ADOQuery3: TADOQuery;
    Image1: TImage;
    RadioButton2: TRadioButton;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    ADOQuery3personel_id: TAutoIncField;
    ADOQuery3username: TWideStringField;
    ADOQuery3password: TWideStringField;
    ADOQuery3personel_ad: TWideStringField;
    ADOQuery3personel_sad: TWideStringField;
    ADOQuery3personel_tel: TWideStringField;
    ADOQuery3personel_mail: TWideStringField;
    ADOQuery3personel_btarihi: TDateTimeField;
    ADOQuery3personel_maas: TWideStringField;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    var haftalik1,haftalik2,haftalikUcret:string;
  end;

var
  kGirisi: TkGirisi;

implementation

{$R *.dfm}

uses gizliForm,uyeOl, anasayfa, perAnasayfa, kulSifreDegis,krediKartlari;

procedure TkGirisi.Button1Click(Sender: TObject);
var kullanici_id:string;
begin

  if RadioButton2.Checked then
  begin
    with ADOQuery1 do
    begin
      ADOQuery1.Close;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('SELECT * from kullanici where username =' + '"' +
        Edit1.Text + '"' + ' and password =' + '"' + Edit2.Text + '"');
      ADOQuery1.Open;
      kullanici_id := ADOQuery1kullanici_id.AsString;


    if ADOQuery1.RecordCount > 0 then
    begin

      ADOQuery2.Close;
      ADOQuery2.SQL.Clear;
      ADOQuery2.SQL.Add('SELECT * from kredi_kartim where username =' + '"' +
        Edit1.Text + '"');
      ADOQuery2.Open;

      girissayfa.ADOQuery2.Close;
      girissayfa.ADOQuery2.SQL.Clear;
      girissayfa.ADOQuery2.SQL.Add(' SELECT * FROM scooter INNER JOIN kiralama ON scooter.scooter_id=kiralama.scooter_id where kiralama.kullanici_id=' + kullanici_id + ' and kiralama.teslim_durumu="1" order by teslim_tarihi desc ');
      girissayfa.ADOQuery2.Open;

      girissayfa.ADOQuery1.Close;
      girissayfa.ADOQuery1.SQL.Clear;
      girissayfa.ADOQuery1.SQL.Add('SELECT count(kira_ucret) as toplam_kiralama, sum(kira_ucret) as toplam_ucret from kiralama where kiralama.kullanici_id=' + kullanici_id + ' and kiralama.teslim_durumu="1"');
      girissayfa.ADOQuery1.Open;

      girissayfa.ADOQuery3.Close;
      girissayfa.ADOQuery3.SQL.Clear;
      girissayfa.ADOQuery3.SQL.Add(' SELECT kullanici_bakiye FROM kullanici where kullanici_id=' + kullanici_id + '');
      girissayfa.ADOQuery3.Open;

      girisSayfa.Label7.Caption := girisSayfa.ADOQuery3kullanici_bakiye.AsString + '₺';
      girisSayfa.Label5.Caption := girisSayfa.ADOQuery1toplam_ucret.AsString + '₺';
      girisSayfa.Label6.Caption := girisSayfa.ADOQuery1toplam_kiralama.AsString;
      girisSayfa.Show;
      gizli.kullanici_id.Text := ADOQuery1kullanici_id.AsString;
      gizli.kredi_kart.Text := ADOQuery2kartim_id.AsString;
      kGirisi.Hide;
    end
    else
    begin
      ShowMessage('Bilgilerinizi kontrol ediniz!');
    end;
    end;
  end
  else if RadioButton1.Checked then
  begin
    with ADOQuery3 do
    begin
      ADOQuery3.Close;
      ADOQuery3.SQL.Clear;
      ADOQuery3.SQL.Add('SELECT * from bakim_personel where username =' + '"' +
        Edit1.Text + '"' + ' and password =' + '"' + Edit2.Text + '"');
      ADOQuery3.Open;
    end;

    if ADOQuery3.RecordCount > 0 then
    begin
      gizli.kullanici_id.Text := ADOQuery3personel_id.AsString;
      perAnaForm.Show;


      perAnaForm.ADOQuery8.Close;
      perAnaForm.ADOQuery8.SQL.Clear;
      perAnaForm.ADOQuery8.SQL.Add('Select sum(bakim_maliyeti) as ucret from scooter_bakim');
      perAnaForm.ADOQuery8.Open;
      perAnaForm.Label13.Caption := perAnaForm.ADOQuery8ucret.AsString +'₺';

      perAnaForm.ADOQuery2.Close;
      perAnaForm.ADOQuery2.SQL.Clear;
      perAnaForm.ADOQuery2.SQL.Add(' Select * from scooter where scooter_durum="1" ');
      perAnaForm.ADOQuery2.Open;


      perAnaForm.ADOQuery6.Close;
      perAnaForm.ADOQuery6.SQL.Clear;
      perAnaForm.ADOQuery6.SQL.Add('select sum(kira_ucret) as ucret from kiralama where teslim_tarihi between date() and date()-1');
      perAnaForm.ADOQuery6.Open;
      perAnaForm.label7.Caption := perAnaForm.ADOQuery6ucret.AsString + '₺';

      perAnaForm.ADOQuery5.Close;
      perAnaForm.ADOQuery5.SQL.Clear;
      perAnaForm.ADOQuery5.SQL.Add('select sum(kira_ucret) as ucret from kiralama where teslim_tarihi between date() and date()-7');
      perAnaForm.ADOQuery5.Open;
      perAnaForm.label11.Caption := perAnaForm.ADOQuery5ucret.AsString + '₺';

      perAnaForm.ADOQuery7.Close;
      perAnaForm.ADOQuery7.SQL.Clear;
      perAnaForm.ADOQuery7.SQL.Add('select sum(kira_ucret) as ucret from kiralama where teslim_tarihi between date() and date()-30');
      perAnaForm.ADOQuery7.Open;
      perAnaForm.label8.Caption := perAnaForm.ADOQuery7ucret.AsString + '₺';
      kGirisi.Hide;
    end
    else
    begin
      ShowMessage('Bilgilerinizi kontrol ediniz!');
    end;
  end
  else
  begin
    ShowMessage('Kullanıcı türü seçiniz!');
  end;

end;

procedure TkGirisi.Button2Click(Sender: TObject);
begin
  uyelik.Show;
end;

procedure TkGirisi.Button3Click(Sender: TObject);
begin
  Application.Terminate;
end;


procedure TkGirisi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TkGirisi.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
end;


end.
