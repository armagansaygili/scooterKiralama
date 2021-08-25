unit perAnasayfa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.Menus, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Samples.Calendar, Vcl.OleCtrls, SHDocVw, Vcl.WinXPanels, Vcl.ComCtrls,
  Vcl.DBCtrls;

type
  TperAnaForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Profil1: TMenuItem;
    ifreDeiiklii1: TMenuItem;
    k1: TMenuItem;
    PersonelEkle1: TMenuItem;
    Bakm1: TMenuItem;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Image2: TImage;
    DBGrid2: TDBGrid;
    ADOQuery2: TADOQuery;
    ADOQuery1scooter_id: TAutoIncField;
    ADOQuery1scooter_marka: TWideStringField;
    ADOQuery1scooter_model: TWideStringField;
    ADOQuery1enyuksek_hiz: TWideStringField;
    ADOQuery1gidebildigi_mesafe: TWideStringField;
    ADOQuery1scooter_gunluk_ucret: TIntegerField;
    ADOQuery1scooter_durum: TWideStringField;
    DataSource2: TDataSource;
    CardPanel2: TCardPanel;
    CardPanel1: TCardPanel;
    DataSource3: TDataSource;
    ADOQuery3: TADOQuery;
    DataSource4: TDataSource;
    ADOQuery4: TADOQuery;
    ADOQuery4scooter_id: TIntegerField;
    ADOQuery4Saykiralama_no: TIntegerField;
    ADOQuery4scooter_marka: TWideStringField;
    ADOQuery4scooter_model: TWideStringField;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    DBGrid4: TDBGrid;
    ADOQuery5: TADOQuery;
    ADOQuery6: TADOQuery;
    ADOQuery5ucret: TFloatField;
    ADOQuery6ucret: TFloatField;
    Label7: TLabel;
    ADOQuery7: TADOQuery;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    ADOQuery7ucret: TFloatField;
    DBGrid3: TDBGrid;
    Label12: TLabel;
    Card1: TCard;
    Label1: TLabel;
    Label3: TLabel;
    ADOQuery8: TADOQuery;
    ADOQuery8ucret: TFloatField;
    Label2: TLabel;
    Label13: TLabel;
    Panel2: TPanel;
    DBRichEdit1: TDBRichEdit;
    Label14: TLabel;
    BisikletListesi1: TMenuItem;
    procedure Profil1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ifreDeiiklii1Click(Sender: TObject);
    procedure k1Click(Sender: TObject);
    procedure PersonelEkle1Click(Sender: TObject);
    procedure Bakm1Click(Sender: TObject);
    procedure BisikletListesi1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  perAnaForm: TperAnaForm;

implementation

{$R *.dfm}


uses perHesapForm,gizliForm,perSifreForm,ShellApi, perScooterListForm,perEkleForm,bakimForm,kulGiris;
var tarih,bugun:String;

procedure TperAnaForm.Bakm1Click(Sender: TObject);
begin
  bakim.Show;
end;

procedure TperAnaForm.BisikletListesi1Click(Sender: TObject);
begin
  perScooterList.Show;
end;


procedure TperAnaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;


procedure TperAnaForm.ifreDeiiklii1Click(Sender: TObject);
begin
  perSifre.ADOQuery1.Close;
  perSifre.ADOQuery1.SQL.Clear;
  perSifre.ADOQuery1.SQL.Add(' Select * from bakim_personel where personel_id =' +
    gizli.kullanici_id.Text + '');
  perSifre.ADOQuery1.Open;
  perSifre.Show;
end;

procedure TperAnaForm.k1Click(Sender: TObject);
begin
  ShellExecute (0, nil, Pchar (ParamStr (0)), nil, nil, sw_shownormal);
  Application.Mainform.Close;
end;

procedure TperAnaForm.PersonelEkle1Click(Sender: TObject);
begin
perEkle.Show;
end;

procedure TperAnaForm.Profil1Click(Sender: TObject);
begin
  perHesap.Show;
  perHesap.ADOQuery1.Close;
  perHesap.ADOQuery1.SQL.Clear;
  perHesap.ADOQuery1.SQL.Add(' Select * from bakim_personel where personel_id=' +
  gizli.kullanici_id.Text + '');
  perHesap.ADOQuery1.Open;
end;
end.
