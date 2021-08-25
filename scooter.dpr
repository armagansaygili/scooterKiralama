program scooter;

uses
  Vcl.Forms,
  kulGiris in 'kulGiris.pas' {kGirisi},
  anasayfa in 'anasayfa.pas' {girisSayfa},
  uyeOl in 'uyeOl.pas' {uyelik},
  perAnasayfa in 'perAnasayfa.pas' {perAnaForm},
  hesap in 'hesap.pas' {hesapForm},
  kulSifreDegis in 'kulSifreDegis.pas' {kulSifre},
  krediKartlari in 'krediKartlari.pas' {krediKart},
  kkEkle in 'kkEkle.pas' {kkEkleForm},
  kiralama in 'kiralama.pas' {kiralamaForm},
  gizliForm in 'gizliForm.pas' {gizli},
  suruslerim in 'suruslerim.pas' {suruslerimForm},
  Vcl.Themes,
  Vcl.Styles,
  perHesapForm in 'perHesapForm.pas' {perHesap},
  perSifreForm in 'perSifreForm.pas' {perSifre},
  perEkleForm in 'perEkleForm.pas' {perEkle},
  perScooterListForm in 'perScooterListForm.pas' {perScooterList},
  bakiyeForm in 'bakiyeForm.pas' {bakiye},
  odemeFormKontrol in 'odemeFormKontrol.pas' {odemeKontrol},
  odemeForm in 'odemeForm.pas' {odeme},
  bakimForm in 'bakimForm.pas' {bakim};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Scooter';
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TkGirisi, kGirisi);
  Application.CreateForm(Tbakim, bakim);
  Application.CreateForm(TperAnaForm, perAnaForm);
  Application.CreateForm(TgirisSayfa, girisSayfa);
  Application.CreateForm(ThesapForm, hesapForm);
  Application.CreateForm(Todeme, odeme);
  Application.CreateForm(TsuruslerimForm, suruslerimForm);
  Application.CreateForm(TodemeKontrol, odemeKontrol);
  Application.CreateForm(TperHesap, perHesap);
  Application.CreateForm(Tuyelik, uyelik);
  Application.CreateForm(TkulSifre, kulSifre);
  Application.CreateForm(TkrediKart, krediKart);
  Application.CreateForm(TkkEkleForm, kkEkleForm);
  Application.CreateForm(TkiralamaForm, kiralamaForm);
  Application.CreateForm(Tgizli, gizli);
  Application.CreateForm(TperSifre, perSifre);
  Application.CreateForm(TperEkle, perEkle);
  Application.CreateForm(TperScooterList, perScooterList);
  Application.CreateForm(Tbakiye, bakiye);
  Application.Run;

end.
