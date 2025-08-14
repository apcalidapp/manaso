object FViewPDF: TFViewPDF
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Visualizar Digital - PDF'
  ClientHeight = 822
  ClientWidth = 1584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 329
    Height = 822
    Align = alLeft
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 20
      Width = 325
      Height = 373
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object ImagAso: TImage
        Left = 2
        Top = 20
        Width = 321
        Height = 351
        Align = alClient
        Stretch = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 547
      Width = 325
      Height = 273
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object ImaFirma: TImage
        Left = 2
        Top = 20
        Width = 321
        Height = 251
        Align = alClient
        Stretch = True
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 329
    Top = 0
    Width = 1255
    Height = 822
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object WebBrowser1: TWebBrowser
      Left = 2
      Top = 20
      Width = 1251
      Height = 800
      Align = alClient
      TabOrder = 0
      OnDownloadComplete = WebBrowser1DownloadComplete
      ControlData = {
        4C0000004B810000AF5200000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
    object pnl01: TPanel
      Left = 513
      Top = 408
      Width = 185
      Height = 41
      Caption = 'Cargando Imagen...'
      TabOrder = 1
      Visible = False
      object Shape2: TShape
        Left = 0
        Top = 0
        Width = 185
        Height = 41
        Brush.Style = bsClear
      end
    end
  end
end
