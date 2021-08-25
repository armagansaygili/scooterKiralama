unit bakimForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  Tbakim = class(TForm)
    RichEdit1: TRichEdit;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image2: TImage;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label4: TLabel;
    ADOQuery2: TADOQuery;
    ADOQuery1scooter_id: TAutoIncField;
    ADOQuery1scooter_marka: TWideStringField;
    ADOQuery1scooter_model: TWideStringField;
    ADOQuery1enyuksek_hiz: TWideStringField;
    ADOQuery1gidebildigi_mesafe: TWideStringField;
    ADOQuery1scooter_gunluk_ucret: TIntegerField;
    ADOQuery1scooter_durum: TWideStringField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var scooter_id,personel_id,yapilan_bakim,bakim_maliyeti:string;
  var bakim_tarih:TDate;
  end;

var
  bakim: Tbakim;

implementation

{$R *.dfm}

uses gizliForm;

procedure Tbakim.Button1Click(Sender: TObject);
begin
scooter_id := ADOQuery1scooter_id.AsString;
personel_id := gizli.kullanici_id.Text;
bakim_tarih := Now();
yapilan_bakim := RichEdit1.Text;
bakim_maliyeti := Edit1.Text;

ADOQuery2.Close;
ADOQuery2.SQL.Clear;
ADOQuery2.SQL.Add('INSERT INTO scooter_bakim (`scooter_id`,`personel_id`,`bakim_tarih`,`yapilan_bakim`,`bakim_maliyeti`) VALUES("' +
scooter_id + '","' + personel_id + '","' + DateToStr(bakim_tarih) + '","' + yapilan_bakim + '","' +
bakim_maliyeti + '")');
ADOQuery2.ExecSQL;

end;

end.
