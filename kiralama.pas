unit kiralama;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.ComCtrls,
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ToolWin;

type
  TkiralamaForm = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery1scooter_id: TAutoIncField;
    ADOQuery1scooter_marka: TWideStringField;
    ADOQuery1scooter_model: TWideStringField;
    ADOQuery1enyuksek_hiz: TWideStringField;
    ADOQuery1gidebildigi_mesafe: TWideStringField;
    ADOQuery1scooter_gunluk_ucret: TIntegerField;
    ADOQuery1scooter_durum: TWideStringField;
    ADOQuery3: TADOQuery;
    Label1: TLabel;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kiralamaForm: TkiralamaForm;

implementation

{$R *.dfm}


uses DateUtils, gizliForm,kulGiris;


procedure TkiralamaForm.Button1Click(Sender: TObject);

var scooter_id:integer;
var teslim_durum, scooter_durum:string;
var bugun:TDate;
begin
scooter_id := StrToInt(DBGrid1.Fields[5].AsString);
teslim_durum := '0';
scooter_durum := '1';
bugun := Now();


  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  //ADOQuery2.SQL.Add('INSERT INTO kiralama (`scooter_id`, `kiralama_tarihi`, `kullanici_id`, `teslim_durumu`) VALUES ('
  //    + '"' + scooter_id.ToString + '"' + ',' + '"' + DateToStr(bugun) + '"' + ',' + '"' + gizli.kullanici_id.Text +
  //    '"' + ',' + teslim_durum  + ')');
  ADOQuery2.SQL.Add('INSERT INTO kiralama (`scooter_id`, `kiralama_tarihi`, `kullanici_id`, `teslim_durumu`) VALUES ('
      + '"' + scooter_id.ToString + '"' + ',' + '"' + '15.05.2021' + '"' + ',' + '"' + gizli.kullanici_id.Text +
      '"' + ',' + teslim_durum  + ')');
  ADOQuery2.ExecSQL;
  ShowMessage('Kiralama Ýþleminiz Tamamlandý.');

  ADOQuery3.Close;
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Add('UPDATE scooter SET `scooter_durum`=' + scooter_durum + ' WHERE scooter_id= ' + scooter_id.ToString);
  ADOQuery3.ExecSQL;

  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(' select * from scooter where scooter_durum="0"  order by scooter_gunluk_ucret asc ');
  ADOQuery1.Open;
  ADOQuery1.Active := True;

end;

end.
