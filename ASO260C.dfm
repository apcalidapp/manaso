object FMantAsociadoObsSinRes: TFMantAsociadoObsSinRes
  Left = 417
  Top = 406
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'El Asociado tiene Observaciones Sin Resolver'
  ClientHeight = 230
  ClientWidth = 784
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
  object pnlObsSinResolver: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 228
    Color = 12615935
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 7
      Width = 414
      Height = 24
      Caption = 'El docente tiene Observaciones sin resolver'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object wwDBGrid1: TwwDBGrid
      Left = 4
      Top = 31
      Width = 776
      Height = 97
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Comic Sans MS'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDblClick = wwDBGrid1DblClick
    end
    object pnlObsConsulta2: TPanel
      Left = 4
      Top = 130
      Width = 777
      Height = 95
      TabOrder = 1
      Visible = False
      object Label2: TLabel
        Left = 4
        Top = 6
        Width = 105
        Height = 13
        Caption = 'Detalle del comentario'
      end
      object memObsConsulta2: TMemo
        Left = 2
        Top = 23
        Width = 773
        Height = 68
        Color = 11468799
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 200
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Button12: TButton
        Left = 754
        Top = 2
        Width = 20
        Height = 20
        Caption = 'x'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button12Click
      end
    end
  end
end
