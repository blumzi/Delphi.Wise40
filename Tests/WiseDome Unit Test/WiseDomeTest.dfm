object DomeForm: TDomeForm
  Left = 1398
  Top = 144
  Width = 282
  Height = 337
  Caption = 'Dome Agent'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = OnCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TLabel
    Left = 8
    Top = 280
    Width = 257
    Height = 17
    AutoSize = False
  end
  object DomeBox: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 177
    Caption = ' Dome '
    TabOrder = 0
    object CaliLabel: TLabel
      Left = 24
      Top = 32
      Width = 3
      Height = 13
    end
    object AzimuthLabel: TLabel
      Left = 56
      Top = 64
      Width = 40
      Height = 13
      Caption = 'Azimuth:'
    end
    object AzimuthValue: TLabel
      Left = 107
      Top = 64
      Width = 109
      Height = 13
      Hint = 'Dome'#39's current azimuth'
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
    end
    object DomeLeft: TButton
      Left = 32
      Top = 24
      Width = 75
      Height = 25
      Hint = 'Keep pressed to move dome left (CCW))'
      Caption = 'Left'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnMouseDown = DomeLeftStart
      OnMouseUp = DomeLeftStop
    end
    object DomeRight: TButton
      Left = 136
      Top = 24
      Width = 75
      Height = 25
      Hint = 'Keep pressed to move dome right (CW)'
      Caption = 'Right'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnMouseDown = DomeRightStart
      OnMouseUp = DomeRightStop
    end
    object ManualAz: TLabeledEdit
      Left = 56
      Top = 92
      Width = 73
      Height = 21
      Hint = 'Send dome to the specified azimuth (0..359.999)'
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = 'Goto Az: '
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = ManualAzKeyPress
    end
    object StopButton: TBitBtn
      Left = 136
      Top = 88
      Width = 75
      Height = 25
      Hint = 'Stop the dome'
      Caption = 'Stop'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = StopButtonClick
    end
    object SetAzimuth: TLabeledEdit
      Left = 88
      Top = 140
      Width = 73
      Height = 21
      Hint = 'Calibrate dome to specified azimuth (0..359.999)'
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'Set Az: '
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnKeyPress = ManualAzKeyPress
    end
  end
  object ShutterBox: TGroupBox
    Left = 8
    Top = 192
    Width = 249
    Height = 81
    Caption = ' Shutter '
    TabOrder = 1
    object PercentLabel: TLabel
      Left = 96
      Top = 24
      Width = 65
      Height = 17
      Hint = 'Current shutter opening per-cent'
      Alignment = taCenter
      AutoSize = False
      Caption = ' % '
      ParentShowHint = False
      ShowHint = True
    end
    object OpenButton: TButton
      Left = 8
      Top = 16
      Width = 75
      Height = 25
      Hint = 'Keep pressed to open the shutter'
      Caption = 'Open'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnMouseDown = DomeOpenStart
      OnMouseUp = DomeShutterStop
    end
    object CloseButton: TButton
      Left = 166
      Top = 16
      Width = 75
      Height = 25
      Hint = 'Keep pressed to close the shutter'
      Caption = 'Close'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnMouseDown = DomeCloseStart
      OnMouseUp = DomeShutterStop
    end
    object FullOpenButton: TButton
      Left = 8
      Top = 48
      Width = 75
      Height = 25
      Hint = 'Click to fully open the shutter'
      Caption = 'Full Open'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = FullOpenClick
    end
    object FullCloseButton: TButton
      Left = 168
      Top = 48
      Width = 75
      Height = 25
      Hint = 'Click to fully close the shutter'
      Caption = 'Full Close'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = FullCloseClick
    end
    object StopShutter: TButton
      Left = 88
      Top = 48
      Width = 75
      Height = 25
      Hint = 'Stop the shutter'
      Caption = 'Stop'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnMouseUp = DomeShutterStop
    end
  end
  object MainTimer: TTimer
    Interval = 50
    OnTimer = MainTimerTick
    Left = 24
    Top = 560
  end
  object PortStatusTimer: TTimer
    Interval = 100
    Left = 32
    Top = 704
  end
  object StatusTimer: TTimer
    Interval = 100
    OnTimer = OnStatusTimer
    Left = 16
    Top = 344
  end
  object Dummy: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    Left = 72
    Top = 352
  end
end
