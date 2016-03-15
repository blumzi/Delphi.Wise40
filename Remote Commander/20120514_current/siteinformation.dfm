object SiteInfo: TSiteInfo
  Left = 634
  Top = 65
  Width = 236
  Height = 425
  Caption = 'Site Information'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object LabelEvening: TLabel
    Left = 51
    Top = 160
    Width = 59
    Height = 20
    Caption = 'Evening'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelMorning: TLabel
    Left = 126
    Top = 160
    Width = 60
    Height = 20
    Caption = 'Morning'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object SetE: TLabel
    Left = 60
    Top = 188
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object RiseM: TLabel
    Left = 136
    Top = 188
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label00: TLabel
    Left = 16
    Top = 188
    Width = 20
    Height = 20
    Caption = ' 0'#176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label06: TLabel
    Left = 15
    Top = 216
    Width = 22
    Height = 20
    Caption = '-6'#176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CivilM: TLabel
    Left = 136
    Top = 216
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CivilE: TLabel
    Left = 60
    Top = 216
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object NautE: TLabel
    Left = 60
    Top = 244
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object NautM: TLabel
    Left = 136
    Top = 244
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 11
    Top = 244
    Width = 31
    Height = 20
    Caption = '-12'#176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel
    Left = 9
    Top = 272
    Width = 35
    Height = 20
    Caption = '-18'#176' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object AstroM: TLabel
    Left = 136
    Top = 272
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object AstroE: TLabel
    Left = 60
    Top = 272
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelMoon2: TLabel
    Left = 16
    Top = 333
    Width = 79
    Height = 20
    Caption = 'Moon Rise'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Moon1E: TLabel
    Left = 136
    Top = 305
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object TwilightDate: TLabel
    Left = 48
    Top = 136
    Width = 104
    Height = 20
    Caption = 'Twilights (UT)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelLong: TLabel
    Left = 16
    Top = 40
    Width = 42
    Height = 20
    Caption = 'Long:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelLat: TLabel
    Left = 16
    Top = 65
    Width = 29
    Height = 20
    Caption = 'Lat:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelAlt: TLabel
    Left = 16
    Top = 90
    Width = 25
    Height = 20
    Caption = 'Alt:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ESiteName: TLabel
    Left = 16
    Top = 12
    Width = 86
    Height = 25
    Caption = 'SiteName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object ESiteLong: TLabel
    Left = 70
    Top = 40
    Width = 82
    Height = 20
    Caption = 'Longitude: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object EsiteLat: TLabel
    Left = 70
    Top = 65
    Width = 60
    Height = 20
    Caption = 'Latitude'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object EsiteAlt: TLabel
    Left = 70
    Top = 90
    Width = 61
    Height = 20
    Caption = 'Altitude:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelMoon1: TLabel
    Left = 16
    Top = 305
    Width = 79
    Height = 20
    Caption = 'Moon Rise'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Moon2E: TLabel
    Left = 136
    Top = 333
    Width = 41
    Height = 20
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Close: TButton
    Left = 79
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = CloseClick
  end
end
