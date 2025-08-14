object FModconsultadatos: TFModconsultadatos
  Left = 429
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Modificaci'#243'n de consulta de datos'
  ClientHeight = 354
  ClientWidth = 544
  Color = 12114134
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 8
    Top = 175
    Width = 102
    Height = 13
    Caption = #193'rea de origen de'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 8
    Top = 190
    Width = 94
    Height = 13
    Caption = 'consentimiento :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 211
    Width = 48
    Height = 13
    Caption = 'Tipo de '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 8
    Top = 226
    Width = 94
    Height = 13
    Caption = 'consentimiento :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 8
    Top = 247
    Width = 89
    Height = 13
    Caption = 'Fecha de firma '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 8
    Top = 262
    Width = 94
    Height = 13
    Caption = 'consentimiento :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 8
    Top = 283
    Width = 61
    Height = 13
    Caption = 'Motivo de '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 8
    Top = 298
    Width = 80
    Height = 13
    Caption = 'modificaci'#243'n :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object pnlApellidosNombres: TPanel
    Left = 3
    Top = 3
    Width = 533
    Height = 53
    BevelInner = bvRaised
    BorderStyle = bsSingle
    Color = 12114134
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 5
      Width = 159
      Height = 13
      Caption = 'Apellidos y nombres del asociado:'
    end
    object Label2: TLabel
      Left = 4
      Top = 27
      Width = 85
      Height = 13
      Caption = 'Tipo de asociado:'
    end
    object edtAsoApeNom: TEdit
      Left = 165
      Top = 2
      Width = 358
      Height = 21
      TabOrder = 0
    end
    object edtAsoTipId: TEdit
      Left = 165
      Top = 23
      Width = 116
      Height = 21
      TabOrder = 1
    end
  end
  object pnlDatosOrigen: TGroupBox
    Left = 3
    Top = 57
    Width = 533
    Height = 103
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 14
      Width = 85
      Height = 13
      Caption = 'Modulo de origen:'
    end
    object Label4: TLabel
      Left = 8
      Top = 35
      Width = 97
      Height = 13
      Caption = 'Usuario que registra:'
    end
    object Label5: TLabel
      Left = 232
      Top = 35
      Width = 89
      Height = 13
      Caption = 'Unidad de registro:'
    end
    object Label6: TLabel
      Left = 8
      Top = 57
      Width = 88
      Height = 13
      Caption = 'Oficina de registro:'
    end
    object Label7: TLabel
      Left = 8
      Top = 80
      Width = 125
      Height = 13
      Caption = 'Estado de consentimiento:'
    end
    object edtModOrigen: TEdit
      Left = 136
      Top = 10
      Width = 57
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edtUsuReg: TEdit
      Left = 136
      Top = 32
      Width = 89
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edtUniReg: TEdit
      Left = 324
      Top = 32
      Width = 203
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edtOfiReg: TEdit
      Left = 136
      Top = 54
      Width = 203
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object edtEstCon: TEdit
      Left = 136
      Top = 76
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 4
    end
  end
  object gbDescOriCon: TGroupBox
    Left = 183
    Top = 167
    Width = 353
    Height = 33
    Enabled = False
    TabOrder = 3
    object meDesOriCon: TEdit
      Left = 2
      Top = 8
      Width = 348
      Height = 21
      TabOrder = 0
    end
  end
  object gbDescTipCons: TGroupBox
    Left = 183
    Top = 207
    Width = 353
    Height = 33
    Enabled = False
    TabOrder = 5
    object meDesTipCon: TEdit
      Left = 2
      Top = 8
      Width = 348
      Height = 21
      TabOrder = 0
    end
  end
  object dbdtpFecCon: TwwDBDateTimePicker
    Left = 124
    Top = 249
    Width = 110
    Height = 21
    CalendarAttributes.Font.Charset = DEFAULT_CHARSET
    CalendarAttributes.Font.Color = clWindowText
    CalendarAttributes.Font.Height = -11
    CalendarAttributes.Font.Name = 'MS Sans Serif'
    CalendarAttributes.Font.Style = []
    Epoch = 1950
    ShowButton = True
    TabOrder = 6
    OnChange = dbdtpFecConChange
  end
  object gbDescMotModCon: TGroupBox
    Left = 183
    Top = 272
    Width = 353
    Height = 33
    Enabled = False
    TabOrder = 8
    object meDescMotCon: TEdit
      Left = 2
      Top = 8
      Width = 348
      Height = 21
      TabOrder = 0
    end
  end
  object btnGrabar: TBitBtn
    Left = 367
    Top = 320
    Width = 82
    Height = 28
    Cursor = crHandPoint
    Hint = 'Salir'
    Caption = '&Grabar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
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
    Spacing = 1
  end
  object btnSalir: TBitBtn
    Left = 455
    Top = 320
    Width = 82
    Height = 28
    Cursor = crHandPoint
    Hint = 'Salir'
    Caption = '&Salir'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = btnSalirClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
    Spacing = 1
  end
  object dblcdOriCon: TwwDBLookupComboDlg
    Left = 124
    Top = 175
    Width = 46
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
  object dblcdTipCon: TwwDBLookupComboDlg
    Left = 124
    Top = 215
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
    TabOrder = 4
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcdTipConExit
  end
  object dblcdMotModCon: TwwDBLookupComboDlg
    Left = 124
    Top = 280
    Width = 41
    Height = 21
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Lookup'
    MaxWidth = 0
    MaxHeight = 209
    LookupTable = DM1.cdsMotModCon
    LookupField = 'CODMOTMODCON'
    TabOrder = 7
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcdMotModConExit
  end
end
