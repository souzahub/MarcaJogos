program MarcaJogos;

uses
  System.StartUpCopy,
  FMX.Forms,
  untApp in 'untApp.pas' {frmApplication},
  Androidapi.JNI.Toasts in 'Uses\Androidapi.JNI.Toasts.pas',
  uDados in 'uDados.pas' {dmDados: TDataModule},
  uteste in 'uteste.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmApplication, frmApplication);
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
