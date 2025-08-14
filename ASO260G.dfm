object FMantAsociadoConfirmaReniec: TFMantAsociadoConfirmaReniec
  Left = 621
  Top = 186
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #218'ltima actualizaci'#243'n de datos de Reniec'
  ClientHeight = 610
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlConfirma: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 609
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object ImgFotoConfirme: TImage
      Left = 16
      Top = 24
      Width = 126
      Height = 149
      Stretch = True
    end
    object ImgFirmaConfirme: TImage
      Left = 170
      Top = 43
      Width = 223
      Height = 112
      Stretch = True
    end
    object lblMsj: TLabel
      Left = 10
      Top = 5
      Width = 55
      Height = 13
      Caption = 'lblUsuAct'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnconfirma: TfcShapeBtn
      Left = 7
      Top = 576
      Width = 377
      Height = 27
      Caption = 'Los datos en color azul ser'#225'n registrados, Confirme'
      Color = clRed
      DitherColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      NumGlyphs = 0
      ParentClipping = True
      ParentFont = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      TabOrder = 0
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnconfirmaClick
    end
    object StringGrid1: TStringGrid
      Left = 8
      Top = 232
      Width = 425
      Height = 337
      TabOrder = 1
      OnDrawCell = StringGrid1DrawCell
      ColWidths = (
        64
        64
        64
        64
        64)
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 178
      Width = 425
      Height = 49
      TabOrder = 2
      object lblFecAct: TLabel
        Left = 149
        Top = 12
        Width = 44
        Height = 13
        Caption = 'lblFecAct'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 5
        Top = 12
        Width = 141
        Height = 13
        Caption = 'FECHA ACTUALIZACI'#211'N     :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 5
        Top = 28
        Width = 141
        Height = 13
        Caption = 'USUARIO QUE ACTUALIZ'#211':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblUsuAct: TLabel
        Left = 149
        Top = 28
        Width = 45
        Height = 13
        Caption = 'lblUsuAct'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblMensaje: TLabel
        Left = 8
        Top = 48
        Width = 3
        Height = 13
      end
    end
  end
end
