object frmTateti: TfrmTateti
  Left = 0
  Top = 0
  Caption = 'Ta-Te-Ti'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object GridTateti: TGridPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    Caption = 'GridTateti'
    ColumnCollection = <
      item
        Value = 33.276091523309150000
      end
      item
        Value = 34.085747789267050000
      end
      item
        Value = 32.638160687423800000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = btn00
        Row = 0
      end
      item
        Column = 1
        Control = btn01
        Row = 0
      end
      item
        Column = 2
        Control = btn02
        Row = 0
      end
      item
        Column = 0
        Control = btn10
        Row = 1
      end
      item
        Column = 1
        Control = btn11
        Row = 1
      end
      item
        Column = 2
        Control = btn12
        Row = 1
      end
      item
        Column = 0
        Control = btn20
        Row = 2
      end
      item
        Column = 1
        Control = btn21
        Row = 2
      end
      item
        Column = 2
        Control = btn22
        Row = 2
      end
      item
        Column = 0
        Control = lblEstado
        Row = 3
      end
      item
        Column = 1
        Control = btnReiniciar
        Row = 3
      end>
    RowCollection = <
      item
        Value = 32.494983127116800000
      end
      item
        Value = 32.560837724729810000
      end
      item
        Value = 34.944179148153390000
      end
      item
        SizeStyle = ssAuto
      end>
    TabOrder = 0
    DesignSize = (
      624
      441)
    object btn00: TButton
      Left = 1
      Top = 1
      Width = 207
      Height = 135
      Align = alClient
      TabOrder = 0
    end
    object btn01: TButton
      Left = 208
      Top = 1
      Width = 212
      Height = 135
      Align = alClient
      TabOrder = 1
    end
    object btn02: TButton
      Left = 420
      Top = 1
      Width = 203
      Height = 135
      Align = alClient
      TabOrder = 2
    end
    object btn10: TButton
      Left = 1
      Top = 136
      Width = 207
      Height = 134
      Align = alClient
      TabOrder = 3
    end
    object btn11: TButton
      Left = 208
      Top = 136
      Width = 212
      Height = 134
      Align = alClient
      TabOrder = 4
    end
    object btn12: TButton
      Left = 420
      Top = 136
      Width = 203
      Height = 134
      Align = alClient
      TabOrder = 5
    end
    object btn20: TButton
      Left = 1
      Top = 270
      Width = 207
      Height = 145
      Align = alClient
      TabOrder = 6
    end
    object btn21: TButton
      Left = 208
      Top = 270
      Width = 212
      Height = 145
      Align = alClient
      TabOrder = 7
    end
    object btn22: TButton
      Left = 420
      Top = 270
      Width = 203
      Height = 145
      Align = alClient
      TabOrder = 8
    end
    object lblEstado: TLabel
      Left = 82
      Top = 420
      Width = 44
      Height = 15
      Anchors = []
      Caption = 'Turno: X'
      ExplicitLeft = 81
      ExplicitTop = 426
    end
    object btnReiniciar: TButton
      Left = 276
      Top = 415
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Reiniciar Juego'
      TabOrder = 9
      OnClick = btnReiniciarClick
    end
  end
end
