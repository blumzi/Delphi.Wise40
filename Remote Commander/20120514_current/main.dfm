object ROForm: TROForm
  Left = 355
  Top = 140
  Width = 1172
  Height = 717
  Caption = 'Remote Wise Commander'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnCreate = Formcreate
  PixelsPerInch = 96
  TextHeight = 13
  object DomBox: TGroupBox
    Left = 14
    Top = 4
    Width = 172
    Height = 226
    Caption = 'DOME'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object SlitAzLabel: TLabel
      Left = 94
      Top = 48
      Width = 36
      Height = 20
      Alignment = taRightJustify
      Caption = '+360'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SlitStatusLabel: TLabel
      Left = 115
      Top = 24
      Width = 49
      Height = 20
      Alignment = taRightJustify
      Caption = 'Closed'
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object VentsLabel: TLabel
      Left = 115
      Top = 168
      Width = 49
      Height = 20
      Alignment = taRightJustify
      Caption = 'Closed'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object FlatLAmpLabel: TLabel
      Left = 145
      Top = 192
      Width = 19
      Height = 20
      Alignment = taRightJustify
      Caption = 'off'
      Enabled = False
      Visible = False
    end
    object Label7: TLabel
      Left = 8
      Top = 75
      Width = 39
      Height = 20
      Caption = 'Track'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = AutoCycleChange
    end
    object DmTrackOnBtn: TSpeedButton
      Left = 106
      Top = 74
      Width = 30
      Height = 22
      GroupIndex = 1
      Caption = 'ON'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = btnClick
    end
    object DmTrackOffBtn: TSpeedButton
      Left = 136
      Top = 74
      Width = 30
      Height = 22
      GroupIndex = 1
      Down = True
      Caption = 'OFF'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = btnClick
    end
    object SpeedButton3: TSpeedButton
      Left = 106
      Top = 118
      Width = 30
      Height = 22
      GroupIndex = 1
      Caption = 'ON'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      Visible = False
      OnClick = btnClick
    end
    object SpeedButton4: TSpeedButton
      Left = 136
      Top = 118
      Width = 30
      Height = 22
      GroupIndex = 1
      Caption = 'OFF'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      Visible = False
      OnClick = btnClick
    end
    object SpeedButton7: TSpeedButton
      Left = 106
      Top = 145
      Width = 30
      Height = 22
      GroupIndex = 1
      Caption = 'ON'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      Visible = False
      OnClick = btnClick
    end
    object SpeedButton8: TSpeedButton
      Left = 136
      Top = 145
      Width = 30
      Height = 22
      GroupIndex = 1
      Caption = 'OFF'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      Visible = False
      OnClick = btnClick
    end
    object Label8: TLabel
      Left = 8
      Top = 118
      Width = 84
      Height = 20
      Caption = 'Dome lights'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = AutoCycleChange
    end
    object Label9: TLabel
      Left = 8
      Top = 143
      Width = 87
      Height = 20
      Caption = 'Air condition'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = AutoCycleChange
    end
    object SlitThAzLbl: TLabel
      Left = 135
      Top = 50
      Width = 29
      Height = 16
      Alignment = taRightJustify
      Caption = '[360]'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ShutterBtn: TButton
      Left = 4
      Top = 24
      Width = 72
      Height = 23
      Caption = 'Shutter'
      Enabled = False
      TabOrder = 0
      OnClick = btnClick
    end
    object SlitAzimuthBtn: TButton
      Left = 4
      Top = 48
      Width = 72
      Height = 23
      Caption = 'Azimuth'
      Enabled = False
      TabOrder = 1
      OnClick = btnClick
    end
    object VentsBtn: TButton
      Left = 4
      Top = 168
      Width = 72
      Height = 23
      Caption = 'Vents'
      Enabled = False
      TabOrder = 2
      Visible = False
    end
    object FlatLampBtn: TButton
      Left = 4
      Top = 192
      Width = 72
      Height = 23
      Caption = 'Flat Light'
      Enabled = False
      TabOrder = 3
      Visible = False
      OnClick = btnClick
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 96
      Width = 105
      Height = 17
      Caption = 'Follow RA Track'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object TeleBox: TGroupBox
    Left = 14
    Top = 230
    Width = 172
    Height = 331
    Caption = 'TELESCOPE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object FocusLabel: TLabel
      Left = 119
      Top = 76
      Width = 27
      Height = 20
      Alignment = taRightJustify
      Caption = '???'
      Enabled = False
    end
    object RABarLabel: TLabel
      Left = 3
      Top = 126
      Width = 19
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'RA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
    end
    object DecBarLabel: TLabel
      Left = 3
      Top = 144
      Width = 25
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Dec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
    end
    object DecBarLbl1: TLabel
      Left = 150
      Top = 144
      Width = 17
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'Dc'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
    end
    object RABarLbl1: TLabel
      Left = 150
      Top = 126
      Width = 19
      Height = 16
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = 'RA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Visible = False
    end
    object RatRACKl: TLabel
      Left = 8
      Top = 20
      Width = 66
      Height = 20
      Caption = 'RA Track'
      OnClick = AutoCycleChange
    end
    object RATrackBtnOn: TSpeedButton
      Left = 106
      Top = 19
      Width = 30
      Height = 22
      GroupIndex = 1
      Caption = 'ON'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = btnClick
    end
    object RATrackBtnOff: TSpeedButton
      Left = 136
      Top = 19
      Width = 30
      Height = 22
      GroupIndex = 1
      Caption = 'OFF'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Layout = blGlyphBottom
      ParentFont = False
      OnClick = btnClick
    end
    object Rotator: TLabel
      Left = 8
      Top = 48
      Width = 54
      Height = 20
      Caption = 'Rotator'
    end
    object FocusBtn: TButton
      Left = 6
      Top = 75
      Width = 60
      Height = 23
      Caption = 'Focus'
      Enabled = False
      TabOrder = 0
      OnClick = BFocusClick
    end
    object RAPrBar: TProgressBar
      Left = 30
      Top = 128
      Width = 95
      Height = 8
      Min = 0
      Max = 15
      Smooth = True
      Step = 1
      TabOrder = 1
      Visible = False
    end
    object DecPrBar: TProgressBar
      Left = 30
      Top = 148
      Width = 95
      Height = 8
      Min = 0
      Max = 15
      Smooth = True
      Step = 1
      TabOrder = 2
      Visible = False
    end
    object RotatorE: TEdit
      Left = 106
      Top = 46
      Width = 42
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '71.0'
      OnChange = RotatorEExit
      OnExit = RotatorEExit
    end
    object RotatorSpinB: TSpinButton
      Left = 148
      Top = 46
      Width = 16
      Height = 24
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      FocusControl = RotatorE
      TabOrder = 4
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      OnDownClick = SpinBDownClick
      OnUpClick = SpinBUpClick
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 104
      Width = 97
      Height = 17
      Caption = 'Auto Correct'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
  end
  object PosBox: TGroupBox
    Left = 880
    Top = -1
    Width = 280
    Height = 451
    Caption = 'Clocks &&  Position'
    DragKind = dkDock
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object MoonBox: TGroupBox
      Left = 5
      Top = 224
      Width = 270
      Height = 153
      Caption = 'Moon'
      TabOrder = 0
      object MoonDistEdit: TLabeledEdit
        Left = 172
        Top = 69
        Width = 90
        Height = 28
        Hint = 'Distance between Moon and telescope'#39's FOV'
        TabStop = False
        EditLabel.Width = 32
        EditLabel.Height = 20
        EditLabel.Caption = 'Dist.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LabelPosition = lpLeft
        LabelSpacing = 3
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object MoonAltEdit: TLabeledEdit
        Left = 37
        Top = 69
        Width = 90
        Height = 28
        TabStop = False
        EditLabel.Width = 23
        EditLabel.Height = 20
        EditLabel.Caption = 'Alt.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LabelPosition = lpLeft
        LabelSpacing = 3
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object MoonRAEdit: TLabeledEdit
        Left = 37
        Top = 29
        Width = 90
        Height = 28
        Hint = 'Moon'#39's Right Ascention'
        TabStop = False
        EditLabel.Width = 31
        EditLabel.Height = 20
        EditLabel.Caption = 'R.A.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LabelPosition = lpLeft
        LabelSpacing = 3
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object MoonDecEdit: TLabeledEdit
        Left = 172
        Top = 29
        Width = 90
        Height = 28
        Hint = 'Moon'#39's Declination'
        TabStop = False
        EditLabel.Width = 29
        EditLabel.Height = 20
        EditLabel.Caption = 'Dec'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LabelPosition = lpLeft
        LabelSpacing = 3
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object MoonIllumEdit: TLabeledEdit
        Left = 172
        Top = 109
        Width = 90
        Height = 28
        TabStop = False
        EditLabel.Width = 37
        EditLabel.Height = 20
        EditLabel.Caption = 'Illum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LabelPosition = lpLeft
        LabelSpacing = 3
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object WeatherBtn: TButton
        Left = 10
        Top = 112
        Width = 112
        Height = 25
        Caption = 'Meteorology'
        Enabled = False
        TabOrder = 5
        OnClick = WeatherBtnClick
      end
    end
    object SunBox: TGroupBox
      Left = 135
      Top = 384
      Width = 140
      Height = 57
      Caption = 'Sun'
      TabOrder = 1
      object SunAltEdit: TLabeledEdit
        Left = 41
        Top = 21
        Width = 90
        Height = 28
        TabStop = False
        Ctl3D = True
        EditLabel.Width = 23
        EditLabel.Height = 20
        EditLabel.Caption = 'Alt.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMenuText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        LabelPosition = lpLeft
        LabelSpacing = 3
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object HAEdit: TLabeledEdit
      Left = 41
      Top = 157
      Width = 90
      Height = 28
      Hint = 'Current Telescope Hour Angle'
      TabStop = False
      EditLabel.Width = 31
      EditLabel.Height = 20
      EditLabel.Caption = 'H.A.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object AMEdit: TLabeledEdit
      Left = 188
      Top = 157
      Width = 85
      Height = 28
      TabStop = False
      EditLabel.Width = 32
      EditLabel.Height = 20
      EditLabel.Caption = 'A.M.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object RAEdit: TLabeledEdit
      Left = 41
      Top = 125
      Width = 90
      Height = 28
      Hint = 'Current Telescope Right Ascention'
      TabStop = False
      Color = clMoneyGreen
      EditLabel.Width = 31
      EditLabel.Height = 20
      EditLabel.Caption = 'R.A.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object DecEdit: TLabeledEdit
      Left = 184
      Top = 125
      Width = 90
      Height = 28
      Hint = 'Current Telescope  Declination'
      TabStop = False
      Color = clMoneyGreen
      EditLabel.Width = 33
      EditLabel.Height = 20
      EditLabel.Caption = 'Dec.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object JDEdit: TLabeledEdit
      Left = 185
      Top = 61
      Width = 90
      Height = 28
      Hint = 'Julian Date'
      TabStop = False
      EditLabel.Width = 28
      EditLabel.Height = 20
      EditLabel.Caption = 'J.D.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object EpochEdit: TLabeledEdit
      Left = 203
      Top = 93
      Width = 70
      Height = 28
      Hint = 'Equinox'
      TabStop = False
      EditLabel.Width = 46
      EditLabel.Height = 20
      EditLabel.Caption = 'Epoch'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object LTEdit: TLabeledEdit
      Left = 41
      Top = 61
      Width = 90
      Height = 28
      Hint = 'Local Time'
      TabStop = False
      EditLabel.Width = 26
      EditLabel.Height = 20
      EditLabel.Caption = 'L.T.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
    object STEdit: TLabeledEdit
      Left = 41
      Top = 93
      Width = 85
      Height = 28
      Hint = 'Sidereal Time'
      TabStop = False
      EditLabel.Width = 28
      EditLabel.Height = 20
      EditLabel.Caption = 'S.T.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object UTEdit: TLabeledEdit
      Left = 41
      Top = 21
      Width = 232
      Height = 28
      Hint = 'Universal Time'
      TabStop = False
      EditLabel.Width = 29
      EditLabel.Height = 20
      EditLabel.Caption = 'U.T.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object AltEdit: TLabeledEdit
      Left = 41
      Top = 189
      Width = 90
      Height = 28
      Hint = 'Current Telescope Altitude'
      TabStop = False
      EditLabel.Width = 23
      EditLabel.Height = 20
      EditLabel.Caption = 'Alt.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object AZEdit: TLabeledEdit
      Left = 187
      Top = 189
      Width = 85
      Height = 28
      Hint = 'Current Telescope Azimuth'
      TabStop = False
      EditLabel.Width = 23
      EditLabel.Height = 20
      EditLabel.Caption = 'Az.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 3
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object SkyClarityBox: TGroupBox
      Left = 13
      Top = 384
      Width = 116
      Height = 57
      Caption = 'Sky Status'
      TabOrder = 13
      object SkyStatLabel: TLabel
        Left = 8
        Top = 24
        Width = 6
        Height = 20
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object GuideBox: TGroupBox
    Left = 14
    Top = 584
    Width = 172
    Height = 49
    Caption = 'GUIDER'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object GuiderStatusLabel: TLabel
      Left = 80
      Top = 21
      Width = 40
      Height = 20
      Caption = 'Idle'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object GuiderBtn: TButton
      Left = 6
      Top = 21
      Width = 70
      Height = 23
      Hint = 'Guiding Control'
      Caption = 'Start'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 0
      OnClick = GuiderBtnClick
    end
  end
  object DetectorBox: TGroupBox
    Left = 192
    Top = 424
    Width = 540
    Height = 209
    Caption = 'Camera'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object ObsCycleStatus: TLabel
      Left = 7
      Top = 178
      Width = 5
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 374
      Top = 77
      Width = 39
      Height = 16
      Caption = 'Frame'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label11: TLabel
      Left = 374
      Top = 109
      Width = 44
      Height = 16
      Caption = 'Binning'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label12: TLabel
      Left = 374
      Top = 45
      Width = 46
      Height = 16
      Caption = 'TopLeft'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label13: TLabel
      Left = 223
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Cycles'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 434
      Top = 18
      Width = 8
      Height = 16
      Caption = 'X'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label15: TLabel
      Left = 496
      Top = 18
      Width = 9
      Height = 16
      Caption = 'Y'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object CCDTempLbl: TLabel
      Left = 374
      Top = 26
      Width = 78
      Height = 16
      Caption = 'Temperature'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CCDTempLabel: TLabel
      Left = 490
      Top = 26
      Width = 18
      Height = 16
      Alignment = taRightJustify
      Caption = 'OK'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CCDStatusLabel: TLabel
      Left = 486
      Top = 62
      Width = 22
      Height = 16
      Alignment = taRightJustify
      Caption = 'Idle'
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object CCDSttusLbl: TLabel
      Left = 374
      Top = 62
      Width = 37
      Height = 16
      Caption = 'Status'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CCDExpLabel: TLabel
      Left = 512
      Top = 143
      Width = 9
      Height = 16
      Alignment = taRightJustify
      Caption = 'T'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object BImBias: TButton
      Left = 288
      Top = 53
      Width = 65
      Height = 25
      Hint = 'Take Bias Images'
      Caption = 'Bias'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BImBiasClick
    end
    object BImArea: TButton
      Left = 288
      Top = 24
      Width = 65
      Height = 25
      Hint = 'Change Frame Size'
      Caption = 'FOV'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BImBiasClick
    end
    object BImIaquire: TButton
      Left = 288
      Top = 82
      Width = 65
      Height = 25
      Hint = 'Aquire Preview Image (Binned 2X2, Full Frame)'
      Caption = 'Acquire'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BImBiasClick
    end
    object BTmpImg: TButton
      Left = 288
      Top = 111
      Width = 65
      Height = 25
      Hint = 'Take a test exposure ( will not be saved)'
      Caption = 'Test'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BImBiasClick
    end
    object CamExp: TValueListEditor
      Left = 96
      Top = 32
      Width = 113
      Height = 137
      Hint = 'Insert Filters and Exposure Times'
      DropDownRows = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = [keyEdit, keyAdd, keyDelete]
      ParentFont = False
      PopupMenu = FiterMnu
      ScrollBars = ssVertical
      Strings.Strings = (
        '=')
      TabOrder = 17
      TitleCaptions.Strings = (
        'Filter'
        'T(exp)')
      OnClick = CamExpEnter
      OnEnter = CamExpEnter
      OnStringsChange = CamExpEnter
      ColWidths = (
        59
        48)
    end
    object BtnObserve: TBitBtn
      Left = 8
      Top = 32
      Width = 73
      Height = 65
      Hint = 'Start a filter Sequence'
      Caption = 'Observe'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BtnObserveClick
      Glyph.Data = {
        66330000424D66330000000000003600000028000000450000003F0000000100
        18000000000030330000120B0000120B00000000000000000000E7AD002FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F00}
      Layout = blGlyphBottom
      Margin = 0
      Spacing = -40
    end
    object BtnStopObserve: TBitBtn
      Left = 8
      Top = 102
      Width = 73
      Height = 65
      Hint = 'Stop Filter Sequence [shift+click would abort the exposure]'
      Caption = 'STOP'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BtnStopObserveClick
      OnMouseDown = BtnStopObserveMouseDown
      Glyph.Data = {
        66330000424D66330000000000003600000028000000450000003F0000000100
        18000000000030330000120B0000120B00000000000000000000E7AD003F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF00}
      Layout = blGlyphBottom
      Margin = 0
      Spacing = -40
    end
    object CamFrameSquare: TCheckBox
      Left = 370
      Top = 132
      Width = 71
      Height = 17
      BiDiMode = bdLeftToRight
      Caption = 'Square'
      Checked = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      State = cbChecked
      TabOrder = 16
      Visible = False
      OnClick = CamFrameSquareClick
    end
    object CCDBinYEdt: TSpinEdit
      Left = 497
      Top = 104
      Width = 33
      Height = 22
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      MaxValue = 4
      MinValue = 1
      ParentFont = False
      TabOrder = 14
      Value = 1
      Visible = False
    end
    object CCDBinXEdt: TSpinEdit
      Left = 441
      Top = 104
      Width = 33
      Height = 22
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      MaxValue = 4
      MinValue = 1
      ParentFont = False
      TabOrder = 13
      Value = 1
      Visible = False
    end
    object CamTopCorner: TSpinEdit
      Left = 480
      Top = 40
      Width = 50
      Height = 26
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 100
      MaxLength = 5
      MaxValue = 1024
      MinValue = 1
      ParentFont = False
      TabOrder = 10
      Value = 1
      Visible = False
    end
    object CamLeftCorner: TSpinEdit
      Left = 424
      Top = 40
      Width = 50
      Height = 26
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 100
      MaxLength = 5
      MaxValue = 1024
      MinValue = 1
      ParentFont = False
      TabOrder = 9
      Value = 1
      Visible = False
    end
    object CamFrmSizeX: TSpinEdit
      Left = 424
      Top = 72
      Width = 50
      Height = 26
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 100
      MaxLength = 5
      MaxValue = 1024
      MinValue = 1
      ParentFont = False
      TabOrder = 12
      Value = 1024
      Visible = False
    end
    object CamFrmSizeY: TSpinEdit
      Left = 480
      Top = 72
      Width = 50
      Height = 26
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 100
      MaxLength = 5
      MaxValue = 1024
      MinValue = 1
      ParentFont = False
      TabOrder = 11
      Value = 1024
      Visible = False
    end
    object CamRepete: TSpinEdit
      Left = 223
      Top = 42
      Width = 52
      Height = 26
      Hint = 'set number of cycles for Filter Sequence  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      MaxValue = 9999
      MinValue = 1
      ParentFont = False
      TabOrder = 6
      Value = 1
      OnChange = CamRepeteChange
    end
    object CamAMLim: TLabeledEdit
      Left = 223
      Top = 90
      Width = 31
      Height = 21
      Hint = 'Set upper AM limit for  Filter Sequence'
      EditLabel.Width = 50
      EditLabel.Height = 16
      EditLabel.Caption = 'AM Limit'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 4
      MaxLength = 5
      ParentFont = False
      TabOrder = 7
      Text = '2.9'
      OnChange = CamAMLimChange
      OnExit = CamAMLimChange
    end
    object CheckBox1: TCheckBox
      Left = 450
      Top = 130
      Width = 79
      Height = 17
      BiDiMode = bdLeftToRight
      Caption = 'Centered'
      Checked = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      State = cbChecked
      TabOrder = 15
      Visible = False
      OnClick = CamFrameSquareClick
    end
    object CamUTLim: TLabeledEdit
      Left = 223
      Top = 137
      Width = 38
      Height = 21
      Hint = 'Set uppet UT limit for Filter Sequence [00:00 - 23:59]'
      EditLabel.Width = 49
      EditLabel.Height = 16
      EditLabel.Caption = 'UT Limit'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 3
      MaxLength = 5
      ParentFont = False
      TabOrder = 8
      OnExit = CamUTLimExit
    end
    object AMLimSpinB: TSpinButton
      Left = 254
      Top = 90
      Width = 16
      Height = 24
      DownGlyph.Data = {
        DE000000424DDE00000000000000360000002800000009000000060000000100
        180000000000A800000000000000000000000000000000000000008080008080
        0080800080800080800080800080800080800080800000808000808000808000
        8080000000008080008080008080008080000080800080800080800000000000
        0000000000808000808000808000008080008080000000000000000000000000
        0000000080800080800000808000000000000000000000000000000000000000
        0000008080000080800080800080800080800080800080800080800080800080
        8000}
      FocusControl = CamAMLim
      TabOrder = 18
      UpGlyph.Data = {
        DE000000424DDE00000000000000360000002800000009000000060000000100
        180000000000A800000000000000000000000000000000000000008080008080
        0080800080800080800080800080800080800080800000808000000000000000
        0000000000000000000000000000008080000080800080800000000000000000
        0000000000000000808000808000008080008080008080000000000000000000
        0080800080800080800000808000808000808000808000000000808000808000
        8080008080000080800080800080800080800080800080800080800080800080
        8000}
      OnDownClick = SpinBDownClick
      OnUpClick = SpinBUpClick
    end
    object INSTchoose: TComboBox
      Left = 96
      Top = 2
      Width = 113
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 19
      Text = '-select-'
      OnChange = INSTchooseChange
      Items.Strings = (
        'PI'
        'LAIWO'
        '')
    end
    object BImFlatField: TButton
      Left = 288
      Top = 140
      Width = 65
      Height = 25
      Hint = 'Run a FlatField script'
      Caption = 'FlatField'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
      OnClick = BImFlatFieldClick
    end
    object ExposurePrgrsBar: TProgressBar
      Left = 376
      Top = 146
      Width = 118
      Height = 10
      Min = 0
      Max = 15
      Smooth = True
      Step = 1
      TabOrder = 21
      Visible = False
    end
  end
  object ListPg: TPageControl
    Left = 192
    Top = 8
    Width = 681
    Height = 225
    MultiLine = True
    PopupMenu = ListPopUp1
    TabOrder = 6
    OnMouseDown = ListPgMouseDown
  end
  object TelescopeBox: TGroupBox
    Left = 192
    Top = 232
    Width = 540
    Height = 193
    Caption = 'Telescope'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object CoordOKLabel: TLabel
      Left = 194
      Top = 165
      Width = 33
      Height = 20
      Caption = 'YYY'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBackground
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object CoordErrLabel: TLabel
      Left = 234
      Top = 165
      Width = 139
      Height = 20
      Caption = 'Invalid/partial  input!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object BZenPark: TButton
      Left = 418
      Top = 49
      Width = 110
      Height = 22
      Caption = 'Zenith Park'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BParkClick
    end
    object BDFPark: TButton
      Left = 418
      Top = 93
      Width = 110
      Height = 22
      Caption = 'Dome Flat Park'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BParkClick
    end
    object BSkyFF: TButton
      Left = 418
      Top = 27
      Width = 110
      Height = 22
      Hint = 'Select Zenith Pointing'
      Caption = 'Sky Flat'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BParkClick
    end
    object BMCPark: TButton
      Left = 418
      Top = 71
      Width = 110
      Height = 22
      Caption = 'Mirror Cover Park'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = BParkClick
    end
    object Tabs: TPageControl
      Left = 79
      Top = 24
      Width = 330
      Height = 137
      ActivePage = TabRA
      TabIndex = 0
      TabOrder = 8
      OnChange = TabsChange
      object TabRA: TTabSheet
        Caption = 'R.A.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object AddToGridB: TButton
          Left = 272
          Top = 6
          Width = 50
          Height = 22
          Hint = 'Add object to active list'
          Caption = '&Add'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = AddToGridBClick
        end
        object RARA: TLabeledEdit
          Left = 14
          Top = 72
          Width = 105
          Height = 21
          Hint = 'Insert Target'#39's R.A'
          Color = clMoneyGreen
          EditLabel.Width = 25
          EditLabel.Height = 16
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'R.A.'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpAbove
          LabelSpacing = 2
          MaxLength = 15
          ParentFont = False
          TabOrder = 1
          OnChange = ValidateRADataInput
        end
        object RATarget: TLabeledEdit
          Left = 54
          Top = 22
          Width = 135
          Height = 21
          Hint = 'Insert Target'#39's Name'
          Color = clMoneyGreen
          EditLabel.Width = 40
          EditLabel.Height = 16
          EditLabel.Caption = 'Target'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpLeft
          LabelSpacing = 4
          MaxLength = 25
          ParentFont = False
          TabOrder = 0
          OnChange = ValidateRADataInput
          OnEnter = CamExpEnter
        end
        object RADec: TLabeledEdit
          Left = 128
          Top = 72
          Width = 105
          Height = 21
          Hint = 'Insert Target'#39's Declination'
          Color = clMoneyGreen
          EditLabel.Width = 28
          EditLabel.Height = 16
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Dec.'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpAbove
          LabelSpacing = 2
          MaxLength = 15
          ParentFont = False
          TabOrder = 2
          OnChange = ValidateRADataInput
        end
        object RAEpoch: TLabeledEdit
          Left = 240
          Top = 72
          Width = 65
          Height = 21
          Hint = 'Insert Epoch of Target'#39's Coordinates'
          Color = clMoneyGreen
          EditLabel.Width = 39
          EditLabel.Height = 16
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Epoch'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpAbove
          LabelSpacing = 2
          MaxLength = 12
          ParentFont = False
          TabOrder = 3
          OnChange = ValidateRADataInput
        end
        object BtnFChart: TBitBtn
          Left = 194
          Top = 20
          Width = 25
          Height = 25
          Hint = 'Show Finding Chart'
          TabOrder = 5
          OnClick = OpenFChart
          Glyph.Data = {
            06030000424D060300000000000036000000280000000F0000000F0000000100
            180000000000D0020000C30E0000C30E00000000000000000000BFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BF0000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000000000BFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF0000000000
            00000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F00000000000000000000
            00007F7F7FBFBFBF000000000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            000000000000BFBFBFBFBFBFBFBFBFBFBFBF000000000000000000000000BFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBF0000007F7F7FBFBFBFBFBFBF7F7F7F7F7F7F7F
            7F7FBFBFBF7F7F7F000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F000000
            BFBFBFBFBFBF7F7F7FBFBFBFBFBFBF7F7F7F7F7F7FBFBFBF0000007F7F7FBFBF
            BFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBF7F7F7FBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBF
            BFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBF000000BFBFBF
            FFFFFFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000BFBF
            BFBFBFBFBFBFBFBFBFBF7F7F7F000000FFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBF0000007F7F7FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000
            7F7F7FFFFFFFFFFFFFBFBFBFBFBFBFBFBFBFBFBFBF7F7F7F000000BFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000000000BFBFBFBFBFBFBFBFBFBF
            BFBF000000000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBF7F7F7F0000000000000000000000007F7F7FBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBF}
        end
      end
      object TabOffset: TTabSheet
        Caption = 'Offset'
        ImageIndex = 1
        object OffsetRAE: TLabeledEdit
          Left = 16
          Top = 72
          Width = 100
          Height = 24
          Color = clSkyBlue
          EditLabel.Width = 25
          EditLabel.Height = 16
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'R.A.'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpAbove
          LabelSpacing = 2
          ParentFont = False
          TabOrder = 0
        end
        object CBRAOffsetUnits: TComboBox
          Left = 115
          Top = 72
          Width = 40
          Height = 24
          Style = csDropDownList
          Color = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          ItemIndex = 1
          MaxLength = 1
          ParentFont = False
          TabOrder = 1
          Text = #39
          Items.Strings = (
            '"'
            #39
            #176)
        end
        object OffsetDecE: TLabeledEdit
          Left = 168
          Top = 72
          Width = 100
          Height = 24
          Color = clSkyBlue
          EditLabel.Width = 28
          EditLabel.Height = 16
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Dec.'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpAbove
          LabelSpacing = 2
          ParentFont = False
          TabOrder = 2
        end
        object ComboBox2: TComboBox
          Left = 267
          Top = 72
          Width = 40
          Height = 24
          Style = csDropDownList
          Color = clSkyBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          ItemIndex = 1
          MaxLength = 1
          ParentFont = False
          TabOrder = 3
          Text = #39
          Items.Strings = (
            '"'
            #39
            #176)
        end
      end
      object TabHA: TTabSheet
        Caption = 'H.A.'
        Enabled = False
        ImageIndex = 2
        object HATarget: TLabeledEdit
          Left = 54
          Top = 22
          Width = 135
          Height = 21
          Color = 10079487
          EditLabel.Width = 40
          EditLabel.Height = 16
          EditLabel.Caption = 'Target'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpLeft
          LabelSpacing = 4
          MaxLength = 25
          ParentFont = False
          TabOrder = 0
        end
        object HAHA: TLabeledEdit
          Left = 14
          Top = 72
          Width = 105
          Height = 21
          Color = 10079487
          EditLabel.Width = 25
          EditLabel.Height = 16
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'H.A.'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpAbove
          LabelSpacing = 2
          MaxLength = 15
          ParentFont = False
          TabOrder = 1
          OnExit = ValidateHADataInput
        end
        object HADec: TLabeledEdit
          Left = 128
          Top = 72
          Width = 105
          Height = 21
          Color = 10079487
          EditLabel.Width = 28
          EditLabel.Height = 16
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = 'Dec.'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpAbove
          LabelSpacing = 2
          MaxLength = 15
          ParentFont = False
          TabOrder = 2
          OnExit = ValidateHADataInput
        end
      end
    end
    object BCalStar: TButton
      Left = 418
      Top = 115
      Width = 110
      Height = 22
      Caption = 'Calibration Star'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = BParkClick
    end
    object BtnGoTo: TBitBtn
      Left = 8
      Top = 24
      Width = 65
      Height = 65
      Hint = 'Move Telescope To Requested Posiotion'
      Caption = 'GO TO'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = GotoClick
      Glyph.Data = {
        0E2C0000424D0E2C00000000000036000000280000003D0000003D0000000100
        180000000000D82B0000120B0000120B00000000000000000000E7AD002FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F002FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F002FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F
        2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED
        2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2FED2F2F
        ED2F2FED2F2FED2F2FED2F2FED2F2FED2F00}
      Layout = blGlyphBottom
      Margin = 0
      Spacing = -40
    end
    object BtnGotoStop: TBitBtn
      Left = 8
      Top = 96
      Width = 65
      Height = 65
      Hint = 'Stop The Telescop'#39
      Caption = 'STOP'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = BtnGotoStopClick
      Glyph.Data = {
        0E2C0000424D0E2C00000000000036000000280000003D0000003D0000000100
        180000000000D82B0000120B0000120B00000000000000000000E7AD003F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF003F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF003F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF
        3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3F
        FF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F
        3FFF3F3FFF3F3FFF3F3FFF3F3FFF3F3FFF00}
      Layout = blGlyphBottom
      Margin = 0
      Spacing = -40
    end
    object AutoMode: TCheckBox
      Left = 10
      Top = 168
      Width = 63
      Height = 17
      Caption = 'Auto'
      Enabled = False
      TabOrder = 9
      OnClick = AutoModeClick
    end
    object PosCombo: TComboBox
      Left = 264
      Top = 24
      Width = 145
      Height = 28
      ItemHeight = 20
      TabOrder = 10
      Text = '-select-'
      OnChange = PosComboChange
      Items.Strings = (
        'Zenith Park'
        'Mirror Cover Park'
        'Dome Flat Park'
        'Sky Flat Position'
        'Open/Close Dome')
    end
    object GraphicMove: TButton
      Left = 418
      Top = 137
      Width = 110
      Height = 22
      Caption = 'MoveIt'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = GraphicMoveClick
    end
    object UseGuider: TCheckBox
      Left = 80
      Top = 168
      Width = 113
      Height = 17
      Caption = 'Use Guider'
      Enabled = False
      TabOrder = 11
      Visible = False
    end
  end
  object FilterWheel: TRadioGroup
    Tag = -1
    Left = 744
    Top = 240
    Width = 113
    Height = 209
    Caption = 'Filter Position'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = FilterWheelGo
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 633
    Width = 1160
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ObsCycle: TLabeledEdit
    Left = 592
    Top = 600
    Width = 25
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 16
    EditLabel.Caption = 'ObsCycle'
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 9
    Text = '4'
    Visible = False
    OnChange = ExpCycle
  end
  object AutoCycle: TLabeledEdit
    Left = 640
    Top = 600
    Width = 25
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 16
    EditLabel.Caption = 'AutoCycle'
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 10
    Text = '4'
    Visible = False
    OnChange = AutoCycleChange
  end
  object TerminalMemo: TMemo
    Left = 736
    Top = 456
    Width = 416
    Height = 177
    Color = clBtnFace
    DragKind = dkDock
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 11
  end
  object MainMenu: TMainMenu
    Images = ToolbarImages
    Left = 224
    Top = 20
    object File1: TMenuItem
      Caption = '&File'
      SubMenuImages = ToolbarImages
      object Preferences1: TMenuItem
        Caption = '&Preferences...'
        OnClick = Preferences1Click
      end
      object Debugoptions1: TMenuItem
        Caption = 'Debug options'
        OnClick = Debugoptions1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object List1: TMenuItem
      Caption = '&List'
      SubMenuImages = ToolbarImages
      object Open1: TMenuItem
        Caption = '&Load...'
        SubMenuImages = ToolbarImages
        ImageIndex = 1
        OnClick = LoadLisFile
      end
      object Save_list: TMenuItem
        Caption = '&Save'
        SubMenuImages = ToolbarImages
        Enabled = False
        ImageIndex = 4
        OnClick = ListSaveClick
      end
      object SaveAs_List: TMenuItem
        Caption = 'Save &As...'
        SubMenuImages = ToolbarImages
        Enabled = False
        ImageIndex = 5
        OnClick = ListSaveAsClick
      end
      object N2: TMenuItem
        Caption = '-'
        Visible = False
      end
      object Print1: TMenuItem
        Caption = '&Print...'
        ImageIndex = 6
        Visible = False
      end
      object PrintSetup1: TMenuItem
        Caption = 'P&rint Setup...'
        Visible = False
      end
      object N3: TMenuItem
        Caption = '-'
        Visible = False
      end
      object N1Landolt1: TMenuItem
        Caption = '1. Landolt'
        Checked = True
        Visible = False
      end
      object N2BrightStarCatalog1: TMenuItem
        Caption = '2. Bright Star Catalog'
        Visible = False
      end
      object N3MasterList1: TMenuItem
        Caption = '3. Wise Objects'
        Visible = False
      end
    end
    object Sockets: TMenuItem
      Caption = 'Sockets'
      SubMenuImages = ToolbarImages
      object Connectall: TMenuItem
        Caption = 'Connect all'
        SubMenuImages = ToolbarImages
        ImageIndex = 11
        OnClick = ConnectallClick
      end
      object Disconnectall: TMenuItem
        Caption = 'Disconnect all'
        SubMenuImages = ToolbarImages
        ImageIndex = 12
        OnClick = DisconnectallClick
      end
      object Connect1: TMenuItem
        Caption = 'Connect...'
        object ScopeConnect: TMenuItem
          Caption = 'Telescope'
          SubMenuImages = ToolbarImages
          ImageIndex = 11
          OnClick = ScopeConnectClick
        end
        object DomeConnect: TMenuItem
          Caption = 'Dome'
          SubMenuImages = ToolbarImages
          ImageIndex = 11
          OnClick = InitDome
        end
        object FocusConnect: TMenuItem
          Caption = 'Focus'
          SubMenuImages = ToolbarImages
          ImageIndex = 11
          OnClick = FocusConnectClick
        end
        object LAIWOScienceConnect: TMenuItem
          Caption = 'LAIWO Science'
          SubMenuImages = ToolbarImages
          ImageIndex = 11
          OnClick = LaiwoScienceConnectClick
        end
        object LAIWOGuiderConnect: TMenuItem
          Caption = 'LAIWO Guider'
          SubMenuImages = ToolbarImages
          ImageIndex = 11
          OnClick = LaiwoGuiderConnectClick
        end
        object PMISConnect: TMenuItem
          Caption = 'PI CCD'
          SubMenuImages = ToolbarImages
          ImageIndex = 11
          OnClick = PMISConnectClick
        end
        object FWConnect: TMenuItem
          Caption = 'Filters'
          SubMenuImages = ToolbarImages
          ImageIndex = 11
          OnClick = InitFilters
        end
        object C18Connect: TMenuItem
          Caption = 'Clouds Radar'
          SubMenuImages = ToolbarImages
          ImageIndex = 11
          OnClick = C18ConnectClick
        end
        object WeatherConnect: TMenuItem
          Caption = 'Weather'
          SubMenuImages = ToolbarImages
          ImageIndex = 11
          OnClick = WeatherConnectClick
        end
      end
      object Disconnect1: TMenuItem
        Caption = 'Disconnect...'
        object ScopeDisconnect: TMenuItem
          Caption = 'Telescope'
          SubMenuImages = ToolbarImages
          Enabled = False
          ImageIndex = 12
          OnClick = ScopeDisconnectClick
        end
        object DomeDisconnect: TMenuItem
          Caption = 'Dome'
          SubMenuImages = ToolbarImages
          Enabled = False
          ImageIndex = 12
          OnClick = DomeDisconnectClick
        end
        object FocusDisconnect: TMenuItem
          Caption = 'Focus'
          SubMenuImages = ToolbarImages
          Enabled = False
          ImageIndex = 12
          OnClick = FocusDisconnectClick
        end
        object LAIWOScienceDisconnect: TMenuItem
          Caption = 'LAIWO Science'
          SubMenuImages = ToolbarImages
          Enabled = False
          ImageIndex = 12
          OnClick = LaiwoScienceDisconnectClick
        end
        object LAIWOGuiderDisconnect: TMenuItem
          Caption = 'LAIWO Guider'
          SubMenuImages = ToolbarImages
          Enabled = False
          ImageIndex = 12
          OnClick = LaiwoGuiderDisconnectClick
        end
        object PMISDisconnect: TMenuItem
          Caption = 'PI CCD'
          SubMenuImages = ToolbarImages
          Enabled = False
          ImageIndex = 12
          OnClick = PMISDisconnectClick
        end
        object FWDisconnect: TMenuItem
          Caption = 'Filters'
          SubMenuImages = ToolbarImages
          Enabled = False
          ImageIndex = 12
          OnClick = FWDisconnectClick
        end
        object C18Disconnect: TMenuItem
          Caption = 'Clouds Radar'
          SubMenuImages = ToolbarImages
          Enabled = False
          ImageIndex = 12
          OnClick = C18DisconnectClick
        end
        object WeatherDisconnect: TMenuItem
          Caption = 'Weather'
          Enabled = False
          ImageIndex = 12
          OnClick = WeatherDisconnectClick
        end
      end
    end
    object Dome1: TMenuItem
      Caption = '&Dome'
      SubMenuImages = ToolbarImages
      object SetSlitMenu: TMenuItem
        Caption = '&Dome Slit...'
        Enabled = False
        OnClick = btnClick
      end
      object SetAzimuthMenu: TMenuItem
        Caption = '&Slit Azimuth...'
        Enabled = False
        OnClick = btnClick
      end
      object SetVentsMenu: TMenuItem
        Caption = 'Open &Vents'
        Enabled = False
        Visible = False
      end
      object SetDomeTrackOn: TMenuItem
        Caption = 'Set &Dome Track Off'
        Enabled = False
        Visible = False
      end
      object SetDomeLightsOn1: TMenuItem
        Caption = 'Close Dome &Lights'
        Enabled = False
        Visible = False
      end
      object CloseAircondition1: TMenuItem
        Caption = 'Close &Air condition'
        Enabled = False
        Visible = False
      end
      object FlatLamp1: TMenuItem
        Caption = 'Flat &Lamp...'
        Enabled = False
        Visible = False
        OnClick = FlatLampMenu
      end
      object AutoDomeTrack: TMenuItem
        Caption = 'Dome Track Follows RA Track'
        Checked = True
        OnClick = AutoDomeTrackClick
      end
    end
    object Telescope1: TMenuItem
      Caption = '&Telescope'
      SubMenuImages = ToolbarImages
      object SetRATrackMenu: TMenuItem
        Caption = 'Set &R.A. Track...'
        Enabled = False
        OnClick = btnClick
      end
      object ShowPad1: TMenuItem
        Caption = 'Show Pad'
        Enabled = False
      end
    end
    object emperature1: TMenuItem
      Caption = 'Temperature'
      SubMenuImages = ToolbarImages
      Visible = False
      object CCDTempReadTemperature: TMenuItem
        Caption = 'Read Temperature'
        Enabled = False
      end
    end
    object FilterWheel2: TMenuItem
      Caption = 'Filter Wheel'
      SubMenuImages = ToolbarImages
      object FiltersTable1: TMenuItem
        Caption = 'Filters Table'
        Enabled = False
      end
      object FWReload: TMenuItem
        Caption = 'Reload'
        Enabled = False
        OnClick = FWReloadClick
      end
    end
    object Meteorology1: TMenuItem
      Caption = 'Meteorology'
      OnClick = Meteorology1Click
    end
    object Window1: TMenuItem
      Caption = 'Window'
      Visible = False
      object Clock1: TMenuItem
        Caption = 'Clock'
        OnClick = Clock1Click
      end
      object erminal1: TMenuItem
        Caption = 'Terminal'
        OnClick = erminal1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Contents1: TMenuItem
        Caption = '&Contents'
        Visible = False
      end
      object SiteInfo1: TMenuItem
        Caption = 'Site Info...'
        OnClick = SiteInfo1Click
      end
      object MeteorologyMnu: TMenuItem
        Caption = 'Meteorology'
        Visible = False
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = '&About...'
        OnClick = About1Click
      end
    end
  end
  object OpenListDlg: TOpenDialog
    DefaultExt = '*.lst'
    Filter = 'List files (*.lst)|*.lst|All files|*'
    InitialDir = 'c:\misc'
    Title = 'Load List File'
    Left = 572
    Top = 28
  end
  object SaveListDlg: TSaveDialog
    DefaultExt = '*.lst'
    Filter = 'List file (*.lst)|*.lst|All files|*'
    InitialDir = 'c:\misc'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 572
    Top = 84
  end
  object ClockUpdateTimer: TTimer
    Enabled = False
    OnTimer = UpdateClocks
    Left = 394
    Top = 176
  end
  object FilterSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = FilterSocketConnect
    OnDisconnect = FilterSocketDisconnect
    OnRead = FilterSocketRead
    OnError = FilterSocketError
    Left = 224
    Top = 72
  end
  object DomeSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = DomeSocketConnect
    OnDisconnect = DomeSocketDisconnect
    OnRead = DomeSocketRead
    OnError = DomeSocketError
    Left = 224
    Top = 120
  end
  object ScopeSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ScopeSocketConnect
    OnDisconnect = ScopeSocketDisconnect
    OnRead = ScopeSocketRead
    OnError = ScopeSocketError
    Left = 224
    Top = 176
  end
  object CCDTempSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = CCDTempSocketConnect
    OnDisconnect = CCDTempSocketDisconnect
    OnRead = CCDTempSocketRead
    OnError = CCDTempSocketError
    Left = 308
    Top = 72
  end
  object PMISSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = PMISSocketConnect
    OnDisconnect = PMISSocketDisconnect
    OnRead = PMISSocketRead
    OnError = PMISSocketError
    Left = 308
    Top = 120
  end
  object GoToTimer: TTimer
    Tag = -1
    Enabled = False
    Interval = 200
    OnTimer = GoToTimerTimer
    Left = 38
    Top = 360
  end
  object ListPopUp1: TPopupMenu
    Images = ToolbarImages
    Left = 304
    Top = 24
    object ListClose: TMenuItem
      Caption = '&Close'
      SubMenuImages = ToolbarImages
      ImageIndex = 3
      OnClick = ListCloseClick
    end
    object ListSave: TMenuItem
      Caption = '&Save'
      SubMenuImages = ToolbarImages
      ImageIndex = 4
      ShortCut = 16467
      OnClick = ListSaveClick
    end
    object ListSaveAs: TMenuItem
      Caption = 'Save &As...'
      SubMenuImages = ToolbarImages
      ImageIndex = 5
      OnClick = ListSaveAsClick
    end
    object ListReload: TMenuItem
      Caption = '&Reload'
      SubMenuImages = ToolbarImages
      Enabled = False
      ImageIndex = 2
      OnClick = ListReloadClick
    end
  end
  object ListPopUp2: TPopupMenu
    Left = 384
    Top = 24
    object Undo1: TMenuItem
      Caption = 'Undo'
      Visible = False
    end
    object Clear1: TMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object DelGridLine: TMenuItem
      Caption = 'Delete Line'
      OnClick = DelGridLineClick
    end
    object InsGridLine: TMenuItem
      Caption = 'Insert Line'
      OnClick = InsGridLineClick
    end
    object CopyPop: TMenuItem
      Caption = 'Copy'
    end
    object PastePop: TMenuItem
      Caption = 'Paste'
    end
  end
  object ToolbarImages: TImageList
    Left = 488
    Top = 180
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000084848400848484008484840084848400848484000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000848484008484840084848400848484008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084848400848484008484840084848400848484008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000CED6D600F7FF
      FF000000000000000000000000000000000000000000CED6D600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00C6C6
      C6000000FF00008484008484000084000000000084000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000848484008484
      8400000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00008484000000FF0084848400008400000000FF000000FF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000848484008484
      840084848400000000000000000000000000000000000000000084848400F7FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000FF000000FF000000FF000000FF0000008400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000A56B
      3900A56B390084840000CED6D60000000000000000008484000084848400C6C6
      C60084848400F7FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000F7FFFF00FFFF00008484000000000000FFFF000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000F7FFFF008484000084840000848400008484000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000FF000000FF000000FF000000FF000000840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      00000000FF000000FF0000848400848484000000FF000000FF0000848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000CED6D600FFFF000084840000848400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00C6C6
      C6000000FF000000FF008484840084848400848484000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000F7FFFF00000000008484840000FF
      FF00000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000084848400848484008484840084848400848484008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400008484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000840000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840084848400CED6
      D600848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000084000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840084848400848484008484840000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      000084000000840000008400000084000000FFFFFF00FFFFFF00FFFFFF000000
      000084848400848484008484840084848400848484000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000848484008484840084848400848484008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0084000000FFFFFF00FFFFFF0000008400FFFF
      FF0084848400848484008484840084848400848484008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000FF000000FF000000FF000000
      8400848484000000000084840000840000000000000084848400FFFFFF00FF00
      0000FF000000FF00000084000000000000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000FF00FFFFFF0000008400FFFF
      FF00848484000000000084000000000000000000000084848400FFFFFF00FFFF
      FF00FFFFFF008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840084848400848484008484840000000000FFFFFF00FFFF
      FF00FFFFFF008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000FF00FFFFFF00FFFFFF000000
      000084848400000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000FF00FFFFFF00FFFFFF000000
      000084848400848484008484840084848400848484000000000000000000FFFF
      FF00FFFFFF008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF0000000000848484008484840084848400848484008484840000000000FFFF
      FF00000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000FF0000008400000084000000
      0000848484008484840084848400848484008484840084848400000000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000084000000
      0000848484000000000000000000840000000000000084848400FFFFFF008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484000000000084000000000000000000000084848400FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000008484840084848400848484008484840000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000848400008484000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000008484000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000848400008484000000
      0000000000000000000000000000FFFFFF00FFFFFF0000000000008484000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000848400008484000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000848400008484000000
      0000000000000000000000000000000000000000000000848400008484000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000084840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008484000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000000000000084840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008484000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000084840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000008484000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000084840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000084840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000000000FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000000000FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      840000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000000000FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      840000848400000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFFFF00FFFFFF000084
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000000000FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      840000848400008484000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF000084
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000000000FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000840000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084
      0000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000000000FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000840000FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000000000FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF0000840000FFFFFF00FFFFFF000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF000084000000840000008400000084000000840000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084000000840000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000840000FFFFFF00FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000084000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000084000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000001FFFF000000000001BF8700000000
      0001BF870000000000018F8F000000000001C787000000000001C38700000000
      0001C183000000000001F03F000000000001F03F000000000001FC1F00000000
      0001FE03000000000001FF01000000000001FF81000000000001FF8100000000
      0001FFC3000000000001FFFF00000000FFFFFFFFFFFF0001F9FFFFFFFC000001
      F6CFFE0080000001F6B7FE0000000001F6B7FE0000000001F8B7800000000001
      FE8F800000010001FE3F800000030001FF7F800000030001FE3F800100030001
      FEBF800300030001FC9F80070FC30001FDDF807F00030001FDDF80FF80070001
      FDDF81FFF87F0001FFFFFFFFFFFF0001FFFF0001FFFFFFFFC0010001C007FFFF
      80310001BFEBFFFF803100010005FFFF803100017E31FFFF800100017E35FFF7
      800100010006C1F7800100017FEAC3FB8FF100018014C7FB8FF10001C00ACBFB
      8FF10001E001DCF78FF10001E007FF0F8FF10001F007FFFF8FF50001F003FFFF
      80010001F803FFFFFFFF0001FFFFFFFFFFFFFFFF00000000FFFFFFFF00000000
      C007001F00000000C007000F00000000C007000700000000C007000300000000
      C007000100000000C007000000000000C007001F00000000C007001F00000000
      C007001F00000000C0078FF100000000C00FFFF900000000C01FFF7500000000
      C03FFF8F00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object FiterMnu: TPopupMenu
    Left = 584
    Top = 184
    object B1: TMenuItem
      Caption = 'B'
    end
    object V1: TMenuItem
      Caption = 'V'
    end
    object R1: TMenuItem
      Caption = 'R'
    end
    object U1: TMenuItem
      Caption = 'U'
    end
  end
  object LaiwoSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientRead = LaiwoSocketClientRead
    Left = 312
    Top = 176
  end
  object C18Socket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = C18SocketConnect
    OnDisconnect = C18SocketDisconnect
    OnRead = C18SocketRead
    OnError = C18SocketError
    Left = 388
    Top = 72
  end
  object FocusSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = FocusSocketConnect
    OnDisconnect = FocusSocketDisconnect
    OnRead = FocusSocketRead
    OnError = FocusSocketError
    Left = 392
    Top = 120
  end
  object WeatherSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = WeatherSocketConnect
    OnDisconnect = WeatherSocketDisconnect
    OnRead = WeatherSocketRead
    OnError = WeatherSocketError
    Left = 488
    Top = 24
  end
  object ObsTimer: TTimer
    Enabled = False
    OnTimer = TakeExposure
    Left = 690
    Top = 584
  end
  object LaiwoScienceSocket: TClientSocket
    Active = False
    Address = '132.66.65.24'
    ClientType = ctNonBlocking
    Port = 9300
    OnConnect = LaiwoScienceSocketConnect
    OnDisconnect = LaiwoScienceSocketDisconnect
    OnRead = LaiwoScienceSocketRead
    OnError = LaiwoScienceSocketError
    Left = 488
    Top = 120
  end
  object LaiwoGuiderSocket: TClientSocket
    Active = False
    Address = '132.66.65.24'
    ClientType = ctNonBlocking
    Port = 9200
    OnConnect = LaiwoGuiderSocketConnect
    OnDisconnect = LaiwoGuiderSocketDisconnect
    OnRead = LaiwoGuiderSocketRead
    OnError = LaiwoGuiderSocketError
    Left = 488
    Top = 72
  end
  object rcServerSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientRead = rcServerSocketClientRead
    Left = 576
    Top = 120
  end
end
