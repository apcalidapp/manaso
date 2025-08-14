object Fconsentimientodatos: TFconsentimientodatos
  Left = 368
  Top = 305
  BorderStyle = bsDialog
  Caption = 'Consentimiento de datos'
  ClientHeight = 139
  ClientWidth = 738
  Color = 12114134
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object gbprincipal: TGroupBox
    Left = 1
    Top = 1
    Width = 728
    Height = 99
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 31
      Width = 88
      Height = 13
      Caption = 'Fecha de Firma'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 47
      Width = 91
      Height = 13
      Caption = 'Consentimiento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 185
      Top = 47
      Width = 91
      Height = 13
      Caption = 'Consentimiento:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 185
      Top = 31
      Width = 26
      Height = 13
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 453
      Top = 47
      Width = 95
      Height = 13
      Caption = 'Consentimiento :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 453
      Top = 31
      Width = 86
      Height = 13
      Caption = #193'rea de Origen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dtpFecFirCon: TwwDBDateTimePicker
      Left = 97
      Top = 38
      Width = 85
      Height = 21
      BiDiMode = bdLeftToRight
      AutoSize = False
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ParentBiDiMode = False
      ShowButton = True
      TabOrder = 0
      UnboundDataType = wwDTEdtDate
      OnExit = dtpFecFirConExit
    end
    object dblcdTipCon: TwwDBLookupComboDlg
      Left = 279
      Top = 39
      Width = 46
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsTipCon
      LookupField = 'LPDPTIPCON'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdTipConExit
    end
    object dblcdOriCon: TwwDBLookupComboDlg
      Left = 550
      Top = 39
      Width = 44
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsOficina
      LookupField = 'CODSUBARE'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdOriConExit
    end
    object Panel1: TPanel
      Left = 328
      Top = 38
      Width = 123
      Height = 23
      Caption = 'Panel1'
      Enabled = False
      TabOrder = 3
      object meDesTipCon: TMaskEdit
        Left = 1
        Top = 1
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 598
      Top = 37
      Width = 123
      Height = 24
      Caption = 'Panel2'
      Enabled = False
      TabOrder = 4
      object meDesAreCon: TMaskEdit
        Left = 1
        Top = 1
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
    end
  end
  object btnGrabar: TBitBtn
    Left = 557
    Top = 105
    Width = 84
    Height = 29
    Caption = 'Grabar'
    TabOrder = 1
    OnClick = btnGrabarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object btnSalir: TBitBtn
    Left = 646
    Top = 105
    Width = 84
    Height = 29
    Caption = 'Salir'
    TabOrder = 2
    OnClick = btnSalirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F333333337F333301111111110333337F333333337F33330111111111
      0333337F3333333F7F333301111111B10333337F333333737F33330111111111
      0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
      0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
      0333337F377777337F333301111111110333337F333333337F33330111111111
      0333337FFFFFFFFF7F3333000000000003333377777777777333}
    NumGlyphs = 2
  end
end
