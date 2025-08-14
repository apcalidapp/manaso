// Inicio Uso Estándares   : 01/08/2011
// Unidad		           : ASO959
// Formulario		       : fResNomb2
// Fecha de Creación       : 15/05/2018
// Autor			       : Desarrollo y Mantenimiento
// Objetivo		           : Cambiar Datos de Resoluciones (núnero y fecha) de Asociado
// HPC_201801_MAS
//Inicio HPC_201801_MAS
// MAS_201905_HPC          : Nivel 3, unidad de Previsión Social modifica Fecha y Número de Resolución de Nombramiento.
//                           Nivel 1, unidad de Previsión Social modificar Número de Resolución de Nombramiento.
//                           Usuario no es de Previsión Social no podrá modificar el Número ni fecha de resolución de nombramiento.
// HPC_201906_MAS          : Resoluciones - grabar y ver historial
// MAS_202103_HPC          : Se adiciona columna de observación en el script

Unit ASO959;

Interface

Uses

   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, StdCtrls,
   wwdbdatetimepicker, Mask, wwdbedit, wwcheckbox, DBCtrls, db;

Type
   TfResNomb2 = Class(TForm)
      grpResoluciones: TGroupBox;
      dbgResoluciones: TwwDBGrid;
      dbgResolucionesIButton: TwwIButton;
      pnlResoluciones: TPanel;
      Shape3: TShape;
      Button1: TButton;
      gbMantRes: TGroupBox;
      lblResNom: TLabel;
      lblResCese: TLabel;
      dbeNroResNom: TwwDBEdit;
      dbeNroResCes: TwwDBEdit;
      lblFecRes: TLabel;
      lblFecCes: TLabel;
      dbdFecResNom: TwwDBDateTimePicker;
      dbdFecResCes: TwwDBDateTimePicker;
      btnGrabaResol: TBitBtn;
      Label5: TLabel;
      chkReingreso: TwwCheckBox;
      Label6: TLabel;
      chkVigente: TwwCheckBox;
      Shape1: TShape;
      BitBtn1: TBitBtn;
      Button2: TButton;
      edtObsAnula: TEdit;
      Label7: TLabel;
      pnlAnulacion: TPanel;
      bitAnula: TBitBtn;
      BitSalir: TBitBtn;
	  BitMostrar: TBitBtn;
      Procedure dbgResolucionesIButtonClick(Sender: TObject);
      Procedure btnGrabaResolClick(Sender: TObject);
      Procedure dbgResolucionesDblClick(Sender: TObject);
      Procedure Button1Click(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbgResolucionesDrawDataCell(Sender: TObject;
         Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bitAnulaClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure Button2Click(Sender: TObject);
      Procedure BitSalirClick(Sender: TObject);
  	  procedure bitMostrarClick(Sender: TObject);
   Private
    { Private declarations }
   Public
      sNumResTemp,sFecResTemp,sFecResCeTemp, sNumResCeTemp : String;
      sUsuarioTemp, sFechaRegTemp : String;
      xinsert, xNroResNomb, xNroResCese, xFechaResNomb, xFechaResCese: String;
      Function corr(): String;
      Function SacaUltimaFechaCese(xasoid: String): String;
      Procedure Graba();
    { Public declarations }
   End;

Var
   fResNomb2: TfResNomb2;
   xReingreso: boolean;

Implementation
Uses ASODM, ASO260,DateUtils, ASO959a, ASO277;

{$R *.dfm}

Procedure TfResNomb2.dbgResolucionesIButtonClick(Sender: TObject);
Var
   xfec, xSQL: String;
   xTieneVigente: boolean;
Begin

   dbeNroResNom.Text := '';
   dbdFecResNom.Text := '';
   dbeNroResCes.Text := '';
   dbdFecResCes.Text := '';

   If DM1.xCnd = 'AUT' Then
   Begin
      ShowMessage('No tiene accesos a Modificar...');
      Exit;
   End;

   pnlResoluciones.Visible := True;
   grpResoluciones.Enabled := False;
   dbgResolucionesIButton.Enabled := False;

   If (Dm1.cdsAso.FieldByName('ASOTIPID').AsString = 'DO') Or (Dm1.cdsAso.FieldByName('ASOTIPID').AsString = 'VO') Then
   Begin
      lblResNom.Caption  := 'Nro. de Res. Nomb';
      lblFecRes.Caption  := 'Fec. de Res. Nomb';
      lblResCese.Caption := 'Nro. de Res. Cese';
      lblFecCes.Caption  := 'Fec. de Res. Cese';

      dbeNroResCes.Enabled := false;
      dbdFecResCes.Enabled := false;
      dbeNroResCes.Color := clScrollBar;
      dbdFecResCes.Color := clScrollBar;

      // Inicio
      // Nivel 01 solo podrá modificar numero y fecha de resolución nombramiento siempre y cuando sea desde la opción de registro de nuevos asociados.
      // En el caso que ya se encuentre en el mantenimiento de asociados solo podrá modificar el numero de resolución de nombramiento.
      If (Copy(DM1.CrgArea(DM1.wUsuario), 1, 3) = 'ASO') And (Copy(DM1.CrgArea(DM1.wUsuario), 8, 2) = 'N1') Then
      Begin
         If DM1.sAPO201 = 'ASO_NUE_CLI' Then
         Begin
            dbeNroResNom.Enabled := True;
            dbeNroResNom.Color   := clWindow;
            dbdFecResNom.Enabled := True;
            dbdFecResNom.Color   := clWindow;
            dbeNroResNom.SetFocus;
         End
         Else
         Begin
            dbdFecResNom.Enabled := False;
            dbdFecResNom.Date := DM1.cdsAso.FieldByName('ASOFRESNOM').AsDateTime;
            dbdFecResNom.Color   := clScrollBar;
            dbeNroResNom.Enabled := True;
            dbeNroResNom.Color   := clWindow;
            dbeNroResNom.SetFocus;
         End;
      End;
      // Fin

      If  (Copy(DM1.CrgArea(DM1.wUsuario), 1, 3) = 'ASO') And (Copy(DM1.CrgArea(DM1.wUsuario), 8, 2) = 'N3') Then
      Begin
         dbeNroResNom.Enabled := True;
         dbeNroResNom.Color   := clWindow;
         dbdFecResNom.Enabled := True;
         dbdFecResNom.Color   := clWindow;
         dbeNroResNom.SetFocus;
      End;

   End;


   If Dm1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO' Then
   Begin
      lblResNom.Caption := 'Nro. Contrato';
      lblFecRes.Caption := 'Fec.Ini.Contrato';
      lblResCese.Caption := '*******';
      lblFecCes.Caption := 'Fec.Fin.Contrato';
      dbeNroResNom.Enabled := True;
      dbdFecResNom.Enabled := True;
      dbeNroResCes.Enabled := True;
      dbdFecResCes.Enabled := True;
      dbeNroResNom.SetFocus;
   End;

   If Dm1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE' Then
   Begin
      xSQL := 'SELECT ASOID FROM PVS301 WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND PVSESTADO NOT IN (''13'')';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount > 0 Then
      Begin
         MessageDlg('No se puede modificar resolución de cese de un asociado cesante con liquidación', mtError, [mbOk], 0);
         Exit;
      End;
      lblResNom.Caption  := 'Nro. de Res. Nomb';
      lblFecRes.Caption  := 'Fec. de Res. Nomb';
      lblResCese.Caption := 'Nro. de Res. Cese';
      lblFecCes.Caption  := 'Fec. de Res. Cese';
      dbeNroResNom.Enabled := False;
      dbdFecResNom.Enabled := False;
      dbeNroResCes.Enabled := True;
      dbdFecResCes.Enabled := True;
      dbeNroResCes.SetFocus;
   End;
End;

Procedure TfResNomb2.btnGrabaResolClick(Sender: TObject);
var
   xSQL, xUltFecCeseAnt, xAsoId: String;
  xTime: String;
Begin
   If (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'DO') Or (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'VO') Then
   Begin
      If Length(trim(dbeNroResNom.Text)) = 0 Then
      begin
         MessageDlg('El número de Resolución de Nombramiento es obligatorio.', mtError, [mbOk], 0);
         exit;
      End;

      If  Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) = '03' Then
      Begin
         If Length(trim(dbdFecResNom.Text)) = 0 Then
         Begin
            MessageDlg('Fecha de resolución de nombramiento es obligatorio.', mtError, [mbOk], 0);
            dbdFecResNom.SetFocus;
            exit;
         End;
         IF (dbdFecResNom.Date < dm1.dFundacionDerrama) THEN
         begin
            MessageDlg('Resolución de nombramiento no es válida.'+ chr(13)+'La Derrama Magisterial inició sus operaciones en Marzo de 1966.', mtError, [mbOk], 0);
            exit;
         end;
         xTime := FloatToStr(int(YearSpan(dbdFecResNom.Date, DM1.cdsAso.FieldByName('ASOFECNAC').AsDateTime)));
         If (dm1.Valores(xTime) < 18) then
         begin
            MessageDlg('Fecha de Resolución no válida, la diferencia de la fecha de nacimiento y resolución corresponden a un menor de edad', mtError, [mbOk], 0);
            exit;
         end;
         if(dbdFecResNom.Date > dm1.FechaSys)then
         begin
            MessageDlg('Fecha de nombramiento no puede ser mayor a la fecha actual', mtError, [mbOk], 0);
            exit;
         end;
      End;

   End;

   If DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO' Then
   Begin
      If Length(trim(dbeNroResNom.Text)) = 0 Then
      begin
         MessageDlg('Número de Resolución inicio de contrato es obligatorio.', mtError, [mbOk], 0);
         dbeNroResNom.SetFocus;
         exit;
      End;
      If Length(trim(dbdFecResNom.Text)) = 0 Then
      Begin
         MessageDlg('Fecha de inicio de contrato es obligatorio.', mtError, [mbOk], 0);
         dbdFecResNom.SetFocus;
         exit;
      End;
      If Length(trim(dbeNroResCes.Text)) = 0 Then
      begin
         MessageDlg('Número de Resolución de finalización de contrato es obligatorio.', mtError, [mbOk], 0);
         dbeNroResCes.SetFocus;
         exit;
      End;
      If Length(trim(dbdFecResCes.Text)) = 0 Then
      Begin
         MessageDlg('Fecha de finalización de contrato es obligarotia.', mtError, [mbOk], 0);
         dbdFecResCes.SetFocus;
         exit;
      End;
      IF (dbdFecResNom.Date < dm1.dFundacionDerrama) THEN
      begin
         MessageDlg('Número de resolución de contrato no es válida.'+ chr(13)+'La Derrama Magisterial inició sus operaciones en Marzo de 1966.', mtError, [mbOk], 0);
         exit;
      end;
      xTime := FloatToStr(int(YearSpan(dbdFecResNom.Date, DM1.cdsAso.FieldByName('ASOFECNAC').AsDateTime)));
      if (dm1.Valores(xTime) < 18) then
      begin
         MessageDlg('Fecha de Resolución no válida, la diferencia de la fecha de nacimiento y resolución corresponden a un menor de edad', mtError, [mbOk], 0);
         exit;
      end;
      if(dbdFecResNom.Date > dm1.FechaSys)then
      begin
         MessageDlg('Fecha de contrato no puede ser mayor a la fecha actual', mtError, [mbOk], 0);
         exit;
      end;
      If dbdFecResCes.Date < dbdFecResNom.Date Then
      Begin
         MessageDlg('La fecha final de contrato no puede ser menor a la fecha de inicio de contrato.', mtError, [mbOk], 0);
         dbdFecResCes.SetFocus;
         exit;
      End;
   End;

   If DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE' Then
   Begin
      If Length(trim(dbeNroResCes.Text)) = 0 Then
      begin
         MessageDlg('Número de Resolución de cese.', mtError, [mbOk], 0);
         dbeNroResCes.SetFocus;
         exit;
      End;
      If Length(trim(dbdFecResCes.Text)) = 0 Then
      Begin
         MessageDlg('Fecha de resolución de cese.', mtError, [mbOk], 0);
         dbdFecResCes.SetFocus;
         exit;
      End;

      xSQL := 'SELECT ASOID, ASONCTA FROM APO207 WHERE ASOID = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
      +' and ASONCTA like (''CI_%'') and SITCTA=''A''';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      if DM1.cdsQry.RecordCount>0 then
      begin
         if strtoint(copy(dbdFecResCes.Text, 7, 4)) >= 1997 then
         begin
            ShowMessage('     No se permite una Fecha de Resolución de Cese mayor a 1997     '+chr(13)
            +'cuando hay una Cuenta de Ahorros Interna asignada y que está activa.');
            dbdFecResCes.SetFocus;
            Exit;
         End;
      End;
   End;

   Graba;

   pnlResoluciones.Visible := False;
   grpResoluciones.Enabled := True;
   dbgResolucionesIButton.Enabled := True;


End;

//genera correlativo de resolucion
Function TfResNomb2.corr(): String;
Var
   XSQL: String;
Begin
   XSQL := ' SELECT NVL(MAX(TO_NUMBER(CORRELATIVO)),0) MAXIMO '
      + ' FROM ' + DM1.sResolucion
      + ' WHERE ' + DM1.sReso_where + ' ASOID=''' + DM1.cdsAso.FieldByName('ASOID').AsString + ''' ';
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest(XSQL);
   DM1.cdsGradoI.Open;
   If DM1.cdsGradoI.FieldByName('MAXIMO').AsInteger > 0 Then
      Result := Format('%.2d', [DM1.cdsGradoI.FieldByName('MAXIMO').AsInteger + 1])
   Else
      Result := '01';
   DM1.cdsGradoI.Close;
End;

Procedure TfResNomb2.dbgResolucionesDblClick(Sender: TObject);
var
  xSql: String;
Begin

   dbeNroResNom.Text := DM1.cdsGradoA.FieldByName('ASORESNOM').AsString;
   dbdFecResNom.Date := DM1.cdsGradoA.FieldByName('ASOFRESNOM').AsDateTime;
   dbeNroResCes.Text := DM1.cdsGradoA.FieldByName('ASORESCESE').AsString;
   dbdFecResCes.Date := DM1.cdsGradoA.FieldByName('ASOFRESCESE').AsDateTime;


   If DM1.cdsGradoA.RecordCount = 0 Then
   Begin
      MessageDlg('No existe registro para mostrar.', mtError, [mbOk], 0);
      exit;
   End;

   If DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO' Then
   Begin
      lblResNom.Caption := 'Nro. Contrato';
      lblFecRes.Caption := 'Fec.Ini.Contrato';
      lblResCese.Caption := '*******';
  	  lblFecCes.Caption := 'Fec.Fin.Contrato';
   End;

   If DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'DO' Then
   Begin
      lblResNom.Caption := 'Nro. de Res. Nomb';
      lblFecRes.Caption := 'Fec. de Res. Nomb';
      lblResCese.Caption := 'Nro. de Res. Cese';
      lblFecCes.Caption := 'Fec. de Res. Cese';

   End;

   If DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE' Then
   Begin
      lblResNom.Caption := 'Nro. de Res. Nomb';
      lblFecRes.Caption := 'Fec. de Res. Nomb';
      lblResCese.Caption := 'Nro. de Res. Cese';
      lblFecCes.Caption := 'Fec. de Res. Cese';

   End;

End;

Procedure TfResNomb2.Button1Click(Sender: TObject);
Var
   xSQL: String;
Begin

   If DM1.sAPO201 = 'APO201' Then
   Begin
      xSQL := 'select ASOID, ASOCODMOD, ASOCODAUX, ASORESNOM, ASOFRESNOM, ASORESCESE, '
         + '       ASOFRESCESE, RESVIG, CORRELATIVO, USUARIO, FREG, HREG, LIQUIDADO, NUMLIQ, FECLIQ, '
         + '       REINGRESO, ANULADO, OBSANU, USUANU, FECANU, NUMEXPLIQ, FECEXPLIQ,OBS '
   End
   Else
   Begin
      xSQL := 'select SOLICITUD, ASOID, ASOCODMOD, ASOCODAUX, ASORESNOM, ASOFRESNOM, ASORESCESE, '
         + '       ASOFRESCESE, RESVIG, CORRELATIVO, USUARIO, FREG, HREG, LIQUIDADO, NUMLIQ, FECLIQ, '
         + '       REINGRESO, ANULADO, OBSANU, USUANU, FECANU, NUMEXPLIQ, FECEXPLIQ '
   End;

   xSQL := xSQL + ' from ' + DM1.sResolucion
      + ' WHERE ' + DM1.sReso_where
      + ' ASOID=' + QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)
      + ' ORDER BY CORRELATIVO ';

   DM1.cdsGradoA.Close;
   DM1.cdsGradoA.DataRequest(xSQL);
   DM1.cdsGradoA.Open;
   DM1.cdsGradoA.Last;

   pnlResoluciones.Visible := False;
   grpResoluciones.Enabled := True;
   if DM1.cdsGradoA.RecordCount>0 then
      If Length(TRIM(DM1.cdsGradoA.FieldByName('CORRELATIVO').AsString)) = 0 Then DM1.cdsGradoA.Delete;

End;

Procedure TfResNomb2.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   End;
End;

Procedure TfResNomb2.dbgResolucionesDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If DM1.cdsGradoA.FieldByName('RESVIG').AsString = 'S' Then
   Begin
      dbgResoluciones.Canvas.Font.Color := clLime;
      dbgResoluciones.DefaultDrawDataCell(rect, Field, State);
   End;

   If DM1.cdsGradoA.FieldByName('ANULADO').AsString = 'S' Then
   Begin
      dbgResoluciones.Canvas.Font.Color := clRED;
      dbgResoluciones.DefaultDrawDataCell(rect, Field, State);
   End;
End;

Procedure TfResNomb2.FormClose(Sender: TObject; Var Action: TCloseAction);
var
   xSQL : String;
Begin
// No se valida para Asociados Fallecidos
   if DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' then
   begin

      If DM1.sAPO201 = 'APO201' Then
      Begin
      // se define estructura de archivo ASO_RESOLUCIONES para abrir
         xSQL := 'select ASOID, ASOCODMOD, ASOCODAUX, ASORESNOM, ASOFRESNOM, ASORESCESE, '
            + '       ASOFRESCESE, RESVIG, CORRELATIVO, USUARIO, FREG, HREG, LIQUIDADO, NUMLIQ, FECLIQ, '
            + '       REINGRESO, ANULADO, OBSANU, USUANU, FECANU, NUMEXPLIQ, FECEXPLIQ '
      End
      Else
      Begin
      // se define estructura de archivo ASO_RESOLUCIONES_NUE para abrir
         xSQL := 'select SOLICITUD, ASOID, ASOCODMOD, ASOCODAUX, ASORESNOM, ASOFRESNOM, ASORESCESE, '
            + '       ASOFRESCESE, RESVIG, CORRELATIVO, USUARIO, FREG, HREG, LIQUIDADO, NUMLIQ, FECLIQ, '
            + '       REINGRESO, ANULADO, OBSANU, USUANU, FECANU, NUMEXPLIQ, FECEXPLIQ '
      End;
      xSQL := xSQL + ' from ' + DM1.sResolucion
         + ' WHERE ' + DM1.sReso_where
         + ' ASOID=' + QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)
         + ' and nvl(RESVIG,''N'')=''S'' ';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      if DM1.cdsQry.RecordCount=0 then
      begin
        MessageDlg('El asociado debería tener una Resolución Vigente', mtConfirmation, [mbOk], 0);
         //raise exception.Create('No se puede quedar sin una Resolución Vigente');
      end;

   end; // Asociados No Fallecidos

   dm1.cdsGradoA.Close;
   dm1.cdsGradoA.IndexFieldNames := '';
End;

Procedure TfResNomb2.Graba;
Var
   XSQL, xAsoid, xCorrelativo, xcodreg : String;
Begin
   xAsoid := DM1.cdsAso.FieldByName('ASOID').AsString;
   xCorrelativo := corr;

   If MessageDlg('¿Seguro que desea registrar los datos ingresados?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
      Exit;

      xSQL := ' UPDATE ' + DM1.sResolucion
         + ' SET RESVIG=''N'' '
         + ' WHERE ' + DM1.sReso_where + ' ASOID=''' + XASOID + ''' AND RESVIG=''S'' ';
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);

      xCodReg := FMantAsociado.CodReg; //Genera Numero de Log
      DM1.Registro_Aud(xAsoId, '0', xCodReg);
      xSQL := 'UPDATE ' + DM1.sAPO201 + ' SET ';

      xSQL := xSQL + ' ASORESNOM=' + QuotedStr(dbeNroResNom.Text) + ','
         + ' ASOFRESNOM=' + QuotedStr(dbdFecResNom.Text) + ','
         + ' ASORESCESE=' + QuotedStr(dbeNroResCes.Text) + ','
         + ' ASOFRESCESE=' + QuotedStr(dbdFecResCes.Text)
         + ' WHERE ASOID=' + QuotedStr(xAsoId);
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      DM1.Registro_Aud(xAsoId, '1', xCodReg);

      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByName('ASORESNOM').AsString := dbeNroResNom.Text;
      DM1.cdsAso.FieldByName('ASOFRESNOM').AsString := dbdFecResNom.Text;
      DM1.cdsAso.FieldByName('ASORESCESE').AsString := dbeNroResCes.Text;
      DM1.cdsAso.FieldByName('ASOFRESCESE').Asstring := dbdFecResCes.Text;
      DM1.cdsAso.Post;


      //Inserto el ASO_RESOLUCIONES
      If DM1.sResolucion = 'ASO_RESOLUCIONES' Then
         xSQL := 'INSERT INTO ' + DM1.sResolucion + ' (ASOID,ASOCODMOD,ASOCODAUX,ASORESNOM,ASOFRESNOM,ASORESCESE,ASOFRESCESE,RESVIG, '
            + '  CORRELATIVO,USUARIO,FREG,HREG,REINGRESO) '
            + 'VALUES (' +
            QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ',' +
            QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString) + ',' +
            QuotedStr(DM1.cdsAso.FieldByName('ASOCODAUX').AsString) + ',' +
            QuotedStr(dbeNroResNom.Text) + ',' +
            QuotedStr(dbdFecResNom.Text) + ',' +
            QuotedStr(dbeNroResCes.Text) + ',' +
            QuotedStr(dbdFecResCes.Text) + ',' +
            QuotedStr('S') + ',' +
            QuotedStr(xCorrelativo) + ',' +
            QuotedStr(DM1.wUsuario) + ',' +
            QuotedStr(DateToStr(DM1.FechaSys)) + ',SYSDATE,' +
            QuotedStr(DM1.cdsAso.FieldByName('REINGRESO').AsString) + ')'
      Else
         xSQL := 'INSERT INTO ' + DM1.sResolucion + ' (SOLICITUD,ASOID,ASOCODMOD,ASOCODAUX,ASORESNOM,ASOFRESNOM,ASORESCESE,ASOFRESCESE,RESVIG, '
            + '  CORRELATIVO,USUARIO,FREG,HREG,REINGRESO) '
            + 'VALUES (' +
            QuotedStr(DM1.cdsAso.FieldByName('SOLICITUD').AsString) + ',' +
            QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ',' +
            QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString) + ',' +
            QuotedStr(DM1.cdsAso.FieldByName('ASOCODAUX').AsString) + ',' +
            QuotedStr(dbeNroResNom.Text) + ',' +
            QuotedStr(dbdFecResNom.Text) + ',' +
            QuotedStr(dbeNroResCes.Text) + ',' +
            QuotedStr(dbdFecResCes.Text) + ',' +
            QuotedStr('S') + ',' +
            QuotedStr(xCorrelativo) + ',' +
            QuotedStr(DM1.wUsuario) + ',' +
            QuotedStr(DateToStr(DM1.FechaSys)) + ',SYSDATE,' +
            QuotedStr(DM1.cdsAso.FieldByName('REINGRESO').AsString) + ')';
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);

   pnlResoluciones.Visible := False;

   Begin
      if (dbeNroResNom.Text<>sNumResTemp)   or (strtodate(dbdFecResNom.Text)<>strtodate(sFecResTemp)) or
         (dbeNroResCes.Text<>sNumResCeTemp) or (strtodate(dbdFecResCes.Text)<>strtodate(sFecResCeTemp)) then
      begin
         try
           xSQL:='CALL SP_ASO_RESOLUCIONES_HIS('+QuotedStr(xAsoId)+','+QuotedStr(sNumResTemp)
                    +', TO_DATE('+QuotedStr(sFecResTemp)+'), '+'TO_DATE('+QuotedStr(sFecResCeTemp)+'), '
                    +QuotedStr(sUsuarioTemp)+', '+QuotedStr(sNumResCeTemp) + ', '
                    +QuotedStr(DM1.cdsAso.FieldByName('ASOTIPID').AsString)+ ', '
                    +QuotedStr(sFechaRegTemp)+' ) ' ;
           DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         except
           MessageDlg('Error al Grabar el Historial de Resoluciones', mtError, [mbOk], 0);
         end;
      end;
   End;

   Button1Click(self);
End;

Function TfResNomb2.SacaUltimaFechaCese(xasoid: String): String;
Var
   XSQL, XFEC: String;
Begin
   If xinsert = 'S' Then
      xsql := ' Select ASOID,max(ASOFRESCESE) Fcese '
         + ' FROM ' + DM1.sResolucion
         + ' WHERE ' + DM1.sReso_where + ' ASOID=''' + XASOID + '''and NVL(ANULADO,''X'')<>''S'' and RESVIG=''S'' '
         + ' Group by Asoid'
   Else
      xsql := ' Select ASOID,max(ASOFRESCESE) Fcese '
         + ' FROM ' + DM1.sResolucion
         + ' WHERE ' + DM1.sReso_where + ' ASOID=''' + XASOID + ''' and CORRELATIVO<> ''' + DM1.cdsGradoA.FieldByName('CORRELATIVO').Asstring + ''' '
         + '   and NVL(ANULADO,''X'')<>''S'' '
         + ' Group by Asoid ';

   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest(xsql);
   DM1.cdsGradoI.Open;
   xfec := DM1.cdsGradoI.FieldByname('Fcese').AsString;
   If Dm1.cdsGradoI.RecordCount = 0 Then
      Result := 'SIN DATA'
   Else
      Result := xfec;
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.IndexFieldNames := '';
End;

Procedure TfResNomb2.bitAnulaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DM1.xCnd = 'AUT' Then
   Begin
      ShowMessage('No tiene accesos a Modificar...');
      Exit;
   End;

   If DM1.cdsGradoA.FieldByName('ANULADO').AsString = 'S' Then
   Begin
      MessageDlg('Registro Anulado, NO PUEDE SER MODIFICADO', mtError, [mbOk], 0);
      Exit;
   End;

   If Length(TRIM(DM1.cdsGradoA.FieldByName('NUMLIQ').AsString)) <> 0 Then
   Begin
      MessageDlg('Periodo Liquidado, NO PUEDE SER MODIFICADO', mtError, [mbOk], 0);
      exit;
   End;

  //Verifico que Anule siempre el Vigente
   If DM1.cdsGradoA.FieldByName('RESVIG').AsString <> 'S' Then
   Begin
      MessageDlg('Sólo se puede Anular la Resolución Vigente', mtError, [mbOk], 0);
      exit;
   End;

  // si el Asociado es Cesado y ha sido Liquidado, NO SE PUEDE ANULAR
   If (Dm1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE') Then
   Begin
      xSQL := 'select ASOID '
         + 'from PVS301 '
         + 'where ASOID = ' + quotedstr(DM1.cdsGradoA.FieldByName('ASOID').AsString)
         + '  and PVSESTADO not in (''13'',''04'') ';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecordCount > 0 Then
      Begin
         xSQL := 'select ASOID '
            + 'from PVS306 '
            + 'where ASOID = ' + quotedstr(DM1.cdsGradoA.FieldByName('ASOID').AsString)
            + '  and PVSESTLIQ not in (''13'',''04'') ';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount > 0 Then
         Begin
            ShowMessage('La Liquidación del Cesante ha sido Cerrada, no se puede Anular');
            exit;
         End
         Else
         Begin
            ShowMessage('El Expediente de Beneficio está en trámite, no se puede Anular');
            exit;
         End;
      End;
   End;

   edtObsAnula.Text := '';

   grpResoluciones.Enabled := False;
   pnlAnulacion.Top := 32;
   pnlAnulacion.Left := 176;
   pnlAnulacion.Visible := True;

End;

Procedure TfResNomb2.BitBtn1Click(Sender: TObject);
Var
   xsql, xasoid, xcorrelativo: String;
Begin
   If Length(trim(edtObsAnula.Text)) = 0 Then
   Begin
      MessageDlg('Debe Ingresar Observación de la Anulación', mtError, [mbOk], 0);
      edtObsAnula.SetFocus;
      Exit;
   End;

   If MessageDlg('ESTA SEGURO(A) ANULAR', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then exit;

// marca como anulado
   xcorrelativo := DM1.cdsGradoA.FieldByName('CORRELATIVO').AsString;
   xasoid := DM1.cdsGradoA.FieldByName('ASOID').AsString;

   xsql := ' UPDATE ' + DM1.sResolucion
         + ' SET RESVIG='+quotedstr('N')+','
         + '     ANULADO='+quotedstr('S')+','
         + '     OBSANU='+quotedstr(trim(edtObsAnula.Text))+','
         + '     USUANU='+quotedstr(DM1.wUsuario)+','
         + '     FECANU=SYSDATE '
         + ' WHERE ' + DM1.sReso_where + ' ASOID='+quotedstr(XASOID)
         + '   AND CORRELATIVO='+ quotedstr(xcorrelativo);
   DM1.DCOM1.AppServer.EjecutaSql(xSQL);

   MessageDlg('<<< Anulación Concluida >>>', mtError, [mbOk], 0);
   Button2Click(self); //SALIR
End;

Procedure TfResNomb2.Button2Click(Sender: TObject);
Begin
   edtObsAnula.Text := '';
   pnlAnulacion.Visible := False;
   grpResoluciones.Enabled := TRue;
End;

Procedure TfResNomb2.BitSalirClick(Sender: TObject);
Begin
   close;
End;

procedure TfResNomb2.bitMostrarClick(Sender: TObject);
var
   xSQL : string;
begin
   Try
      if DM1.cdsAso.fieldbyname('ASOTIPID').AsString='CO' then
      begin
         xSQL:='UPDATE DB2ADMIN.ASO_RESOLUCIONES '
             +  ' SET RESVIG=''N'' '
             + 'WHERE ASOID='''+DM1.cdsAso.fieldbyname('ASOID').AsString+''' '
             +  ' AND ASORESCESE IS NULL AND ASOFRESCESE IS NOT NULL '
             +  ' AND ASOFRESCESE<TO_DATE(SYSDATE)';
         DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      end;

      FResolucionesHis := TFResolucionesHis.Create(self);
      FResolucionesHis.ShowModal;
   Finally
      FResolucionesHis.Free;
   End;

   Exit;

   {
   Try
      fResNombHist:= TfResNombHist.create(self);
      xSQL := 'SELECT ASOID, NUMDOC, FECIDOC, FECFDOC, USUREG, FECREG FROM ASO_RESOLUCIONES_HIS WHERE ASOID=' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ' ORDER BY FECIDOC DESC';
      DM1.cdsResolucionHist.Close;
      DM1.cdsResolucionHist.DataRequest(xSQL);
      DM1.cdsResolucionHist.Open;
      If DM1.cdsResolucionHist.RecordCount >= 1 Then
      Begin

      fResNombHist.Width:=580;
      fResNombHist.grpResoluciones.Width:=560;
      fResNombHist.dbgResolucionesHist.Width:=541;

      If (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO') Then
      Begin

         fResNombHist.dbgResolucionesHist.Selected.Clear;
         fResNombHist.dbgResolucionesHist.Selected.Add('NUMDOC'#9'5'#9'Numero Cont.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECIDOC'#9'10'#9'Fecha Ini. Cont.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECFDOC'#9'10'#9'Fecha Fin. Cont.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('USUREG'#9'10'#9'Usuario~Modificación'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECREG'#9'20'#9'Fecha~Modificación'#9#9);
         fResNombHist.dbgResolucionesHist.ApplySelected;
      End
      Else
      Begin
         fResNombHist.dbgResolucionesHist.Selected.Clear;
         fResNombHist.dbgResolucionesHist.Selected.Add('NUMDOC'#9'5'#9'Numero Res.Nomb.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECIDOC'#9'10'#9'Fecha Res.Nomb.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECFDOC'#9'10'#9'Fecha Cese.'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('USUREG'#9'10'#9'Usuario~Modificación'#9#9);
         fResNombHist.dbgResolucionesHist.Selected.Add('FECREG'#9'20'#9'Fecha~Modificación'#9#9);
         fResNombHist.dbgResolucionesHist.ApplySelected;
      End;
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
   }

end;
End.
