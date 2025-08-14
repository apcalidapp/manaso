object Fautdes: TFautdes
  Left = 562
  Top = 222
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Autorizaci'#243'n de descuento de Aportes'
  ClientHeight = 440
  ClientWidth = 444
  Color = 12114134
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 18
    Top = 289
    Width = 119
    Height = 13
    Caption = 'Motivo de Desestimiento:'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 341
    Width = 429
    Height = 5
  end
  object gbgrupo: TGroupBox
    Left = 8
    Top = 8
    Width = 429
    Height = 270
    Caption = ' Detalle de la autorizaci'#243'n de descuento :'
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 25
      Width = 103
      Height = 13
      Caption = 'Usuario que autoriz'#243' :'
    end
    object Label2: TLabel
      Left = 7
      Top = 46
      Width = 111
      Height = 13
      Caption = 'Fecha de autorizaci'#243'n :'
    end
    object Label5: TLabel
      Left = 31
      Top = 144
      Width = 84
      Height = 17
      Caption = 'Procesado En : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 31
      Top = 185
      Width = 84
      Height = 17
      Caption = 'Unidad De Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 31
      Top = 223
      Width = 60
      Height = 17
      Caption = 'Use / Ugel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 5
      Top = 128
      Width = 88
      Height = 13
      Caption = 'Fecha de registro :'
    end
    object Label9: TLabel
      Left = 5
      Top = 73
      Width = 110
      Height = 13
      Caption = 'Motivo de autorizaci'#243'n:'
    end
    object Label10: TLabel
      Left = 5
      Top = 101
      Width = 97
      Height = 13
      Caption = 'Oficina que autoriza:'
    end
    object edtusuaut: TEdit
      Left = 126
      Top = 21
      Width = 233
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtfecregaut: TEdit
      Left = 126
      Top = 124
      Width = 233
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 2
    end
    object DbLUniPro: TwwDBLookupComboDlg
      Left = 33
      Top = 160
      Width = 49
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      DataField = 'UPROID'
      DataSource = DM1.dsAso
      LookupField = 'UPROID'
      Enabled = False
      TabOrder = 3
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeUproDes: TMaskEdit
      Left = 83
      Top = 160
      Width = 300
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 4
    end
    object DbLUniPag: TwwDBLookupComboDlg
      Left = 33
      Top = 201
      Width = 49
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      DataField = 'UPAGOID'
      DataSource = DM1.dsAso
      LookupField = 'UPAGOID'
      Enabled = False
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeUpagDes: TMaskEdit
      Left = 83
      Top = 201
      Width = 300
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 6
    end
    object DbLUses: TwwDBLookupComboDlg
      Left = 33
      Top = 240
      Width = 49
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      DataField = 'USEID'
      DataSource = DM1.dsAso
      LookupField = 'USEID'
      Enabled = False
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbeUses: TMaskEdit
      Left = 83
      Top = 240
      Width = 300
      Height = 21
      TabStop = False
      ReadOnly = True
      TabOrder = 8
    end
    object dbdtfecaut: TwwDBDateTimePicker
      Left = 126
      Top = 44
      Width = 107
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 1
      UnboundDataType = wwDTEdtDate
      OnExit = dbdtfecautExit
    end
    object dblcdmotCADAPS: TwwDBLookupComboDlg
      Left = 126
      Top = 70
      Width = 49
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsAutCADAPS
      LookupField = 'CODMOTAUTCADAPS'
      TabOrder = 9
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdmotCADAPSExit
    end
    object Panel2: TPanel
      Left = 179
      Top = 69
      Width = 230
      Height = 23
      Enabled = False
      TabOrder = 10
      object edtdesmotCADAPS: TEdit
        Left = 1
        Top = 1
        Width = 228
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
    end
    object pnlOfiAut: TPanel
      Left = 180
      Top = 96
      Width = 230
      Height = 23
      Enabled = False
      TabOrder = 11
      object edtOfiAut: TEdit
        Left = 1
        Top = 1
        Width = 228
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
    end
    object dblcdOfiAut: TwwDBLookupComboDlg
      Left = 126
      Top = 96
      Width = 49
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsOfdes
      LookupField = 'OFDESID'
      Color = clWhite
      Enabled = False
      TabOrder = 12
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblcdOfiAutExit
    end
  end
  object dblcdmotdesapo: TwwDBLookupComboDlg
    Left = 150
    Top = 288
    Width = 49
    Height = 21
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Lookup'
    MaxWidth = 0
    MaxHeight = 209
    LookupTable = DM1.cdsReclamoMotiv
    LookupField = 'CODMOTDEST'
    Enabled = False
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnChange = dblcdmotdesapoChange
    OnExit = dblcdmotdesapoExit
  end
  object pnlmotdesapo: TPanel
    Left = 200
    Top = 287
    Width = 230
    Height = 23
    Enabled = False
    TabOrder = 2
    object edtdesaut: TEdit
      Left = 1
      Top = 1
      Width = 228
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
  end
  object btnactualiza: TBitBtn
    Left = 263
    Top = 405
    Width = 101
    Height = 32
    Caption = 'Desaut. desct.'
    TabOrder = 4
    OnClick = btnactualizaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
  end
  object btncerrar: TBitBtn
    Left = 366
    Top = 405
    Width = 71
    Height = 32
    Caption = 'Cerrar'
    TabOrder = 5
    OnClick = btncerrarClick
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
  object BitAutDes: TBitBtn
    Left = 181
    Top = 405
    Width = 80
    Height = 32
    Cursor = crHandPoint
    Hint = 'Autorizaci'#243'n de Descuentos de Aportes'
    Caption = 'Aut. desct.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitAutDesClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333000003333333333F777773FF333333008877700
      33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
      703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
      77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
      07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
      780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
      8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
      3333333773FFFF77333333333000003333333333377777333333}
    NumGlyphs = 2
    Spacing = 0
  end
  object BitPrint: TBitBtn
    Left = 110
    Top = 405
    Width = 68
    Height = 32
    Hint = 'Imprimir'
    Caption = 'Imprimir'
    TabOrder = 6
    OnClick = BitPrintClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object pnlRegistraEmail: TPanel
    Left = 416
    Top = 9
    Width = 313
    Height = 86
    BorderStyle = bsSingle
    Color = clTeal
    TabOrder = 7
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 305
      Height = 47
      Caption = 'Email recordatorio '
      TabOrder = 0
      object meemail: TMaskEdit
        Left = 4
        Top = 17
        Width = 296
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
    end
    object btnvalida: TBitBtn
      Left = 274
      Top = 52
      Width = 32
      Height = 28
      TabOrder = 1
      OnClick = btnvalidaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
    end
  end
  object btnhisautdesapo: TBitBtn
    Left = 8
    Top = 405
    Width = 100
    Height = 32
    Caption = 'Historial'
    TabOrder = 8
    OnClick = btnhisautdesapoClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000000
      055557777777777775F508888888888880557F5FFFFFFFFFF75F080000000000
      88057577777777775F755080FFFFFF05088057F7FFFFFF7575F70000000000F0
      F08077777777775757F70FFFFFFFFF0F008075F5FF5FF57577F750F00F00FFF0
      F08057F775775557F7F750FFFFFFFFF0F08057FF5555555757F7000FFFFFFFFF
      0000777FF5FFFFF577770900F00000F000907F775777775777F7090FFFFFFFFF
      00907F7F555555557757000FFFFFFFFF0F00777F5FFF5FF57F77550F000F00FF
      0F05557F777577557F7F550FFFFFFFFF0005557F555FFFFF7775550FFF000000
      05555575FF777777755555500055555555555557775555555555}
    NumGlyphs = 2
  end
  object gbCADAPS: TGroupBox
    Left = 8
    Top = 349
    Width = 429
    Height = 52
    Caption = ' Estado CADAPS '
    TabOrder = 9
    object Memo1: TMemo
      Left = 3
      Top = 18
      Width = 75
      Height = 26
      HelpType = htKeyword
      BorderStyle = bsNone
      Color = 12114134
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Estado envio '
        'CADAPS:')
      ParentFont = False
      TabOrder = 0
    end
    object Memo2: TMemo
      Left = 216
      Top = 18
      Width = 78
      Height = 26
      HelpType = htKeyword
      BorderStyle = bsNone
      Color = 12114134
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Tipo '
        'Observaci'#243'n:')
      ParentFont = False
      TabOrder = 1
    end
    object meestado: TMemo
      Left = 81
      Top = 14
      Width = 133
      Height = 32
      Enabled = False
      TabOrder = 2
    end
    object meobservacion: TMemo
      Left = 292
      Top = 14
      Width = 133
      Height = 32
      Enabled = False
      TabOrder = 3
    end
  end
  object medescdesa_otros: TMaskEdit
    Left = 18
    Top = 315
    Width = 412
    Height = 21
    Enabled = False
    TabOrder = 10
  end
end
