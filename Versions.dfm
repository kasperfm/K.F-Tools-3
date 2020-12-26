object VerHistForm: TVerHistForm
  Left = 309
  Top = 202
  AlphaBlend = True
  BorderStyle = bsSizeToolWin
  Caption = 'Versions historie'
  ClientHeight = 398
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Versions: TMemo
    Left = 0
    Top = 0
    Width = 493
    Height = 398
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    Lines.Strings = (
      'v3.0 (OpenSource)'
      '* Gjort det muligt at afvikle programmet p'#229' Windows 10.'
      
        '* Fjernet forskellige funktioner der ikke virkede under Windows ' +
        '10.'
      ''
      '+ Programmet er nu OpenSource og er bygget med Delphi 10.3.'
      ''
      '- Der er en r'#230'kke gamle og nye bugs, som ikke bliver l'#248'st pt.'
      ''
      'v3.0 (Beta 8)'
      
        '* Fjernet opdaterings, nyheds og UserMessage funktionen da serve' +
        'ren '
      'ikke eksistrere l'#230'ngere.'
      ''
      ''
      'v3.0 (Beta 7)'
      '* Fjernet nogle rester efter licens systemet.'
      '* Rettet stierne til netradioerne.'
      
        '* Gjort kft_lib.dll overfl'#248'dig, og derved minimeret ram forbruge' +
        't.'
      '* Skiftet DNS adresse til serveren.'
      '* Optimeret program opstarten.'
      ''
      '+ Tilf'#248'jet MMradio i NetRadio funktionen.'
      ''
      '- Der er stadig en mindre bug i uptime funktionen.'
      ''
      ''
      'v3.0 (Beta 6)'
      
        '* Licens-systemet er fjernet da jeg har stoppet udviklingen af p' +
        'rojektet, '
      
        'og det aldrig bliver kommercielt som planlagt. Programmet er der' +
        'for nu '
      'freeware.'
      
        '* Jeg har i '#248'jeblikket ikke t'#230'nkt mig at forts'#230'tte udviklingen a' +
        'f '
      'programmet, muligvis h'#248'jst rette nogle bugs.'
      ''
      ''
      'v3.0 (Beta 5)'
      '* '#198'ndret nogle stier til opdaterings og registrerings serveren.'
      '* Rettet en r'#230'kke mindre bugs.'
      ''
      ''
      'v3.0 (Beta 4)'
      
        '+ Funktion til at skifte mellem tilf'#230'ldige wallpapers p'#229' skriveb' +
        'ordet.'
      '+ Gjort det muligt at hente opdateringer fra andre servere.'
      ''
      '* Fjernet SkyRadio fra NetRadio'#39'en da den er blevet lukket.'
      '* Nogle server stier er '#230'ndret og gjort mere dynamiske.'
      ''
      ''
      'v3.0 (Beta 3)'
      '! Forbedret kopibeskyttelsen ekstremt!'
      ''
      
        '+ Gjort det muligt at skifte mellem hvad der vises i TrayBalloon' +
        'en.'
      '+ NetRadio'#39'en gemmer lydstyrken i ini filen.'
      ''
      
        '* Rettet en bug i vinduet som fort'#230'ller at programmet skal genst' +
        'artes.'
      
        '* Rettet nogle fejl med at skriftyperne i alle vinduerne ikke va' +
        'r ens.'
      '* '#198'ndret m'#229'den at l'#230'se uptime p'#229'.'
      '* Lavet om i noget tekst og design nogle steder.'
      '* Gjort mange ting mere brugervenligt.'
      '* Muligt at '#230'ndre flere ting via ini filen.'
      '* Lavet om i ini filens struktur.'
      ''
      ''
      'v3.0 (Beta 2)'
      '+ Tilf'#248'jet K.F Software'#39's hjemmeside i menuen.'
      ''
      '* Forbedret kopibeskyttelsen.'
      '* Rettet en bug med dll filerne.'
      '* Manualen er skrevet f'#230'rdig.'
      '* '#198'ndret lidt i designet i nogle vinduer.'
      
        '* Gjort programmet mere dynamisk n'#229'r det kommunikere med servere' +
        'n.'
      ''
      ''
      'v3.0 (Beta 1)'
      
        '! Nu kan jeg administrere at folk k'#248'ber programmet og give dem l' +
        'icens.'
      '! Bruger nu tar formatet istedet for rar.'
      ''
      '+ Skrevet en manual til programmet. (Ikke helt f'#230'rdig).'
      
        '+ Gjort "Vis lokal ip" & "Batteri status" vinduet mere brugerven' +
        'ligt.'
      '+ Gjort det muligt at hente en allerede k'#248'bt licens.'
      '+ Jeg kan nu deaktivere folks licenser hvis jeg vil.'
      '+ Udbygget alarmen med flere funktioner.'
      ''
      '* Optimeret en masse kode i kernen.'
      '* Rettet nogle bugs ang. batteri status.'
      '* Rettet en masse bugs i alarm funktionen.'
      
        '* Rettet en bug med at programmet laver fejl, hvis man dobbelt k' +
        'likker '
      'p'#229' '
      'ikonet 2 gange i tr'#230'k.'
      
        '* Rettet bug med at programmet nogle gange fokusere andre vindue' +
        'r '
      'automatisk, n'#229'r et internt vindue '#229'bnes.'
      '* Fjernet "dekstop.ini" fra '#39'Favoritter'#39' menuen.'
      '* '#198'ndret i licens-koden igen for at g'#248're programmet mere enkelt.'
      '* Rettet en memmory leak hvis programmet startede uden licens.'
      '* Rettet en memmory leak i alarmens ringe lyd.'
      '* Omskrevet nogle af fejlmeddelelserne.'
      '* Forbedret kopibeskyttelsen (GreenFire Protection) kraftigt.'
      '* Alle vinduer bliver vist p'#229' midten af sk'#230'rmen.'
      '* Lavet om p'#229' designet i "om" vinduet, og tilf'#248'jet logo.'
      '* Rettet diverse sm'#229' bugs rundt omkring.'
      '* '#198'ndret i stierne til netradioerne.'
      ''
      ''
      'v3.0 (Alpha 5)'
      '! Rettet nogle ekstremt alvorlige fejl i licens systemet.'
      ''
      '+ Tilf'#248'jet lyd til Alarm funktionen.'
      '+ Tilf'#248'jet "Favoritter" i menuen.'
      '+ Tilf'#248'jet "System information" funktionen.'
      '+ Tilf'#248'jet et billedkonverterings v'#230'rkt'#248'j.'
      '+ Nu er det muligt at vise/skjule skjulte filer.'
      '+ Gjort Alarm og Tidsindstillet nedlukning mere brugervenligt.'
      '+ Omskrevet nyhedssystemet totalt, s'#229' det nu er web baseret.'
      '+ Omskrevet "UserMessage" funktionen, s'#229' den ogs'#229' underst'#248'tter '
      'HTML.'
      '+ Tilf'#248'jet nogle flere "OnMouse" hints.'
      '+ Tilf'#248'jet 100FM til netradioen.'
      '+ Gjort programmet meget sv'#230'rre at cracke.'
      '+ Nu skal man bekr'#230'fte for at t'#248'mme papirkurven.'
      '+ Knap under indstillinger til "Mine genveje".'
      ''
      '- M'#229'ske lidt mere besv'#230'rlig f'#248'rste-gangs licens oprettelse.'
      ''
      '* '#198'ndret designet i nogle vinduer.'
      '* Rettetede bugs: '
      ' - Fejl med at programmet ligger sig i taskbaren ved start.'
      
        ' - Klokken opdateres ikke efter standby i "Tidsindstillet nedluk' +
        'ning".'
      ' - Diverse memory leaks.'
      ' - Et par alvorlige fejl i netradioens kode.'
      ' - Rettet s'#229' programmet godt kan starte op sammen med Windows.'
      '* Ekstern og mere stabilt licens-oprettelses system.'
      ''
      ''
      'v3.0 (Alpha 4)'
      '! Forbedret licens systemet.'
      ''
      '+ Kraftfuldt fil-krypterings v'#230'rkt'#248'j.'
      '+ Opstarts/Splash vindue.'
      '+ Rettet lidt i kernen s'#229' den burde v'#230're hurtigere.'
      '+ Info n'#229'r der klikkes p'#229' ikonet i statuslinien.'
      '+ "Mine genveje" funktion.'
      '+ Mulighed for tidsindstillet nedlukning af computeren.'
      '+ "Internet Indstillinger" dialog tilf'#248'jet.'
      '+ Alarm funktion.'
      ''
      '* Rettet nogle memory leaks og andre alvorlige bugs.'
      '* Rettet p'#229' den m'#229'de nyhederne bliver downloadet p'#229'.'
      '* Rettet lidt p'#229' designet nogle enkelte steder.'
      '* Fixet nogle fejl i opdaterings funktionen.'
      '* Der kan kun v'#230're '#233't eksemplar af programmet '#229'ben ad gangen.'
      '* Givet demo-licensensen mindre rettigheder.'
      '* Optimeret kode s'#229' programmet er hurtigere.'
      '* Lidt mere dynamisk kode.'
      ''
      ''
      'v3.0 (Alpha 3)'
      '! Licens system integreret i kernen.'
      ''
      '+ Multi-web s'#248'gnings v'#230'rkt'#248'j.'
      '+ NetRadio.'
      '+ En "Minimer alt" funktion.'
      '+ Hurtig noter.'
      '+ Nu er det muligt at indstille nogle dele af programmet.'
      '+ Batteri status for b'#230'rbare computere.'
      '+ Funktion til at '#229'bne og lukke CD skuffen.'
      '+ Funktion til at l'#229'se computeren.'
      '+ Opdaterings funktion.'
      '+ Mulighed for at skifte mellem advanceret og simpel tilstand.'
      ''
      '- Der kan opst'#229' ukendte fejl p'#229' nogen systemer.'
      ''
      '* Rettet problem med programmet lukker ved dll kald.'
      '* Mere dynamisk kode.'
      '* Rettet lidt i editoren.'
      '* Rettet nogle stavefejl.'
      ''
      ''
      'v3.0 (Alpha 2)'
      '! Rettet en masse fejl.'
      '! Optimeret stabilitet.'
      ''
      '+ Gjort det muligt at indstille editoren.'
      '+ Nyt ikon til programmet.'
      '+ OnMouse hints tilf'#248'jet.'
      '+ IP-Finder tilf'#248'jet. '
      '+ K.F Nyheds funktion tilf'#248'jet.'
      '+ Tilf'#248'jet ikoner til menuen.'
      '+ Muligt at g'#248're vinduerne gennemsigtige.'
      ''
      '* Opdateret kft_lib.dll med lidt nyt.'
      ''
      ''
      'v3.0 (Alpha 1)'
      '--= F'#248'rste udgave =--'
      '! Programmet er skrevet helt fra bunden.')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
