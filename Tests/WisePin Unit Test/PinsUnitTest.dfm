object Form1: TForm1
  Left = 100
  Top = 142
  Width = 344
  Height = 204
  Caption = 'Dome Az Encoder'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = OnCreate
  OnDestroy = DestroyForm
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TLabel
    Left = 8
    Top = 144
    Width = 313
    Height = 17
    AutoSize = False
  end
  object PortGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 73
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
      Left = 224
      Top = 24
      Width = 65
      Height = 41
      Ctl3D = False
      ItemIndex = 0
      Items.Strings = (
        'Out'
        'In')
      ParentCtl3D = False
      TabOrder = 0
      OnClick = RedefinePins
    end
    object PortSelector: TComboBox
      Left = 96
      Top = 40
      Width = 121
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'FIRSTPORTA'
      OnChange = RedefinePins
      OnSelect = RedefinePins
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
      OnChange = RedefinePins
      Items.Strings = (
        'Board 0'
        'Board 1'
        'Board 2')
    end
  end
  object ValueBox: TGroupBox
    Left = 8
    Top = 88
    Width = 313
    Height = 49
    Caption = ' Value '
    TabOrder = 1
    object EightBitsPanel: TPanel
      Left = 60
      Top = 23
      Width = 120
      Height = 17
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object FourBitsPanel: TPanel
      Left = 80
      Top = 23
      Width = 75
      Height = 17
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
    end
  end
  object MainTimer: TTimer
    Interval = 50
    OnTimer = MainTimerTick
    Left = 16
    Top = 216
  end
  object PortStatusTimer: TTimer
    Interval = 100
    OnTimer = PortStatusTimerTick
    Left = 32
    Top = 704
  end
end
