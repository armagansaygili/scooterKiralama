unit suruslerim;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.DBCGrids,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TsuruslerimForm = class(TForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Button1: TButton;
    ADOQuery1scooter_marka: TWideStringField;
    ADOQuery1scooter_model: TWideStringField;
    ADOQuery1kiralama_tarihi: TDateTimeField;
    ADOQuery3: TADOQuery;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    ADOQuery1kiralamascooter_id: TIntegerField;
    ADOQuery1scooter_gunluk_ucret: TIntegerField;
    Image2: TImage;
    ADOQuery1kiralama_no: TAutoIncField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var scooter_id,kullanilan_gun,gunluk_ucret,toplam_borc,kiralama_id:integer;
    var scooter_marka,scooter_model:string;
  end;

var
  suruslerimForm: TsuruslerimForm;

implementation

{$R *.dfm}

uses gizliForm, kiralama, anasayfa, DateUtils, odemeFormKontrol,odemeForm,kulGiris;




procedure TsuruslerimForm.Button1Click(Sender: TObject);

begin
  kullanilan_gun := StrToInt(DaysBetween(StrToDate(DBGrid1.Fields[2].AsString) , Now() ).ToString);
  scooter_id := StrToInt(DBGrid1.Fields[3].AsString);
  gunluk_ucret := StrToInt(DBGrid1.Fields[4].AsString);
  scooter_marka := (DBGrid1.Fields[0].AsString);
  scooter_model := (DBGrid1.Fields[1].AsString);
  toplam_borc := (kullanilan_gun * gunluk_ucret);
  kiralama_id := StrToInt(DBGrid1.Fields[5].AsString);
  odeme.Label8.Caption := kullanilan_gun.ToString;
  odeme.Label9.Caption := gunluk_ucret.ToString + '₺';
  odeme.Label10.Caption := toplam_borc.ToString + '₺';
  odeme.Label7.Caption := scooter_marka;
  odeme.Label6.Caption := scooter_model;


  if kullanilan_gun = 0 then
  begin
    ShowMessage('1 gün dolmadan teslim edilemez.');
  end
  else
  begin
  odemeKontrol.Show;
  end;
end;



end.
