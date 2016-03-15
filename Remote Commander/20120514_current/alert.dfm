object AlertForm: TAlertForm
  Left = 258
  Top = 195
  Width = 639
  Height = 296
  Caption = 'Alert!'
  Color = clRed
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object AlertTxt: TLabel
    Left = 24
    Top = 80
    Width = 57
    Height = 36
    Caption = 'alert'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 264
    Top = 216
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
end
