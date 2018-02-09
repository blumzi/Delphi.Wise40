object DomeForm: TDomeForm
  Left = 1163
  Top = 272
  Width = 278
  Height = 579
  Caption = 'Dome Agent'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = OnCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TLabel
    Left = 8
    Top = 496
    Width = 249
    Height = 17
    AutoSize = False
    Color = clBtnFace
    ParentColor = False
  end
  object DomeBox: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 193
    Hint = 'Set dome azimuth (calibrate)'
    Caption = ' Dome '
    TabOrder = 0
    DesignSize = (
      249
      193)
    object CaliLabel: TLabel
      Left = 24
      Top = 32
      Width = 5
      Height = 13
    end
    object AzimuthLabel: TLabel
      Left = 56
      Top = 72
      Width = 49
      Height = 13
      Caption = 'Azimuth:'
    end
    object AzimuthValue: TLabel
      Left = 115
      Top = 64
      Width = 94
      Height = 33
      Hint = 'Dome'#39's current azimuth'
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Layout = tlCenter
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
      Left = 64
      Top = 148
      Width = 73
      Height = 21
      Hint = 'Greater-equal to 0.0 and less than 360.0 <ENTER>'
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Hint = 'Send dome to Azimuth.'
      EditLabel.Caption = 'Goto Az: '
      EditLabel.ParentShowHint = False
      EditLabel.ShowHint = True
      Enabled = False
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnKeyPress = ManualAzKeyPress
    end
    object StopButton: TBitBtn
      Left = 160
      Top = 144
      Width = 65
      Height = 25
      Hint = 'Stop the dome'
      Caption = 'Stop'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = StopButtonClick
    end
    object SetAzimuth: TLabeledEdit
      Left = 64
      Top = 100
      Width = 73
      Height = 21
      Hint = 'Greater-equal to 0.0 and less than 360.0 <ENTER>'
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Hint = 'Set dome Azimuth (calibrate)'
      EditLabel.Caption = 'Set Az: '
      EditLabel.ParentShowHint = False
      EditLabel.ShowHint = True
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnKeyPress = ManualAzKeyPress
    end
    object CalibrateButton: TButton
      Left = 160
      Top = 96
      Width = 65
      Height = 25
      Hint = 'Find calibration point'
      Caption = 'Find Cali'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = CalibrateButtonClick
    end
  end
  object ShutterBox: TGroupBox
    Left = 8
    Top = 208
    Width = 249
    Height = 113
    Caption = ' Shutter '
    TabOrder = 1
    object PercentLabel: TLabel
      Left = 96
      Top = 48
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
      Top = 40
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
      Top = 40
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
      Top = 72
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
      Top = 72
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
      Top = 72
      Width = 75
      Height = 25
      Hint = 'Stop the shutter'
      Caption = 'Stop'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnMouseUp = DomeShutterStop
    end
    object ProgressBar: TProgressBar
      Left = 8
      Top = 16
      Width = 233
      Height = 20
      Min = 0
      Max = 100
      Smooth = True
      Step = 1
      TabOrder = 5
    end
  end
  object VentBox: TGroupBox
    Left = 8
    Top = 328
    Width = 249
    Height = 73
    Caption = ' Vent '
    TabOrder = 2
    object VentPanel: TPanel
      Left = 80
      Top = 16
      Width = 89
      Height = 41
      BevelOuter = bvNone
      Caption = 'VentPanel'
      TabOrder = 0
      object VentButton: TButton
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        Hint = 'Toggle the Dome vent'#39's state'
        Caption = 'Open'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = VentButtonClick
      end
    end
  end
  object LightsBox: TGroupBox
    Left = 5
    Top = 408
    Width = 249
    Height = 73
    Caption = 'Projector'
    TabOrder = 3
    object LightsPanel: TPanel
      Left = 80
      Top = 16
      Width = 89
      Height = 41
      BevelOuter = bvNone
      Caption = 'VentPanel'
      TabOrder = 0
      object LightsButton: TButton
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        Hint = 'Toggle the Dome vent'#39's state'
        Caption = 'Turn On'
        Enabled = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = LightsButtonClick
      end
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
    Top = 536
  end
  object MainMenu: TMainMenu
    Left = 104
    Top = 528
    object AboutMenuItem: TMenuItem
      Caption = 'About'
      OnClick = AboutButtonClick
    end
  end
end
