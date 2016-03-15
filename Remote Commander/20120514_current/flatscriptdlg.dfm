object FlatScriptDialog: TFlatScriptDialog
  Left = 708
  Top = 161
  Width = 300
  Height = 475
  Caption = 'FlatField Script'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FlatLabel1: TLabel
    Left = 13
    Top = 20
    Width = 201
    Height = 24
    Caption = 'Choose Flat Parameters'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object FlatLabel3: TLabel
    Left = 20
    Top = 117
    Width = 97
    Height = 20
    Caption = 'Choose filters'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object FlatLabel2: TLabel
    Left = 20
    Top = 59
    Width = 93
    Height = 20
    Caption = 'Choose Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object FlatLabel4: TLabel
    Left = 20
    Top = 234
    Width = 179
    Height = 20
    Caption = 'Number of Flats per Filter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object RadioSkyFF: TRadioButton
    Left = 20
    Top = 85
    Width = 78
    Height = 13
    Caption = 'Sky Flat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object RadioDomeFF: TRadioButton
    Left = 130
    Top = 85
    Width = 92
    Height = 13
    Caption = 'Dome Flat'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Filter1: TCheckBox
    Left = 26
    Top = 143
    Width = 79
    Height = 14
    Caption = 'Filter1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Filter2: TCheckBox
    Left = 26
    Top = 163
    Width = 79
    Height = 13
    Caption = 'Filter2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Filter3: TCheckBox
    Left = 26
    Top = 182
    Width = 79
    Height = 14
    Caption = 'Filter3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Filter4: TCheckBox
    Left = 26
    Top = 202
    Width = 79
    Height = 13
    Caption = 'Filter4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object Filter5: TCheckBox
    Left = 124
    Top = 143
    Width = 78
    Height = 14
    Caption = 'Filter5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Filter6: TCheckBox
    Left = 124
    Top = 163
    Width = 78
    Height = 13
    Caption = 'Filter6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object Filter7: TCheckBox
    Left = 124
    Top = 182
    Width = 78
    Height = 14
    Caption = 'Filter7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object Filter8: TCheckBox
    Left = 124
    Top = 202
    Width = 78
    Height = 13
    Caption = 'Filter8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object FlatSpin: TEdit
    Left = 33
    Top = 260
    Width = 33
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    Text = '4'
    OnChange = FlatSpinChange
  end
  object UpDown1: TUpDown
    Left = 66
    Top = 260
    Width = 13
    Height = 23
    Associate = FlatSpin
    Min = 1
    Max = 30
    Position = 4
    TabOrder = 11
    Wrap = False
  end
  object RunBtn: TButton
    Left = 33
    Top = 310
    Width = 76
    Height = 25
    Caption = 'Run'
    Default = True
    TabOrder = 12
    OnClick = RunBtnClick
  end
  object CancelBtn: TButton
    Left = 114
    Top = 310
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Exit'
    ModalResult = 2
    TabOrder = 13
    OnClick = ExitBtnClick
  end
  object FlatWaitScopeTimer: TTimer
    Enabled = False
    OnTimer = FlatWaitScopeTimerTimer
    Left = 136
    Top = 336
  end
  object FlatWaitCCDTimer: TTimer
    Enabled = False
    OnTimer = FlatWaitCCDTimerTimer
    Left = 160
    Top = 336
  end
  object FlatWaitSunTimer: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = FlatWaitSunTimerTimer
    Left = 184
    Top = 336
  end
end
