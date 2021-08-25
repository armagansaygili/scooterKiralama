unit uyeOl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  Tuyelik = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uyelik: Tuyelik;

implementation

{$R *.dfm}

uses kulGiris;
procedure Tuyelik.Button1Click(Sender: TObject);
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') and
    (Edit4.Text <> '') and (Edit5.Text <> '') then
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
      ('INSERT INTO kullanici (`username`, `password`, `kullanici_ad`, `kullanici_sad`, `kullanici_mail`) VALUES ('
      + '"' + Edit1.Text + '"' + ',' + '"' + Edit2.Text + '"' + ',' + '"' +
      Edit3.Text + '"' + ',' + '"' + Edit4.Text + '"' + ',' + '"' + Edit5.Text +
      '"' + ')');

    ADOQuery1.ExecSQL;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('INSERT INTO kredi_kartim (`username`) VALUES (' + '"' + Edit1.Text + '"' + ')');

    ADOQuery1.ExecSQL;

    ShowMessage('Kullanýcý Eklendi.');
  end
  else
    ShowMessage('Bilgilerinizi eksiksiz doldurunuz.');
end;


end.
