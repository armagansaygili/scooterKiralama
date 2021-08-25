unit hesap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Data.Win.ADODB, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  ThesapForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    ADOQuery2: TADOQuery;
    ADOQuery1kullanici_id: TAutoIncField;
    ADOQuery1username: TWideStringField;
    ADOQuery1password: TWideStringField;
    ADOQuery1kullanici_tc: TWideStringField;
    ADOQuery1kullanici_ad: TWideStringField;
    ADOQuery1kullanici_sad: TWideStringField;
    ADOQuery1kullanici_tel: TWideStringField;
    ADOQuery1kullanici_mail: TWideStringField;
    ADOQuery1kullanici_bakiye: TWideStringField;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  hesapForm: ThesapForm;

implementation

{$R *.dfm}

uses kulGiris;

procedure ThesapForm.Button1Click(Sender: TObject);
begin
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('UPDATE kullanici SET username =' + '"' +
    ADOQuery1username.AsString + '"' + ', kullanici_ad =' + '"' +
    ADOQuery1kullanici_ad.AsString + '"' + ', kullanici_tc =' + '"' +
    ADOQuery1kullanici_tc.AsString + '"' + ', kullanici_sad =' + '"' +
    ADOQuery1kullanici_sad.AsString + '"' + ', kullanici_tel =' + '"' +
    ADOQuery1kullanici_tel.AsString + '"' + ', kullanici_mail =' + '"' +
    ADOQuery1kullanici_mail.AsString + '"' + ' WHERE kullanici_id =' +
    ADOQuery1kullanici_id.AsString + '');
  ADOQuery2.ExecSQL;

  ShowMessage('Kayýt Güncellendi.');
end;



end.
