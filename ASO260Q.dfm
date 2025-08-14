object Fmuescarneextranjeria: TFmuescarneextranjeria
  Left = 413
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Muestra carn'#233' de extranjeria'
  ClientHeight = 582
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 8
    Width = 81
    Height = 13
    Caption = 'Foto asociado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 287
    Top = 8
    Width = 86
    Height = 13
    Caption = 'Firma asociado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 16
    Top = 299
    Width = 178
    Height = 13
    Caption = 'Carnet de extranjer'#237'a (anverso)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 404
    Top = 299
    Width = 175
    Height = 13
    Caption = 'Carnet de extranjer'#237'a (reverso)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCerrar: TBitBtn
    Left = 706
    Top = 553
    Width = 75
    Height = 25
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
  object Panel3: TPanel
    Left = 16
    Top = 26
    Width = 217
    Height = 231
    BorderStyle = bsSingle
    Color = 12114134
    TabOrder = 1
    object imgfoto: TImage
      Left = 2
      Top = 1
      Width = 209
      Height = 223
      Stretch = True
    end
  end
  object Panel4: TPanel
    Left = 287
    Top = 26
    Width = 381
    Height = 231
    BorderStyle = bsSingle
    Color = 12114134
    TabOrder = 2
    object imgfirma: TImage
      Left = 2
      Top = 1
      Width = 372
      Height = 223
      Stretch = True
    end
  end
  object Panel1: TPanel
    Left = 16
    Top = 317
    Width = 381
    Height = 231
    BorderStyle = bsSingle
    Color = 12114134
    TabOrder = 3
    object imgcarneAnverso: TImage
      Left = 2
      Top = 1
      Width = 372
      Height = 223
      Stretch = True
    end
  end
  object Panel2: TPanel
    Left = 404
    Top = 316
    Width = 381
    Height = 231
    BorderStyle = bsSingle
    Color = 12114134
    TabOrder = 4
    object ImgCarneReverso: TImage
      Left = 2
      Top = 1
      Width = 372
      Height = 223
      Stretch = True
    end
  end
end
