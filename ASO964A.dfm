object Fhisautdesapo: TFhisautdesapo
  Left = 314
  Top = 298
  BorderStyle = bsDialog
  ClientHeight = 266
  ClientWidth = 811
  Color = 12114134
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object btnsalir: TBitBtn
    Left = 727
    Top = 233
    Width = 73
    Height = 30
    Caption = 'Salir'
    TabOrder = 0
    OnClick = btnsalirClick
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
  object dbghisdesapo: TwwDBGrid
    Left = 4
    Top = 18
    Width = 803
    Height = 212
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsQry26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBlack
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 4
    TitleButtons = False
    OnDblClick = dbghisdesapoDblClick
  end
  object pnldetalle: TPanel
    Left = 138
    Top = 38
    Width = 556
    Height = 147
    Color = clSilver
    TabOrder = 2
    Visible = False
    object GroupBox1: TGroupBox
      Left = 1
      Top = 14
      Width = 554
      Height = 131
      Color = clMoneyGreen
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 9
        Top = 16
        Width = 77
        Height = 13
        Caption = 'C'#243'digo Modular:'
      end
      object Label2: TLabel
        Left = 9
        Top = 44
        Width = 102
        Height = 13
        Caption = 'Apellidos y nombre(s):'
      end
      object Label3: TLabel
        Left = 193
        Top = 16
        Width = 85
        Height = 13
        Caption = 'Tipo de asociado:'
      end
      object Label4: TLabel
        Left = 321
        Top = 16
        Width = 131
        Height = 13
        Caption = 'Fecha de aut. desc. aporte:'
      end
      object lbldesautdesa: TLabel
        Left = 9
        Top = 69
        Width = 84
        Height = 13
        Caption = 'Mot. autorizaci'#243'n:'
      end
      object Label5: TLabel
        Left = 9
        Top = 95
        Width = 84
        Height = 13
        Caption = 'Usuario que crea:'
      end
      object Label6: TLabel
        Left = 222
        Top = 95
        Width = 92
        Height = 13
        Caption = 'Fecha de creaci'#243'n:'
      end
      object btncerrar: TBitBtn
        Left = 473
        Top = 96
        Width = 73
        Height = 30
        Caption = 'Cerrar'
        TabOrder = 0
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
      object Panel1: TPanel
        Left = 117
        Top = 12
        Width = 71
        Height = 23
        Enabled = False
        TabOrder = 1
        object measocodmod: TMaskEdit
          Left = 1
          Top = 1
          Width = 68
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel2: TPanel
        Left = 117
        Top = 39
        Width = 429
        Height = 23
        Enabled = False
        TabOrder = 2
        object measoapenomdni: TMaskEdit
          Left = 1
          Top = 1
          Width = 427
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 284
        Top = 12
        Width = 26
        Height = 23
        Enabled = False
        TabOrder = 3
        object measotipid: TMaskEdit
          Left = 1
          Top = 1
          Width = 23
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel4: TPanel
        Left = 457
        Top = 12
        Width = 74
        Height = 23
        Enabled = False
        TabOrder = 4
        object mefecautdesapo: TMaskEdit
          Left = 1
          Top = 1
          Width = 71
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel5: TPanel
        Left = 117
        Top = 64
        Width = 429
        Height = 23
        Enabled = False
        TabOrder = 5
        object medesautdesa: TMaskEdit
          Left = 1
          Top = 1
          Width = 427
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel6: TPanel
        Left = 117
        Top = 90
        Width = 98
        Height = 23
        Enabled = False
        TabOrder = 6
        object meusucrea: TMaskEdit
          Left = 1
          Top = 1
          Width = 96
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel7: TPanel
        Left = 319
        Top = 90
        Width = 112
        Height = 23
        Enabled = False
        TabOrder = 7
        object mefeccrea: TMaskEdit
          Left = 1
          Top = 1
          Width = 110
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object StaticText1: TStaticText
      Left = 1
      Top = 1
      Width = 554
      Height = 17
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSingle
      Caption = 'Detalle del registro'
      TabOrder = 1
    end
  end
  object btnautoriza: TBitBtn
    Left = 4
    Top = 233
    Width = 130
    Height = 30
    Caption = 'Autorizaciones'
    TabOrder = 3
    OnClick = btnautorizaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
      0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
      0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
      0005555555575FF7777555555555000555555555555577755555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
  object btndesautoriza: TBitBtn
    Left = 145
    Top = 233
    Width = 130
    Height = 30
    Caption = 'Desautorizaciones'
    TabOrder = 4
    OnClick = btndesautorizaClick
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
  object stautorizaciones: TStaticText
    Left = 0
    Top = 0
    Width = 811
    Height = 17
    Align = alTop
    Alignment = taCenter
    BorderStyle = sbsSingle
    Caption = 'AUTORIZACION'
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 5
  end
end
