object FMenCarnetExt: TFMenCarnetExt
  Left = 540
  Top = 294
  BorderStyle = bsDialog
  Caption = 'Carnet de Extranjer'#237'a'
  ClientHeight = 179
  ClientWidth = 233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object fcLabel2: TfcLabel
    Left = 40
    Top = 64
    Width = 1
    Height = 0
    TextOptions.Alignment = taLeftJustify
    TextOptions.VAlignment = vaTop
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 0
    Width = 233
    Height = 17
    Align = alTop
    Alignment = taCenter
    BorderStyle = sbsSingle
    Caption = 'CARNET DE EXTRANJER'#205'A'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox3: TGroupBox
    Left = 1
    Top = 19
    Width = 231
    Height = 158
    Color = clRed
    ParentColor = False
    TabOrder = 1
    object fclMensaje1: TfcLabel
      Left = 22
      Top = 16
      Width = 185
      Height = 36
      AutoSize = False
      Caption = 'Debe actualizar Carnet de Extranjer'#237'a.'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaTop
      TextOptions.WordWrap = True
    end
    object fclMensaje2: TfcLabel
      Left = 16
      Top = 64
      Width = 201
      Height = 52
      AutoSize = False
      Caption = 'Debe contactarse con el Equipo de Actualizaci'#243'n de datos.'
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaTop
      TextOptions.WordWrap = True
    end
    object btnacepta: TBitBtn
      Left = 87
      Top = 124
      Width = 65
      Height = 25
      Caption = 'Salir'
      TabOrder = 0
      OnClick = btnaceptaClick
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
  object Timer1: TTimer
    Interval = 250
    OnTimer = Timer1Timer
    Left = 201
    Top = 216
  end
end
