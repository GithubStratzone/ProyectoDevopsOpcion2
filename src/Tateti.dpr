program Tateti;

uses
  Vcl.Forms,
  uTateti in 'uTateti.pas' {frmTateti};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTateti, frmTateti);
  Application.Run;
end.
