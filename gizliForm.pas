unit gizliForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass;

type
  Tgizli = class(TForm)
    kullanici_id: TEdit;
    Label1: TLabel;
    kredi_kart: TEdit;
    Label2: TLabel;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  gizli: Tgizli;


implementation

{$R *.dfm}

uses suruslerim;

end.
