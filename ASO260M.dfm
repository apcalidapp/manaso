object Facttipbenhojcargo: TFacttipbenhojcargo
  Left = 532
  Top = 298
  BorderStyle = bsDialog
  Caption = 'Registro de tipo de beneficio'
  ClientHeight = 187
  ClientWidth = 372
  Color = 12114134
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 4
    Width = 119
    Height = 13
    Caption = 'Descripci'#243'n del beneficio'
  end
  object Label2: TLabel
    Left = 7
    Top = 101
    Width = 97
    Height = 13
    Caption = 'Usuario que registra:'
  end
  object Label3: TLabel
    Left = 7
    Top = 126
    Width = 111
    Height = 13
    Caption = 'Fecha/hora de registro:'
  end
  object btnactualiza: TBitBtn
    Left = 202
    Top = 147
    Width = 80
    Height = 28
    Caption = 'Confirmar'
    TabOrder = 1
    OnClick = btnactualizaClick
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
    Left = 286
    Top = 147
    Width = 80
    Height = 28
    Caption = 'Cerrar'
    TabOrder = 2
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
  object dblcdtipobeneficio: TwwDBLookupComboDlg
    Left = 7
    Top = 22
    Width = 41
    Height = 21
    GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
    GridColor = clWhite
    GridTitleAlignment = taLeftJustify
    Caption = 'Lookup'
    MaxWidth = 0
    MaxHeight = 209
    LookupTable = DM1.cdsQry3
    LookupField = 'TIPBENEF'
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    AllowClearKey = False
    OnExit = dblcdtipobeneficioExit
  end
  object pnldesctipobeneficio: TPanel
    Left = 53
    Top = 21
    Width = 273
    Height = 23
    Enabled = False
    TabOrder = 3
    object medesctipobeneficio: TMaskEdit
      Left = 1
      Top = 1
      Width = 270
      Height = 21
      TabOrder = 0
    end
  end
  object pnlusuregistra: TPanel
    Left = 120
    Top = 96
    Width = 248
    Height = 23
    Enabled = False
    TabOrder = 4
    object meusuario: TMaskEdit
      Left = 1
      Top = 1
      Width = 246
      Height = 21
      TabOrder = 0
    end
  end
  object pnlfecharegistro: TPanel
    Left = 120
    Top = 121
    Width = 127
    Height = 23
    TabOrder = 5
    object mefechahora: TMaskEdit
      Left = 1
      Top = 1
      Width = 125
      Height = 21
      Enabled = False
      TabOrder = 0
    end
  end
  object rgtiporetiro: TRadioGroup
    Left = 7
    Top = 45
    Width = 160
    Height = 48
    Caption = ' Tipo de retiro '
    Items.Strings = (
      'Por limite de edad al 31/12'
      'Otros retiros')
    TabOrder = 6
  end
end
