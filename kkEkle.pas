unit kkEkle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TkkEkleForm = class(TForm)
    ADOQuery1: TADOQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Edit5: TEdit;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  kkEkleForm: TkkEkleForm;

implementation

{$R *.dfm}

uses hesap, krediKartlari, gizliForm,kulGiris;

procedure TkkEkleForm.Button1Click(Sender: TObject);
begin

  if (Edit1.Text = '') and (Edit2.Text = '') and (Edit3.Text = '') and (Edit5.Text = '') then
  begin
    ShowMessage('Ekleme Yapýlamýyor.');
  end
  else
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
      ('INSERT INTO kredi_karti (kartim_id,kk_ad_sad,kk_isim, kk_numara, kk_cvv) VALUES('
      + '"' + gizli.kredi_kart.Text + '"' + ',' + '"' + Edit1.Text + '"' + ',' + '"' + Edit5.Text + '"' + ',' +
      '"' + Edit2.Text + '"' + ',' + '"' + Edit3.Text + '"' + ')');
    ADOQuery1.ExecSQL;
    ShowMessage('Kredi Kartý Eklendi.');

    Edit1.Text := '';
    Edit2.Text := '';
    Edit3.Text := '';
    Edit5.Text := '';
  end;


end;




end.
