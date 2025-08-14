// Inicio Uso Estándares     :  01/08/2011
// Unidad                    :  ASO269.PAS
// Formulario                :  FModconsultadatos
// Fecha de Creación         :  15/02/2018
// Autor                     :  Isaac Revilla
// Objetivo                  :  Modificación de consulta de datos
// Actualizaciones:
// MAS_201901_HPC            : Creación

unit ASO270;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, wwdbdatetimepicker, wwdblook,
  Wwdbdlg;

type
  TFModconsultadatos = class(TForm)
    edtAsoApeNom: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtAsoTipId: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtModOrigen: TEdit;
    edtUsuReg: TEdit;
    edtUniReg: TEdit;
    edtOfiReg: TEdit;
    edtEstCon: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    gbDescOriCon: TGroupBox;
    meDesOriCon: TEdit;
    gbDescTipCons: TGroupBox;
    meDesTipCon: TEdit;
    dbdtpFecCon: TwwDBDateTimePicker;
    gbDescMotModCon: TGroupBox;
    meDescMotCon: TEdit;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    dblcdOriCon: TwwDBLookupComboDlg;
    dblcdTipCon: TwwDBLookupComboDlg;
    dblcdMotModCon: TwwDBLookupComboDlg;
    pnlApellidosNombres: TPanel;
    pnlDatosOrigen: TGroupBox;
    procedure FormActivate(Sender: TObject);
    procedure dblcdTipConExit(Sender: TObject);
    procedure dblcdOriConExit(Sender: TObject);
    procedure dblcdMotModConExit(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure dbdtpFecConChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FModconsultadatos: TFModconsultadatos;

implementation

uses ASODM;

{$R *.dfm}

procedure TFModconsultadatos.FormActivate(Sender: TObject);
Var xSql: String;
begin
   xSql := 'SELECT A.CODARE, B.CODSUBARE, B.DESARE FROM SEGURIDAD.M_USUARIO A, REQUERIMIENTO.TI_SUBAREA B'
   +' WHERE A.ID_USUARIO = '+QuotedStr(DM1.wUsuario)+' AND A.CODARE = B.CODUNI(+) ORDER BY B.CODSUBARE';
   DM1.cdsOficina.Close;
   DM1.cdsOficina.DataRequest(xSql);
   DM1.cdsOficina.Open;
   dblcdOriCon.Selected.Clear;
   dblcdOriCon.Selected.Add('CODSUBARE'#9'2'#9'Código'#9#9);
   dblcdOriCon.Selected.Add('DESARE'#9'35'#9'Descripción'#9#9);

   xsql := 'SELECT LPDPTIPCON, LPDPTIPCONDES FROM ASO_LPDP_TIP_MAE ORDER BY LPDPTIPCON';
   DM1.cdsTipCon.Close;
   DM1.cdsTipCon.DataRequest(xSql);
   DM1.cdsTipCon.Open;
   dblcdTipCon.Selected.Clear;
   dblcdTipCon.Selected.Add('LPDPTIPCON'#9'2'#9'Código'#9#9);
   dblcdTipCon.Selected.Add('LPDPTIPCONDES'#9'35'#9'Descripción'#9#9);

   xsql := 'SELECT CODMOTMODCON, DESMOTMODCON FROM ASO_LPDP_MOT_MOD_CONS ORDER BY CODMOTMODCON';
   DM1.cdsMotModCon.Close;
   DM1.cdsMotModCon.DataRequest(xSql);
   DM1.cdsMotModCon.Open;
   dblcdMotModCon.Selected.Clear;
   dblcdMotModCon.Selected.Add('CODMOTMODCON'#9'2'#9'Código'#9#9);
   dblcdMotModCon.Selected.Add('DESMOTMODCON'#9'35'#9'Descripción'#9#9);

   edtAsoApeNom.Text := DM1.cdsAso.FieldByName('ASOAPENOMDNI').AsString;
   edtAsoTipId.Text  := DM1.RecuperaDatos('APO107', 'ASOTIPID', DM1.cdsAso.fieldbyname('ASOTIPID').AsString, 'ASOTIPDES');
   edtModOrigen.Text := DM1.cdsQry2.FieldByName('MODULO_REGISTRA').AsString;
   edtUsuReg.Text    := DM1.cdsQry2.FieldByName('USUARIO_REGISTRA').AsString;
   edtUniReg.Text    := DM1.cdsQry2.FieldByName('DESC_AREA').AsString;
   edtOfiReg.Text    := DM1.cdsQry2.FieldByName('DESC_OFICINA_ORIGEN').AsString;
   edtEstCon.Text    := DM1.cdsQry2.FieldByName('DESC_ESTADO_CONSENTIMIENTO').AsString;

   dblcdTipCon.Text  := DM1.cdsQry2.FieldByName('CODI_TIPO_CONSENTIMIENTO').AsString;
   If Trim(dblcdTipCon.Text) <> '' Then
   Begin
      DM1.cdsTipCon.Locate('LPDPTIPCON', VarArrayof([dblcdTipCon.Text]), []);
      meDesTipCon.Text := DM1.cdsTipCon.FieldByName('LPDPTIPCONDES').AsString;
   End;

   dblcdOriCon.Text := DM1.cdsQry2.FieldByName('CODIGO_SUBAREA').AsString;
   If dblcdOriCon.Text <> '' Then
   Begin
      DM1.cdsOficina.Locate('CODSUBARE', VarArrayof([dblcdOriCon.Text]), []);
      meDesOriCon.Text := DM1.cdsOficina.FieldByName('DESARE').AsString;
   End;

   dbdtpFecCon.Date := DM1.cdsQry2.FieldByName('FECHA_CONSENTIMIENTO').AsDateTime;

end;

procedure TFModconsultadatos.dblcdTipConExit(Sender: TObject);
begin
   If Trim(dblcdTipCon.Text) = '' Then Exit;
   If DM1.cdsTipCon.Locate('LPDPTIPCON', dblcdTipCon.Text, []) Then
      meDesTipCon.Text := DM1.cdsTipCon.FieldByName('LPDPTIPCONDES').AsString
   Else
   Begin
      MessageDlg('Código no valido', mtInformation, [mbOk], 0);
      dblcdTipCon.Text := '';
      meDesTipCon.Text := '';
   End;
end;

procedure TFModconsultadatos.dblcdOriConExit(Sender: TObject);
begin
   If Trim(dblcdOriCon.Text) = '' Then Exit;
   If (Trim(dblcdOriCon.Text) <> '') And (DM1.cdsOficina.Locate('CODSUBARE', dblcdOriCon.Text, [])) Then
      meDesOriCon.Text := DM1.cdsOficina.FieldByName('DESARE').AsString
   Else
   Begin
      MessageDlg('Código no valido', mtInformation, [mbOk], 0);
      dblcdOriCon.Text := '';
      meDesOriCon.Text := '';
   End;
end;

procedure TFModconsultadatos.dblcdMotModConExit(Sender: TObject);
begin
   If Trim(dblcdMotModCon.Text) = '' Then Exit;
   If (Trim(dblcdMotModCon.Text) <> '') And (DM1.cdsMotModCon.Locate('CODMOTMODCON', dblcdMotModCon.Text, [])) Then
      meDescMotCon.Text := DM1.cdsMotModCon.FieldByName('DESMOTMODCON').AsString
   Else
   Begin
      MessageDlg('Código no valido', mtInformation, [mbOk], 0);
      dblcdMotModCon.Text := '';
      meDescMotCon.Text := '';
   End;
end;

procedure TFModconsultadatos.btnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFModconsultadatos.btnGrabarClick(Sender: TObject);
Var xMensaje, xSql, xCodAre: String;
begin
   If Trim(dblcdOriCon.Text) = '' Then
   Begin
      MessageDlg('Registre el área de origen de consentimiento de datos.', mtInformation, [mbOk], 0);
      dblcdOriCon.SetFocus;
      Exit;
   End;
   If Trim(dblcdTipCon.Text) = '' Then
   Begin
      MessageDlg('Registre el tipo de consentimiento de datos.', mtInformation, [mbOk], 0);
      dblcdTipCon.SetFocus;
      Exit;
   End;
   If Trim(dbdtpFecCon.Text) = '' Then
   Begin
      MessageDlg('Registre la fecha de la firma de consentimiento de datos.', mtInformation, [mbOk], 0);
      dbdtpFecCon.SetFocus;
      Exit;
   End;
   If Trim(dblcdMotModCon.Text) = '' Then
   Begin
      MessageDlg('Registre el motivo de la modificación.', mtInformation, [mbOk], 0);
      dblcdMotModCon.SetFocus;
      Exit;
   End;
   If dblcdTipCon.Text = 'T' Then
      xMensaje := '¿Seguro de aceptar consentimiento de datos?'
   Else
      xMensaje := '¿Seguro de no aceptar consentimiento de datos?';
   If MessageDlg(xMensaje,  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
   Begin
      xCodAre := DM1.cdsOficina.FieldByName('CODARE').AsString;
      xSql := 'BEGIN SP_INSERTA_ASO_LPDP_CON_DET ('+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+','+QuotedStr(dblcdTipCon.Text)
      +','+QuotedStr('ASO')+','+QuotedStr(DM1.wUsuario)+','+QuotedStr(xCodAre)+','+QuotedStr(dblcdOriCon.Text)+','+QuotedStr('E')+','+QuotedStr(dbdtpFecCon.Text)+'); END;';
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      MessageDlg('La información fue insertada satisfactoriamente.', mtInformation, [mbOk], 0);
      Close;
   End;

end;

procedure TFModconsultadatos.dbdtpFecConChange(Sender: TObject);
begin
   If Trim(dbdtpFecCon.Text) =  '' Then Exit;
end;

end.

