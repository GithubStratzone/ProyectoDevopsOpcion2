object frmTateti: TfrmTateti
  Left = 0
  Top = 0
  Caption = 'Ta-Te-Ti'
  ClientHeight = 442
  ClientWidth = 628
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
    Width = 628
    Height = 442
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
    ExplicitWidth = 624
    ExplicitHeight = 441
    DesignSize = (
      628
      442)
    object btn00: TButton
      Left = 1
      Top = 1
      Width = 208
      Height = 135
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 207
    end
    object btn01: TButton
      Left = 209
      Top = 1
      Width = 214
      Height = 135
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 208
      ExplicitWidth = 212
    end
    object btn02: TButton
      Left = 423
      Top = 1
      Width = 204
      Height = 135
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 420
      ExplicitWidth = 203
    end
    object btn10: TButton
      Left = 1
      Top = 136
      Width = 208
      Height = 135
      Align = alClient
      TabOrder = 3
      ExplicitWidth = 207
      ExplicitHeight = 134
    end
    object btn11: TButton
      Left = 209
      Top = 136
      Width = 214
      Height = 135
      Align = alClient
      TabOrder = 4
      ExplicitLeft = 208
      ExplicitWidth = 212
      ExplicitHeight = 134
    end
    object btn12: TButton
      Left = 423
      Top = 136
      Width = 204
      Height = 135
      Align = alClient
      TabOrder = 5
      ExplicitLeft = 420
      ExplicitWidth = 203
      ExplicitHeight = 134
    end
    object btn20: TButton
      Left = 1
      Top = 271
      Width = 208
      Height = 145
      Align = alClient
      TabOrder = 6
      ExplicitTop = 270
      ExplicitWidth = 207
    end
    object btn21: TButton
      Left = 209
      Top = 271
      Width = 214
      Height = 145
      Align = alClient
      TabOrder = 7
      ExplicitLeft = 208
      ExplicitTop = 270
      ExplicitWidth = 212
    end
    object btn22: TButton
      Left = 423
      Top = 271
      Width = 204
      Height = 145
      Align = alClient
      TabOrder = 8
      ExplicitLeft = 420
      ExplicitTop = 270
      ExplicitWidth = 203
    end
    object lblEstado: TLabel
      Left = 83
      Top = 421
      Width = 44
      Height = 15
      Anchors = []
      Caption = 'Turno: X'
      ExplicitLeft = 81
      ExplicitTop = 426
    end
    object btnReiniciar: TButton
      Left = 278
      Top = 416
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Reiniciar'
      TabOrder = 9
      OnClick = btnReiniciarClick
      ExplicitLeft = 276
      ExplicitTop = 415
    end
  end
end
