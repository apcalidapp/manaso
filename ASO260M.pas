unit ASO260M;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, ExtCtrls, StdCtrls, wwdblook, Wwdbdlg, Buttons;

type
  TFacttipbenhojcargo = class(TForm)
    btnactualiza: TBitBtn;
    btncerrar: TBitBtn;
    dblcdtipobeneficio: TwwDBLookupComboDlg;
    Label1: TLabel;
    pnldesctipobeneficio: TPanel;
    medesctipobeneficio: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    pnlusuregistra: TPanel;
    meusuario: TMaskEdit;
    pnlfecharegistro: TPanel;
    mefechahora: TMaskEdit;
    rgtiporetiro: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure dblcdtipobeneficioExit(Sender: TObject);
    procedure btnactualizaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Facttipbenhojcargo: TFacttipbenhojcargo;

implementation

uses ASODM;

{$R *.dfm}

procedure TFacttipbenhojcargo.FormActivate(Sender: TObject);
Var xSql:String;
begin
   xSql := 'SELECT TIPBENEF, BENEFDES FROM TGE186 WHERE TIPBENEF IN (''01'',''02'',''03'')';
   DM1.cdsQry3.Close;
   DM1.cdsQry3.DataRequest(xSql);
   DM1.cdsQry3.Open;
   dblcdtipobeneficio.Selected.Clear;
   dblcdtipobeneficio.Selected.Add('TIPBENEF'#9'2'#9'Código'#9#9);
   dblcdtipobeneficio.Selected.Add('BENEFDES'#9'15'#9'Descripción'#9#9);
   rgtiporetiro.Enabled := True;
   xSql := 'SELECT A.PVSTIPBEN, B.BENEFDES, A.TIPORETIRO FROM PRE_CARGO_EXPEDIENTE_MOV A, TGE186 B'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND CODCAREXPEST = ''PENDIENTE'' AND A.PVSTIPBEN = B.TIPBENEF';
   DM1.cdsQry4.Close;
   DM1.cdsQry4.DataRequest(xSql);
   DM1.cdsQry4.Open;
   dblcdtipobeneficio.Text  := DM1.cdsQry4.FieldByName('PVSTIPBEN').AsString;
   medesctipobeneficio.Text := DM1.cdsQry4.FieldByName('BENEFDES').AsString;
   If dblcdtipobeneficio.Text = '01' Then
   Begin
      If DM1.cdsQry4.FieldByName('TIPORETIRO').AsString = 'Por limite de edad al 31/12' Then rgtiporetiro.ItemIndex := 0;
      If DM1.cdsQry4.FieldByName('TIPORETIRO').AsString = 'Otros retiros' Then rgtiporetiro.ItemIndex := 1;
   End
   Else
   Begin
      rgtiporetiro.ItemIndex := -1;
      rgtiporetiro.Enabled := False;
   End;
   meusuario.Text := DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
   mefechahora.Text := DM1.FechaHora;
end;

procedure TFacttipbenhojcargo.btncerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFacttipbenhojcargo.dblcdtipobeneficioExit(Sender: TObject);
begin
   If Trim(dblcdtipobeneficio.Text) = '' Then Exit;
   If DM1.cdsQry3.Locate('TIPBENEF', VarArrayof([dblcdtipobeneficio.text]), []) Then
   Begin
      medesctipobeneficio.Text := DM1.cdsQry3.FieldByName('BENEFDES').AsString;
      If dblcdtipobeneficio.Text = '01' Then
         rgtiporetiro.Enabled := True
      Else
      Begin
         rgtiporetiro.Enabled := False;
         rgtiporetiro.ItemIndex := -1;
      End;
   End
   Else
   Begin
     MessageDlg('Tipo de beneficio no valido.', mtError, [mbOk], 0);
     dblcdtipobeneficio.SetFocus;
     Exit;
   End;
end;

procedure TFacttipbenhojcargo.btnactualizaClick(Sender: TObject);
Var xcodcargo, xtexto, xSql:String;
begin
   If Trim(dblcdtipobeneficio.Text) = '' Then
   Begin
      MessageDlg('Debe seleccionar el tipo de beneficio.', mtInformation, [mbOk], 0);
      dblcdtipobeneficio.SetFocus;
      Exit;
   End;
   If dblcdtipobeneficio.Text = '01' Then
   Begin
      If rgtiporetiro.ItemIndex = -1 Then
      Begin
         MessageDlg('Debe seleccionar el tipo de retiro.', mtInformation, [mbOk], 0);
         rgtiporetiro.SetFocus;
         Exit;
      End;
   End;
   If MessageDlg('¿Seguro que desea generar la hoja de cargo?' ,  mtConfirmation, [mbYes, mbNo], 0) = mrYes  Then
   Begin
      xSql := 'SELECT DB2ADMIN.PCK_PRE_CARGO_EXPEDIENTE.SF_PRE_OBTIENE_CODIGO_PENDIENT '
         +' (' + QuotedStr(DM1.xOfiDes) + ', ' + QuotedStr(DM1.wUsuario) + ', ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ', SYSDATE) CODCAREXP '
         +' FROM DUAL';
         DM1.cdsQry5.Close;
         DM1.cdsQry5.DataRequest(xSql);
         DM1.cdsQry5.Open;
         xcodcargo := DM1.cdsQry5.FieldByName('CODCAREXP').AsString;
         If xcodcargo = 'NULL' Then
         Begin
            MessageDlg('Solo se pueden crear Hojas de Cargo para asociado del tipo ''DO'' y ''CE'' que registren aportes', mtInformation, [mbOk], 0);
            Exit;
         End;
         If dblcdtipobeneficio.Text = '01' Then
         Begin
            If rgtiporetiro.ItemIndex = 0 Then xtexto := 'Por limite de edad al 31/12';
            If rgtiporetiro.ItemIndex = 1 Then xtexto := 'Otros retiros';
         End
         Else xtexto := '';
         xSql := 'UPDATE PRE_CARGO_EXPEDIENTE_MOV SET PVSTIPBEN = '+QuotedStr(dblcdtipobeneficio.Text)+', USUREGTIPBE = '+QuotedStr(DM1.wUsuario)
         +', FECREGTIPBE = SYSDATE, TIPORETIRO = '+QuotedStr(xtexto)+' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND CODCAREXPEST = ''PENDIENTE''';
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
         MessageDlg('Hoja de cargo registrado.', mtInformation, [mbOk], 0);
         Close;
   End;
end;

procedure TFacttipbenhojcargo.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   End;
end;

end.
