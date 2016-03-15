object LogoutForm: TLogoutForm
  Left = 583
  Top = 157
  BorderStyle = bsDialog
  Caption = 'Login to Dome Agent'
  ClientHeight = 136
  ClientWidth = 172
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object UserTXT: TLabeledEdit
    Left = 80
    Top = 10
    Width = 80
    Height = 24
    EditLabel.Width = 66
    EditLabel.Height = 16
    EditLabel.Caption = 'Username:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    LabelSpacing = 6
    TabOrder = 0
    OnChange = TXTChange
  end
  object PassTXT: TLabeledEdit
    Left = 80
    Top = 40
    Width = 80
    Height = 24
    EditLabel.Width = 63
    EditLabel.Height = 16
    EditLabel.Caption = 'Password:'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'MS Sans Serif'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    LabelPosition = lpLeft
    LabelSpacing = 6
    PasswordChar = '*'
    TabOrder = 1
    OnChange = TXTChange
  end
  object NameTXT: TLabeledEdit
    Left = 80
    Top = 70
    Width = 80
    Height = 24
    EditLabel.Width = 40
    EditLabel.Height = 16
    EditLabel.Caption = 'Name:'
    LabelPosition = lpLeft
    LabelSpacing = 6
    TabOrder = 2
    OnChange = TXTChange
  end
  object LoginButton: TButton
    Left = 24
    Top = 104
    Width = 50
    Height = 25
    Caption = 'Login'
    Default = True
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
  end
  object ExitButton: TButton
    Left = 104
    Top = 104
    Width = 50
    Height = 25
    Caption = 'Exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
  end
end
