// Inicio Uso Estándares:	01/08/2011
// Unidad		            : ASO964.pas
// Formulario		        : Fautdes
// Fecha de Creación        : 15/05/2018
// Autor			        : Daniel Fernández
// Objetivo		            : Autorizar las CADAPS - Cartas de Autorización de Descuento de Aportes
// Actualizaciones:
// HPC_201801_MAS
//Inicio HPC_201801_MAS
// MAS_201907_HPC : Se añade el ingreso de oficina de registro de CADAPS  
// MAS_202002_HPC : Al grabar la autorización de descuento de aportes, enviar un correo recordatorio
// MAS_202105_HPC : Se adiciona formato de Autorización de descuento
// al usuario para el envío de la documentación a la unidad de previsió social.
// MAS_202309_HPC : 1. Validar que la edad al momento de la fecha de autorización de descuento sea igual o mayor a 18.
//                  2. Guardar los cambios de actualización de descuentos de aportes en el historial.
//                  3. Añadir botón para mostrar la forma del historial de autorización de descuento de aportes.
//                  4. Envio de mensaje al celular para encuesta de afiliación
unit ASO964;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, wwdblook, Wwdbdlg, Buttons, ppEndUsr,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands,
  ppCache, Mask,
//Inicio MAS_202105_HPC
  wwdbdatetimepicker, ComCtrls, DB,
  jpeg, OleServer, Wordxp,  ppMemo,ShellApi, dateutils;
//Fin MAS_202105_HPC
type
  TFautdes = class(TForm)
    gbgrupo: TGroupBox;
    dblcdmotdesapo: TwwDBLookupComboDlg;
    pnlmotdesapo: TPanel;
    edtdesaut: TEdit;
    btnactualiza: TBitBtn;
    btncerrar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtusuaut: TEdit;
    edtfecregaut: TEdit;
    // Inicio: MAS_201907_HPC
    // Se retira etiquetas no usadas
    // Label3: TLabel;
    // edtofiaut: TEdit;
    // Fin: MAS_201907_HPC
    Label4: TLabel;
    Bevel1: TBevel;
    BitAutDes: TBitBtn;
    Label5: TLabel;
    DbLUniPro: TwwDBLookupComboDlg;
    dbeUproDes: TMaskEdit;
    Label6: TLabel;
    DbLUniPag: TwwDBLookupComboDlg;
    dbeUpagDes: TMaskEdit;
    Label7: TLabel;
    DbLUses: TwwDBLookupComboDlg;
    dbeUses: TMaskEdit;
    Label8: TLabel;
    dbdtfecaut: TwwDBDateTimePicker;
    Label9: TLabel;
    dblcdmotCADAPS: TwwDBLookupComboDlg;
    Panel2: TPanel;
    edtdesmotCADAPS: TEdit;
    BitPrint: TBitBtn;
    // Inicio: MAS_201907_HPC
    // Se añaden nuevas etiquetas para usar en el ingreso de oficina que se registra
    Label10: TLabel;
    pnlOfiAut: TPanel;
    edtOfiAut: TEdit;
    dblcdOfiAut: TwwDBLookupComboDlg;
    // Inicio: MAS_202002_HPC
    // Se crean componentes para el registro del email a donde se enviara el correo.
    pnlRegistraEmail: TPanel;
    GroupBox1: TGroupBox;
    meemail: TMaskEdit;
    btnvalida: TBitBtn;
    // Inicio: MAS_202308_HPC
    // Botón para visualizar el historial de autorización de descuento de aportes
    btnhisautdesapo: TBitBtn;
    gbCADAPS: TGroupBox;
    Memo1: TMemo;
    Memo2: TMemo;
    meestado: TMemo;
    meobservacion: TMemo;
    medescdesa_otros: TMaskEdit;
    // Fin: MAS_202308_HPC
    procedure FormActivate(Sender: TObject);
    procedure btnactualizaClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure dblcdmotdesapoChange(Sender: TObject);
    procedure BitAutDesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcdmotdesapoExit(Sender: TObject);
    procedure dbdtfecautExit(Sender: TObject); 
    procedure dblcdmotCADAPSExit(Sender: TObject);
    procedure BitPrintClick(Sender: TObject);
    // Inicio: MAS_201907_HPC
    // Procedimiento que valida el ingreso de la oficina
    procedure dblcdOfiAutExit(Sender: TObject);
    // Inicio: MAS_202002_HPC
    // botón para enviar email 
    procedure btnvalidaClick(Sender: TObject);
    // Fin: MAS_202002_HPC
    // Fin: MAS_201907_HPC
//Inicio MAS_202105_HPC
    procedure Genereapdf(xPlantilla,xnombre,xcolegio,xRuta,xsufijo,xasodni:String);
    // Inicio: MAS_202308_HPC
    // Procedimiento para llamar a la forma que visualiza la autorización de descuento de aportes.
    procedure btnhisautdesapoClick(Sender: TObject);
    // Fin: MAS_202308_HPC
//Fin MAS_202105_HPC
  private
    { Private declarations }
    function chkdesdesapo(xasoid:String):Boolean;
  public
    { Public declarations }
//Inicio MAS_202105_HPC
    sConsulta: string;
    sFirmaCarta,sRuta,sPlantilla: string;
//Fin MAS_202105_HPC
  end;

var
  Fautdes: TFautdes;

implementation
//Inicio MAS_202105_HPC

// Inicio: MAS_202308_HPC
// Se añade forma la mostrar el historial de autorizaciones de descuento.
// uses ASODM, ASO260,ASO969,ComObj, VERPDF;
uses ASODM, ASO260,ASO969,ComObj, VERPDF, ASO964A;
// Fin: MAS_202308_HPC
  const
  wdFormatPDF = 17;
//Fin MAS_202105_HPC
{$R *.dfm}

procedure TFautdes.FormActivate(Sender: TObject);
Var xSql, xasoid:String;
begin
   // Inicio: MAS_202308_HPC
   // Actualiza variables para mostrar el estado de envio CADADPS
   xSql := 'SELECT'
   +' CASE WHEN C.USUGENLOT IS NOT NULL THEN ''S'' ELSE ''N'' END ESTGEN, CASE WHEN C.USUENVASEDCEN IS NOT NULL THEN ''S'' ELSE ''N'' END ESTENV,'
   +' CASE WHEN A.USUREC IS NOT NULL THEN ''S'' ELSE ''N'' END CHEREC, CASE WHEN A.USUVAL IS NOT NULL THEN ''S'' ELSE ''N'' END CHEVAL,'
   +' CASE WHEN A.USUENVALM IS NOT NULL THEN ''S'' ELSE ''N'' END ESTENVALM, CASE WHEN A.USURECALM IS NOT NULL THEN ''S'' ELSE ''N'' END ESTRECALM,'
   +' TRIM(B.DESOBSAUTDESAPO)||CASE WHEN TRIM(A.COMVALDOC) IS NOT NULL THEN ''/'' END||TRIM(A.COMVALDOC)||'
   +'CASE WHEN TRIM(D.DESOBSAUTDESAPO) IS NOT NULL THEN ''/'' END||TRIM(D.DESOBSAUTDESAPO) OBS'
   +' FROM ASO_VAL_CADAPS A, (SELECT CODOBSAUTDESAPO, DESOBSAUTDESAPO FROM ASO_OBS_AUT_DES_APO WHERE TIPO = ''O'') B,'
   +' ASO_VAL_CADAPS_CAB C,'
   +' (SELECT CODOBSAUTDESAPO, DESOBSAUTDESAPO FROM ASO_OBS_AUT_DES_APO WHERE TIPO = ''V'') D'
   +' WHERE ASOID = '+QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)
   +' AND A.CODGENENV IN (SELECT MAX(A.CODGENENV) FROM ASO_VAL_CADAPS A, ASO_VAL_CADAPS_CAB B'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)+' AND A.CODGENENV = B.CODGENENV) AND A.CODVALDOC = B.CODOBSAUTDESAPO(+)'
   +' AND A.CODGENENV = C.CODGENENV AND A.CODVALOK = D.CODOBSAUTDESAPO(+)';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.RecordCount > 0 Then gbCADAPS.Visible := True
   Else gbCADAPS.Visible := False;
   If (DM1.cdsQry.FieldByName('ESTGEN').AsString = 'S') And (DM1.cdsQry.FieldByName('ESTENV').AsString = 'N')
   And (DM1.cdsQry.FieldByName('CHEREC').AsString = 'N') And (DM1.cdsQry.FieldByName('CHEVAL').AsString = 'N')
   And (DM1.cdsQry.FieldByName('ESTENVALM').AsString = 'N') And (DM1.cdsQry.FieldByName('ESTRECALM').AsString = 'N') Then
      meestado.Text := 'LOTE GENERADO';
   If (DM1.cdsQry.FieldByName('ESTGEN').AsString = 'S') And (DM1.cdsQry.FieldByName('ESTENV').AsString = 'S')
   And (DM1.cdsQry.FieldByName('CHEREC').AsString = 'N') And (DM1.cdsQry.FieldByName('CHEVAL').AsString = 'N')
   And (DM1.cdsQry.FieldByName('ESTENVALM').AsString = 'N') And (DM1.cdsQry.FieldByName('ESTRECALM').AsString = 'N') Then
      meestado.Text := 'LOTE ENVIADO A SEDE CENTRAL';
   If (DM1.cdsQry.FieldByName('ESTGEN').AsString = 'S') And (DM1.cdsQry.FieldByName('ESTENV').AsString = 'S')
   And (DM1.cdsQry.FieldByName('CHEREC').AsString = 'S') And (DM1.cdsQry.FieldByName('CHEVAL').AsString = 'N')
   And (DM1.cdsQry.FieldByName('ESTENVALM').AsString = 'N') And (DM1.cdsQry.FieldByName('ESTRECALM').AsString = 'N') Then
      meestado.Text := 'FILE RECEPCIONADO POR SEDE CENTRAL';
   If (DM1.cdsQry.FieldByName('ESTGEN').AsString = 'S') And (DM1.cdsQry.FieldByName('ESTENV').AsString = 'S')
   And (DM1.cdsQry.FieldByName('CHEREC').AsString = 'S') And (DM1.cdsQry.FieldByName('CHEVAL').AsString = 'S')
   And (DM1.cdsQry.FieldByName('ESTENVALM').AsString = 'N') And (DM1.cdsQry.FieldByName('ESTRECALM').AsString = 'N') Then
      meestado.Text := 'FILE VALIDADO POR SEDE CENTRAL';
   If (DM1.cdsQry.FieldByName('ESTGEN').AsString = 'S') And (DM1.cdsQry.FieldByName('ESTENV').AsString = 'S')
   And (DM1.cdsQry.FieldByName('CHEREC').AsString = 'S') And (DM1.cdsQry.FieldByName('CHEVAL').AsString = 'S')
   And (DM1.cdsQry.FieldByName('ESTENVALM').AsString = 'S') And (DM1.cdsQry.FieldByName('ESTRECALM').AsString = 'N') Then
      meestado.Text := 'FILE ENVIADO HA ARCHIVO CENTRAL';
   If (DM1.cdsQry.FieldByName('ESTGEN').AsString = 'S') And (DM1.cdsQry.FieldByName('ESTENV').AsString = 'S')
   And (DM1.cdsQry.FieldByName('CHEREC').AsString = 'S') And (DM1.cdsQry.FieldByName('CHEVAL').AsString = 'S')
   And (DM1.cdsQry.FieldByName('ESTENVALM').AsString = 'S') And (DM1.cdsQry.FieldByName('ESTRECALM').AsString = 'S') Then
      meestado.Text := 'FILE RECEPCIONADO POR ARCHIVO CENTRAL';
   meobservacion.Text := DM1.cdsQry.FieldByName('OBS').AsString;
   // Fin: MAS_202308_HPC
   pnlRegistraEmail.Visible := False;
   // Carga información de las oficina
   xSql := 'SELECT OFDESID, OFDESNOM FROM APO110 ORDER BY OFDESNOM';
   // DM1.cdsQry20.Close;
   // DM1.cdsQry20.DataRequest(xSql);
   // DM1.cdsQry20.Open;
   DM1.cdsOfdes.Close;
   DM1.cdsOfdes.DataRequest(xSql);
   DM1.cdsOfdes.Open;


   dblcdOfiAut.Selected.Clear;
   dblcdOfiAut.Selected.Add('OFDESID'#9'5'#9'Código'#9#9);
   dblcdOfiAut.Selected.Add('OFDESNOM'#9'30'#9'Descripción'#9#9);
   // Fin: MAS_201907_HPC
  // Inicio: MAS_202308_HPC: Se añade clausula para ordenar el client
  // xSql := 'SELECT CODMOTDEST, DESMOTDES FROM ASO_MOT_DES';
  xSql := 'SELECT CODMOTDEST, DESMOTDES FROM ASO_MOT_DES ORDER BY CODMOTDEST';
  // Fin: MAS_202308_HPC
  DM1.cdsReclamoMotiv.Close;
  DM1.cdsReclamoMotiv.DataRequest(xSql);
  DM1.cdsReclamoMotiv.Open;
  dblcdmotdesapo.Selected.Clear;
  dblcdmotdesapo.Selected.Add('CODMOTDEST'#9'5'#9'Código'#9#9);
  dblcdmotdesapo.Selected.Add('DESMOTDES'#9'30'#9'Descripción'#9#9);
  xSql := 'SELECT CODMOTAUTCADAPS, DESMOTAUTCADAPS  FROM ASO_MOT_AUT_CADAPS ORDER BY CODMOTAUTCADAPS';
  DM1.cdsAutCADAPS.Close;
  DM1.cdsAutCADAPS.DataRequest(xSql);
  DM1.cdsAutCADAPS.Open;
  dblcdmotCADAPS.Selected.Clear;
  dblcdmotCADAPS.Selected.Add('CODMOTAUTCADAPS'#9'5'#9'Código'#9#9);
  dblcdmotCADAPS.Selected.Add('DESMOTAUTCADAPS'#9'30'#9'Descripción'#9#9);

  xAsoId:=DM1.cdsAso.fieldbyname('ASOID').AsString;

  DbLUniPro.Text :=FMantAsociado.DbLUniPro.Text;
  DbLUniPag.Text :=FMantAsociado.DbLUniPag.Text;
  DbLUses.Text   :=FMantAsociado.DbLUses.Text;
  dbeUproDes.Text:=FMantAsociado.dbeUproDes.Text;
  dbeUpagDes.Text:=FMantAsociado.dbeUpagDes.Text;
  dbeUses.Text   :=FMantAsociado.dbeUses.Text;

  If  DM1.xautdes='A' Then
     Begin
       // Inicio: MAS_202308_HPC: Se añade columna DESOBSDESTAPO
       // xSql := 'SELECT A.FECAUTDESAPO, A.FECREGAUTDESAPO, A.USUREGAUTDESAPO, A.OFIREGAUTDESAPO, A.CODMOTDESTAPO, B.OFDESNOM, A.CODMOTAUTCADAPS FROM '+DM1.sAPO201+' A, APO110 B WHERE ASOID = '+QuotedStr(xAsoId)
       xSql := 'SELECT A.FECAUTDESAPO, A.FECREGAUTDESAPO, A.USUREGAUTDESAPO, A.OFIREGAUTDESAPO, A.CODMOTDESTAPO, B.OFDESNOM, A.CODMOTAUTCADAPS, A.DESOBSDESTAPO FROM '+DM1.sAPO201+' A, APO110 B WHERE ASOID = '+QuotedStr(xAsoId)
       // Fin: MAS_202308_HPC
       +' AND A.OFIREGAUTDESAPO = B.OFDESID(+)';
       DM1.cdsQry.Close;
       DM1.cdsQry.DataRequest(xSQL);
       DM1.cdsQry.Open;
       edtusuaut.Text := DM1.cdsQry.FieldByName('USUREGAUTDESAPO').AsString;
       dbdtfecaut.DateTime := DM1.cdsQry.FieldByName('FECAUTDESAPO').AsDateTime;
       dblcdmotCADAPS.Text := DM1.cdsQry.FieldByName('CODMOTAUTCADAPS').AsString;
       edtdesmotCADAPS.Text := dm1.RecuperaDatos('ASO_MOT_AUT_CADAPS', 'CODMOTAUTCADAPS', dblcdmotCADAPS.Text , 'DESMOTAUTCADAPS');
       edtfecregaut.Text := DM1.cdsQry.FieldByName('FECREGAUTDESAPO').AsString;
       edtofiaut.Text := DM1.cdsQry.FieldByName('OFDESNOM').AsString;
       // Inicio: MAS_201907_HPC
       // Se asigna codigo de oficina de registro
       dblcdOfiAut.Text := DM1.cdsQry.FieldByName('OFIREGAUTDESAPO').AsString;
       // Fin: MAS_201907_HPC
       dblcdmotdesapo.Text := DM1.cdsQry.FieldByName('CODMOTDESTAPO').AsString;
       medescdesa_otros.Text := DM1.cdsQry.FieldByName('DESOBSDESTAPO').AsString;
    End
  Else
    Begin
       // Inicio: MAS_202308_HPC: Se añade columna DESOBSDESTAPO
       // xSql := 'SELECT A.FECAUTDESCUO, A.FECREGAUTDESAPO, A.USUREGAUTDESCUO, A.OFIREGAUTDESCUO, A.CODMOTDESTCUO, B.OFDESNOM, A.CODMOTAUTCADAPS FROM '+DM1.sAPO201+' A, APO110 B WHERE ASOID = '+QuotedStr(xAsoId)
       xSql := 'SELECT A.FECAUTDESCUO, A.FECREGAUTDESAPO, A.USUREGAUTDESCUO, A.OFIREGAUTDESCUO, A.CODMOTDESTCUO, B.OFDESNOM, A.CODMOTAUTCADAPS, A.DESOBSDESTAPO FROM '+DM1.sAPO201+' A, APO110 B WHERE ASOID = '+QuotedStr(xAsoId)
       // Fin: MAS_202308_HPC
       +' AND A.OFIREGAUTDESCUO = B.OFDESID(+)';
       DM1.cdsQry.Close;
       DM1.cdsQry.DataRequest(xSQL);
       DM1.cdsQry.Open;
       edtusuaut.Text := DM1.cdsQry.FieldByName('USUREGAUTDESCUO').AsString;
       dbdtfecaut.DateTime := DM1.cdsQry.FieldByName('FECAUTDESCUO').AsDateTime;
       dblcdmotCADAPS.Text := DM1.cdsQry.FieldByName('CODMOTAUTCADAPS').AsString;
       edtfecregaut.Text := DM1.cdsQry.FieldByName('FECREGAUTDESAPO').AsString;
       edtofiaut.Text := DM1.cdsQry.FieldByName('OFDESNOM').AsString;
       dblcdmotdesapo.Text := DM1.cdsQry.FieldByName('CODMOTDESTCUO').AsString;
    End;

  IF ((DM1.cdsAso.fieldbyname('ASOTIPID').AsString = 'DO')
    OR (DM1.cdsAso.fieldbyname('ASOTIPID').AsString = 'VO')) THEN
  BEGIN
    IF (DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S') THEN
    BEGIN
      IF (DM1.CrgDescrip('ASOID=' + QuotedStr(xAsoId), DM1.sAPO201, 'AUTDESAPO') = 'S') And (FMantAsociado.sFirmaCarta <> 'S') THEN
      begin
        dbdtfecaut.Enabled := false;
        dblcdmotCADAPS.Enabled := False;
        Label4.Visible := False;
        dblcdmotdesapo.Visible := False;
        medescdesa_otros.Visible := False;
        pnlmotdesapo.Visible := False;
        BitAutDes.Enabled := False;
        //la desautorización sólo es para el Nivel 3 o superior
        If (Copy(DM1.CrgArea(DM1.wUsuario),6,2) >= '03')
          and (chkdesdesapo(xAsoId) = True) Then
          btnactualiza.Enabled := True
        else
          btnactualiza.Enabled := False;
      end
      else
      begin
        dbdtfecaut.Enabled := True;
        dblcdmotCADAPS.Enabled := True;
        Label4.Visible := True;
        if Trim(dblcdmotdesapo.Text) = '' then
        begin
          Label4.Visible := False;
          dblcdmotdesapo.Visible := False;
          pnlmotdesapo.Visible := False;
          medescdesa_otros.Visible := False;
        end
        else
        begin
          Label4.Visible := True;
          dblcdmotdesapo.Visible := True;
          medescdesa_otros.Visible := True;
          pnlmotdesapo.Visible := True;
        end;
        BitAutDes.Enabled := True;
        If Copy(DM1.CrgArea(DM1.wUsuario),6,2) >= '03' Then
          btnactualiza.Enabled := True
        else
          btnactualiza.Enabled := False;
        btnactualiza.Enabled := False;
      end;
    END
    ELSE
    BEGIN
      IF (DM1.CrgDescrip('ASOID=' + QuotedStr(xAsoId), DM1.sAPO201, 'AUTDESAPO') = 'S') THEN
      begin
        Label4.Visible := False;
        dblcdmotdesapo.Visible := False;
        medescdesa_otros.Visible := False;
        pnlmotdesapo.Visible := False;
      end
      else
      begin
        Label4.Visible := True;
        dblcdmotdesapo.Visible := True;
        medescdesa_otros.Visible := True;
        pnlmotdesapo.Visible := True;
      end;
      dbdtfecaut.Enabled := false;
      BitAutDes.Enabled := False;
      btnactualiza.Enabled := False;
    END;
  END
  ELSE
  BEGIN
    dbdtfecaut.Enabled := false;
    BitAutDes.Enabled := False;
    btnactualiza.Enabled := False;
  END;

  if (sFirmaCarta = 'S') AND (Copy(DM1.CrgArea(DM1.wUsuario),6,2) >= '03') then
  begin
    BitAutDes.Enabled := true;
  end;
  //Adicionar funcionalidades de consulta y control de errores de servicio web RENIEC
//Inicio MAS_202105_HPC
  IF (DM1.CrgDescrip('ASOID=' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString), DM1.sAPO201, 'AUTDESAPO') <> 'S')  THEN
     BitAutDes.Enabled := False;
//Fin MAS_202105_HPC
  if sConsulta = 'S' then
    Begin
       gbgrupo.Enabled := False;
       dblcdmotdesapo.Enabled := False;
       medescdesa_otros.Enabled := False;
       pnlmotdesapo.Enabled := False;
    end
  else
    Begin
       gbgrupo.Enabled := True;
    End;
end;

Procedure TFautdes.btnactualizaClick(Sender: TObject);
Var Boton:Integer;
   xItem, xSQL, xCodReg, xAsoId,xmsg1,xmsg2:String;
Begin
   xAsoId:=DM1.cdsAso.fieldbyname('ASOID').AsString;
   IF DM1.xautdes='A' then
      Begin
         xmsg1:='Por favor seleccione el motivo por el cual el asociado'+#13+'desautoriza su descuento de aporte';
         xmsg2:='Se ha registrado la desautorización de descuento de aportes';
     End
   Else
     Begin
        xmsg1:='Por favor seleccione el motivo por el cual el asociado'+#13+'desautoriza su descuento de cuotas';
        xmsg2:='Se ha registrado la desautorización de descuento de cuotas';
     End;

   If Trim(dblcdmotdesapo.Text) = '' Then
   Begin
      MessageDlg(xmsg1, mtConfirmation, [mbOk], 0);

   End;

   TRY
      FConfirmaDesautDcto := TFConfirmaDesautDcto.Create(Self);
      FConfirmaDesautDcto.ShowModal;
      if FConfirmaDesautDcto.CODMOTDEST <> '' then
      begin
         dblcdmotdesapo.Text := FConfirmaDesautDcto.CODMOTDEST;
         medescdesa_otros.Text := FConfirmaDesautDcto.DESOTRMOTDESC;
      end
      else
      begin
         exit;
      end;
   FINALLY
      FConfirmaDesautDcto.Free;
   END;

   Label4.Visible := True;
   dblcdmotdesapo.Visible := True;
   medescdesa_otros.Visible := True;
   pnlmotdesapo.Visible := True;
   // Se añade el campo de motivo de la autorización de descuento de aportes
   // Al momento de actualizar la carta CADAPS
   IF DM1.xautdes='A' then
   Begin
      xSQL:='UPDATE '+DM1.sAPO201+' SET TIPOCANALCOD = NULL, FECACTCANAL = NULL, USUACTCANAL = NULL, CODGENENV = NULL, AUTDESAPO=NULL, FECREGAUTDESAPO = NULL, FECAUTDESAPO=NULL, USUREGAUTDESAPO=NULL, OFIREGAUTDESAPO=NULL, CODMODAUTDESAPO=NULL, CODMOTAUTCADAPS = NULL, CODMOTDESTAPO = '+QuotedStr(dblcdmotdesapo.Text)+', DESOBSDESTAPO = '+QuotedStr(medescdesa_otros.Text)+', AUTDESAPOFORMATO=NULL WHERE ASOID = '+QuotedStr(xAsoId);
   End
   Else
   Begin
      xSQL:='UPDATE '+DM1.sAPO201+' SET TIPOCANALCOD = NULL, FECACTCANAL = NULL, USUACTCANAL = NULL, CODGENENV = NULL, AUTDESCUO=NULL, FECAUTDESCUO=NULL, USUREGAUTDESCUO=NULL, OFIREGAUTDESCUO=NULL, CODMODAUTDESCUO=NULL, CODMOTAUTCADAPS = NULL, CODMOTDESTCUO = '+QuotedStr(dblcdmotdesapo.Text)+', DESOBSDESTAPO = '+QuotedStr(medescdesa_otros.Text)+', AUTDESAPOFORMATO=NULL WHERE ASOID = '+QuotedStr(xAsoId);
  End;

   If DM1.xautdes='A' then
      Boton := Application.MessageBox ('¿Desea quitar la autorización de descuento de aportes?', 'Desautorización de descuento de aportes',MB_YESNO+MB_ICONQUESTION)
   Else
      Boton := Application.MessageBox ('¿Desea quitar la autorización de descuento de cuotas?', 'Desautorización de descuento de cuotas',MB_YESNO+MB_ICONQUESTION);

   If Boton = ID_YES Then
   Begin
      Screen.Cursor:=crHourGlass;
      xCodReg := DM1.CodReg;
      DM1.Registro_Aud(xAsoId,'0',xCodReg);
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      DM1.Registro_Aud(xAsoId,'1',xCodReg);
      xSQL:='UPDATE APOSINCARTA SET AUTODESC='+QuotedStr('S')+' WHERE ASOID='+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      xSQL := 'UPDATE GEMAP.T_AFILIACIONES SET DOCFECDESAUTORIZA = SYSDATE WHERE DOCASOID  = '+QuotedStr(xAsoId)+' AND DOCFECDESAUTORIZA IS NULL';
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);

      // Inicio: MAS_202308_HPC
      // Se añade actualización de autorización de descuento de aportes a la tabla de historiales
      xSQL := 'UPDATE DB2ADMIN.ASO_AUT_DES_APO_HIS SET SITREG = ''N'' WHERE ASOID = '+QuotedStr(xAsoId);
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      xSQL := 'SELECT  LPAD(NVL(MAX(ITEM),0)+1,4,''0'') ITEM FROM ASO_AUT_DES_APO_HIS WHERE ASOID = '+QuotedStr(xAsoId);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      xItem := DM1.cdsQry.FieldByname('ITEM').AsString;
      xSQL := 'INSERT INTO DB2ADMIN.ASO_AUT_DES_APO_HIS (ASOID, ASOCODMOD, ASODNI, ASOAPENOMDNI, ASOTIPID, UPROID, UPAGOID, USEID, ITEM,'
      +' SITREG, USUCREA, FECCREA, MODCREA, AUTDESAPO, FECAUTDESAPO, FECREGAUTDESAPO, USUREGAUTDESAPO, OFIREGAUTDESAPO, CODMODAUTDESAPO, DESOBSDESTAPO,'
      +' CODMOTDESTAPO, CODMOTAUTCADAPS, AUTDESAPOFORMATO, FECREGDESTAPO, USUREGDESTAPO, OFIREGDESTAPO)'
      +' SELECT ASOID, ASOCODMOD, ASODNI, ASOAPENOMDNI, ASOTIPID, UPROID, UPAGOID, USEID, '+QuotedStr(xItem)
      +' , ''S'', '+QuotedStr(DM1.wUsuario)+', SYSDATE, ''ASO'', AUTDESAPO, FECAUTDESAPO, FECREGAUTDESAPO, USUREGAUTDESAPO, OFIREGAUTDESAPO, CODMODAUTDESAPO, DESOBSDESTAPO,'
      +' CODMOTDESTAPO, CODMOTAUTCADAPS, AUTDESAPOFORMATO, SYSDATE, '+QuotedStr(DM1.wUsuario)+', '+QuotedStr(DM1.wofides)+' FROM APO201 WHERE ASOID = '+QuotedStr(xAsoid);
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      // Fin: MAS_202308_HPC

      xSql := 'SELECT DOCDECLAASOIMG, DOCAUTDESCIMG FROM GEMAP.T_AFILIACIONES'
      +' WHERE TDOCAFID IN (SELECT MAX(TDOCAFID) TDOCAID FROM GEMAP.T_AFILIACIONES WHERE DOCASOID  = '+QuotedStr(xAsoId)
      +' AND DOCFECDESAUTORIZA IS NULL)';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('DOCDECLAASOIMG').AsString <> '' Then FMantAsociado.fcDeclaracion.Visible := True Else FMantAsociado.fcDeclaracion.Visible := False;
      If DM1.cdsQry.FieldByName('DOCAUTDESCIMG').AsString <> '' Then FMantAsociado.fcAutorizacion.Visible := True Else FMantAsociado.fcAutorizacion.Visible := False;
      Screen.Cursor:=crDefault;
      MessageDlg(xmsg2, mtConfirmation, [mbOk], 0);
      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByName('AUTDESAPOFORMATO').AsString:='';
      DM1.cdsAso.FieldByName('AUTDESAPO').AsString:='';
      sPlantilla := '';
   End;
   Fautdes.Close;
End;

procedure TFautdes.btncerrarClick(Sender: TObject);
begin
   Fautdes.Close;
end;

procedure TFautdes.dblcdmotdesapoChange(Sender: TObject);
begin
  If DM1.cdsReclamoMotiv.Locate('CODMOTDEST',dblcdmotdesapo.Text,[]) then
    edtdesaut.Text := DM1.cdsReclamoMotiv.FieldByName('DESMOTDES').asstring
  Else
    edtdesaut.Text := '';
end;

procedure TFautdes.BitAutDesClick(Sender: TObject);
var
   Boton : Integer;
   xSQL, xEmailUsuario : String;
   xCodReg, xItem: STRING;
   xmovil, xmensaje:String;
begin
   If Trim(dblcdmotCADAPS.Text) = '' then
   Begin
      MessageDlg('Ingrese el motivo de autorización CADAPS', mtConfirmation, [mbOk], 0);
      dblcdmotCADAPS.SetFocus;
      Exit;
   End;
   If Trim(dblcdOfiAut.Text) = '' then
   Begin
      MessageDlg('Debe registrar la Oficina que autoriza', mtConfirmation, [mbOk], 0);
      dblcdOfiAut.SetFocus;
      Exit;
   End;
   if Trim(dbdtfecaut.Text) = '' then
   begin
      MessageDlg('Ingrese la fecha en la cual el asociado firmó la carta de autorización CADAP', mtConfirmation, [mbOk], 0);
      dbdtfecaut.SetFocus;
      Exit;
   end;
   If MessageDlg('¿Se ha firmado el formato de autorización de descuento y la declaración del asociado?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Exit;
   Boton := Application.MessageBox ('¿Autoriza descuento de aportes?','Autorización de descuento de aportes',MB_YESNO+MB_ICONQUESTION);
   If Boton = ID_YES Then
   Begin
      try
         if DM1.cdsAso.fieldbyname('FALLECIDO').AsString <> 'S' then
         begin
            Screen.Cursor := crHourGlass;
            xCodReg := DM1.CodReg;
            DM1.Registro_Aud(DM1.cdsAso.FieldByName('ASOID').AsString, '0', xCodReg);
            xSQL := 'UPDATE '+DM1.sAPO201+' SET AUTDESAPO = '+QuotedStr('S')
            +', FECAUTDESAPO = '+QuotedStr(Trim(dbdtfecaut.Text))
            +', FECREGAUTDESAPO = SYSDATE, CODGENENV = NULL, USUREGAUTDESAPO = '+QuotedStr(DM1.wUsuario)
            +', OFIREGAUTDESAPO = '+QuotedStr(dblcdOfiAut.Text)+', CODMODAUTDESAPO = ''ASO'', CODMOTDESTAPO = NULL, CODMOTAUTCADAPS = '+QuotedStr(dblcdmotCADAPS.Text)
            +', AUTDESAPOFORMATO='+QuotedStr(sPlantilla)
            +', TIPOCANALCOD = '+IntToStr(2)
            +', FECACTCANAL = SYSDATE '
            +', USUACTCANAL = '+QuotedStr(DM1.wUsuario)
            +' WHERE '+DM1.sAso_where+' ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
            DM1.Registro_Aud(DM1.cdsAso.FieldByName('ASOID').AsString, '1', xCodReg);
            // Inicio: MAS_202308_HPC
            // Se añade actualización de autorización de descuento de aportes a la tabla de historiales
            xSQL := 'UPDATE DB2ADMIN.ASO_AUT_DES_APO_HIS SET SITREG = ''N'' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
            xSQL := 'SELECT  LPAD(NVL(MAX(ITEM),0)+1,4,''0'') ITEM FROM ASO_AUT_DES_APO_HIS WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSql);
            DM1.cdsQry.Open;
            xItem := DM1.cdsQry.FieldByname('ITEM').AsString;
            xSql := 'INSERT INTO DB2ADMIN.ASO_AUT_DES_APO_HIS (ASOID, ASOCODMOD, ASODNI, ASOAPENOMDNI, ASOTIPID, UPROID, UPAGOID, USEID,'
            +' ITEM, SITREG, USUCREA, FECCREA, MODCREA, AUTDESAPO, FECAUTDESAPO, FECREGAUTDESAPO, USUREGAUTDESAPO, OFIREGAUTDESAPO, CODMODAUTDESAPO,'
            +' CODMOTDESTAPO, CODMOTAUTCADAPS, AUTDESAPOFORMATO)'
            +' VALUES ('+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+','
            +QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString)+','
            +QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString)+','
            +QuotedStr(DM1.cdsAso.FieldByName('ASOAPENOMDNI').AsString)+','
            +QuotedStr(DM1.cdsAso.FieldByName('ASOTIPID').AsString)+','
            +QuotedStr(DM1.cdsAso.FieldByName('UPROID').AsString)+','
            +QuotedStr(DM1.cdsAso.FieldByName('UPAGOID').AsString)+','
            +QuotedStr(DM1.cdsAso.FieldByName('USEID').AsString)+','
            +QuotedStr(xItem)+','
            +QuotedStr('S')+','
            +QuotedStr(DM1.wUsuario)+','
            +'SYSDATE,'
            +'''ASO'','
            +QuotedStr('S')+','
            +QuotedStr(Trim(dbdtfecaut.Text))+','
            +'SYSDATE,'
            +QuotedStr(DM1.wUsuario)+','
            +QuotedStr(dblcdOfiAut.Text)+','
            +QuotedStr('ASO')+','
            +'NULL,'
            +QuotedStr(dblcdmotCADAPS.Text)+','
            +QuotedStr(sPlantilla)+')';
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
            // Fin: MAS_202308_HPC
            Screen.Cursor := crDefault;
         end;
         xSQL:='UPDATE APOSINCARTA SET AUTODESC='+QuotedStr('N')+' WHERE ASOID='+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         xSQL:='UPDATE APOSINCARTA SET FLG_SEG_FIR='+QuotedStr('S')+' WHERE ASOID='+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND NVL(FLG_SEG_FIR,''N'')=''N''';
         DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         FMantAsociado.sFirmaCarta:='N';
         BitAutDes.Enabled := False;
         MessageDlg('El registro ha sido actualizado!!!', mtConfirmation, [mbOk], 0);
         pnlRegistraEmail.Visible := True;
         pnlRegistraEmail.Top     :=  171;
         pnlRegistraEmail.Left    :=   72;
         gbgrupo.Enabled := False;
         BitPrint.Enabled := False;
         BitAutDes.Enabled := False;
         btnactualiza.Enabled := False;
         btncerrar.Enabled := False;

         xSQL := 'SELECT VALDES1 MENSAJE FROM DB2ADMIN.CRE_TABLA_PARAMETRO WHERE CODTAB = ''ENCUAFI'' AND CODDET = ''SMS''';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         xmensaje := DM1.cdsQry.FieldByName('MENSAJE').AsString;
         xSQL := 'SELECT DB2ADMIN.SF_SIO_CONTACTO_CELULAR('+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+')  CELULAR FROM DUAL';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         xmovil := DM1.cdsQry.FieldByName('CELULAR').AsString;
         DM1.EnviarSMS(xmovil, xmensaje);

         // Buscar si existe email del usuario, en caso que no exista solicita el nombre de usuario
         xSQL := 'SELECT MAIL FROM SEGURIDAD.M_USUARIO WHERE ID_USUARIO = '+QuotedStr(DM1.wUsuario)+' and TRIM(MAIL) IS NOT NULL ' ;
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount > 0 Then
         Begin
            meemail.Enabled := False;
            xEmailUsuario := DM1.cdsQry.FieldByName('MAIL').AsString;
            meemail.Text := xEmailUsuario;
         End
         Else
         Begin
            meemail.Enabled := True;
            xEmailUsuario   := '';
            meemail.SetFocus;
         End;
         DM1.cdsAso.Edit;
         DM1.cdsAso.FieldByName('AUTDESAPOFORMATO').AsString:=sPlantilla ;
      except
         ShowMessage('Error al grabar. Volver a intentar');
      end;
   end;
end;

function TFautdes.chkdesdesapo(xasoid: String): Boolean;
Var
   xSql:String;

begin
   Result := True;
   // Se verifica si el docente cuenta con créditos vigentes
   xSql := 'SELECT COUNT(*) CREDITOS FROM CRE301 WHERE ASOID = '+QuotedStr(xasoid)+' AND CREESTID IN (''01'',''02'')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If DM1.cdsQry.FieldByName('CREDITOS').AsInteger > 0 Then
   Begin
      MessageDlg('El docente cuenta actualmente con créditos vigentes'#13'No procede la desautorización.', mtConfirmation, [mbOk], 0);
      Result := False;
   End;

end;

procedure TFautdes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFautdes.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
end;

procedure TFautdes.dblcdmotdesapoExit(Sender: TObject);
begin
   If Trim(dblcdmotdesapo.Text) = '' Then Exit;
end;

procedure TFautdes.dbdtfecautExit(Sender: TObject);
var xedad:Double;
begin
   If btncerrar.Focused Then Exit;
   If dbdtfecaut.Date > DM1.FechaSys Then
   Begin
      MessageDlg('Fecha de autorización no puede ser mayor a la fecha de hoy.', mtConfirmation, [mbOk], 0);
      dbdtfecaut.SetFocus;
      Exit;
   End;
   xedad := Int(YearSpan(dbdtfecaut.Date, DM1.cdsAso.FieldByName('ASOFECNAC').AsDateTime));
   If xedad < 18 Then
   Begin
      MessageDlg('Asociado debe ser mayor de edad a la fecha de autorización de descuento de aportes.', mtConfirmation, [mbOk], 0);
      dbdtfecaut.SetFocus;
      Exit;
   End;
end;

// Inicio: MAS_201907_HPC
// Se valida el ingreso de la oficina de registro
procedure TFautdes.dblcdmotCADAPSExit(Sender: TObject);
Var xSql:String;
begin
  If DM1.cdsAutCADAPS.Locate('CODMOTAUTCADAPS',dblcdmotCADAPS.Text,[]) Then
  Begin
     edtdesmotCADAPS.Text := DM1.cdsAutCADAPS.FieldByName('DESMOTAUTCADAPS').asstring;
     dblcdOfiAut.Text := DM1.wofides;
     DM1.cdsOfdes.Locate('OFDESID',dblcdOfiAut.Text,[]);
     edtOfiAut.Text := DM1.cdsOfdes.FieldByName('OFDESNOM').AsString;
     If DM1.cdsAutCADAPS.FieldByName('CODMOTAUTCADAPS').AsString = '01' Then
     Begin
        dblcdOfiAut.Enabled := True;
        dblcdOfiAut.Color   := clWhite;
        edtOfiAut.Color     := clWhite;
     End
     Else
     Begin
        dblcdOfiAut.Enabled := False;
        dblcdOfiAut.Color   := clScrollBar;
        edtOfiAut.Color     := clScrollBar;
     End;
  End
  Else
  Begin
     edtdesmotCADAPS.Text := '';
     dblcdmotCADAPS.Text := '';
  End;
end;
// Fin: MAS_201907_HPC

procedure TFautdes.BitPrintClick(Sender: TObject);
//Inicio MAS_202105_HPC
var xsql, xasoid,sSufijo,sArchivo, xnumdocumento:String;
//Fin MAS_202105_HPC
begin
   // Se valida que tidpo de asociado esta permitido la impresión del formato
   IF (DM1.cdsAso.fieldbyname('ASOTIPID').AsString <> 'DO') AND ((DM1.cdsAso.fieldbyname('ASOTIPID').AsString <> 'VO')) THEN
   BEGIN
      MessageDlg('Solo asociados activos(DO) y nuevos(VO) tienen acceso a la opción de imprimir.', mtError, [mbCancel], 0);
      Screen.Cursor := crDefault;
      Exit;
   END;

   xasoid  := DM1.cdsAso.FieldByName('ASOID').AsString;
   xsql := 'SELECT A.ASODNI, A.TIPDOCCOD, A.ASODOCNUM, A.ASOAPENOMDNI, B.USENOM  FROM '+DM1.sAPO201+' A, APO101 B WHERE A.ASOID = '+QuotedStr(xasoid)
   +' AND A.UPROID = B.UPROID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.USEID = B.USEID(+)';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsql);
   DM1.cdsQry.Open;

   If (DM1.cdsQry.FieldByName('TIPDOCCOD').AsString = '10') And (DM1.cdsQry.FieldByName('ASODNI').AsString = '') Then
   Begin
      MessageDlg('Debe actualizar el DNI para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

   If (DM1.cdsQry.FieldByName('TIPDOCCOD').AsString = '04') And (DM1.cdsQry.FieldByName('ASODOCNUM').AsString = '') Then
   Begin
      MessageDlg('Debe actualizar el Carnet de extranjería para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

   If DM1.cdsQry.FieldByName('ASOAPENOMDNI').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar los apellidos y nombre(s) del DNI para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;
   If DM1.cdsQry.FieldByName('USENOM').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar los datos de UGEL para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;
   DM1.LlenaDatosPlaUniPag(xasoid);
   DM1.pprPlaAutDesUni.print;
   DM1.pprPlaAutDesUni.Cancel;
   xsql := 'SELECT A.ASODNI, A.TIPDOCCOD, A.ASODOCNUM, A.ASOAPENOMDNI, B.USENOM, C.UPRONOM, A.ASODIR, A.ZIPID, D.NOMCENEDU, A.ASOFRESNOM, A.ASORESNOM'
   +' FROM '+DM1.sAPO201+' A, APO101 B, APO102 C, ASO_CEN_EDU D'
   +' WHERE A.ASOID = '+QuotedStr(xasoid)+' AND A.UPROID = B.UPROID(+) AND A.UPAGOID = B.UPAGOID(+) AND A.USEID = B.USEID(+)'
   +' AND A.UPROID = C.UPROID(+) AND A.CENEDUID = D.CENEDUID(+)';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsql);
   DM1.cdsQry.Open;

   If (DM1.cdsQry.FieldByName('TIPDOCCOD').AsString = '10') And (DM1.cdsQry.FieldByName('ASODNI').AsString = '') Then
   Begin
      MessageDlg('Debe actualizar el DNI para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

   If (DM1.cdsQry.FieldByName('TIPDOCCOD').AsString = '04') And (DM1.cdsQry.FieldByName('ASODOCNUM').AsString = '') Then
   Begin
      MessageDlg('Debe actualizar el Carnet de extranjería para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

   If DM1.cdsQry.FieldByName('ASOAPENOMDNI').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar los apellidos y nombre(s) del DNI para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

   If DM1.cdsQry.FieldByName('UPRONOM').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar los datos de la Unidad de Proceso para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

   If DM1.cdsQry.FieldByName('USENOM').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar los datos de UGEL para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

   If DM1.cdsQry.FieldByName('ASODIR').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar la dirección domiciliaria para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

   If DM1.cdsQry.FieldByName('ZIPID').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar datos del UBIGEO para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

   If DM1.cdsQry.FieldByName('NOMCENEDU').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar nombre del centro educativo para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;
   If DM1.cdsQry.FieldByName('ASOFRESNOM').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar fecha de resolución de nombramiento para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;
   If DM1.cdsQry.FieldByName('ASORESNOM').AsString = '' Then
   Begin
      MessageDlg('Debe actualizar número de la resolución de nombramiento para proceder a la impresión.', mtError, [mbCancel], 0);
      Exit;
   End;

//Inicio MAS_202105_HPC
  DM1.LlenaDatosPlaDecAso(xasoid);
If (DM1.cdsAso.FieldByName('AUTDESAPO').AsString='S') AND
   (Length(TRIM(DM1.cdsAso.FieldByName('AUTDESAPOFORMATO').AsString))=0) then
  begin
    DM1.pprDecAso.print;
    DM1.pprDecAso.Cancel;
  end
  Else
  begin

   XSQL:='SELECT RUT_FORMATO,NOM_FORMATO FROM DB2ADMIN.ASO_FORMATO_AUTDESAPO WHERE VIG_FORMATO=''S'' ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(XSQL);
   DM1.cdsQry.Open;
   If DM1.cdsQry.RecordCount=0 Then
   begin
     ShowMessage('No existe formato asignado para la Autorización de descuento de aportes');
     exit;
   end;

   If Length(TRIM(DM1.cdsAso.FieldByName('AUTDESAPOFORMATO').AsString))>0  Then
    begin
      sPlantilla := TRIM(DM1.cdsAso.FieldByName('AUTDESAPOFORMATO').AsString);
      sRuta      := trim(DM1.cdsQry.fieldbyname('RUT_FORMATO').AsString);
    end
   else
    begin
       sPlantilla := trim(DM1.cdsQry.fieldbyname('RUT_FORMATO').AsString)+trim(DM1.cdsQry.fieldbyname('NOM_FORMATO').AsString);
       sRuta      := trim(DM1.cdsQry.fieldbyname('RUT_FORMATO').AsString);
       DM1.cdsQry.Close;
       If NOT DirectoryExists(sRuta) Then
       Begin
          MessageDlg('Debe crear la siguiente carpeta:['+trim(sRuta)+'] y copiar los formatos de Carta de Autorización en Word', mtError, [mbCancel], 0);
          Exit;
       End;
    end;




   Screen.Cursor:=crHourGlass;
   sSufijo   :='_AUT';


   If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '10' Then
      xnumdocumento := DM1.cdsAso.FieldByName('ASODNI').AsString;
   If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '04' Then
      xnumdocumento := DM1.cdsAso.FieldByName('ASODOCNUM').AsString;

   Genereapdf(sPlantilla,DM1.cdsAso.FieldByName('ASOAPENOMDNI').AsString ,
              '' ,
              sRuta,
              sSufijo,
              xnumdocumento);

    sArchivo :=  xnumdocumento + sSufijo;
    If FileExists(sRuta+sArchivo+'.pdf' ) then
    Begin
       Try
          FVERPDF :=  TFVERPDF.Create(Self);
          FVERPDF.Archivo := sRuta+sArchivo+'.pdf';
          FVERPDF.ShowModal;
       Finally
          FVERPDF.Free;
       End;
    End;
   Screen.Cursor := crDefault;
 End;

  IF (DM1.CrgDescrip('ASOID=' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString), DM1.sAPO201, 'AUTDESAPO') <> 'S')  THEN
  BEGIN
   BitAutDes.Enabled := True;
  END;


  // DM1.pprDecAso.print;
  // DM1.pprDecAso.Cancel;
//Fin MAS_202105_HPC
end;

// Inicio: MAS_201907_HPC
// Se actualiza descripción de la oficina de registro
procedure TFautdes.dblcdOfiAutExit(Sender: TObject);
Var xSql:String;
begin
   If DM1.cdsOfdes.Locate('OFDESID',dblcdOfiAut.Text,[]) Then
      edtOfiAut.Text := DM1.cdsOfdes.FieldByName('OFDESNOM').AsString
   Else
   Begin
      dblcdOfiAut.Text := '';
      edtOfiAut.Text   := '';
   End;
end;
// Fin: MAS_201907_HPC

// Inicio: MAS_202002_HPC
// Procedimiento para el envio del email, y el procedimiento para abandonar sin enviar.
procedure TFautdes.btnvalidaClick(Sender: TObject);
Var xSql, xDominio, xMensaje, xUsuario, xEmailRegistrado: String;
begin
   xUsuario := DM1.CrgDescrip('USERID='+QuotedStr(Trim(DM1.wUsuario)), 'TGE006', 'USERNOM');
   meemail.Text := Trim(meemail.Text);
   If Trim(meemail.Text) = '' Then
   Begin
      MessageDlg('Debe registrar un email valido para poder proceder a enviarlo.', mtError, [mbCancel], 0);
      meemail.SetFocus;
      Exit;
   End;
   xSql := 'SELECT SUBSTR('+QuotedStr(meemail.Text)+',INSTR('+QuotedStr(meemail.Text)+',''@''), LENGTH('+QuotedStr(meemail.Text)+')-INSTR('+QuotedStr(meemail.Text)+',''@'')+1) DOMINIO FROM DUAL';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   xDominio := DM1.cdsQry.FieldByName('DOMINIO').AsString;
   If xDominio <> '@DERRAMA.ORG.PE' Then
   Begin
      MessageDlg('El dominio del correo debe ser [@DERRAMA.ORG.PE], modifique.', mtError, [mbCancel], 0);
      meemail.SetFocus;
      Exit;
   End;
   //If MessageDlg('¿Seguro de enviar email recordatorio al correo: '+meemail.text+'?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   Begin
      xMensaje := 'Estimado usuario: '+xUsuario;
      xMensaje := xMensaje +chr(13);
      xMensaje := xMensaje +'Con fecha: '+Copy(DM1.FechaHora,1,10)+', usted ha registrado en el Modulo Mantenimiento ';
      xMensaje := xMensaje +'de Asociados, la Aut. Descuento de aportes del docente '+DM1.cdsAso.FieldByName('ASOAPENOMDNI').AsString+'.';
      xMensaje := xMensaje +chr(13);
      xMensaje := xMensaje +'Agradeceremos enviar a la brevedad posible los documentos sustentatorios de la afiliación a la unidad de Previsión Social.';
      xMensaje := xMensaje +' Una vez enviado el documento, reenviar este correo al Buzón de actualización de datos';
      xMensaje := xMensaje +' (actualizaciondedatos@derrama.org.pe), informando el número de memorándum de envio del documento.';
      xMensaje := xMensaje +chr(13);
      xMensaje := xMensaje +'Atentamente.'+chr(13);
      xMensaje := xMensaje +'Equipo de Previsión Social'+chr(13);
      xMensaje := xMensaje +'Anexo 101814';
      xMensaje := xMensaje +chr(13);
      xMensaje := xMensaje +'Nota: Las tildes han sido omitidas intencionalmente debido a la configuracion del correo.';
      xSql := 'Begin DB2ADMIN.ENVIO_MAIL('
      +QuotedStr(meemail.Text)
      +','+QuotedStr('actualizaciondedatos@derrama.org.pe')
      +','+QuotedStr('Aviso MMA: Ha registrado Aut. Descuento del docente '+DM1.cdsAso.FieldByName('ASOAPENOMDNI').AsString)
      +','+QuotedStr(xMensaje)+'); End;';
      DM1.cdsQry2.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Execute;
      xSql := 'Begin DB2ADMIN.ENVIO_MAIL('
      +QuotedStr('actualizaciondedatos@derrama.org.pe')   
      +','+QuotedStr(meemail.Text)
      +','+QuotedStr('Aviso MMA: Ha registrado Aut. Descuento del docente '+DM1.cdsAso.FieldByName('ASOAPENOMDNI').AsString)
      +','+QuotedStr(xMensaje)+'); End;';
      DM1.cdsQry2.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Execute;
      xSql := 'UPDATE SEGURIDAD.M_USUARIO SET MAIL = '+QuotedStr(meemail.Text)+' WHERE ID_USUARIO = '+QuotedStr(DM1.wUsuario)+' AND MAIL IS NULL';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      MessageDlg('Se ha procedido a enviar un email recordatorio a su correo institucional.', mtCustom, [mbOk], 0);
   End;
   Close;
end;
// Fin: MAS_202002_HPC
//Inicio MAS_202105_HPC
procedure TFautdes.Genereapdf(xPlantilla, xnombre, xcolegio, xRuta,
  xsufijo, xasodni: String);
var word,Documento: variant;
tmp        : OleVariant;
FileFormat : OleVariant;
FWordDoc  : WordDocument;
xArchivo,xArchivoNuevo,xpdf,xSql  :String;

begin
 Try

  xArchivo       := trim(xPlantilla);
  xArchivoNuevo  := xRuta+xasodni+xsufijo;
  Copyfile(PChar(xArchivo),PChar(xArchivoNuevo+'.docx'),False);
  Word := CreateOleObject('Word.Application');
  Word.Documents.Open(xArchivoNuevo+'.docx');
  Word.Selection.Find.MatchWholeWord := True;

  Word.Selection.Find.Text:= 'NOMBRE1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := xnombre;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'DNI1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := xasodni;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'DOC1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  If Length(Trim(xasodni)) = 8 Then
     Word.Selection.Find.Replacement.Text := 'DNI.'
  Else
     Word.Selection.Find.Replacement.Text := 'CE.';
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'DNI2';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  If Length(Trim(xasodni)) = 8 Then
     Word.Selection.Find.Replacement.Text := 'DNI.'
  Else
     Word.Selection.Find.Replacement.Text := 'CE.';
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam);


  Word.Selection.Find.Text:= 'docide1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  If Length(Trim(xasodni)) = 8 Then
     Word.Selection.Find.Replacement.Text := 'Completar nombre completos y números de documento nacional de identidad (DNI)'
  Else
     Word.Selection.Find.Replacement.Text := 'Completar nombre completos y números de carné de extranjería (CE)';
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'DIA1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xDIA1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'MES1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xMES1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'ANO1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xANO1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'DIREC1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xDIREC1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'DPTO1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xDPTO1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'REF1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xREF1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'TLF1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xTLF1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'CEL1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xCEL1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'EMAIL1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xEMAIL1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'COLE1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xCOLE1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);


  Word.Selection.Find.Text:= 'ANONOM1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xANONOM1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  Word.Selection.Find.Text:= 'RESNOM1';
  Word.Selection.Find.Forward := True;
  Word.Selection.Find.Wrap := wdFindContinue;
  Word.Selection.Find.Replacement.Text := ' '+dm1.xRESNOM1;
  Word.Selection.Find.Execute(EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                EmptyParam, EmptyParam, EmptyParam, wdReplaceAll,
                EmptyParam, EmptyParam, EmptyParam, EmptyParam);

  FileFormat := wdFormatPDF;
  If FileExists(xArchivoNuevo+'.pdf') Then DeleteFile(xArchivoNuevo+'.pdf');
  Word.ActiveDocument.SaveAs(xArchivoNuevo,FileFormat);
  Word.ActiveDocument.Close;
  Word.Application.Quit;
  DeleteFile(xArchivoNuevo+'.docx');
  xpdf:=xArchivoNuevo+'.pdf';

{
  xSql:='Insert into DB2ADMIN.ASO_ENV_CAR_DIRECTORES_DET '
      + '(idenvio,asoid,asocodmod,asodni,asoapenom,emails,'
      + ' usugenera,fecgenera,NOMCENEDU,CENEDUID,TOTALASO,CON_AUTO,SIN_AUTO,archpdf1) values('
      + QuotedStr(DM1.cdsQry.Fieldbyname('IDENVIO_NEW').AsString)+','
      + QuotedStr(DM1.cdsColegio.Fieldbyname('ASOID').AsString)+','
      + QuotedStr(DM1.cdsColegio.Fieldbyname('ASOCODMOD').AsString)+','
      + QuotedStr(DM1.cdsColegio.Fieldbyname('ASODNI').AsString)+','
      + QuotedStr(DM1.cdsColegio.Fieldbyname('ASOAPENOM').AsString)+','
      + QuotedStr(DM1.cdsColegio.Fieldbyname('ASOEMAIL').AsString)+','
      + QuotedStr(dm1.wUsuario)+',trunc(sysdate),'
      + QuotedStr(DM1.cdsColegio.Fieldbyname('NOMCENEDU').AsString)+','
      + QuotedStr(DM1.cdsColegio.Fieldbyname('CENEDUID').AsString)+','
      + QuotedStr(DM1.cdsColegio.Fieldbyname('TOTAL').AsString)+','
      + QuotedStr(DM1.cdsColegio.Fieldbyname('CON_AUTO').AsString)+','
      + QuotedStr(DM1.cdsColegio.Fieldbyname('SIN_AUTO').AsString)+','
      + QuotedStr(xpdf)+')';
     DM1.DCOM1.AppServer.EjecutaSQL(xSql);
 }
   //  xNUMREg:=xNUMREg+1;
Except
  Word.Application.Quit;
end;


end;

{procedure TFautdes.btnPlantillaWordClick(Sender: TObject);
var filename:String;
begin

   sRuta      :='D:/CARTA_AUT/';
   If not DirectoryExists(sRuta) Then
   Begin
      MessageDlg('Debe crear en la unidad D: la siguiente carpeta:[D:\CARTA_AUT\] y copiar los formatos de Carta de Autorización en Word', mtError, [mbCancel], 0);
      Exit;
   End;

   open.FileName := '';
   open.Execute;
   filename := open.FileName;
   If Length(trim(filename)) =0 Then
   Begin
     ShowMessage('Debe selecionar un archivo Word');
     exit;
   End;
   sPlantilla:=filename;
end; }
//Fin MAS_202105_HPC

procedure TFautdes.btnhisautdesapoClick(Sender: TObject);
begin
   Try
      Fhisautdesapo := TFhisautdesapo.create(self);
      Fhisautdesapo.Showmodal;
   Finally
      Fhisautdesapo.free;
   End;
end;

end.