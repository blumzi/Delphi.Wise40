object Wise_Meteorology: TWise_Meteorology
  Left = 1010
  Top = 365
  Width = 237
  Height = 274
  Caption = 'Meteorology'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 13
  object TemperatureE: TLabeledEdit
    Left = 148
    Top = 26
    Width = 60
    Height = 28
    EditLabel.Width = 123
    EditLabel.Height = 20
    EditLabel.Caption = 'Temperature ['#176'C] '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    TabOrder = 0
    Text = '20'
  end
  object PressureE: TLabeledEdit
    Left = 148
    Top = 155
    Width = 60
    Height = 28
    EditLabel.Width = 115
    EditLabel.Height = 20
    EditLabel.Caption = 'Pressure [mbar] '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    TabOrder = 1
    Text = '920'
  end
  object HumidityE: TLabeledEdit
    Left = 148
    Top = 59
    Width = 60
    Height = 28
    EditLabel.Width = 91
    EditLabel.Height = 20
    EditLabel.Caption = 'Humidity [%] '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    TabOrder = 2
    Text = '50'
  end
  object Button1: TButton
    Left = 80
    Top = 200
    Width = 73
    Height = 25
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object TransCoord: TCheckBox
    Left = 5
    Top = 2
    Width = 131
    Height = 20
    Caption = 'Transform coordinates'
    TabOrder = 4
    Visible = False
  end
  object WindSpeedE: TLabeledEdit
    Left = 148
    Top = 91
    Width = 60
    Height = 28
    EditLabel.Width = 137
    EditLabel.Height = 20
    EditLabel.Caption = 'Wind Speed [km/h] '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    TabOrder = 5
    Text = '10'
  end
  object WindDirE: TLabeledEdit
    Left = 148
    Top = 123
    Width = 60
    Height = 28
    EditLabel.Width = 119
    EditLabel.Height = 20
    EditLabel.Caption = 'Wind Azimuth ['#176'] '
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -16
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 3
    ParentFont = False
    TabOrder = 6
    Text = '300'
  end
end
