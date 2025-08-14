object FManCodigoPago: TFManCodigoPago
  Left = 598
  Top = 449
  BorderStyle = bsDialog
  Caption = 'Mantenimiento de C'#243'digo de Pago'
  ClientHeight = 222
  ClientWidth = 579
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
  object btnSalir: TBitBtn
    Left = 497
    Top = 192
    Width = 80
    Height = 28
    Caption = 'Salir'
    TabOrder = 0
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
  object dbgcodigopago: TwwDBGrid
    Left = 1
    Top = 1
    Width = 576
    Height = 188
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsQry20
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    object dbgcodigopagoIButton: TwwIButton
      Left = 0
      Top = 0
      Width = 30
      Height = 30
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = dbgcodigopagoIButtonClick
    end
  end
  object pnlcodigopago: TPanel
    Left = 12
    Top = 19
    Width = 522
    Height = 165
    Color = clMoneyGreen
    TabOrder = 2
    object gbcodigopago: TGroupBox
      Left = 4
      Top = 4
      Width = 514
      Height = 125
      TabOrder = 0
      object lbletidoc: TLabel
        Left = 5
        Top = 21
        Width = 22
        Height = 13
        Caption = 'DNI:'
      end
      object Label2: TLabel
        Left = 5
        Top = 46
        Width = 102
        Height = 13
        Caption = 'Apellidos y nombre(s):'
      end
      object Label3: TLabel
        Left = 5
        Top = 71
        Width = 32
        Height = 13
        Caption = 'UGEL:'
      end
      object Label4: TLabel
        Left = 5
        Top = 97
        Width = 78
        Height = 13
        Caption = 'C'#243'digo de pago:'
      end
      object measocodpago: TMaskEdit
        Left = 193
        Top = 93
        Width = 173
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 21
        TabOrder = 0
        OnExit = measocodpagoExit
      end
      object Panel1: TPanel
        Left = 110
        Top = 16
        Width = 89
        Height = 23
        Caption = 'pnlasodni'
        Enabled = False
        TabOrder = 1
        object measodni: TMaskEdit
          Left = 1
          Top = 1
          Width = 87
          Height = 21
          TabOrder = 0
        end
      end
      object pnlasoapenomdni: TPanel
        Left = 110
        Top = 41
        Width = 400
        Height = 23
        Caption = 'pnlasodni'
        Enabled = False
        TabOrder = 2
        object measoapenomdni: TMaskEdit
          Left = 1
          Top = 1
          Width = 398
          Height = 21
          TabOrder = 0
        end
      end
      object pnldescuegl: TPanel
        Left = 110
        Top = 66
        Width = 400
        Height = 23
        Enabled = False
        TabOrder = 3
        object medescugel: TMaskEdit
          Left = 1
          Top = 1
          Width = 398
          Height = 21
          TabOrder = 0
        end
      end
    end
    object btnguardar: TBitBtn
      Left = 379
      Top = 135
      Width = 68
      Height = 25
      Caption = 'Guardar'
      TabOrder = 1
      OnClick = btnguardarClick
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
    object btncerrar: TBitBtn
      Left = 450
      Top = 135
      Width = 68
      Height = 25
      Caption = 'Salir'
      TabOrder = 2
      OnClick = btncerrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
    end
  end
end
