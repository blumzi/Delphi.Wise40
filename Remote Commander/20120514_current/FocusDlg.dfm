object FocusDialog: TFocusDialog
  Left = 1220
  Top = 236
  Width = 166
  Height = 213
  Caption = 'Focus'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FocusLabel: TLabel
    Left = 32
    Top = 24
    Width = 61
    Height = 24
    Caption = 'XXXX'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object IterLabel: TLabel
    Left = 120
    Top = 26
    Width = 9
    Height = 20
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object GotoButton: TButton
    Left = 8
    Top = 56
    Width = 65
    Height = 25
    Caption = 'Go To'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = GotoButtonClick
  end
  object StopButton: TButton
    Left = 8
    Top = 88
    Width = 65
    Height = 25
    Caption = 'Stop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = StopButtonClick
  end
  object AutoFocusButton: TButton
    Left = 8
    Top = 120
    Width = 89
    Height = 25
    Caption = 'Auto Focus'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = AutoFocusButtonClick
  end
  object FocusWantedVal: TSpinEdit
    Left = 88
    Top = 56
    Width = 50
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 5
    MaxValue = 3999
    MinValue = 0
    ParentFont = False
    TabOrder = 3
    Value = 1
  end
  object FocusWaitCCDTimer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = FocusWaitCCDTimer1Timer
    Left = 8
    Top = 144
  end
  object FocusWaitFocusTimer1: TTimer
    Enabled = False
    OnTimer = FocusWaitFocusTimer1Timer
    Left = 32
    Top = 144
  end
end
