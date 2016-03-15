object ShutDownMsg: TShutDownMsg
  Left = 484
  Top = 145
  BorderStyle = bsDialog
  Caption = 'Shutdown'
  ClientHeight = 132
  ClientWidth = 359
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
    Left = 20
    Top = 39
    Width = 135
    Height = 24
    Caption = 'ShutDownMsg'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CloseBtn: TButton
    Left = 13
    Top = 91
    Width = 61
    Height = 20
    Caption = 'Shutdown'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 91
    Top = 91
    Width = 61
    Height = 20
    Cancel = True
    Caption = 'Cancel'
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
    Top = 8
  end
end
