program Updater;

uses
  Vcl.Forms,
  uUpdater in 'uUpdater.pas' {frmUpdater};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmUpdater, frmUpdater);
  Application.Run;
end.
