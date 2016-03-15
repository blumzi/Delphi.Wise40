object Form1: TForm1
  Left = 965
  Top = 676
  Width = 261
  Height = 268
  Caption = 'Dome Az Encoder'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = OnCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TLabel
    Left = 8
    Top = 208
    Width = 233
    Height = 17
    AutoSize = False
  end
  object PortGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 233
    Height = 129
    Caption = ' Configuration '
    TabOrder = 0
    object BoardDescription: TLabel
      Left = 8
      Top = 20
      Width = 205
      Height = 16
      AutoSize = False
    end
    object DirectionSelector: TRadioGroup
      Left = 8
      Top = 72
      Width = 209
      Height = 41
      Caption = ' Direction '
      Columns = 2
      Ctl3D = False
      ItemIndex = 0
      Items.Strings = (
        'Out'
        'In')
      ParentCtl3D = False
      TabOrder = 0
      OnClick = RedefinePort
    end
    object PortSelector: TComboBox
      Left = 96
      Top = 40
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'FIRSTPORTA'
      OnChange = RedefinePort
      OnSelect = RedefinePort
    end
    object BoardSelector: TComboBox
      Left = 8
      Top = 40
      Width = 65
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = 'Board 0'
      OnChange = RedefinePort
      Items.Strings = (
        'Board 0'
        'Board 1'
        'Board 2')
    end
  end
  object ValueBox: TGroupBox
    Left = 8
    Top = 144
    Width = 233
    Height = 57
    Caption = ' Value '
    TabOrder = 1
    object PortValueBin: TLabel
      Left = 112
      Top = 24
      Width = 61
      Height = 13
      AutoSize = False
    end
    object PortValueHex: TLabeledEdit
      Left = 56
      Top = 20
      Width = 33
      Height = 21
      Hint = 'Decimals or Hexadecimals as $NN or 0xNN'
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'Hex'
      LabelPosition = lpLeft
      LabelSpacing = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnKeyDown = OnKeyDown
    end
  end
  object MainTimer: TTimer
    Interval = 50
    OnTimer = MainTimerTick
    Left = 24
    Top = 416
  end
  object PortStatusTimer: TTimer
    Interval = 100
    OnTimer = PortStatusTimerTick
    Left = 32
    Top = 704
  end
end
