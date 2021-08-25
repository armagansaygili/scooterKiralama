unit odemeFormKontrol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TodemeKontrol = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  odemeKontrol: TodemeKontrol;

implementation

{$R *.dfm}

uses odemeForm, gizliForm,suruslerim;

procedure TodemeKontrol.Button1Click(Sender: TObject);
begin
odeme.Show;
odemeKontrol.Close;
end;

procedure TodemeKontrol.Button2Click(Sender: TObject);
begin
odemeKontrol.Close;
end;

end.
