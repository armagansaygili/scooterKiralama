unit kkDuzenle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids;

type
  TkDuzenleForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1kk_ad_sad: TWideStringField;
    ADOQuery1kk_numara: TWideStringField;
    ADOQuery1kk_cvv: TWideStringField;
    ADOQuery1kk_isim: TWideStringField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kDuzenleForm: TkDuzenleForm;

implementation

{$R *.dfm}

uses krediKartlari, gizliForm;

procedure TkDuzenleForm.Button1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(' UPDATE kredi_karti SET `kk_ad_sad`=' + '"' + DBEdit1.Text + '",`kk_numara`=' + '"'
    + DBEdit2.Text + '",`kk_cvv`='  + '"' + DBEdit3.Text + '",`kk_isim`=' + '"' + DBEdit4.Text +
    '"' + ' WHERE kartim_id =' + gizli.kredi_kart.Text + '');
  ADOQuery1.ExecSQL;

end;

end.
