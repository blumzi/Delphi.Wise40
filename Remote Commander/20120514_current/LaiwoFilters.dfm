object LaiwoFiltersSetup: TLaiwoFiltersSetup
  Left = 487
  Top = 152
  Width = 292
  Height = 289
  Caption = 'Laiwo Filters Setup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 76
    Width = 11
    Height = 22
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 115
    Width = 11
    Height = 22
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 157
    Width = 11
    Height = 22
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 16
    Width = 243
    Height = 22
    Caption = #39'Enter/Confirm LAIWO Filters'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 80
    Top = 72
    Width = 81
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 80
    Top = 112
    Width = 81
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 80
    Top = 152
    Width = 81
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 32
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object RadioButton1: TRadioButton
    Left = 168
    Top = 80
    Width = 25
    Height = 17
    TabOrder = 5
  end
  object RadioButton2: TRadioButton
    Left = 168
    Top = 120
    Width = 25
    Height = 17
    TabOrder = 6
  end
  object RadioButton3: TRadioButton
    Left = 168
    Top = 160
    Width = 25
    Height = 17
    TabOrder = 7
  end
end
