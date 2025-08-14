// Inicio Uso Estándares   : 01/08/2011
// Unidad		               : ASO277
// Formulario		           : FResolucionesHis
// Fecha de Creación       : 26/08/2019
// Autor			             : Desarrollo y Mantenimiento
// Objetivo		             : Ver Historial de Resoluciones
// Actualizaciones:
// HPC_201906_MAS          : Resoluciones grabar historial

unit ASO277;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppParameter, ppBands, ppCtrls, ppReport, ppStrtch,
  ppSubRpt, ppVar, jpeg, ppPrnabl, ppClass, ppCache, ppProd, ppComm,
  ppRelatv, ppDB, ppDBPipe, fcButton, fcImgBtn, fcShapeBtn, StdCtrls,
  Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls;

type
  TFResolucionesHis = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    BitMostrarCon: TBitBtn;
    BitClose: TfcShapeBtn;
    BitResol: TBitBtn;
    BitPrint: TBitBtn;
    ppdbResC: TppDBPipeline;
    pprRes: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage4: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel9: TppLabel;
    ppShape3: TppShape;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel12: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape4: TppShape;
    ppDBText1: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBText9: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDetailBand3: TppDetailBand;
    ppShape2: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppFooterBand1: TppFooterBand;
    ppParameterList1: TppParameterList;
    ppdRes: TppDesigner;
    pprResN: TppDBPipeline;
    dbgDocentes: TwwDBGrid;
    dbgContratados: TwwDBGrid;
    BitMostrarNom: TBitBtn;
    procedure BitMostrarNomClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitMostrarConClick(Sender: TObject);
    procedure BitPrintClick(Sender: TObject);
    procedure BitCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FResolucionesHis: TFResolucionesHis;

implementation

uses ASODM, ASO959a;

{$R *.dfm}

procedure TFResolucionesHis.BitMostrarNomClick(Sender: TObject);
var
   xSQL : string;
begin
  Try
      fResNombHist:= TfResNombHist.create(self);
      xSQL:='SELECT ASOID, NUMDOC, FECIDOC, FECFDOC, USUREG, FECREG, NUMCESE FROM ASO_RESOLUCIONES_HIS '
           + 'WHERE ASOID=' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
           +  ' AND NVL(ASOTIPID,''DO'') IN (''DO'',''CE'') ORDER BY FECREG DESC';
      DM1.cdsResolucionHist.Close;
      DM1.cdsResolucionHist.DataRequest(xSQL);
      DM1.cdsResolucionHist.Open;
      If DM1.cdsResolucionHist.RecordCount >= 1 Then
      Begin
         fResNombHist.dbgResolucionesHist.Selected.Clear;
         fResNombHist.dbgResolucionesHist.Selected.Add('NUMDOC'#9'12'#9'Numero~Res.Nomb.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECIDOC'#9'11'#9'Fecha~Res.Nomb.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('NUMCESE'#9'12'#9'Numero~Res.Nomb.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECFDOC'#9'11'#9'Fecha~Cese.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('USUREG'#9'15'#9'Usuario~Modificación'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECREG'#9'18'#9'Fecha~Modificación'#9#9);
         fResNombHist.dbgResolucionesHist.ApplySelected;
         fResNombHist.Showmodal;
      End
      Else
      Begin
         MessageDlg('No existe un Historial de Cambios relacionado al Asociado', mtConfirmation, [mbOk], 0);
      End;

  finally
      DM1.cdsResolucionHist.Close;
      fResNombHist.Free;
  end;
end;

procedure TFResolucionesHis.FormActivate(Sender: TObject);
var
   xSQL : String;
begin

   IF DM1.sAPO201 = 'APO201' THEN
      BEGIN
         DM1.sResolucion := 'ASO_RESOLUCIONES';
         DM1.sReso_where := '';
      END
      ELSE
      BEGIN
         DM1.sResolucion := 'ASO_RESOLUCIONES_NUE';
         DM1.sReso_where := 'SOLICITUD=''' + DM1.cdsAso.fieldbyname('SOLICITUD').AsString + ''' and ';
      END;


   xSQL:='SELECT asoid, ''N'' TIPO, asoresnom, asofresnom, resvig, correlativo, usuario, freg, hreg, anulado, '
        +      ' case when REINGRESO=''S'' then ''REINGRESO'' ELSE ''NOMBRAMIENTO'' END MODALIDAD, '
        +       'case when nvl(ANULADO,''N'')=''S'' then ''ANULADO'' '
        +           ' else case when nvl(RESVIG,''N'')=''S'' and asorescese is null then ''VIGENTE'' else ''CONCLUIDO'' end end ESTADO '
        + ' FROM ' + DM1.sResolucion
        + ' WHERE ' + DM1.sReso_where + ' ASOID=' + QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)
        + '  AND ASOFRESNOM IS NOT NULL AND ASORESNOM IS NOT NULL '
        + '  AND ( ( ASORESCESE IS not NULL AND ASOFRESCESE IS not NULL) OR (ASORESCESE IS NULL AND ASOFRESCESE IS NULL ) ) '
        +' UNION ALL '
        +'SELECT asoid, ''C'' TIPO, asorescese, asofrescese, resvig, correlativo, usuario, freg, hreg, anulado, '
        +      ' case when REINGRESO=''S'' then ''CESE (REINGRESO)'' ELSE ''CESE'' END MODALIDAD, '
        +       'case when nvl(ANULADO,''N'')=''S'' then ''ANULADO'' '
        +           ' else case when nvl(RESVIG,''N'')=''S'' then ''VIGENTE'' else ''CONCLUIDO'' end end ESTADO '
        + ' FROM ' + DM1.sResolucion
        + ' WHERE ' + DM1.sReso_where + ' ASOID=' + QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)
        + '  AND (ASOFRESCESE IS NOT NULL AND ASORESCESE IS NOT NULL) '
        + ' ORDER BY CORRELATIVO, TIPO DESC';
   DM1.cdsResolNom.Close;
   DM1.cdsResolNom.DataRequest(xSQL);
   DM1.cdsResolNom.Open;


   dbgDocentes.DataSource := DM1.dsResolNom;
   dbgDocentes.Selected.Clear;
   dbgDocentes.Selected.Add('MODALIDAD'#9'20'#9'Modalidad');
   dbgDocentes.Selected.Add('ASORESNOM'#9'20'#9'Nro.de~Resolución');
   dbgDocentes.Selected.Add('ASOFRESNOM'#9'11'#9'Fecha~Resolución');
   dbgDocentes.Selected.Add('ESTADO'#9'15'#9'Condición~Actual');
   dbgDocentes.Selected.Add('USUARIO'#9'18'#9'Usuario de Registro');
   dbgDocentes.Selected.Add('HREG'#9'18'#9'Fecha de Registro');
   dbgDocentes.ApplySelected;


   xSQL:='SELECT DISTINCT asoid, asocodmod, asocodaux, asoresnom, asofresnom, asorescese, asofrescese, resvig, correlativo, '
        +       'usuario, freg, hreg, liquidado, numliq, fecliq, reingreso, anulado, obsanu, usuanu, fecanu, numexpliq, fecexpliq, '
        +       'case when nvl(ANULADO,''N'')=''S'' then ''ANULADO'' '
        +           ' else case when nvl(RESVIG,''N'')=''S'' then ''VIGENTE'' else ''CONCLUIDO'' end end ESTADO '
        +  ' FROM ' + DM1.sResolucion
        + ' WHERE ' + DM1.sReso_where + ' ASOID=' + QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)
        + '  AND ASOFRESCESE IS NOT NULL AND ASORESCESE IS NULL '
        + ' ORDER BY CORRELATIVO DESC';
   DM1.cdsResolCon.Close;
   DM1.cdsResolCon.DataRequest(xSQL);
   DM1.cdsResolCon.Open;

   dbgContratados.DataSource := DM1.dsResolCon;
   dbgContratados.Selected.Clear;
   dbgContratados.Selected.Add('ASORESNOM'#9'20'#9'Nro.de~Resolución');
   dbgContratados.Selected.Add('ASOFRESNOM'#9'11'#9'Inicio'#9'F'#9'Fecha');
   dbgContratados.Selected.Add('ASOFRESCESE'#9'11'#9'Final'#9'F'#9'Fecha');
   dbgContratados.Selected.Add('ESTADO'#9'15'#9'Condición~Actual');
   dbgContratados.Selected.Add('USUARIO'#9'20'#9'Usuario de Registro');
   dbgContratados.Selected.Add('HREG'#9'18'#9'Fecha de Registro');
   dbgContratados.ApplySelected;

end;

procedure TFResolucionesHis.BitMostrarConClick(Sender: TObject);
var
   xSQL : string;
begin
  Try
      fResNombHist:= TfResNombHist.create(self);
      xSQL:='SELECT ASOID, NUMDOC, FECIDOC, FECFDOC, USUREG, FECREG FROM ASO_RESOLUCIONES_HIS '
           + 'WHERE ASOID=' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
           +  ' AND ASOTIPID IN (''CO'') ORDER BY FECREG DESC';
      DM1.cdsResolucionHist.Close;
      DM1.cdsResolucionHist.DataRequest(xSQL);
      DM1.cdsResolucionHist.Open;
      If DM1.cdsResolucionHist.RecordCount >= 1 Then
      Begin
         fResNombHist.dbgResolucionesHist.Selected.Clear;
         fResNombHist.dbgResolucionesHist.Selected.Add('NUMDOC'#9'15'#9'Numero~Contrato'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECIDOC'#9'12'#9'Fecha~Ini.Cont.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECFDOC'#9'12'#9'Fecha~Fin.Cont.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('USUREG'#9'20'#9'Usuario~Modificación'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECREG'#9'18'#9'Fecha~Modificación'#9#9);
         fResNombHist.dbgResolucionesHist.ApplySelected;
         fResNombHist.Showmodal;
      End
      Else
      Begin
         MessageDlg('No existe un Historial de Cambios relacionado al Asociado', mtConfirmation, [mbOk], 0);
      End;

  finally
      DM1.cdsResolucionHist.Close;
      fResNombHist.Free;
  end;
end;

procedure TFResolucionesHis.BitPrintClick(Sender: TObject);
begin
  if (DM1.cdsResolNom.RecordCount>0) or (DM1.cdsResolCon.RecordCount>0) then
     pprRes.Print
  else
     MessageDlg('No existe información para el reporte', mtInformation, [mbOk], 0);
  //ppdRes.ShowModal;
end;

procedure TFResolucionesHis.BitCloseClick(Sender: TObject);
begin
  Close;
end;

end.
