unit perScooterListForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TperScooterList = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1scooter_id: TAutoIncField;
    ADOQuery1scooter_marka: TWideStringField;
    ADOQuery1scooter_model: TWideStringField;
    ADOQuery1enyuksek_hiz: TWideStringField;
    ADOQuery1gidebildigi_mesafe: TWideStringField;
    ADOQuery1scooter_gunluk_ucret: TIntegerField;
    ADOQuery1scooter_durum: TWideStringField;
    Label1: TLabel;
    Image2: TImage;
    DBNavigator1: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  perScooterList: TperScooterList;

implementation

{$R *.dfm}

uses kulGiris;


end.
