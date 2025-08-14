// Inicio Uso Estándares     : 01/08/2011
// Unidad                    : ASO272.PAS
// Formulario                : FCargaArchivo
// Fecha de Creación         : 30/10/2019
// Autor                     : Isaac Revilla
// Objetivo                  : Carga de archivos de los documentos de no cancelación
// Actualizaciones:
// MAS_201908_HPC            : Creación

unit ASO272;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ComCtrls, ShellCtrls, Buttons, Mask,
  ExtCtrls, jpeg;

type
  TFCargaArchivo = class(TForm)
    gbArchivo: TGroupBox;
    GroupBox2: TGroupBox;
    meImagen: TMaskEdit;
    btnCargar: TBitBtn;
    btnCerrar: TBitBtn;
    dcbnombre: TDriveComboBox;
    dlbnombre: TDirectoryListBox;
    flbnombre: TFileListBox;
    GroupBox1: TGroupBox;
    imaprevio: TImage;
    procedure btnCerrarClick(Sender: TObject);
    procedure flbnombreClick(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCargaArchivo: TFCargaArchivo;

implementation

uses ASODM;

{$R *.dfm}



procedure TFCargaArchivo.btnCerrarClick(Sender: TObject);
begin
   DM1.xFlaIma := '';
   Close;
end;



procedure TFCargaArchivo.flbnombreClick(Sender: TObject);
begin
   meImagen.Text := flbnombre.FileName;
   imaprevio.Picture.LoadFromFile(meImagen.Text);
end;

procedure TFCargaArchivo.btnCargarClick(Sender: TObject);
begin
   If Trim(meImagen.Text) = '' Then
   Begin
      MessageDlg('Debe seleccionar la imagen a cargar', mtInformation, [mbOk], 0);
      Exit;
   End;
   Close;
end;

end.
