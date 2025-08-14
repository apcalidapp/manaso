// Inicio Uso Estándares : 01/08/2011
// Unidad                : ASO260C.pas
// Formulario            : FMantAsociadoObsSinRes
// Fecha de Creación     : 15/05/2018
// Autor                 : Equipo de Desarrollo de Sistemas DM
// Objetivo              : Mostrar al ingreso del mantenimiento de asociados
//                         observaciones que se registraron a ese asociado.
// Actualizaciones:
// HPC_201801_MAS
// MAS_202103_HPC        : Se adiciona columna en GRID
// MAS_202309_HPC        : Se mejora la presentación del mensaje de alerta


//Inicio HPC_201801_MAS
unit ASO260C;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, db;

type
  TFMantAsociadoObsSinRes = class(TForm)
    pnlObsSinResolver: TPanel;
    wwDBGrid1: TwwDBGrid;
    pnlObsConsulta2: TPanel;
    memObsConsulta2: TMemo;
    Button12: TButton;
    // Inicio: MAS_202309_HPC
    // Nuevas etiquetas para el mensaje de alerta
    Label1: TLabel;
    Label2: TLabel;
    // Fin: MAS_202309_HPC
    procedure wwDBGrid1DblClick(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure EnlazarDatos(pDSOBSSINRESOLVER: TDataSource);
  end;

var
  FMantAsociadoObsSinRes: TFMantAsociadoObsSinRes;

implementation

uses ASODM;

{$R *.dfm}

procedure TFMantAsociadoObsSinRes.EnlazarDatos(pDSOBSSINRESOLVER: TDataSource);
begin
  wwDBGrid1.DataSource := pDSOBSSINRESOLVER;
  wwDBGrid1.Selected.clear;
  wwDBGrid1.Selected.Add('FECHA'#9'20'#9'Fecha');
  wwDBGrid1.Selected.Add('USUARIO'#9'15'#9'Usuario'#9'F');
  wwDBGrid1.Selected.Add('PROCEDENCIA'#9'15'#9'Procedencia');
  wwDBGrid1.Selected.Add('OFICINA'#9'15'#9'Oficina');
  wwDBGrid1.Selected.Add('OBSERVACION'#9'20'#9'Observación'#9'F');
  wwDBGrid1.Selected.Add('CARACTER'#9'15'#9'Carácter'#9'F');
  wwDBGrid1.Selected.Add('COMENTARIO'#9'100'#9'Comentario'#9'F');
  wwDBGrid1.ApplySelected;
  // Fin: MAS_202309_HPC
end;




// Incio: MAS_202309_HPC
// Se mejora presentación en mensaje de alerta
procedure TFMantAsociadoObsSinRes.wwDBGrid1DblClick(Sender: TObject);
begin
  pnlObsConsulta2.Left := 4;
  pnlObsConsulta2.Top := 130;
  memObsConsulta2.Text := wwDBGrid1.DataSource.DataSet.FieldByName('COMENTARIO').AsString;
  pnlObsConsulta2.Visible := True;
end;
// Fin: MAS_202309_HPC

procedure TFMantAsociadoObsSinRes.Button12Click(Sender: TObject);
begin
  pnlObsConsulta2.Visible := False;
end;

procedure TFMantAsociadoObsSinRes.FormActivate(Sender: TObject);
begin
  pnlObsConsulta2.Left := 4;
  pnlObsConsulta2.Top := 130;
  memObsConsulta2.Text := wwDBGrid1.DataSource.DataSet.FieldByName('COMENTARIO').AsString;
  pnlObsConsulta2.Visible := True;
end;

end.
//Fin HPC_201801_MAS
