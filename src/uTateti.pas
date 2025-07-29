unit uTateti;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmTateti = class(TForm)
    GridTateti: TGridPanel;
    btn00: TButton;
    btn01: TButton;
    btn02: TButton;
    btn10: TButton;
    btn11: TButton;
    btn12: TButton;
    btn20: TButton;
    btn21: TButton;
    btn22: TButton;
    lblEstado: TLabel;
    btnReiniciar: TButton; // Asegurate de agregarlo al diseño
    procedure FormCreate(Sender: TObject);
    procedure btnReiniciarClick(Sender: TObject);
  private
    TurnoActual: Char;
    procedure BotonClick(Sender: TObject);
    procedure CambiarTurno;
    function VerificarGanador: Boolean;
    procedure DeshabilitarBotones;
  public
  end;

var
  frmTateti: TfrmTateti;

implementation

{$R *.dfm}

procedure TfrmTateti.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  TurnoActual := 'X';
  lblEstado.Caption := 'Turno: ' + TurnoActual;

  for i := 0 to GridTateti.ControlCount - 1 do
  begin
    if GridTateti.Controls[i] is TButton then
    begin
      with TButton(GridTateti.Controls[i]) do
      begin
        if (Name <> 'btnReiniciar') then
        begin
          Caption := '';
          Enabled := True;
          OnClick := BotonClick;
        end;
      end;
    end;
  end;
end;

procedure TfrmTateti.BotonClick(Sender: TObject);
var
  btn: TButton;
begin
  btn := Sender as TButton;

  if btn.Caption = '' then
  begin
    btn.Caption := TurnoActual;
    if VerificarGanador then
    begin
      lblEstado.Caption := 'Ganó: ' + TurnoActual;
      DeshabilitarBotones;
    end
    else
    begin
      CambiarTurno;
    end;
  end;
end;

procedure TfrmTateti.CambiarTurno;
begin
  if TurnoActual = 'X' then
    TurnoActual := 'O'
  else
    TurnoActual := 'X';

  lblEstado.Caption := 'Turno: ' + TurnoActual;
end;

function TfrmTateti.VerificarGanador: Boolean;
var
  i: Integer;
  b: array[0..2, 0..2] of string;

  function Igual(a, b, c: string): Boolean;
  begin
    Result := (a <> '') and (a = b) and (b = c);
  end;

begin
  Result := False;

  // Obtener el texto de los botones
  for i := 0 to 8 do
    b[i div 3, i mod 3] := TButton(GridTateti.Controls[i]).Caption;

  // Verificar filas y columnas
  for i := 0 to 2 do
  begin
    if Igual(b[i,0], b[i,1], b[i,2]) or Igual(b[0,i], b[1,i], b[2,i]) then
    begin
      Result := True;
      Exit;
    end;
  end;

  // Diagonales
  if Igual(b[0,0], b[1,1], b[2,2]) or Igual(b[0,2], b[1,1], b[2,0]) then
  begin
    Result := True;
    Exit;
  end;
end;

procedure TfrmTateti.DeshabilitarBotones;
var
  i: Integer;
begin
  for i := 0 to GridTateti.ControlCount - 1 do
    if GridTateti.Controls[i] is TButton then
      TButton(GridTateti.Controls[i]).Enabled := False;
end;

procedure TfrmTateti.btnReiniciarClick(Sender: TObject);
begin
  FormCreate(Self); // Reinicia la lógica del juego
end;

end.

