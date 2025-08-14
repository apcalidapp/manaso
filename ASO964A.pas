// Unidad		            : ASO964A.pas
// Formulario		        : Fhisautdesapo
// Fecha de Creación    : 10/01/2023
// Autor			          : Isaac Revilla
// Objetivo		          : Muestra historial de las autorizaciones y desautorizaciones de autorizaciones de descuento de aportes
// Actualizaciones:
// MAS_202305_HPC       : Creación

unit ASO964A;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, ExtCtrls, Mask,
  fcButton, fcImgBtn, fcShapeBtn,  db;



type
  TFhisautdesapo = class(TForm)
    btnsalir: TBitBtn;
    dbghisdesapo: TwwDBGrid;
    pnldetalle: TPanel;
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    btncerrar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    measocodmod: TMaskEdit;
    Panel2: TPanel;
    measoapenomdni: TMaskEdit;
    Label3: TLabel;
    Panel3: TPanel;
    measotipid: TMaskEdit;
    Label4: TLabel;
    Panel4: TPanel;
    mefecautdesapo: TMaskEdit;
    lbldesautdesa: TLabel;
    Panel5: TPanel;
    medesautdesa: TMaskEdit;
    Panel6: TPanel;
    meusucrea: TMaskEdit;
    Label5: TLabel;
    Panel7: TPanel;
    mefeccrea: TMaskEdit;
    Label6: TLabel;
    btnautoriza: TBitBtn;
    btndesautoriza: TBitBtn;
    stautorizaciones: TStaticText;
    procedure FormActivate(Sender: TObject);
    procedure dbghisdesapoDblClick(Sender: TObject);
    procedure btnsalirClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnautorizaClick(Sender: TObject);
    procedure btndesautorizaClick(Sender: TObject);
  private
    procedure muestraautorizaciones;
    procedure muestradesautorizaciones;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fhisautdesapo: TFhisautdesapo;

implementation

uses ASODM;

{$R *.dfm}

procedure TFhisautdesapo.FormActivate(Sender: TObject);
Var xSql:String;
begin
   pnldetalle.Visible := False;
   btncerrar.Enabled := True;
   dbghisdesapo.Enabled := True;
   btnautoriza.OnClick(btnautoriza);
end;

procedure TFhisautdesapo.dbghisdesapoDblClick(Sender: TObject);
begin
   If DM1.cdsQry26.RecordCount = 0 Then
   Begin
      MessageDlg('No existe información que mostrar', mtError, [mbOk], 0);
      Exit;
   End;
   pnldetalle.Visible := True;
   btnsalir.Enabled := False;
   dbghisdesapo.Enabled := False;
   btnautoriza.Visible := False;
   btndesautoriza.Visible := False;
   pnldetalle.Top := 23;
   pnldetalle.Left := 151;
   measocodmod.Text := DM1.cdsQry26.FieldByName('ASOCODMOD').AsString;
   measotipid.Text := DM1.cdsQry26.FieldByName('ASOTIPID').AsString;
   measoapenomdni.Text := DM1.cdsQry26.FieldByName('ASOAPENOMDNI').AsString;
   mefecautdesapo.Text := DM1.cdsQry26.FieldByName('FECAUTDESAPO').AsString;
   If DM1.cdsQry26.FieldByName('AUTDESAPO').AsString = 'S' Then
   Begin
      lbldesautdesa.Caption := 'Mot. autorización';
      medesautdesa.Text := DM1.cdsQry26.FieldByName('DESMOTAUTCADAPS').AsString;
   End
   Else
   Begin
      lbldesautdesa.Caption := 'Mot. desautorización';
      medesautdesa.Text := DM1.cdsQry26.FieldByName('DESMOTDES').AsString;
   End;
   meusucrea.Text := DM1.cdsQry26.FieldByName('USUCREA').AsString;
   mefeccrea.Text := DM1.cdsQry26.FieldByName('FECCREA').AsString;
end;

procedure TFhisautdesapo.btnsalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFhisautdesapo.btncerrarClick(Sender: TObject);
begin
   pnldetalle.Visible := False;
   btnsalir.Enabled := True;
   dbghisdesapo.Enabled := True;
   btnautoriza.Visible := True;
   btndesautoriza.Visible := True;
end;


procedure TFhisautdesapo.muestraautorizaciones;
Var xSql:String;
begin
   xSql := 'SELECT A.ITEM, A.SITREG, NVL(A.AUTDESAPO,''N'') AUTDESAPO, A.ASOCODMOD, A.ASODNI, A.ASOAPENOMDNI, A.ASOTIPID, A.UPROID,'
   +' A.UPAGOID, A.USEID, A.USUCREA, TO_CHAR(A.FECCREA,''DD/MM/YYYY HH12:MI:SS AM'') FECCREA, A.MODCREA, A.FECAUTDESAPO, A.CODMODAUTDESAPO,'
   +' TO_CHAR(A.FECREGAUTDESAPO,''DD/MM/YYYY HH12:MI:SS AM'') FECREGAUTDESAPO, A.USUREGAUTDESAPO, C.DESMOTDES'
   +' FROM DB2ADMIN.ASO_AUT_DES_APO_HIS A, ASO_MOT_AUT_CADAPS B, ASO_MOT_DES C, APO110 D, APO110 E'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND NVL(A.AUTDESAPO,''N'') = ''S'''
   +' AND A.CODMOTAUTCADAPS = B.CODMOTAUTCADAPS(+)'
   +' AND A.CODMOTDESTAPO = C.CODMOTDEST(+) AND A.OFIREGAUTDESAPO = D.OFDESID(+) AND A.OFIREGDESTAPO = E.OFDESID(+)'
   +' ORDER BY A.ITEM DESC';
   DM1.cdsQry26.Close;
   DM1.cdsQry26.DataRequest(xSql);
   DM1.cdsQry26.Open;
   dbghisdesapo.Selected.Clear;
   // Datos del registro
   dbghisdesapo.Selected.Add('ITEM'#9'3'#9'Item'#9);
   dbghisdesapo.Selected.Add('SITREG'#9'1'#9'Sit.~reg.'#9);
   dbghisdesapo.Selected.Add('USUCREA'#9'15'#9'Usuario~que crea'#9);
   dbghisdesapo.Selected.Add('FECCREA'#9'21'#9'Fecha/hora~creación'#9);
   dbghisdesapo.Selected.Add('MODCREA'#9'3'#9'Modulo~creación'#9);
   // Datos del asociado
   dbghisdesapo.Selected.Add('UPROID'#9'3'#9'Unidad de~proceso'#9'F'#9'Datos del asociado');
   dbghisdesapo.Selected.Add('UPAGOID'#9'3'#9'Unidad de~pago'#9'F'#9'Datos del asociado');
   dbghisdesapo.Selected.Add('USEID'#9'3'#9'Unidad de~gestión'#9'F'#9'Datos del asociado');
   // Autorización de descuento
   dbghisdesapo.Selected.Add('FECAUTDESAPO'#9'21'#9'Fec.aut.~desc.aporte'#9'F'#9'Autorización de descuento de aporte');
   dbghisdesapo.Selected.Add('CODMODAUTDESAPO'#9'3'#9'Modulo~aut.desc.aporte'#9'F'#9'Autorización de descuento de aporte');
   dbghisdesapo.Selected.Add('FECREGAUTDESAPO'#9'21'#9'Fec.reg.~aut.desc.aporte'#9'F'#9'Autorización de descuento de aporte');
   dbghisdesapo.Selected.Add('USUREGAUTDESAPO'#9'15'#9'Usu.reg.~aut.desc.aporte'#9'F'#9'Autorización de descuento de aporte');
   dbghisdesapo.ApplySelected;
end;

procedure TFhisautdesapo.muestradesautorizaciones;
Var xSql:String;
begin
   xSql := 'SELECT A.ITEM, A.SITREG, NVL(A.AUTDESAPO,''N'') AUTDESAPO, A.ASOCODMOD, A.ASODNI, A.ASOAPENOMDNI, A.ASOTIPID, A.UPROID,'
   +' A.UPAGOID, A.USEID, A.USUCREA, TO_CHAR(A.FECCREA,''DD/MM/YYYY HH12:MI:SS AM'') FECCREA, A.MODCREA,'
   +' A.FECREGDESTAPO, A.USUREGDESTAPO, A.OFIREGDESTAPO, D.OFDESNOM DESOFIDESTAPO, A.DESOBSDESTAPO, C.DESMOTDES'
   +' FROM DB2ADMIN.ASO_AUT_DES_APO_HIS A, ASO_MOT_AUT_CADAPS B, ASO_MOT_DES C, APO110 D, APO110 E'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND NVL(A.AUTDESAPO,''N'') = ''N'''
   +' AND A.CODMOTAUTCADAPS = B.CODMOTAUTCADAPS(+) AND A.CODMOTDESTAPO = C.CODMOTDEST(+) AND A.OFIREGDESTAPO = D.OFDESID(+)'
   +' AND A.OFIREGDESTAPO = E.OFDESID(+) ORDER BY A.ITEM DESC';
   DM1.cdsQry26.Close;
   DM1.cdsQry26.DataRequest(xSql);
   DM1.cdsQry26.Open;
   dbghisdesapo.Selected.Clear;
   // Datos del registro
   dbghisdesapo.Selected.Add('ITEM'#9'3'#9'Item'#9);
   dbghisdesapo.Selected.Add('SITREG'#9'1'#9'Sit.~reg.'#9);
   dbghisdesapo.Selected.Add('USUCREA'#9'15'#9'Usuario~que crea'#9);
   dbghisdesapo.Selected.Add('FECCREA'#9'21'#9'Fecha/hora~creación'#9);
   dbghisdesapo.Selected.Add('MODCREA'#9'3'#9'Modulo~creación'#9);
   // Datos del asociado
   dbghisdesapo.Selected.Add('UPROID'#9'3'#9'Unidad de~proceso'#9'F'#9'Datos del asociado');
   dbghisdesapo.Selected.Add('UPAGOID'#9'3'#9'Unidad de~pago'#9'F'#9'Datos del asociado');
   dbghisdesapo.Selected.Add('USEID'#9'3'#9'Unidad de~gestión'#9'F'#9'Datos del asociado');
   // Desautorización de descuento
   dbghisdesapo.Selected.Add('FECREGDESTAPO'#9'21'#9'Fec.desaut.~desc.aporte'#9'F'#9'Desautorización de descuento de aporte');
   dbghisdesapo.Selected.Add('USUREGDESTAPO'#9'15'#9'Usu.reg.~desaut.desc.aporte'#9'F'#9'Desautorización de descuento de aporte');
   dbghisdesapo.Selected.Add('DESOFIDESTAPO'#9'3'#9'Oficina reg.~desaut.desc.aporte'#9'F'#9'Desautorización de descuento de aporte');
   dbghisdesapo.Selected.Add('DESMOTDES'#9'21'#9'Motivo~desaut.desc.aporte'#9'F'#9'Desautorización de descuento de aporte');
   dbghisdesapo.Selected.Add('DESOBSDESTAPO'#9'21'#9'Desc.obs.~desaut.desc.aporte'#9'F'#9'Desautorización de descuento de aporte');
   dbghisdesapo.ApplySelected;
end;

procedure TFhisautdesapo.btnautorizaClick(Sender: TObject);
begin
   btnautoriza.Enabled := False;
   btndesautoriza.Enabled := True;
   stautorizaciones.Caption := 'HISTORIAL DE AUTORIZACIONES DE DESCUENTO DE APORTES';
   muestraautorizaciones;
end;

procedure TFhisautdesapo.btndesautorizaClick(Sender: TObject);
begin
   btnautoriza.Enabled := True;
   btndesautoriza.Enabled := False;
   stautorizaciones.Caption := 'HISTORIAL DE DESAUTORIZACIONES DE DESCUENTO DE APORTES';
   muestradesautorizaciones;
end;

end.


