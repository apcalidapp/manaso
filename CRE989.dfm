object fContactabilidadVerificada: TfContactabilidadVerificada
  Left = 456
  Top = 337
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'CONTACTABILIDAD VERIFICADA'
  ClientHeight = 335
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxCorreo: TGroupBox
    Left = 9
    Top = 184
    Width = 749
    Height = 95
    Caption = 'Correo Electr'#243'nico'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object lblValidarCorreo: TLabel
      Left = 400
      Top = 20
      Width = 136
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'VERIFICADO'
      Color = clMoneyGreen
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 370
      Top = 34
      Width = 19
      Height = 13
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6908265
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 13
      Top = 35
      Width = 76
      Height = 13
      Caption = 'Cuenta de correo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6908265
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnValidarCorreoToken: TBitBtn
      Left = 593
      Top = 11
      Width = 145
      Height = 29
      Caption = 'Validar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnValidarCorreoTokenClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
        000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
        FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
        FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
        9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
        0000777777777777777733333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnNuevoCorreo: TBitBtn
      Left = 591
      Top = 44
      Width = 145
      Height = 27
      Caption = 'Nuevo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnNuevoCorreoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object btnGrabarCorreo: TBitBtn
      Left = 592
      Top = 44
      Width = 145
      Height = 27
      Caption = 'Grabar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btnGrabarCorreoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object dbeCorreo: TwwDBEdit
      Left = 12
      Top = 48
      Width = 348
      Height = 23
      CharCase = ecUpperCase
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object cbCorreo: TwwDBLookupCombo
      Left = 11
      Top = 47
      Width = 350
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 4
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnCloseUp = cbCorreoCloseUp
      OnKeyPress = cbCorreoKeyPress
      OnNotInList = cbCorreoNotInList
    end
    object btnCancelarCor: TBitBtn
      Left = 592
      Top = 12
      Width = 147
      Height = 27
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Visible = False
      OnClick = btnCancelarCorClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object btnActualizarCorreo: TBitBtn
      Left = 545
      Top = 46
      Width = 34
      Height = 25
      Hint = 'Actualizar Correos'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnActualizarCorreoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555FFFFF555555555544C4C5555555555F777775FF5555554C444C444
        5555555775FF55775F55554C4334444445555575577F55557FF554C4C334C4C4
        335557F5577FF55577F554CCC3334444335557555777F555775FCCCCC333CCC4
        C4457F55F777F555557F4CC33333CCC444C57F577777F5F5557FC4333333C3C4
        CCC57F777777F7FF557F4CC33333333C4C457F577777777F557FCCC33CC4333C
        C4C575F7755F777FF5755CCCCC3333334C5557F5FF777777F7F554C333333333
        CC55575777777777F755553333CC3C33C555557777557577755555533CC4C4CC
        5555555775FFFF77555555555C4CCC5555555555577777555555}
      NumGlyphs = 2
    end
    object cbTipoCorreo: TwwDBLookupCombo
      Left = 369
      Top = 47
      Width = 50
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnCloseUp = cbTipoCorreoCloseUp
      OnKeyPress = cbTipoCorreoKeyPress
      OnNotInList = cbTipoCorreoNotInList
    end
    object txttiponombrecorreo: TwwDBEdit
      Left = 421
      Top = 48
      Width = 115
      Height = 23
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 9
    Top = 10
    Width = 749
    Height = 79
    Caption = 'Tel'#233'fono Celular'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object lblValidarCelular: TLabel
      Left = 396
      Top = 34
      Width = 136
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'VERIFICADO'
      Color = 12572159
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label1: TLabel
      Left = 13
      Top = 19
      Width = 33
      Height = 13
      Caption = 'N'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6908265
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 211
      Top = 20
      Width = 19
      Height = 13
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6908265
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbTelefono: TwwDBLookupCombo
      Left = 12
      Top = 32
      Width = 188
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnCloseUp = cbTelefonoCloseUp
      OnKeyPress = cbTelefonoKeyPress
      OnNotInList = cbTelefonoNotInList
    end
    object btnCancelarCelular: TBitBtn
      Left = 591
      Top = 12
      Width = 146
      Height = 27
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnCancelarCelularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object btnGrabarCelular: TBitBtn
      Left = 591
      Top = 44
      Width = 146
      Height = 27
      Caption = 'Grabar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btnGrabarCelularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object btnActualizarCelular: TBitBtn
      Left = 548
      Top = 46
      Width = 34
      Height = 25
      Hint = 'Actualizar Celulares'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnActualizarCelularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555FFFFF555555555544C4C5555555555F777775FF5555554C444C444
        5555555775FF55775F55554C4334444445555575577F55557FF554C4C334C4C4
        335557F5577FF55577F554CCC3334444335557555777F555775FCCCCC333CCC4
        C4457F55F777F555557F4CC33333CCC444C57F577777F5F5557FC4333333C3C4
        CCC57F777777F7FF557F4CC33333333C4C457F577777777F557FCCC33CC4333C
        C4C575F7755F777FF5755CCCCC3333334C5557F5FF777777F7F554C333333333
        CC55575777777777F755553333CC3C33C555557777557577755555533CC4C4CC
        5555555775FFFF77555555555C4CCC5555555555577777555555}
      NumGlyphs = 2
    end
    object btnValidacionTokenCelular: TBitBtn
      Left = 592
      Top = 11
      Width = 145
      Height = 29
      Caption = 'Validar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnValidacionTokenCelularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
        000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
        FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
        FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
        9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
        0000777777777777777733333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnNuevoCelular: TBitBtn
      Left = 592
      Top = 44
      Width = 145
      Height = 27
      Caption = 'Nuevo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = btnNuevoCelularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object txtcelular: TwwDBEdit
      Left = 12
      Top = 33
      Width = 187
      Height = 23
      CharCase = ecUpperCase
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyPress = txtcelularKeyPress
    end
    object cbTipoCelular: TwwDBLookupCombo
      Left = 210
      Top = 32
      Width = 50
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnCloseUp = cbTipoCelularCloseUp
      OnKeyPress = cbTipoCelularKeyPress
      OnNotInList = cbTipoCelularNotInList
    end
    object txttiponombrecelular: TwwDBEdit
      Left = 262
      Top = 33
      Width = 115
      Height = 23
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object btnContactarCelular: TBitBtn
      Left = 262
      Top = 11
      Width = 114
      Height = 21
      Hint = 'Registro de verificaci'#243'n manual '
      Caption = 'Contactar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnContactarCelularClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
        DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
        0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
        808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
        90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
        6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
        9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
        50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
        3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
        A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
        9F806000402000808080808020202000600000804000804020FF7F00BF000000
        00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
        2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
        702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
        0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
        A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
        9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
        8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
        707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
        DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
        DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
        AFAFAF303030000000000000000000000000000000000000000000303030AFAF
        AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object BitSalir: TBitBtn
    Left = 659
    Top = 291
    Width = 99
    Height = 32
    Cursor = crHandPoint
    Caption = '&Salir'
    TabOrder = 2
    OnClick = BitSalirClick
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
  end
  object GroupBox2: TGroupBox
    Left = 9
    Top = 97
    Width = 749
    Height = 79
    Caption = 'Tel'#233'fono Fijo'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    object lblValidarFijo: TLabel
      Left = 396
      Top = 38
      Width = 136
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'VERIFICADO'
      Color = 12572159
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbldepartamento: TLabel
      Left = 66
      Top = 24
      Width = 131
      Height = 13
      AutoSize = False
      Caption = '...'
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label3: TLabel
      Left = 209
      Top = 25
      Width = 19
      Height = 13
      Caption = 'Tipo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6908265
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 12
      Top = 27
      Width = 33
      Height = 13
      Caption = 'N'#250'mero'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6908265
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbFijo: TwwDBLookupCombo
      Left = 11
      Top = 39
      Width = 190
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnCloseUp = cbFijoCloseUp
      OnKeyPress = cbFijoKeyPress
      OnNotInList = cbFijoNotInList
    end
    object btnFijoCancelar: TBitBtn
      Left = 591
      Top = 12
      Width = 146
      Height = 27
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnFijoCancelarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
        993337777F777F3377F3393999707333993337F77737333337FF993399933333
        399377F3777FF333377F993339903333399377F33737FF33377F993333707333
        399377F333377FF3377F993333101933399377F333777FFF377F993333000993
        399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
        99333773FF777F777733339993707339933333773FF7FFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
    end
    object btnGrabarFijo: TBitBtn
      Left = 591
      Top = 44
      Width = 146
      Height = 27
      Caption = 'Grabar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btnGrabarFijoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object btnActualizarFijo: TBitBtn
      Left = 548
      Top = 45
      Width = 34
      Height = 25
      Hint = 'Actualizar Celulares'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnActualizarFijoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555FFFFF555555555544C4C5555555555F777775FF5555554C444C444
        5555555775FF55775F55554C4334444445555575577F55557FF554C4C334C4C4
        335557F5577FF55577F554CCC3334444335557555777F555775FCCCCC333CCC4
        C4457F55F777F555557F4CC33333CCC444C57F577777F5F5557FC4333333C3C4
        CCC57F777777F7FF557F4CC33333333C4C457F577777777F557FCCC33CC4333C
        C4C575F7755F777FF5755CCCCC3333334C5557F5FF777777F7F554C333333333
        CC55575777777777F755553333CC3C33C555557777557577755555533CC4C4CC
        5555555775FFFF77555555555C4CCC5555555555577777555555}
      NumGlyphs = 2
    end
    object btnNuevoFijo: TBitBtn
      Left = 592
      Top = 45
      Width = 145
      Height = 27
      Caption = 'Nuevo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnNuevoFijoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object txtnumerofijo: TwwDBEdit
      Left = 65
      Top = 39
      Width = 134
      Height = 23
      CharCase = ecUpperCase
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
      OnKeyPress = txtcelularKeyPress
    end
    object cbCodigoTelefono: TwwDBLookupCombo
      Left = 11
      Top = 39
      Width = 50
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 6
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnCloseUp = cbCodigoTelefonoCloseUp
      OnKeyPress = cbCodigoTelefonoKeyPress
      OnNotInList = cbCodigoTelefonoNotInList
    end
    object cbTipoFijo: TwwDBLookupCombo
      Left = 208
      Top = 38
      Width = 50
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnCloseUp = cbTipoFijoCloseUp
      OnKeyPress = cbTipoFijoKeyPress
      OnNotInList = cbTipoFijoNotInList
    end
    object txttiponombrefijo: TwwDBEdit
      Left = 260
      Top = 39
      Width = 115
      Height = 23
      CharCase = ecUpperCase
      Color = clBtnFace
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 8
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object btnModificarFijo: TBitBtn
      Left = 592
      Top = 11
      Width = 146
      Height = 27
      Caption = 'Actualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Visible = False
      OnClick = btnModificarFijoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
    object btnContactarFijo: TBitBtn
      Left = 260
      Top = 17
      Width = 114
      Height = 21
      Hint = 'Registro de verificaci'#243'n manual '
      Caption = 'Contactar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = btnContactarFijoClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
        DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
        0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
        808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
        90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
        6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
        9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
        50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
        3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
        A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
        9F806000402000808080808020202000600000804000804020FF7F00BF000000
        00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
        2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
        702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
        0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
        A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
        9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
        8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
        707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
        DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
        DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
        AFAFAF303030000000000000000000000000000000000000000000303030AFAF
        AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object dsContactabilidadCor: TwwDataSource
    DataSet = cdsContactabilidadCor
    Left = 159
    Top = 292
  end
  object cdsContactabilidadCor: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DM1.DCOM1
    ValidateWithMask = True
    Left = 127
    Top = 292
  end
  object dsContactabilidadTel: TwwDataSource
    DataSet = cdsContactabilidadTel
    Left = 55
    Top = 292
  end
  object cdsContactabilidadTel: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DM1.DCOM1
    ValidateWithMask = True
    Left = 23
    Top = 292
  end
  object cdsTipoCelular: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DM1.DCOM1
    ValidateWithMask = True
    Left = 199
    Top = 292
  end
  object dsTipoCelular: TwwDataSource
    DataSet = cdsTipoCelular
    Left = 231
    Top = 292
  end
  object cdsTipoFijo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DM1.DCOM1
    ValidateWithMask = True
    Left = 279
    Top = 292
  end
  object dsTipoFijo: TwwDataSource
    DataSet = cdsTipoFijo
    Left = 311
    Top = 292
  end
  object cdsContactabilidadFijo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DM1.DCOM1
    ValidateWithMask = True
    Left = 351
    Top = 292
  end
  object dsContactabilidadFijo: TwwDataSource
    DataSet = cdsContactabilidadFijo
    Left = 383
    Top = 292
  end
  object cdsCodigosTelefono: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DM1.DCOM1
    ValidateWithMask = True
    Left = 423
    Top = 292
  end
  object dsCodigosTelefono: TwwDataSource
    DataSet = cdsCodigosTelefono
    Left = 455
    Top = 292
  end
  object cdsTipoCorreo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DM1.DCOM1
    ValidateWithMask = True
    Left = 495
    Top = 292
  end
  object dsTipoCorreo: TwwDataSource
    DataSet = cdsTipoCorreo
    Left = 527
    Top = 292
  end
end
