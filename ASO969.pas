// Inicio Uso Estándares: 01/08/2011
// Unidad		        : ASO969.pas
// Formulario           : FConfirmaDesautDcto
// Fecha de Creación    : 15/05/2018
// Autor	            : Daniel Fernández
// Objetivo             : Ingresar un motivo para la desautorización de CADAP

// Actualizaciones:
// HPC_201801_MAS
//Inicio HPC_201801_MAS
// MAS_202309_HPC: Se añade una caja para registrar la descripción de motivo de desautorización
// para los casos de motivo de desautorización sea '99'.
unit ASO969;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, Wwdbdlg, Buttons, Mask;

type
  TFConfirmaDesautDcto = class(TForm)
    Label4: TLabel;
    dblcdmotdesapo: TwwDBLookupComboDlg;
    edtdesaut: TEdit;
    btnSalir: TBitBtn;
    btnGrabar: TBitBtn;
    medescdesa_otros: TMaskEdit;
    procedure dblcdmotdesapoChange(Sender: TObject);
    procedure dblcdmotdesapoExit(Sender: TObject);
    procedure btnGrabarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    CODMOTDEST: string;
    DESOTRMOTDESC: String;
  end;

var
  FConfirmaDesautDcto: TFConfirmaDesautDcto;

implementation

uses ASODM;

{$R *.dfm}

procedure TFConfirmaDesautDcto.dblcdmotdesapoChange(Sender: TObject);
begin
  If DM1.cdsReclamoMotiv.Locate('CODMOTDEST',dblcdmotdesapo.Text,[]) then
    edtdesaut.Text := DM1.cdsReclamoMotiv.FieldByName('DESMOTDES').asstring
  Else
    edtdesaut.Text := '';
end;

procedure TFConfirmaDesautDcto.dblcdmotdesapoExit(Sender: TObject);
begin
   If Trim(dblcdmotdesapo.Text) = '' Then Exit;
   If dblcdmotdesapo.Text = '99' Then
   Begin
      medescdesa_otros.Visible := True;
      medescdesa_otros.SetFocus;
   End
   Else
      medescdesa_otros.Visible := False;
end;

procedure TFConfirmaDesautDcto.btnGrabarClick(Sender: TObject);
begin
  If Trim(edtdesaut.Text) = '' Then
  begin
    MessageDlg('Seleccione un motivo', mtConfirmation, [mbOk], 0);
    dblcdmotdesapo.SetFocus;
    Exit;
  end;
  If (dblcdmotdesapo.Text = '99') And  (Trim(medescdesa_otros.Text) = '') Then
  Begin
     MessageDlg('Registre el motivo de desautorización.', mtConfirmation, [mbOk], 0);
     medescdesa_otros.SetFocus;
     Exit;
  End;
  CODMOTDEST := dblcdmotdesapo.Text;
  DESOTRMOTDESC := medescdesa_otros.Text;
  Close;
end;

procedure TFConfirmaDesautDcto.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFConfirmaDesautDcto.FormCreate(Sender: TObject);
begin
   CODMOTDEST := '';
   DESOTRMOTDESC := '';
end;

procedure TFConfirmaDesautDcto.FormActivate(Sender: TObject);
begin
  dblcdmotdesapo.Selected.Clear;
  dblcdmotdesapo.Selected.Add('CODMOTDEST'#9'5'#9'Código'#9#9);
  dblcdmotdesapo.Selected.Add('DESMOTDES'#9'30'#9'Descripción'#9#9);
  medescdesa_otros.Visible := False;
end;

procedure TFConfirmaDesautDcto.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key = #13 Then
   Begin
      Key := #0;
      Perform(CM_DIALOGKEY, VK_TAB, 0);
   End;
end;

end.
//Fin HPC_201801_MAS
