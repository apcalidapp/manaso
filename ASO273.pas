// Inicio Uso Estándares     : 01/08/2011
// Unidad                    : ASO273.PAS
// Formulario                : FMueImaGa
// Fecha de Creación         : 31/10/2019
// Autor                     : Isaac Revilla
// Objetivo                  : Visualiza los documentos de no cancelación
// Actualizaciones:
// MAS_201908_HPC            : Creación

unit ASO273;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFMueImaGa = class(TForm)
    gbGrpTit: TGroupBox;
    imagrande: TImage;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMueImaGa: TFMueImaGa;

implementation

{$R *.dfm}

procedure TFMueImaGa.BitBtn3Click(Sender: TObject);
begin
   Close;
end;

end.
