// Inicio Uso Estándares     :  01/08/2011
// Unidad                    :  ASO268.PAS
// Formulario                :  Fconsentimientodatos
// Fecha de Creación         :  15/02/2018
// Autor                     :  Isaac Revilla
// Objetivo                  :  Registro de consentimiento de datos
// Actualizaciones:
// MAS_201901_HPC            : Creación
unit ASO268;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, wwdblook, Wwdbdlg, wwdbdatetimepicker, Mask,
  ExtCtrls;

type
  TFconsentimientodatos = class(TForm)
    gbprincipal: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpFecFirCon: TwwDBDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblcdTipCon: TwwDBLookupComboDlg;
    dblcdOriCon: TwwDBLookupComboDlg;
    btnGrabar: TBitBtn;
    btnSalir: TBitBtn;
    Panel1: TPanel;
    meDesTipCon: TMaskEdit;
    Panel2: TPanel;
    meDesAreCon: TMaskEdit;
    procedure btnSalirClick(Sender: TObject);
    procedure dblcdTipConExit(Sender: TObject);
    procedure dblcdOriConExit(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dtpFecFirConExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fconsentimientodatos: TFconsentimientodatos;

implementation

uses ASODM, ASO260;

{$R *.dfm}

procedure TFconsentimientodatos.btnSalirClick(Sender: TObject);
begin
   Close;
end;


procedure TFconsentimientodatos.dblcdTipConExit(Sender: TObject);
begin
   If DM1.cdsTipCon.Locate('LPDPTIPCON', dblcdTipCon.Text, []) Then
      meDesTipCon.Text := DM1.cdsTipCon.FieldByName('LPDPTIPCONDES').AsString
   Else
   Begin
      MessageDlg('Código no valido', mtInformation, [mbOk], 0);
      dblcdTipCon.Text := '';
      meDesTipCon.Text := '';
   End;
end;

procedure TFconsentimientodatos.dblcdOriConExit(Sender: TObject);
begin
   If Trim(dblcdOriCon.Text) = '' Then Exit;
   If (Trim(dblcdOriCon.Text) <> '') And (DM1.cdsOficina.Locate('CODSUBARE', dblcdOriCon.Text, [])) Then
      meDesAreCon.Text := DM1.cdsOficina.FieldByName('DESARE').AsString
   Else
   Begin
      MessageDlg('Código no valido', mtInformation, [mbOk], 0);
      dblcdOriCon.Text := '';
      meDesAreCon.Text := '';
   End;
end;

procedure TFconsentimientodatos.btnmodificarClick(Sender: TObject);
begin
   If dblcdTipCon.Text = 'T' Then
   Begin
      MessageDlg(#13'Docente cuenta con el consentimiento, en caso de requerir una modificación'#13'deberá derivarse con el Encargado de Protección de Datos.'#13, mtError, [mbOk], 0);
      Exit;
   End;

  btnGrabar.Enabled := True;
end;

procedure TFconsentimientodatos.btnGrabarClick(Sender: TObject);
Var xSql, xCodAre:String;
begin

   If (DM1.xCtlCon = '1') And (Trim(dtpFecFirCon.Text) = '') Then
   Begin
      MessageDlg('Debe registrar fecha de consentimiento antes de proceder a actualizar', mtError, [mbOk], 0);
      dtpFecFirCon.SetFocus;
      Exit;
   End;

   If Trim(dblcdTipCon.Text) = '' Then
   Begin
      MessageDlg('Debe registrar el tipo de consentimiento antes de proceder a actualizar', mtError, [mbOk], 0);
      dblcdTipCon.SetFocus;
      Exit;
   End;

   If Trim(dblcdOriCon.Text) = '' Then
   Begin
      MessageDlg('Debe registrar el origen del consentimiento antes de proceder a actualizar', mtError, [mbOk], 0);
      dblcdOriCon.SetFocus;
      Exit;
   End;
   If MessageDlg('¿ Seguro de confirmar el consentimiento de datos ?' ,  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
   Begin
      xCodAre := DM1.cdsOficina.FieldByName('CODARE').AsString;
      xSql := 'BEGIN SP_INSERTA_ASO_LPDP_CON_DET ('+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+','+QuotedStr(dblcdTipCon.Text)
      +','+QuotedStr('ASO')+','+QuotedStr(DM1.wUsuario)+','+QuotedStr(xCodAre)+','+QuotedStr(dblcdOriCon.Text)+','+QuotedStr('E')+','+QuotedStr(dtpFecFirCon.Text)+'); END;';
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      MessageDlg('Se ha grabado información para el consentimiento de datos', mtInformation, [mbOk], 0);
      FMantAsociado.ActivaBotonConsentimiento;
      btnGrabar.Enabled    := False;
   End;
   Close;
end;

procedure TFconsentimientodatos.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   End;
end;

procedure TFconsentimientodatos.dtpFecFirConExit(Sender: TObject);
begin
  If dtpFecFirCon.Date>DM1.FechaSys Then
  Begin
     ShowMessage('La fecha del consentimiento de datos no puede ser mayor a la fecha de registro');
     Exit;
  end;
end;

end.
