unit perEkleForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TperEkle = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image2: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery1personel_id: TAutoIncField;
    ADOQuery1bakim_id: TIntegerField;
    ADOQuery1username: TWideStringField;
    ADOQuery1password: TWideStringField;
    ADOQuery1personel_ad: TWideStringField;
    ADOQuery1personel_sad: TWideStringField;
    ADOQuery1personel_tel: TWideStringField;
    ADOQuery1personel_mail: TWideStringField;
    ADOQuery1personel_btarihi: TDateTimeField;
    ADOQuery1personel_maas: TWideStringField;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  perEkle: TperEkle;

implementation

{$R *.dfm}

uses kulGiris;

procedure TperEkle.Button1Click(Sender: TObject);
begin
if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') and
    (Edit4.Text <> '') and (Edit5.Text <> '') then
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
      ('INSERT INTO bakim_personel (`username`, `password`, `personel_ad`, `personel_sad`, `personel_mail`,`personel_bTarihi`) VALUES ('
      + '"' + Edit1.Text + '"' + ',' + '"' + Edit2.Text + '"' + ',' + '"' +
      Edit3.Text + '"' + ',' + '"' + Edit4.Text + '"' + ',' + '"' + Edit5.Text +
      '"' +  ',' + '"' +DateToStr(Now())+ '"' + ')');
    ADOQuery1.ExecSQL;

    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('INSERT INTO kredi_kartim (`username`) VALUES (' + '"' + Edit1.Text + '"' + ')');
    ADOQuery1.ExecSQL;

    ShowMessage('Personel Eklendi.');
  end
  else
    ShowMessage('Bilgilerinizi eksiksiz doldurunuz.');
end;

end.
