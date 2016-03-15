object ProtoFrame: TProtoFrame
  Left = 1411
  Top = 154
  Width = 223
  Height = 259
  Caption = 'Focus Proto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object FocusBox: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 193
    Caption = ' Focus '
    TabOrder = 0
    object EncLabel: TLabel
      Left = 48
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Value'
    end
    object EncValue: TLabel
      Left = 104
      Top = 24
      Width = 72
      Height = 17
      AutoSize = False
    end
    object SpeedLabel: TLabel
      Left = 48
      Top = 56
      Width = 31
      Height = 13
      Caption = 'Speed'
    end
    object SpeedVal: TLabel
      Left = 104
      Top = 56
      Width = 61
      Height = 13
      AutoSize = False
    end
    object UpButton: TButton
      Left = 16
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Up'
      TabOrder = 0
      OnMouseDown = StartUp
      OnMouseUp = EndUp
    end
    object DownButton: TButton
      Left = 16
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Down'
      TabOrder = 1
      OnMouseDown = StartDown
      OnMouseUp = EndDown
    end
    object FullUpButton: TButton
      Left = 104
      Top = 88
      Width = 75
      Height = 25
      Caption = 'FullUp'
      TabOrder = 2
      OnClick = FullUpClick
    end
    object FullDownButton: TButton
      Left = 104
      Top = 120
      Width = 75
      Height = 25
      Caption = 'FullDown'
      TabOrder = 3
      OnClick = FullDownClick
    end
    object StopButton: TButton
      Left = 56
      Top = 152
      Width = 75
      Height = 25
      Caption = 'Stop'
      TabOrder = 4
      OnClick = StopButtonClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 202
    Width = 207
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object mainTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = onMainTimer
    Left = 16
    Top = 264
  end
end
