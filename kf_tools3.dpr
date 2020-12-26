{
                   ***************
                   *  K.F Tools  *
                   * Version 3.0 *
                   ***************
                  OpenSource version


 K.F Tools er efterfølgeren af K.F Tools 2, som er
 det ultimative alt-i-en værktøj til MS Windows.
 Det indeholder en masse smarte funktioner, værktøjer og
 genveje som vil gøre Windows-brugernes dagligdag nemmere.

 Det er umuligt at forklare alt hvad programmet kan..
 Men prøv det gerne selv!


 Dette projekt er normalt ikke opensource, men jeg har valgt
 at udgive kildekoden til programmet, efter jeg har optimeret det
 en smule til Windows 10 og gjort det kompatibelt med Delphi 10.3 CE.

 Programmet er skrevet af "Kasper Færch Mikkelsen" omkring år 2005.
}

program kf_tools3;



uses
  sharemem,
  Forms,
  Main in 'Main.pas' {MainForm},
  About in 'About.pas' {AboutForm},
  Versions in 'Versions.pas' {VerHistForm},
  Editor in 'Editor.pas' {EditorForm},
  GoogleSearch in 'GoogleSearch.pas' {WebFind},
  HurtigNoter in 'HurtigNoter.pas' {QuickNotesForm},
  Indstillinger in 'Indstillinger.pas' {IndstillingerForm},
  GenstartProgram in 'GenstartProgram.pas' {RestartProg},
  FilKryptering in 'FilKryptering.pas' {EncDecForm},
  Splash in 'Splash.pas' {SplashForm},
  Alarm in 'Alarm.pas' {AlarmForm},
  ShowLocalIp in 'ShowLocalIp.pas' {LocalIpForm},
  Uptime in 'Uptime.pas' {UptimeForm},
  BatteryPowerStatus in 'BatteryPowerStatus.pas' {BatteryForm},
  RandomWallpaper in 'RandomWallpaper.pas' {RandomWallpaperForm};

{$R *.res}

begin
  splashform := tsplashform.create(application);
  splashForm.show;
  application.Initialize;
  Application.Title := 'K.F Tools 3';
  Application.MainFormOnTaskbar := False;
  splashForm.update;
  repeat
  application.ProcessMessages;
  until splashForm.CloseQuery;
  splashform.Free;

  Application.Title := 'K.F Tools 3.0';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TVerHistForm, VerHistForm);
  Application.CreateForm(TEditorForm, EditorForm);
  Application.CreateForm(TWebFind, WebFind);
  Application.CreateForm(TQuickNotesForm, QuickNotesForm);
  Application.CreateForm(TIndstillingerForm, IndstillingerForm);
  Application.CreateForm(TRestartProg, RestartProg);
  Application.CreateForm(TEncDecForm, EncDecForm);
  Application.CreateForm(TSplashForm, SplashForm);
  Application.CreateForm(TAlarmForm, AlarmForm);
  Application.CreateForm(TLocalIpForm, LocalIpForm);
  Application.CreateForm(TUptimeForm, UptimeForm);
  Application.CreateForm(TBatteryForm, BatteryForm);
  Application.CreateForm(TRandomWallpaperForm, RandomWallpaperForm);
  Application.Run;
end.
