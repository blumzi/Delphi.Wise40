object PrefsForm: TPrefsForm
  Left = 480
  Top = 28
  Width = 591
  Height = 640
  Caption = 'Preferences'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Button1: TButton
    Left = 25
    Top = 553
    Width = 73
    Height = 24
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object CancelBtn: TButton
    Left = 112
    Top = 551
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object BtnApply: TButton
    Left = 489
    Top = 551
    Width = 73
    Height = 25
    Caption = 'Apply'
    Enabled = False
    TabOrder = 2
    OnClick = BtnApplyClick
  end
  object PrefsTab: TPageControl
    Left = 0
    Top = 16
    Width = 577
    Height = 529
    ActivePage = TabSheet4
    MultiLine = True
    TabIndex = 1
    TabOrder = 3
    object PrefComm: TTabSheet
      Caption = 'Communications'
      object Label1: TLabel
        Left = 112
        Top = 9
        Width = 12
        Height = 16
        Caption = 'IP'
      end
      object Label2: TLabel
        Left = 240
        Top = 9
        Width = 24
        Height = 16
        Caption = 'Port'
      end
      object Label3: TLabel
        Left = 9
        Top = 64
        Width = 41
        Height = 16
        Caption = 'Setting'
      end
      object Label4: TLabel
        Left = 9
        Top = 96
        Width = 32
        Height = 16
        Caption = 'PMIS'
      end
      object Label5: TLabel
        Left = 9
        Top = 137
        Width = 36
        Height = 16
        Caption = 'Filters'
      end
      object Label6: TLabel
        Left = 9
        Top = 160
        Width = 99
        Height = 16
        Caption = 'Tek temperature'
      end
      object Label7: TLabel
        Left = 9
        Top = 185
        Width = 37
        Height = 16
        Caption = 'Dome'
      end
      object Label10: TLabel
        Left = 16
        Top = 217
        Width = 77
        Height = 16
        Caption = 'Audio/Video'
      end
      object TeleIPME: TMaskEdit
        Left = 112
        Top = 57
        Width = 114
        Height = 24
        EditMask = '999.999.999.999;1; '
        MaxLength = 15
        TabOrder = 0
        Text = '   .   .   .   '
        OnChange = RemotePrefsModified
      end
      object DomeIPMe: TMaskEdit
        Left = 112
        Top = 185
        Width = 118
        Height = 24
        EditMask = '999.999.999.999;1; '
        MaxLength = 15
        TabOrder = 8
        Text = '   .   .   .   '
        OnChange = RemotePrefsModified
      end
      object TekIPME: TMaskEdit
        Left = 112
        Top = 89
        Width = 118
        Height = 24
        EditMask = '999.999.999.999;1; '
        MaxLength = 15
        TabOrder = 2
        Text = '   .   .   .   '
        OnChange = RemotePrefsModified
      end
      object FWIPMe: TMaskEdit
        Left = 112
        Top = 121
        Width = 118
        Height = 24
        EditMask = '999.999.999.999;1; '
        MaxLength = 15
        TabOrder = 4
        Text = '   .   .   .   '
        OnChange = RemotePrefsModified
      end
      object TekTempIPMe: TMaskEdit
        Left = 112
        Top = 153
        Width = 118
        Height = 24
        EditMask = '999.999.999.999;1; '
        MaxLength = 15
        TabOrder = 6
        Text = '   .   .   .   '
        OnChange = RemotePrefsModified
      end
      object FWPortE: TEdit
        Left = 240
        Top = 121
        Width = 49
        Height = 24
        MaxLength = 4
        TabOrder = 5
        OnChange = RemotePrefsModified
      end
      object TekTempPortE: TEdit
        Left = 240
        Top = 153
        Width = 49
        Height = 24
        MaxLength = 4
        TabOrder = 7
        OnChange = RemotePrefsModified
      end
      object TekPortE: TEdit
        Left = 240
        Top = 89
        Width = 49
        Height = 24
        MaxLength = 4
        TabOrder = 3
        OnChange = RemotePrefsModified
      end
      object DomePortE: TEdit
        Left = 240
        Top = 185
        Width = 49
        Height = 24
        MaxLength = 4
        TabOrder = 9
        OnChange = RemotePrefsModified
      end
      object TelePortE: TEdit
        Left = 240
        Top = 57
        Width = 49
        Height = 24
        MaxLength = 4
        TabOrder = 1
        OnChange = RemotePrefsModified
      end
      object MicIPME: TMaskEdit
        Left = 112
        Top = 217
        Width = 118
        Height = 24
        EditMask = '999.999.999.999;1; '
        MaxLength = 15
        TabOrder = 10
        Text = '   .   .   .   '
        OnChange = RemotePrefsModified
      end
      object GroupBox3: TGroupBox
        Left = 16
        Top = 249
        Width = 241
        Height = 104
        Caption = 'Netmeeting'
        TabOrder = 11
        object NetMeetOption0R: TRadioButton
          Left = 9
          Top = 16
          Width = 136
          Height = 17
          Caption = 'Use system default'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RemotePrefsModified
        end
        object NetMeetOption1R: TRadioButton
          Left = 9
          Top = 41
          Width = 104
          Height = 16
          Caption = 'Use specified program'
          TabOrder = 1
          OnClick = RemotePrefsModified
        end
        object NetMeetPathE: TEdit
          Left = 9
          Top = 64
          Width = 184
          Height = 24
          Enabled = False
          TabOrder = 2
        end
        object NetMeetPathBtn: TBitBtn
          Left = 208
          Top = 64
          Width = 25
          Height = 25
          ModalResult = 5
          TabOrder = 3
          OnClick = PathBtnClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000008484000084840000848400008484000084840000848400008484000084
            84000084840000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
            FF00000000000084840000848400008484000084840000848400008484000084
            8400008484000084840000000000FF00FF00FF00FF00FF00FF0000000000FFFF
            FF0000FFFF000000000000848400008484000084840000848400008484000084
            840000848400008484000084840000000000FF00FF00FF00FF000000000000FF
            FF00FFFFFF0000FFFF0000000000008484000084840000848400008484000084
            84000084840000848400008484000084840000000000FF00FF0000000000FFFF
            FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000000FF
            FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
            FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
            FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
            FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Local / Misc'
      ImageIndex = 3
      object GroupBox1: TGroupBox
        Left = 16
        Top = 9
        Width = 521
        Height = 152
        Caption = 'Object Lists'
        TabOrder = 0
        object Label8: TLabel
          Left = 218
          Top = 116
          Width = 4
          Height = 16
          Caption = '-'
        end
        object LisPathE: TLabeledEdit
          Left = 89
          Top = 25
          Width = 192
          Height = 24
          EditLabel.Width = 89
          EditLabel.Height = 19
          EditLabel.Caption = 'Default Path'
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 0
          OnChange = RemotePrefsModified
        end
        object SpinEdit1: TSpinEdit
          Left = 121
          Top = 57
          Width = 40
          Height = 26
          MaxValue = 15
          MinValue = 0
          TabOrder = 1
          Value = 4
          OnChange = RemotePrefsModified
        end
        object CheckBox1: TCheckBox
          Left = 16
          Top = 57
          Width = 97
          Height = 16
          Caption = 'Recent Lists'
          TabOrder = 2
        end
        object Edit7: TEdit
          Left = 224
          Top = 112
          Width = 41
          Height = 24
          Enabled = False
          MaxLength = 4
          TabOrder = 3
          Text = '2050'
          OnChange = RemotePrefsModified
        end
        object Edit6: TEdit
          Left = 176
          Top = 112
          Width = 41
          Height = 24
          Enabled = False
          MaxLength = 4
          TabOrder = 4
          Text = '1950'
          OnChange = RemotePrefsModified
        end
        object RadioButton2: TRadioButton
          Left = 16
          Top = 112
          Width = 161
          Height = 17
          Caption = 'Allow epochs in range'
          TabOrder = 5
        end
        object RadioButton1: TRadioButton
          Left = 16
          Top = 89
          Width = 121
          Height = 16
          Caption = 'Allow any epoch'
          Checked = True
          TabOrder = 6
          TabStop = True
        end
        object LisPathBtn: TBitBtn
          Left = 288
          Top = 25
          Width = 25
          Height = 24
          ModalResult = 5
          TabOrder = 7
          OnClick = PrefsDirSelect
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000008484000084840000848400008484000084840000848400008484000084
            84000084840000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
            FF00000000000084840000848400008484000084840000848400008484000084
            8400008484000084840000000000FF00FF00FF00FF00FF00FF0000000000FFFF
            FF0000FFFF000000000000848400008484000084840000848400008484000084
            840000848400008484000084840000000000FF00FF00FF00FF000000000000FF
            FF00FFFFFF0000FFFF0000000000008484000084840000848400008484000084
            84000084840000848400008484000084840000000000FF00FF0000000000FFFF
            FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000000FF
            FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
            FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
            FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
            FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 160
        Width = 521
        Height = 329
        Caption = 'Finding Charts '
        TabOrder = 1
        object FchartPathE: TLabeledEdit
          Left = 89
          Top = 48
          Width = 288
          Height = 24
          EditLabel.Width = 89
          EditLabel.Height = 20
          EditLabel.Caption = 'Default Path'
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 0
          OnChange = RemotePrefsModified
        end
        object FchartExtnE: TLabeledEdit
          Left = 89
          Top = 80
          Width = 120
          Height = 24
          EditLabel.Width = 86
          EditLabel.Height = 20
          EditLabel.Caption = 'Default Extn'
          LabelPosition = lpLeft
          LabelSpacing = 3
          MaxLength = 6
          TabOrder = 1
          OnChange = RemotePrefsModified
        end
        object FchartPathBtn: TBitBtn
          Left = 400
          Top = 48
          Width = 25
          Height = 25
          ModalResult = 5
          TabOrder = 2
          OnClick = PrefsDirSelect
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
            0000008484000084840000848400008484000084840000848400008484000084
            84000084840000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
            FF00000000000084840000848400008484000084840000848400008484000084
            8400008484000084840000000000FF00FF00FF00FF00FF00FF0000000000FFFF
            FF0000FFFF000000000000848400008484000084840000848400008484000084
            840000848400008484000084840000000000FF00FF00FF00FF000000000000FF
            FF00FFFFFF0000FFFF0000000000008484000084840000848400008484000084
            84000084840000848400008484000084840000000000FF00FF0000000000FFFF
            FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000000000FF
            FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
            FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
            FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
            FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
            000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
            FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object GroupBox4: TGroupBox
          Left = 2
          Top = 190
          Width = 517
          Height = 139
          Caption = 'Internet Browser'
          TabOrder = 3
          object BrowserOption0R: TRadioButton
            Left = 9
            Top = 16
            Width = 136
            Height = 17
            Caption = 'Use system default'
            TabOrder = 0
            OnClick = RemotePrefsModified
          end
          object BrowserOption2R: TRadioButton
            Left = 377
            Top = 16
            Width = 128
            Height = 17
            Caption = 'Specify program'
            TabOrder = 1
            OnClick = RemotePrefsModified
          end
          object BrowserPathE: TEdit
            Left = 9
            Top = 41
            Width = 400
            Height = 24
            Enabled = False
            TabOrder = 2
            OnChange = RemotePrefsModified
          end
          object BrowserPathBtn: TBitBtn
            Left = 416
            Top = 41
            Width = 25
            Height = 24
            Enabled = False
            ModalResult = 5
            TabOrder = 3
            OnClick = PathBtnClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000008484000084840000848400008484000084840000848400008484000084
              84000084840000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
              FF00000000000084840000848400008484000084840000848400008484000084
              8400008484000084840000000000FF00FF00FF00FF00FF00FF0000000000FFFF
              FF0000FFFF000000000000848400008484000084840000848400008484000084
              840000848400008484000084840000000000FF00FF00FF00FF000000000000FF
              FF00FFFFFF0000FFFF0000000000008484000084840000848400008484000084
              84000084840000848400008484000084840000000000FF00FF0000000000FFFF
              FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000000000FF
              FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
              FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
              FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
              000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
              FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
          object LabeledEdit3: TLabeledEdit
            Left = 96
            Top = 73
            Width = 313
            Height = 24
            EditLabel.Width = 80
            EditLabel.Height = 19
            EditLabel.Caption = 'Query Site:'
            LabelPosition = lpLeft
            LabelSpacing = 3
            TabOrder = 4
            Text = 'http://'
            OnChange = RemotePrefsModified
          end
          object LabeledEdit8: TLabeledEdit
            Left = 96
            Top = 105
            Width = 313
            Height = 24
            EditLabel.Width = 93
            EditLabel.Height = 19
            EditLabel.Caption = 'Query String:'
            LabelPosition = lpLeft
            LabelSpacing = 3
            TabOrder = 5
            OnChange = RemotePrefsModified
          end
          object BrowserOption1R: TRadioButton
            Left = 153
            Top = 16
            Width = 208
            Height = 17
            Caption = 'Use Microsoft Internet Explorer'
            TabOrder = 6
            OnClick = RemotePrefsModified
          end
        end
        object CheckBox4: TCheckBox
          Left = 9
          Top = 25
          Width = 160
          Height = 16
          Caption = 'Query local charts first'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object GroupBox7: TGroupBox
          Left = 4
          Top = 110
          Width = 517
          Height = 75
          Caption = 'Image Viewer '
          TabOrder = 5
          object ImgViewerOption0R: TRadioButton
            Left = 9
            Top = 16
            Width = 136
            Height = 17
            Caption = 'Use system default'
            TabOrder = 0
            OnClick = RemotePrefsModified
          end
          object ImgViewerOption1R: TRadioButton
            Left = 160
            Top = 16
            Width = 169
            Height = 17
            Caption = 'Use specified program'
            TabOrder = 1
            OnClick = RemotePrefsModified
          end
          object ImgViewerPathE: TEdit
            Left = 9
            Top = 41
            Width = 400
            Height = 24
            Enabled = False
            TabOrder = 2
            OnChange = RemotePrefsModified
          end
          object ImgViewerPathBtn: TBitBtn
            Left = 416
            Top = 41
            Width = 25
            Height = 24
            Enabled = False
            ModalResult = 5
            TabOrder = 3
            OnClick = PathBtnClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
              0000008484000084840000848400008484000084840000848400008484000084
              84000084840000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
              FF00000000000084840000848400008484000084840000848400008484000084
              8400008484000084840000000000FF00FF00FF00FF00FF00FF0000000000FFFF
              FF0000FFFF000000000000848400008484000084840000848400008484000084
              840000848400008484000084840000000000FF00FF00FF00FF000000000000FF
              FF00FFFFFF0000FFFF0000000000008484000084840000848400008484000084
              84000084840000848400008484000084840000000000FF00FF0000000000FFFF
              FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
              00000000000000000000000000000000000000000000000000000000000000FF
              FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
              FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
              FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
              000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
              FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
              00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
        end
      end
    end
    object PrefExtrn: TTabSheet
      Caption = 'Observatory Settings'
      ImageIndex = 1
      object GroupBox5: TGroupBox
        Left = 25
        Top = 25
        Width = 208
        Height = 144
        Caption = 'Dome Azimuths'
        TabOrder = 0
        object LabeledEdit4: TLabeledEdit
          Left = 96
          Top = 48
          Width = 73
          Height = 21
          EditLabel.Width = 107
          EditLabel.Height = 20
          EditLabel.Caption = 'Dome flat park'
          Enabled = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          MaxLength = 10
          TabOrder = 0
        end
        object LabeledEdit5: TLabeledEdit
          Left = 96
          Top = 80
          Width = 73
          Height = 21
          EditLabel.Width = 82
          EditLabel.Height = 20
          EditLabel.Caption = 'Zenith Park'
          Enabled = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          MaxLength = 10
          TabOrder = 1
        end
        object LabeledEdit7: TLabeledEdit
          Left = 96
          Top = 112
          Width = 73
          Height = 21
          EditLabel.Width = 86
          EditLabel.Height = 20
          EditLabel.Caption = 'Open Vents'
          Enabled = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          MaxLength = 10
          TabOrder = 2
        end
        object CheckBox3: TCheckBox
          Left = 9
          Top = 25
          Width = 136
          Height = 16
          Caption = 'Use local settings'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
      end
      object GroupBox6: TGroupBox
        Left = 240
        Top = 25
        Width = 321
        Height = 144
        Caption = 'Telescope Positions'
        TabOrder = 1
        object Label9: TLabel
          Left = 112
          Top = 57
          Width = 19
          Height = 16
          Caption = 'HA'
          Enabled = False
        end
        object Label11: TLabel
          Left = 176
          Top = 57
          Width = 25
          Height = 16
          Caption = 'Dec'
          Enabled = False
        end
        object Label12: TLabel
          Left = 16
          Top = 73
          Width = 62
          Height = 16
          Caption = 'Dome Flat'
          Enabled = False
        end
        object Label13: TLabel
          Left = 16
          Top = 105
          Width = 67
          Height = 16
          Caption = 'Cover Park'
          Enabled = False
        end
        object MaskEdit3: TMaskEdit
          Left = 89
          Top = 73
          Width = 65
          Height = 21
          Enabled = False
          EditMask = '00:00:00.0;1; '
          MaxLength = 10
          TabOrder = 0
          Text = '  :  :  . '
        end
        object MaskEdit4: TMaskEdit
          Left = 155
          Top = 73
          Width = 67
          Height = 21
          Enabled = False
          EditMask = 'a00:00:00.0;1; '
          MaxLength = 11
          TabOrder = 1
          Text = '   :  :  . '
        end
        object MaskEdit9: TMaskEdit
          Left = 89
          Top = 105
          Width = 65
          Height = 21
          Enabled = False
          EditMask = '00:00:00.0;1; '
          MaxLength = 10
          TabOrder = 2
          Text = '  :  :  . '
        end
        object MaskEdit11: TMaskEdit
          Left = 155
          Top = 105
          Width = 67
          Height = 21
          Enabled = False
          EditMask = 'a00:00:00.0;1; '
          MaxLength = 11
          TabOrder = 3
          Text = '   :  :  . '
        end
        object CheckBox2: TCheckBox
          Left = 16
          Top = 32
          Width = 137
          Height = 17
          Caption = 'Use local settings'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Sounds'
      ImageIndex = 3
      object ListBox1: TListBox
        Left = 32
        Top = 57
        Width = 185
        Height = 96
        ItemHeight = 16
        Items.Strings = (
          'Socket Connect'
          'Socket Disonnect'
          'Filter Wheel Error'
          'Filter Wheel EditMode'
          'CCD Hot'
          'End Exposure'
          'End Exposure Sequence')
        TabOrder = 0
      end
      object VolumeGroup: TGroupBox
        Left = 32
        Top = 345
        Width = 497
        Height = 136
        Caption = 'Volume'
        TabOrder = 1
        object Label14: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 16
          Caption = 'Left:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 10
          Top = 64
          Width = 41
          Height = 16
          Caption = 'Right:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 230
          Top = 25
          Width = 24
          Height = 16
          Caption = 'Low'
        end
        object Label17: TLabel
          Left = 230
          Top = 64
          Width = 24
          Height = 16
          Caption = 'Low'
        end
        object Label18: TLabel
          Left = 430
          Top = 25
          Width = 28
          Height = 16
          Caption = 'High'
        end
        object Label19: TLabel
          Left = 430
          Top = 64
          Width = 28
          Height = 16
          Caption = 'High'
        end
        object VolumeLeftTB: TTrackBar
          Left = 260
          Top = 25
          Width = 170
          Height = 44
          LineSize = 0
          Max = 100
          Orientation = trHorizontal
          PageSize = 3
          Frequency = 10
          Position = 0
          SelEnd = 0
          SelStart = 0
          TabOrder = 0
          ThumbLength = 15
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = VolumeTBChange
        end
        object VolumeRightTB: TTrackBar
          Left = 260
          Top = 64
          Width = 170
          Height = 46
          LineSize = 10
          Max = 100
          Orientation = trHorizontal
          PageSize = 3
          Frequency = 10
          Position = 0
          SelEnd = 0
          SelStart = 0
          TabOrder = 1
          ThumbLength = 15
          TickMarks = tmBottomRight
          TickStyle = tsAuto
          OnChange = VolumeTBChange
        end
        object VolumLeftMute: TCheckBox
          Left = 110
          Top = 25
          Width = 57
          Height = 16
          Caption = 'Mute'
          TabOrder = 2
          OnClick = VolumMuteClick
        end
        object VolumRightMute: TCheckBox
          Left = 110
          Top = 64
          Width = 57
          Height = 17
          Caption = 'Mute'
          TabOrder = 3
          OnClick = VolumMuteClick
        end
        object SameVolume: TCheckBox
          Left = 9
          Top = 96
          Width = 224
          Height = 17
          Caption = 'Move both sliders at the same time'
          TabOrder = 4
        end
      end
      object BitBtn1: TBitBtn
        Left = 233
        Top = 169
        Width = 24
        Height = 24
        TabOrder = 2
        Glyph.Data = {
          8E040000424D8E040000000000003604000028000000070000000B0000000100
          080000000000580000007412000074120000000100000001000000000000DEEF
          EF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00010101010101
          0100010001010101010001000001010101000100000001010100010000000001
          0100010000000000010001000000000101000100000001010100010000010101
          010001000101010101000101010101010100}
        Layout = blGlyphTop
      end
      object ComboBox1: TComboBox
        Left = 32
        Top = 169
        Width = 185
        Height = 24
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 3
        Text = '(none)'
        Items.Strings = (
          '(none)'
          'Critical')
      end
      object BitBtn2: TBitBtn
        Left = 272
        Top = 169
        Width = 25
        Height = 24
        ModalResult = 5
        TabOrder = 4
        OnClick = PrefsDirSelect
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
          0000008484000084840000848400008484000084840000848400008484000084
          84000084840000000000FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
          FF00000000000084840000848400008484000084840000848400008484000084
          8400008484000084840000000000FF00FF00FF00FF00FF00FF0000000000FFFF
          FF0000FFFF000000000000848400008484000084840000848400008484000084
          840000848400008484000084840000000000FF00FF00FF00FF000000000000FF
          FF00FFFFFF0000FFFF0000000000008484000084840000848400008484000084
          84000084840000848400008484000084840000000000FF00FF0000000000FFFF
          FF0000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000000FF
          FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFF
          FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
          FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FF00
          FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      end
    end
  end
  object PrefsFileDlg: TOpenDialog
    Filter = 'Programs (*.exe, *.com)|*.exe; *.com|All Programs|*.*'
    Left = 496
    Top = 488
  end
end
