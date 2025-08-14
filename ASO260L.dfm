object FAutDec: TFAutDec
  Left = 551
  Top = 176
  BorderStyle = bsDialog
  Caption = 'Declaraci'#243'n/Autorizaci'#243'n'
  ClientHeight = 615
  ClientWidth = 489
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
  object btnCerrar: TBitBtn
    Left = 355
    Top = 579
    Width = 75
    Height = 23
    Caption = 'Cerrar'
    TabOrder = 0
    OnClick = btnCerrarClick
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
  object GroupBox1: TGroupBox
    Left = 2
    Top = 1
    Width = 482
    Height = 103
    Caption = ' Datos del asociado '
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 16
      Width = 167
      Height = 13
      Caption = 'Apellidos y Nombre(s) del asociado:'
    end
    object Label2: TLabel
      Left = 5
      Top = 59
      Width = 88
      Height = 13
      Caption = 'Fecha de  registro:'
    end
    object Label3: TLabel
      Left = 6
      Top = 80
      Width = 80
      Height = 13
      Caption = 'Usuario GEMAP:'
    end
    object Label4: TLabel
      Left = 251
      Top = 80
      Width = 75
      Height = 13
      Caption = 'Oficina captura:'
    end
    object pnlasoapenom: TPanel
      Left = 6
      Top = 31
      Width = 473
      Height = 22
      Alignment = taLeftJustify
      BorderStyle = bsSingle
      TabOrder = 0
    end
    object pnlfecreg: TPanel
      Left = 97
      Top = 54
      Width = 151
      Height = 22
      Alignment = taLeftJustify
      BorderStyle = bsSingle
      TabOrder = 1
    end
    object pnlusuGEMAP: TPanel
      Left = 97
      Top = 76
      Width = 151
      Height = 22
      Alignment = taLeftJustify
      BorderStyle = bsSingle
      TabOrder = 2
    end
    object pnloficap: TPanel
      Left = 332
      Top = 76
      Width = 146
      Height = 22
      Alignment = taLeftJustify
      BorderStyle = bsSingle
      TabOrder = 3
    end
  end
  object ScrollBox1: TScrollBox
    Left = 83
    Top = 112
    Width = 345
    Height = 465
    Color = clSilver
    ParentColor = False
    TabOrder = 2
    object ImagAutDec: TImage
      Left = 4
      Top = 24
      Width = 333
      Height = 432
      Cursor = crHandPoint
      ParentShowHint = False
      ShowHint = True
      Stretch = True
    end
    object stTitDecAut: TStaticText
      Left = 0
      Top = 0
      Width = 341
      Height = 24
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'Declaraci'#243'n de autorizaci'#243'n de descuento de aportes'
      Color = clActiveCaption
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object BtnZoommas: TfcShapeBtn
    Left = 88
    Top = 576
    Width = 33
    Height = 33
    Cursor = crHandPoint
    Caption = '+'
    Color = clMedGray
    DitherColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Layout = blGlyphRight
    ParentClipping = True
    ParentFont = False
    RoundRectBias = 25
    ShadeStyle = fbsHighlight
    Shape = bsRoundRect
    TabOrder = 3
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    OnClick = BtnZoommasClick
  end
  object fcShapeBtn1: TfcShapeBtn
    Left = 165
    Top = 576
    Width = 33
    Height = 33
    Cursor = crHandPoint
    Caption = '-'
    Color = clMedGray
    DitherColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -25
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Layout = blGlyphRight
    NumGlyphs = 0
    ParentClipping = True
    ParentFont = False
    RoundRectBias = 25
    ShadeStyle = fbsHighlight
    Shape = bsRoundRect
    TabOrder = 4
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    OnClick = fcShapeBtn1Click
  end
  object fcShapeBtn2: TfcShapeBtn
    Left = 127
    Top = 576
    Width = 33
    Height = 33
    Cursor = crHandPoint
    Color = clMedGray
    DitherColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 0
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    Glyph.Data = {
      26040000424D2604000000000000360000002800000010000000150000000100
      180000000000F0030000C40E0000C40E00000000000000000000FDFDFDE9E9E9
      EDEDEDE9E9E9ECECECF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
      FBFEFEFEFFFFFFFFFFFFFBFBFBDDDDDDE2E2E2DDDDDDDDDDDDE2E2E2ECECECFB
      FBFBF8F8F8EFEFEFF0F0F0F7F7F7F9F9F9E7E7E7F2F2F2FEFEFEFBFBFBD6D6D6
      D6D6D6DADADAD6D6D6DADADAD1D1D1F2F2F2F9F9F9EDEDEDEEEEEEF3F3F3FFFF
      FFF2F2F2EFEFEFFDFDFDFBFBFBDBDBDBDEDEDEE1E1E1E1E1E1DFDFDFD5D5D5F1
      F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEF0F0F0
      EEEEEEEDEDEDEDEDEDEFEFEFEBEBEBF8F8F8F4F4F4E0E0E0EFEFEFE3E3E3E8E8
      E8F8F8F8F6F6F6FDFDFDFAFAFAD4D4D4DADADADCDCDCDBDBDBDFDFDFE6E6E6F7
      F7F7F2F2F2D9D9D9D9D9D9DEDEDEE0E0E0DEDEDEDBDBDBFAFAFAFBFBFBDEDEDE
      E4E4E4ECECECEEEEEEF1F1F1E8E8E8F8F8F8EFEFEFDDDDDDE4E4E4EAEAEAE9E9
      E9EDEDEDE9E9E9FDFDFDFDFDFDE7E7E7EDEDEDE7E7E7ECECECE7E7E7E4E4E4F6
      F6F6FBFBFBEAEAEAEAEAEAF5F5F5E2E2E2E9E9E9E1E1E1FBFBFBFBFBFBD8D8D8
      DFDFDFEEEEEEE7E7E7F2F2F2EDEDEDFCFCFCEDEDEDD5D5D5DBDBDBD1D1D1FAFA
      FAF9F9F9FFFFFFFFFFFFFCFCFCD5D5D5DFDFDFF3F3F3F1F1F1F4F4F4EFEFEFF9
      F9F9F0F0F0DDDDDDE7E7E7E2E2E2DDDDDDE1E1E1E0E0E0FCFCFCFBFBFBE1E1E1
      D8D8D8E5E5E5E2E2E2E7E7E7E1E1E1F7F7F7EEEEEECECECEDADADAD0D0D0EDED
      EDE1E1E1DFDFDFFCFCFCFBFBFBDCDCDCDFDFDFDFDFDFDFDFDFE1E1E1D6D6D6F2
      F2F2FBFBFBE2E2E2E4E4E4E2E2E2E6E6E6EBEBEBF5F5F5FEFEFEFCFCFCD9D9D9
      DBDBDBE0E0E0DDDDDDD8D8D8D5D5D5F1F1F1FFFFFFE8E8E8E1E1E1EAEAEAFFFF
      FFFFFFFFFFFFFFFEFEFEFAFAFADADADAE5E5E5E0E0E0DFDFDFE8E8E8DCDCDCF1
      F1F1F1F1F1E3E3E3E1E1E1E3E3E3E2E2E2DDDDDDE4E4E4FEFEFEFAFAFAD5D5D5
      DBDBDBDEDEDEE0E0E0DCDCDCD2D2D2EFEFEFF5F5F5DEDEDEE5E5E5E6E6E6E9E9
      E9EBEBEBE8E8E8FBFBFBFCFCFCE0E0E0D2D2D2E2E2E2DDDDDDE8E8E8EDEDEDFA
      FAFAF3F3F3DDDDDDDFDFDFDEDEDED8D8D8E2E2E2DFDFDFFBFBFBFCFCFCECECEC
      EFEFEFEDEDEDE5E5E5FFFFFFFFFFFFFFFFFFF5F5F5E6E6E6F6F6F6FEFEFEFCFC
      FCFCFCFCFCFCFCFEFEFEFCFCFCE8E8E8ECECECF1F1F1F9F9F9EFEFEFE4E4E4F9
      F9F9F0F0F0DDDDDDDCDCDCDADADAD4D4D4DCDCDCD4D4D4FBFBFBFBFBFBDBDBDB
      E4E4E4E5E5E5E4E4E4F0F0F0E1E1E1F1F1F1F3F3F3E1E1E1EFEFEFEBEBEBF7F7
      F7F0F0F0F1F1F1FEFEFEF9F9F9CECECEDFDFDFDBDBDBE1E1E1DDDDDDDBDBDBF6
      F6F6EDEDEDD1D1D1D4D4D4D6D6D6DEDEDEDBDBDBDBDBDBFBFBFBFDFDFDFAFAFA
      FAFAFAFBFBFBFAFAFAFCFCFCFCFCFCFEFEFEFCFCFCF9F9F9FAFAFAF9F9F9FAFA
      FAF9F9F9F9F9F9FCFCFC}
    Layout = blGlyphRight
    Margin = 0
    ParentClipping = True
    ParentFont = False
    RoundRectBias = 25
    ShadeStyle = fbsHighlight
    Shape = bsRoundRect
    Spacing = 0
    TabOrder = 5
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    OnClick = fcShapeBtn2Click
  end
  object PnlFirmaVerifica: TPanel
    Left = 58
    Top = 113
    Width = 393
    Height = 201
    TabOrder = 6
    Visible = False
    object ImaFirmaVerifica: TImage
      Left = 9
      Top = 24
      Width = 376
      Height = 172
      Stretch = True
    end
    object Shape1: TShape
      Left = 1
      Top = 1
      Width = 391
      Height = 17
      Align = alTop
      Brush.Color = clNavy
      Pen.Style = psClear
      Pen.Width = 0
    end
    object BitBtn1: TBitBtn
      Left = 373
      Top = 2
      Width = 17
      Height = 15
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object fcShapeBtn3: TfcShapeBtn
    Left = 262
    Top = 578
    Width = 33
    Height = 33
    Cursor = crHandPoint
    Color = clMedGray
    DitherColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 0
    Font.Name = 'MS Sans Serif'
    Font.Pitch = fpVariable
    Font.Style = [fsBold]
    Glyph.Data = {
      96030000424D96030000000000003600000028000000180000000C0000000100
      1800000000006003000000000000000000000000000000000000E9E9E9DBDBDB
      FFFFFFFAFAFAF6F6F6F6F6F6F7F7F7F7F7F7F8F8F8F7F7F7F7F7F7F8F8F8F8F8
      F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8F5F5F5FB
      FBFBE2E2E2929292C6C6C6F3F3F3FDFDFDFBFBFBF8F8F8F7F7F7F7F7F7F7F7F7
      F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F8F8F8F8F8F8F8F8
      F8F8F8F8F5F5F5FBFBFBFFFFFFF4F4F4B9B9B99D9D9DC3C3C3EBEBEBF5F5F5FC
      FCFCFCFCFCFBFBFBFDFDFDF7F7F7FAFAFAF9F9F9F9F9F9F9F9F9F9F9F9F7F7F7
      F8F8F8F7F7F7F7F7F7F8F8F8F5F5F5FBFBFBF7F7F7F9F9F9FFFFFFEAEAEABABA
      BAA5A5A5B8B8B8D8D8D8EAEAEADDDDDDCFCFCFF7F7F7EDEDEDEEEEEEECECECEC
      ECECEEEEEEF8F8F8FDFDFDFCFCFCFAFAFAF9F9F9F4F4F4FBFBFBF8F8F8F5F5F5
      F7F7F7FAFAFAFFFFFFFBFBFBD5D5D5BDBDBDAFAFAFA8A8A8787878A9A9A9C8C8
      C8B6B6B6B9B9B9B6B6B6B7B7B7CACACACBCBCBD1D1D1EBEBEBFCFCFCFAFAFAFB
      FBFBF8F8F8F5F5F5F9F9F9F4F4F4C4C4C4BFBFBFC5C5C5C8C8C8BFBFBF9D9D9D
      C0C0C0555555E8E8E8DFDFDFD5D5D5EAEAEAE8E8E8DBDBDBC0C0C0B8B8B8B1B1
      B1C6C6C6F0F0F0FFFFFFF8F8F8F5F5F5F8F8F8FCFCFCC9C9C96E6E6E64646483
      8383D5D5D5909090A8A8A85656568F8F8FAAAAAAA0A0A0B1B1B1ACACACB1B1B1
      DDDDDDDFDFDFC9C9C9BCBCBCA5A5A5EFEFEFF8F8F8F5F5F5F9F9F9FFFFFFFFFF
      FFBABABA747474757575CACACAE3E3E3656565B4B4B49D9D9D66666668686893
      93939696966D6D6DA6A6A6B5B5B5C1C1C1B7B7B7767676DEDEDEF8F8F8F7F7F7
      F0F0F09494949B9B9BA9A9A9ACACACD3D3D3E8E8E8FFFFFFC0C0C09D9D9DE5E5
      E5959595848484CFCFCFF9F9F9DEDEDEE8E8E8EDEDEDEBEBEBE4E4E4DFDFDFF9
      F9F9F8F8F8F6F6F6F7F7F7E7E7E7E8E8E8E9E9E9F1F1F1FDFDFDF8F8F8F7F7F7
      FFFFFFBDBDBDCECECEDEDEDE939393B4B4B4FFFFFFFFFFFFFBFBFBF9F9F9FAFA
      FAFBFBFBF9F9F9FDFDFDF8F8F8F5F5F5F7F7F7FAFAFAFAFAFAFCFCFCFAFAFAF8
      F8F8F7F7F7F6F6F6F7F7F7FBFBFBFBFBFBFFFFFFC1C1C1878787DADADAFFFFFF
      F7F7F7F7F7F7F7F7F7F8F8F8F4F4F4FBFBFBF8F8F8F5F5F5F8F8F8F6F6F6F6F6
      F6F6F6F6F6F6F6F8F8F8F8F8F8F8F8F8F6F6F6F7F7F7F7F7F7FAFAFAFFFFFFB3
      B3B39B9B9BFFFFFFF7F7F7F8F8F8F8F8F8F8F8F8F5F5F5FBFBFB}
    Layout = blGlyphRight
    Margin = 0
    NumGlyphs = 0
    ParentClipping = True
    ParentFont = False
    RoundRectBias = 25
    ShadeStyle = fbsHighlight
    Shape = bsRoundRect
    Spacing = 0
    TabOrder = 7
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    OnClick = fcShapeBtn3Click
  end
end
