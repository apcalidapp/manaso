// Inicio Uso Estándares     :  01/08/2011
// Unidad                    :  ASO269.PAS
// Formulario                :  FHistConDatos
// Fecha de Creación         :  15/02/2018
// Autor                     :  Isaac Revilla
// Objetivo                  :  Grid de historico de consentimiento de datos
// Actualizaciones:
// MAS_201901_HPC            : Creación
// MAS_201909_HPC            : Se añade boton para la carga de documentos de cancelación 
unit ASO269;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, DB;

type
  TFHistConDatos = class(TForm)
    dbgMuesHistDatos: TwwDBGrid;
    BitSalir: TBitBtn;
    // Inicio: MAS_201909_HPC
    // Botón ´para la carga de documentos
    btnregdoc: TBitBtn;
    // Fin: MAS_201909_HPC
    procedure FormActivate(Sender: TObject);
    procedure BitSalirClick(Sender: TObject);
    procedure dbgMuesHistDatosDrawDataCell(Sender: TObject;
      const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure dbgMuesHistDatosDblClick(Sender: TObject);
    // Inicio: MAS_201909_HPC
    // Procedimiento que llama a forma que carga documentos de cancelación
    procedure btnregdocClick(Sender: TObject);
    // Fin: MAS_201909_HPC
  private
    procedure ActualizaGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistConDatos: TFHistConDatos;

implementation
// Inicio: MAS_201909_HPC
// Se añade unidad para la carga de documentos de cancelación
// uses ASODM, ASO270;
uses ASODM, ASO270, ASO271;
// Fin: MAS_201909_HPC

{$R *.dfm}

procedure TFHistConDatos.FormActivate(Sender: TObject);
begin
   ActualizaGrid;
end;

procedure TFHistConDatos.BitSalirClick(Sender: TObject);
begin
   Close;
end;


procedure TFHistConDatos.dbgMuesHistDatosDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
   If DM1.cdsQry2.RecNo = 1 Then
   Begin
      If DM1.cdsQry2.FieldByName('CODI_TIPO_CONSENTIMIENTO').AsString = 'T' Then
      Begin
         dbgMuesHistDatos.Canvas.Font.Color := clBlue;
         dbgMuesHistDatos.DefaultDrawDataCell(rect,Field,State);
      End
      Else
      Begin
         dbgMuesHistDatos.Canvas.Font.Color := clRed;
         dbgMuesHistDatos.DefaultDrawDataCell(rect,Field,State);
      End;
   End;
end;

procedure TFHistConDatos.ActualizaGrid;
Var xSql:String;
begin
   xSql := 'SELECT A.CORRELATIVO, A.FECHA_REGISTRO, A.MODULO_REGISTRA, A.DESC_AREA, A.CODI_TIPO_CONSENTIMIENTO, A.DESC_TIPO_CONSENTIMIENTO,'
   +' A.FECHA_CONSENTIMIENTO, A.USUARIO_REGISTRA, A.CODIGO_SUBAREA, A.DESC_SUBAREA, A.DESC_ESTADO_CONSENTIMIENTO, A.IMPRESION,'
   // Inicio: MAS_201909_HPC
   // Se añaden campos donde se guardan las imagenes de carga de documentos de cancelación
   // +' A.FECHA_IMPRESION, A.FLAG_ACTIVO, A.CODI_OFICINA_ORIGEN, A.DESC_OFICINA_ORIGEN, A.ASOID'
   +' A.FECHA_IMPRESION, A.FLAG_ACTIVO, A.CODI_OFICINA_ORIGEN, A.DESC_OFICINA_ORIGEN, A.ASOID, A.DOCPRODAT01, A.DOCPRODAT02'
   // Fin: MAS_201909_HPC
   +' FROM ASO_LPDP_CON_DET_VW A WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' ORDER BY A.FECHA_REGISTRO DESC';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSql);
   DM1.cdsQry2.Open;
   dbgMuesHistDatos.Selected.Clear;
   dbgMuesHistDatos.Selected.Add('CORRELATIVO'#9'3'#9'Item'#9#9);
   dbgMuesHistDatos.Selected.Add('FECHA_REGISTRO'#9'20'#9'Fecha y hora~de registro'#9#9);
   dbgMuesHistDatos.Selected.Add('MODULO_REGISTRA'#9'5'#9'Modulo que~registra'#9#9);
   dbgMuesHistDatos.Selected.Add('DESC_AREA'#9'40'#9'Unidad origen~de registro'#9#9);
   dbgMuesHistDatos.Selected.Add('DESC_SUBAREA'#9'25'#9'Área Origen~de registro'#9#9);
   dbgMuesHistDatos.Selected.Add('DESC_OFICINA_ORIGEN'#9'25'#9'Oficina de~Registro'#9#9);
   dbgMuesHistDatos.Selected.Add('DESC_TIPO_CONSENTIMIENTO'#9'25'#9'Tipo de~consentimiento'#9#9);
   dbgMuesHistDatos.Selected.Add('FECHA_CONSENTIMIENTO'#9'12'#9'Fecha de~consentimiento'#9#9);
   dbgMuesHistDatos.Selected.Add('USUARIO_REGISTRA'#9'25'#9'Usuario~que registra'#9#9);
   dbgMuesHistDatos.Selected.Add('DESC_ESTADO_CONSENTIMIENTO'#9'25'#9'Estado de~consentimiento'#9#9);
   dbgMuesHistDatos.Selected.Add('IMPRESION'#9'5'#9'Flag de~impresión'#9#9);
   dbgMuesHistDatos.Selected.Add('FECHA_IMPRESION'#9'12'#9'Fecha de~impresión'#9#9);
   dbgMuesHistDatos.Selected.Add('FLAG_ACTIVO'#9'5'#9'Flag de~activo'#9#9);
   dbgMuesHistDatos.ApplySelected;
end;

procedure TFHistConDatos.dbgMuesHistDatosDblClick(Sender: TObject);
begin
   If DM1.cdsQry2.RecNo = 1 Then
   Begin
      Try
         FModconsultadatos := TFModconsultadatos.create(self);
         FModconsultadatos.Showmodal;
      Finally
         FModconsultadatos.free;
      End;
   End
   Else
   Begin
      MessageDlg('Solo puede ser modificado el ultimo registro ingresado', mtInformation, [mbOk], 0);
      Exit;
   End;
   ActualizaGrid;
End;

// Inicio: MAS_201909_HPC
// Prodimiento para llamado a forma de captura de documentos de cancelación
procedure TFHistConDatos.btnregdocClick(Sender: TObject);
begin
   If DM1.cdsQry2.RecNo <> 1 Then
   Begin
      MessageDlg('Solo se permite la carga de documentos para el registro "ACTIVO".', mtInformation, [mbOk], 0);
      Exit;
   End;
   If DM1.cdsQry2.FieldByName('CODI_TIPO_CONSENTIMIENTO').AsString <> 'C' Then
   Begin
      MessageDlg('Solo puede ser visualizado por tipo de consentimiento "NO - CANCELACION".', mtInformation, [mbOk], 0);
      Exit;
   End;
   Try
      FCapturaDatos := TFCapturaDatos.create(self);
      FCapturaDatos.Showmodal;
   Finally
      FCapturaDatos.free;
   End;
end;
// Fin: MAS_201909_HPC

end.
