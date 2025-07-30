program Tateti;

uses
  Vcl.Forms,
  uTateti in 'uTateti.pas' {frmTateti};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Tateti 1.0.0';
  Application.CreateForm(TfrmTateti, frmTateti);
  Application.Run;
end.
