unit anasayfa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TgirisSayfa = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Profil1: TMenuItem;
    KrediKart1: TMenuItem;
    Kiralama1: TMenuItem;
    KKEkle1: TMenuItem;
    KrediKartEkle1: TMenuItem;
    ifreDeiiklii1: TMenuItem;
    k1: TMenuItem;
    Kiralamalarm1: TMenuItem;
    ScooterKirala1: TMenuItem;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    ADOQuery2: TADOQuery;
    ADOQuery2scooter_marka: TWideStringField;
    ADOQuery2scooter_model: TWideStringField;
    ADOQuery2teslim_tarihi: TDateTimeField;
    ADOQuery2kira_ucret: TIntegerField;
    DataSource2: TDataSource;
    Label1: TLabel;
    ADOQuery2kiralama_tarihi: TDateTimeField;
    Label3: TLabel;
    ADOQuery1: TADOQuery;
    ADOQuery1toplam_kiralama: TIntegerField;
    ADOQuery1toplam_ucret: TFloatField;
    Image2: TImage;
    Bakiyeykle1: TMenuItem;
    Label4: TLabel;
    ADOQuery3: TADOQuery;
    ADOQuery3kullanici_bakiye: TWideStringField;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Profil1Click(Sender: TObject);
    procedure k1Click(Sender: TObject);
    procedure ifreDeiiklii1Click(Sender: TObject);
    procedure KKEkle1Click(Sender: TObject);
    procedure KrediKartEkle1Click(Sender: TObject);
    procedure KrediKartlarDzenle1Click(Sender: TObject);
    procedure ScooterKirala1Click(Sender: TObject);
    procedure Kiralamalarm1Click(Sender: TObject);
    procedure Bakiyeykle1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  girisSayfa: TgirisSayfa;

implementation

{$R *.dfm}

uses hesap, kulGiris, kulSifreDegis, krediKartlari, kkEkle ,kkDuzenle,ShellApi,kiralama,
  gizliForm, suruslerim, bakiyeForm;

procedure TgirisSayfa.Bakiyeykle1Click(Sender: TObject);
begin

  if bakiye.ComboBox1.Items[0] = '' then
  begin
     with bakiye.ADOQuery2 do
  begin
  bakiye.ADOQuery2.Close;
  bakiye.ADOQuery2.SQL.clear;
  bakiye.ADOQuery2.SQL.add('select * from kredi_karti where kartim_id=' + gizli.kredi_kart.Text + '');
  bakiye.ADOQuery2.active:=true;
  bakiye.ADOQuery2.first;
  while not eof do
  begin
  bakiye.combobox1.items.add(FieldByName('kk_isim').AsString);
  next;
  end;
  end;

  end
  else
  begin

  end;

   bakiye.Show;
end;

procedure TgirisSayfa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;



procedure TgirisSayfa.ifreDeiiklii1Click(Sender: TObject);
begin
  kulSifre.Show;
  kulSifre.ADOQuery1.Close;
  kulSifre.ADOQuery1.SQL.Clear;
  kulSifre.ADOQuery1.SQL.Add(' Select * from kullanici where kullanici_id =' +
    gizli.kullanici_id.Text + '');
  kulSifre.ADOQuery1.Open;
end;

procedure TgirisSayfa.k1Click(Sender: TObject);
begin
  ShellExecute (0, nil, Pchar (ParamStr (0)), nil, nil, sw_shownormal);
  Application.Mainform.Close;

end;


procedure TgirisSayfa.Kiralamalarm1Click(Sender: TObject);
begin

  suruslerimForm.ADOQuery1.Close;
  suruslerimForm.ADOQuery1.SQL.Clear;
  suruslerimForm.ADOQuery1.SQL.Add('SELECT * FROM scooter INNER JOIN kiralama ON scooter.scooter_id=kiralama.scooter_id where kiralama.kullanici_id=' + gizli.kullanici_id.Text + ' and kiralama.teslim_durumu="0" order by teslim_tarihi desc ');
  suruslerimForm.ADOQuery1.Open;
  suruslerimForm.Show;

end;

procedure TgirisSayfa.KKEkle1Click(Sender: TObject);
begin

  krediKart.ADOQuery1.Close;
  krediKart.ADOQuery1.SQL.Clear;
  krediKart.ADOQuery1.SQL.Add
    (' select * from kredi_karti where kartim_id =' +
    gizli.kredi_kart.Text + '');
  krediKart.ADOQuery1.Open;
  krediKart.Show;
end;

procedure TgirisSayfa.KrediKartEkle1Click(Sender: TObject);
begin
  kkEkleForm.Show;
end;

procedure TgirisSayfa.KrediKartlarDzenle1Click(Sender: TObject);
begin
  kDuzenleForm.ADOQuery1.Close;
  kDuzenleForm.ADOQuery1.SQL.Clear;
  kDuzenleForm.ADOQuery1.SQL.Add(' select * from kredi_karti where kartim_id =' +
    gizli.kredi_kart.Text + '');
  kDuzenleForm.ADOQuery1.Open;

  kDuzenleForm.Show;
end;




procedure TgirisSayfa.Profil1Click(Sender: TObject);
begin
  hesapForm.Show;
  hesapForm.ADOQuery1.Close;
  hesapForm.ADOQuery1.SQL.Clear;
  hesapForm.ADOQuery1.SQL.Add(' Select * from kullanici where kullanici_id=' +
  gizli.kullanici_id.Text + '');
  hesapForm.ADOQuery1.Open;
end;

procedure TgirisSayfa.ScooterKirala1Click(Sender: TObject);
begin

  kiralamaForm.ADOQuery1.Close;
  kiralamaForm.ADOQuery1.SQL.Clear;
  kiralamaForm.ADOQuery1.SQL.Add(' select * from scooter where scooter_durum="0"  order by scooter_gunluk_ucret asc ');
  kiralamaForm.ADOQuery1.Open;
  kiralamaForm.Show;
end;

end.
