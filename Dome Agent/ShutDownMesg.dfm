object ShutDownMsg: TShutDownMsg
  Left = 1198
  Top = 300
  BorderStyle = bsDialog
  Caption = 'Shutdown'
  ClientHeight = 142
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ShutDownMsg: TLabel
    Left = 72
    Top = 15
    Width = 321
    Height = 24
    Alignment = taCenter
    Caption = 'ShutDownMsg'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CloseBtn: TButton
    Left = 112
    Top = 83
    Width = 89
    Height = 46
    Caption = 'Shutdown Now'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 232
    Top = 83
    Width = 104
    Height = 46
    Cancel = True
    Caption = 'Cancel Shutdown'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
  end
  object SDTimer: TTimer
    Enabled = False
    OnTimer = SDTimerTimer
    Left = 8
    Top = 168
  end
end
