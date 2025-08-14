// Inicio Uso Estándares     : 01/08/2011
// Unidad                    : ASO271.PAS
// Formulario                : FCapturaDatos
// Fecha de Creación         : 30/10/2019
// Autor                     : Isaac Revilla
// Objetivo                  : Cargar, Grabar y mostar documentos de no cancelación  
// Actualizaciones:
// MAS_201908_HPC            : Creación
unit ASO271;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, DB, ExtCtrls;

type
  TFCapturaDatos = class(TForm)
    GroupBox1: TGroupBox;
    btnbuscadoc01: TBitBtn;
    GroupBox2: TGroupBox;
    btnbuscadoc02: TBitBtn;
    BitBtn3: TBitBtn;
    imaprodat01: TImage;
    imaprodat02: TImage;
    procedure btnbuscadoc01Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnbuscadoc02Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure imaprodat01DblClick(Sender: TObject);
    procedure imaprodat02DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure CargaMemStreamDoc;
    procedure GrabaFotoTablaDoc;
    procedure CargaImagenes;
  public
    { Public declarations }
  end;

var
  FCapturaDatos: TFCapturaDatos;

implementation

uses ASO272, ASODM, ASO273;

{$R *.dfm}

procedure TFCapturaDatos.btnbuscadoc01Click(Sender: TObject);
begin
   DM1.xFlaIma := '1';
   Try
      FCargaArchivo := TFCargaArchivo.create(self);
      FCargaArchivo.Showmodal;
      DM1.xNomIma := FCargaArchivo.meImagen.Text;
   Finally
      FCargaArchivo.free;
   End;
   If DM1.xFlaIma = '1' Then
   Begin
      CargaMemStreamDoc;
      GrabaFotoTablaDoc;
      CargaImagenes;
   End;
end;

procedure TFCapturaDatos.CargaMemStreamDoc;
begin
   DM1.Jpg    := Nil;
   DM1.Stream := Nil;
   DM1.jpg    := TJPEGImage.Create;
   DM1.Stream := TMemoryStream.Create;
   DM1.Stream.Position := 0;
   DM1.Jpg.LoadFromStream(DM1.Stream);
   try
      DM1.jpg.LoadFromFile(DM1.xNomIma);
   except
      null;
   end;
   DM1.Stream := TMemoryStream.Create;
   DM1.Jpg.SaveToStream(DM1.Stream);
   DM1.Stream.Position := 0;
end;


procedure TFCapturaDatos.GrabaFotoTablaDoc;
Var xSql:String;
   xLpdNumCon :Integer;
begin
    xSql:= 'SELECT MAX(LPDPNUMCON) LPDPNUMCON FROM ASO_LPDP_CON_DET WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    xLpdNumCon := DM1.cdsQry.FieldByName('LPDPNUMCON').AsInteger;
    xSql := 'SELECT lpdpnumcon, asoid, lpdptipcon, lpdpmodulo, lpdpofiori, lpdpestcon, lpdpfecreg, lpdpusureg, asodni, fecimpfor, lpdfeccon, lpdareori,'
    +' lpdunireg, lpdimp, lpdact, lpdpcodmotmod, lpdpfecregmotmod, lpdpusumodmotmod, docprodat01, docprodat02'
    +' FROM ASO_LPDP_CON_DET WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND LPDPNUMCON = '+IntToStr(xLpdNumCon);
     DM1.cdsParam.Close;
     DM1.cdsParam.DataRequest(xSql);
     DM1.cdsParam.Open;
     DM1.cdsParam.Edit;
     If DM1.xFlaIma = '1' Then TBlobField(DM1.cdsParam.FieldByName('DOCPRODAT01')).LoadFromStream(DM1.Stream);
     If DM1.xFlaIma = '2' Then TBlobField(DM1.cdsParam.FieldByName('DOCPRODAT02')).LoadFromStream(DM1.Stream);
     DM1.cdsParam.ApplyUpdates(-1);
end;


procedure TFCapturaDatos.BitBtn3Click(Sender: TObject);
begin
   Close;
end;

procedure TFCapturaDatos.btnbuscadoc02Click(Sender: TObject);
begin
   DM1.xFlaIma := '2';
   Try
      FCargaArchivo := TFCargaArchivo.create(self);
      FCargaArchivo.Showmodal;
      DM1.xNomIma := FCargaArchivo.meImagen.Text;
   Finally
      FCargaArchivo.free;
   End;
   If DM1.xFlaIma = '2' Then
   Begin
      CargaMemStreamDoc;
      GrabaFotoTablaDoc;
      CargaImagenes;      
   End;
end;

procedure TFCapturaDatos.CargaImagenes;
Var xSql:String;
begin
   // xSql := 'SELECT DOCPRODAT01, DOCPRODAT02  FROM ASO_LPDP_CON_DET WHERE ASOID = '+QuotedStr(DM1.cdsQry2.FieldByName('ASOID').AsString)+' AND LPDPNUMCON = '+DM1.cdsQry2.FieldByName('CORRELATIVO').AsString;
   xSql := 'SELECT DOCPRODAT01, DOCPRODAT02  FROM ASO_LPDP_CON_DET_VW WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
   +' AND  CORRELATIVO = (SELECT MAX(CORRELATIVO)  FROM ASO_LPDP_CON_DET_VW WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   DM1.JpgProDat01 := NIL;
   DM1.StrProDat01 := NIL;
   DM1.JpgProDat02 := NIL;
   DM1.StrProDat02 := NIL;
   DM1.StrProDat01 := TMemoryStream.Create;
   TBlobField(DM1.cdsQry.FieldByName('DOCPRODAT01')).SaveToStream(DM1.StrProDat01);
   DM1.StrProDat02 := TMemoryStream.Create;
   TBlobField(DM1.cdsQry.FieldByName('DOCPRODAT02')).SaveToStream(DM1.StrProDat02);
   If DM1.StrProDat01.Size > 0 Then
   Begin
      DM1.JpgProDat01 := TJpegImage.Create;
      DM1.StrProDat01.Position := 0;
      DM1.JpgProDat01.LoadFromStream(DM1.StrProDat01);
   End;
   If DM1.StrProDat02.Size > 0 Then
   Begin
      DM1.JpgProDat02 := TJpegImage.Create;
      DM1.StrProDat02.Position := 0;
      DM1.JpgProDat02.LoadFromStream(DM1.StrProDat02);
   End;
   imaprodat01.Picture.Assign(DM1.JpgProDat01);
   imaprodat02.Picture.Assign(DM1.JpgProDat02);
end;

procedure TFCapturaDatos.FormActivate(Sender: TObject);
begin
   CargaImagenes;
end;

procedure TFCapturaDatos.imaprodat01DblClick(Sender: TObject);
begin
  If DM1.JpgProDat01 = nil Then
  Begin
     MessageDlg('No hay nada que mostrar', mtInformation, [mbOk], 0);
     Exit;
  End;
  Try
     FMueImaGa := TFMueImaGa.create(self);
     FMueImaGa.gbGrpTit.Caption := ' Imagen 1 ';
     FMueImaGa.imagrande.Picture := imaprodat01.Picture;
     FMueImaGa.Showmodal;
  Finally
     FMueImaGa.free;
  End;
end;

procedure TFCapturaDatos.imaprodat02DblClick(Sender: TObject);
begin
  If DM1.JpgProDat02 = nil Then
  Begin
     MessageDlg('No hay nada que mostrar', mtInformation, [mbOk], 0);
     Exit;
  End;
  Try
     FMueImaGa := TFMueImaGa.create(self);
     FMueImaGa.gbGrpTit.Caption := ' Imagen 2 ';
     FMueImaGa.imagrande.Picture := imaprodat02.Picture;
     FMueImaGa.Showmodal;
  Finally
     FMueImaGa.free;
  End;
end;

end.
