object Form1: TForm1
  Left = 1014
  Top = 337
  Width = 626
  Height = 525
  Caption = 'Dome Az Encoder'
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
    Top = 464
    Width = 257
    Height = 17
    AutoSize = False
  end
  object ConfigurationBox: TGroupBox
    Left = 8
    Top = 8
    Width = 257
    Height = 385
    Caption = ' Configuration '
    TabOrder = 0
    object nBitsLabel: TLabel
      Left = 72
      Top = 344
      Width = 29
      Height = 13
      Caption = 'Ticks:'
    end
    object lastMask: TLabeledEdit
      Left = 112
      Top = 272
      Width = 33
      Height = 21
      EditLabel.Width = 75
      EditLabel.Height = 13
      EditLabel.Caption = 'Last Daq Mask:'
      LabelPosition = lpLeft
      LabelSpacing = 8
      TabOrder = 0
      Text = '$ff'
    end
    object Daqs: TGroupBox
      Left = 8
      Top = 16
      Width = 241
      Height = 241
      Caption = ' Daqs '
      TabOrder = 1
      object DaqBox0: TGroupBox
        Left = 8
        Top = 24
        Width = 217
        Height = 49
        Caption = ' First Daq '
        TabOrder = 0
        object PortSelector0: TComboBox
          Left = 80
          Top = 16
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'None'
        end
        object BoardSelector0: TComboBox
          Left = 8
          Top = 16
          Width = 65
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = 'Board 0'
          OnChange = ChangeBoard
          Items.Strings = (
            'Board 0'
            'Board 1'
            'Board 2')
        end
      end
      object DaqBox1: TGroupBox
        Left = 8
        Top = 80
        Width = 217
        Height = 41
        Caption = ' Second Daq '
        TabOrder = 1
        object BoardSelector1: TComboBox
          Left = 8
          Top = 16
          Width = 65
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Board 0'
          OnChange = ChangeBoard
          Items.Strings = (
            'Board 0'
            'Board 1'
            'Board 2')
        end
        object PortSelector1: TComboBox
          Left = 80
          Top = 16
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = 'None'
        end
      end
      object DaqBox2: TGroupBox
        Left = 8
        Top = 128
        Width = 217
        Height = 49
        Caption = ' Third Daq '
        TabOrder = 2
        object BoardSelector2: TComboBox
          Left = 8
          Top = 20
          Width = 65
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Board 0'
          OnChange = ChangeBoard
          Items.Strings = (
            'Board 0'
            'Board 1'
            'Board 2')
        end
        object PortSelector2: TComboBox
          Left = 80
          Top = 20
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = 'None'
        end
      end
      object DaqBox3: TGroupBox
        Left = 8
        Top = 184
        Width = 217
        Height = 49
        Caption = ' Fourth Daq '
        TabOrder = 3
        object BoardSelector3: TComboBox
          Left = 8
          Top = 20
          Width = 65
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Board 0'
          OnChange = ChangeBoard
          Items.Strings = (
            'Board 0'
            'Board 1'
            'Board 2')
        end
        object PortSelector3: TComboBox
          Left = 80
          Top = 20
          Width = 121
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = 'None'
        end
      end
    end
    object GrayBox: TCheckBox
      Left = 72
      Top = 320
      Width = 49
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Gray:'
      TabOrder = 2
    end
    object TicksValue: TStaticText
      Left = 108
      Top = 344
      Width = 116
      Height = 12
      AutoSize = False
      TabOrder = 3
    end
    object OkBox: TCheckBox
      Left = 16
      Top = 360
      Width = 41
      Height = 17
      Caption = 'OK'
      TabOrder = 4
      OnClick = RedefineEncoder
    end
    object TicksPerRevolution: TLabeledEdit
      Left = 112
      Top = 296
      Width = 41
      Height = 21
      EditLabel.Width = 70
      EditLabel.Height = 13
      EditLabel.Caption = 'Ticks/360deg:'
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 5
    end
  end
  object ValueBox: TGroupBox
    Left = 8
    Top = 400
    Width = 257
    Height = 57
    Caption = ' Value '
    TabOrder = 1
    object ClicksLabel: TLabel
      Left = 56
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Tlicks:'
    end
    object ClicksValue: TLabel
      Left = 99
      Top = 16
      Width = 125
      Height = 13
      AutoSize = False
    end
    object AzimuthLabel: TLabel
      Left = 48
      Top = 32
      Width = 40
      Height = 13
      Caption = 'Azimuth:'
    end
    object AzimuthValue: TLabel
      Left = 99
      Top = 32
      Width = 109
      Height = 13
      AutoSize = False
    end
  end
  object EncoderSelector: TRadioGroup
    Left = 272
    Top = 8
    Width = 329
    Height = 49
    Caption = ' Encoder Selector '
    Columns = 4
    Items.Strings = (
      'Dome'
      'Tele. HA'
      'Tele. RA'
      'Tele. Dec')
    TabOrder = 2
    OnClick = ChangeEncoder
  end
  object DomeBox: TGroupBox
    Left = 272
    Top = 64
    Width = 329
    Height = 129
    Caption = ' Dome Controls '
    TabOrder = 3
    object DomeLabel: TLabel
      Left = 80
      Top = 32
      Width = 31
      Height = 13
      Caption = 'Dome:'
    end
    object CaliLabel: TLabel
      Left = 24
      Top = 32
      Width = 3
      Height = 13
    end
    object DomeLeft: TButton
      Left = 128
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Left'
      TabOrder = 0
      OnMouseDown = DomeLeftStart
      OnMouseUp = DomeLeftStop
    end
    object DomeRight: TButton
      Left = 224
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Right'
      TabOrder = 1
      OnMouseDown = DomeRightStart
      OnMouseUp = DomeRightStop
    end
    object ManualAz: TLabeledEdit
      Left = 128
      Top = 92
      Width = 73
      Height = 21
      EditLabel.Width = 29
      EditLabel.Height = 13
      EditLabel.Caption = 'Goto: '
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 2
      OnKeyPress = ManualAzKeyPress
    end
    object CaliButton: TBitBtn
      Left = 128
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Find Calib.'
      TabOrder = 3
      OnClick = CaliButtonClick
    end
    object StopButton: TBitBtn
      Left = 224
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Stop'
      TabOrder = 4
      OnClick = StopButtonClick
    end
  end
  object TelescopeControls: TGroupBox
    Left = 272
    Top = 200
    Width = 329
    Height = 129
    Caption = ' Telescope Controls '
    TabOrder = 4
    object RaLabel: TLabel
      Left = 40
      Top = 40
      Width = 80
      Height = 13
      Caption = 'Right Ascension:'
    end
    object HaLabel: TLabel
      Left = 64
      Top = 72
      Width = 56
      Height = 13
      Caption = 'Hour Angle:'
    end
    object DecLabel: TLabel
      Left = 64
      Top = 104
      Width = 56
      Height = 13
      Caption = 'Declination:'
    end
    object RaUpButton: TButton
      Left = 128
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Increase'
      TabOrder = 0
    end
    object RaDownButton: TButton
      Left = 224
      Top = 32
      Width = 75
      Height = 25
      Caption = 'Decrease'
      TabOrder = 1
    end
    object HaUpButton: TButton
      Left = 128
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Increase'
      TabOrder = 2
    end
    object HaDownButton: TButton
      Left = 224
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Decrease'
      TabOrder = 3
    end
    object DecUpButton: TButton
      Left = 128
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Increase'
      TabOrder = 4
    end
    object DecDownButton: TButton
      Left = 224
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Decrease'
      TabOrder = 5
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
    OnTimer = PortStatusTimerTick
    Left = 32
    Top = 704
  end
end
