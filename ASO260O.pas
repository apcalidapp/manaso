// Unidad		        : ASO260O.pas
// Formulario		    : FManCodigoPago
// Fecha de Creación    : 10/01/2023
// Autor			    : Isaac Revilla
// Objetivo		        : Mantenimiento de Código de Pago
// Actualizaciones:
// Creación
// MAS_202305_HPC       : Se añade inserción de las modificaciones en la tabla de historial de codigos de pago.


unit ASO260O;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, Mask;

type
  TFManCodigoPago = class(TForm)
    btnSalir: TBitBtn;
    dbgcodigopago: TwwDBGrid;
    dbgcodigopagoIButton: TwwIButton;
    pnlcodigopago: TPanel;
    gbcodigopago: TGroupBox;
    btnguardar: TBitBtn;
    btncerrar: TBitBtn;
    lbletidoc: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    measocodpago: TMaskEdit;
    Label4: TLabel;
    Panel1: TPanel;
    measodni: TMaskEdit;
    pnlasoapenomdni: TPanel;
    measoapenomdni: TMaskEdit;
    pnldescuegl: TPanel;
    medescugel: TMaskEdit;
    procedure dbgcodigopagoIButtonClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure measocodpagoExit(Sender: TObject);
  private
  procedure actdbgcodigopago;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FManCodigoPago: TFManCodigoPago;

implementation

uses ASODM, ASO260;

{$R *.dfm}

procedure TFManCodigoPago.dbgcodigopagoIButtonClick(Sender: TObject);
Var xSql:String;
begin
   xSql := 'SELECT A.ASODNI, A.ASOAPENOMDNI, A.TIPDOCCOD, A.ASODOCNUM, B.USEID, B.USENOM FROM '+DM1.sAPO201+' A, APO101 B'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
   +' AND A.UPROID = B.UPROID AND A.UPAGOID = B.UPAGOID AND A.USEID = B.USEID';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pnlcodigopago.Visible := True;
   pnlcodigopago.Top := 4;
   pnlcodigopago.Left := 4;
   gbcodigopago.Caption := ' Insertando nuevo código de pago ';
   dbgcodigopago.Enabled := False;
   btnSalir.Enabled := False;


   If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '10' Then
      measodni.Text := DM1.cdsQry.FieldByName('ASODNI').AsString
   Else
      measodni.Text := DM1.cdsQry.FieldByName('ASODOCNUM').AsString;

   measoapenomdni.Text := DM1.cdsQry.FieldByName('ASOAPENOMDNI').AsString;
   medescugel.Text := Trim(DM1.cdsQry.FieldByName('USEID').AsString)+'-'+Trim(DM1.cdsQry.FieldByName('USENOM').AsString);

   lbletidoc.Caption := FMantAsociado.edtTipDoc.Text;

   measocodpago.Text := '';
   measocodpago.SetFocus;
end;

procedure TFManCodigoPago.btncerrarClick(Sender: TObject);
begin
   pnlcodigopago.Visible := False;
   dbgcodigopago.Enabled := True;
   btnSalir.Enabled := True;
end;

procedure TFManCodigoPago.FormActivate(Sender: TObject);
begin
   pnlcodigopago.Visible := False;
   actdbgcodigopago;
end;

procedure TFManCodigoPago.btnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFManCodigoPago.btnguardarClick(Sender: TObject);
Var xSql, xItem:String;

begin
   If Trim(measocodpago.Text) = '' Then
   Begin
      MessageDlg('Debe registrar código de pago.', mtError, [mbCancel], 0);
      measocodpago.SetFocus;
      Exit;
   End;
   If MessageDlg('¿Seguro que desea registrar nuevo código de pago?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      xSql := 'UPDATE ASO_COD_PAG_HIS SET SITREG = ''C'' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      xSql := 'SELECT LPAD(NVL(MAX(ITEM),0)+1,3,''0'') PRO_ITEM from ASO_COD_PAG_HIS WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      xItem := DM1.cdsQry.FieldByName('PRO_ITEM').AsString;
      xSql := 'INSERT INTO DB2ADMIN.ASO_COD_PAG_HIS (ASOID, ASOCODMOD, ASODNI, ASOAPENOMDNI, ASOTIPID, UPROID, UPAGOID, USEID, ASOCODPAGO, ITEM, SITREG, USUCREA, FECCREA)'
      +' VALUES ('+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+','
      + QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString)+','
      + QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString)+','
      + QuotedStr(DM1.cdsAso.FieldByName('ASOAPENOMDNI').AsString)+','
      + QuotedStr(DM1.cdsAso.FieldByName('ASOTIPID').AsString)+','
      + QuotedStr(DM1.cdsAso.FieldByName('UPROID').AsString)+','
      + QuotedStr(DM1.cdsAso.FieldByName('UPAGOID').AsString)+','
      + QuotedStr(DM1.cdsAso.FieldByName('USEID').AsString)+','
      + QuotedStr(Trim(measocodpago.Text))+','
      + QuotedStr(xItem)+','
      + QuotedStr('A')+','
      + QuotedStr(DM1.wUsuario)+', SYSDATE)';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      xSql := 'UPDATE DB2ADMIN.APO201 SET ASOCODPAGO = '+QuotedStr(Trim(measocodpago.Text))+' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      xSql := 'UPDATE DB2ADMIN.ASO_NUE_CLI SET ASOCODPAGO = '+QuotedStr(Trim(measocodpago.Text))+' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      actdbgcodigopago;
      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByName('ASOCODPAGO').AsString := Trim(measocodpago.Text);
      DM1.cdsAso.Post;
      MessageDlg('Nuevo código de pago fue registrado satisfactoriamente.', mtInformation, [mbOk], 0);
   End;
   pnlcodigopago.Visible := False;
   dbgcodigopago.Enabled := True;
   btnSalir.Enabled := True;
end;

procedure TFManCodigoPago.measocodpagoExit(Sender: TObject);
begin
   If Trim(measocodpago.Text) = '' Then Exit;
   If Copy(Trim(measocodpago.Text),1,2) <> Trim(DM1.cdsQry.FieldByName('USEID').AsString) Then
   Begin
      MessageDlg('Los 2 primeros caracteres del código de pago debe ser igual al código de ugel.', mtInformation, [mbOk], 0);
      measocodpago.Text := '';
      measocodpago.SetFocus;
      Exit;
   End;
end;

procedure TFManCodigoPago.actdbgcodigopago;
Var xSql:String;
begin

   xSql := 'SELECT ITEM, ASODNI, ASOAPENOMDNI, ASOCODPAGO, ASOCODMOD, ASOTIPID, UPROID, UPAGOID, USEID,   SITREG, USUCREA, TO_CHAR(FECCREA,''DD/MM/YYYY HH12:MI:SS AM'') FECCREA'
   +' FROM ASO_COD_PAG_HIS WHERE ASOID = '+QuotedStr(Dm1.cdsAso.FieldByname('ASOID').AsString)
   +' ORDER BY ITEM DESC';
   DM1.cdsQry20.Close;
   DM1.cdsQry20.DataRequest(xSql);
   DM1.cdsQry20.Open;
   dbgcodigopago.Selected.Clear;
   dbgcodigopago.Selected.Add('ITEM'#9'4'#9'Item'#9);
   dbgcodigopago.Selected.Add('SITREG'#9'4'#9'Sit.~registro'#9);
   // dbgcodigopago.Selected.Add('ASODNI'#9'8'#9'DNI~asociado'#9);
   // dbgcodigopago.Selected.Add('ASOCODMOD'#9'10'#9'Código~Modular'#9);
   // dbgcodigopago.Selected.Add('ASOAPENOMDNI'#9'35'#9'Apellidos y~Nombres'#9);
   dbgcodigopago.Selected.Add('ASOCODPAGO'#9'20'#9'Código~de pago'#9);
   dbgcodigopago.Selected.Add('USUCREA'#9'15'#9'Usuario~que crea'#9);
   dbgcodigopago.Selected.Add('FECCREA'#9'21'#9'Fecha/hora~de creación'#9);
   dbgcodigopago.ApplySelected;
end;

end.
