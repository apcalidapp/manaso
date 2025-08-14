// Inicio Uso Estándares:	01/08/2011
// Unidad		            : ASO260L.pas
// Formulario		        : FAutDec
// Fecha de Creación    : 22/10/2019
// Autor			          : Isaac Revilla
// Objetivo		          : Mostrar información recepcionada por GEMAP
// Actualizaciones:
// MAS_201907_HPC       : Creación

unit ASO260L;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, Db, StdCtrls, Buttons, fcButton, fcImgBtn,
  fcShapeBtn;


  {
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, IniFiles, MConnect, Wwdatsrc, wwclient,RecError, variants,
  DBTables, Wwquery, FileCtrl, ObjBrkr, StrContainer, Math, wwdbedit, DBGrids,
  Excel2000, OleServer,DateUtils, jpeg,rxgif,  ExcelXP,
  Wwdbgrid, wwexport, shellapi, SConnect, winsock, ImageDLLLoader,
  ppParameter, ppModule, daDataModule, ppBands, ppCtrls, ppStrtch, ppMemo,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppRichTx,
  ppSubRpt;

  }


type
  TFAutDec = class(TForm)
    btnCerrar: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnlasoapenom: TPanel;
    pnlfecreg: TPanel;
    pnlusuGEMAP: TPanel;
    Label4: TLabel;
    pnloficap: TPanel;
    ScrollBox1: TScrollBox;
    ImagAutDec: TImage;
    BtnZoommas: TfcShapeBtn;
    fcShapeBtn1: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    stTitDecAut: TStaticText;
    PnlFirmaVerifica: TPanel;
    ImaFirmaVerifica: TImage;
    fcShapeBtn3: TfcShapeBtn;
    Shape1: TShape;
    BitBtn1: TBitBtn;
    procedure btnCerrarClick(Sender: TObject);
    procedure BtnZoommasClick(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure fcShapeBtn2Click(Sender: TObject);
    procedure fcShapeBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    jpgDeclaracion, jpgAutorizacion: TJpegImage;
    StreamDeclaracion, StreamAutorizacion: TMemoryStream;
    Procedure CargaImaDecAut;


    { Public declarations }
  end;

var
  FAutDec: TFAutDec;

implementation

uses ASODM, ASO260;

{$R *.dfm}

{ TFAutDec }

procedure TFAutDec.CargaImaDecAut;
begin
   jpgDeclaracion     := NIL;
   jpgAutorizacion    := NIL;
   StreamDeclaracion  := NIL;
   StreamAutorizacion := NIL;
   Try
      StreamDeclaracion  := TMemoryStream.Create;
      TBlobField(DM1.cdsQry.FieldByName('DOCDECLAASOIMG')).SaveToStream(StreamDeclaracion);
      StreamAutorizacion := TMemoryStream.Create;
      TBlobField(DM1.cdsQry.FieldByName('DOCAUTDESCIMG')).SaveToStream(StreamAutorizacion);

      If StreamDeclaracion.Size > 0 THEN
      Begin
         jpgDeclaracion := TJpegImage.Create;
         StreamDeclaracion.Position := 0;
         jpgDeclaracion.LoadFromStream(StreamDeclaracion);
      End
      Else
         jpgDeclaracion := NIL;

      If StreamAutorizacion.Size > 0 THEN
      Begin
         jpgAutorizacion := TJpegImage.Create;
         StreamAutorizacion.Position := 0;
         jpgAutorizacion.LoadFromStream(StreamAutorizacion);
      End
      Else
         jpgAutorizacion := NIL;
   Except
      jpgDeclaracion := NIL;
      jpgAutorizacion := NIL;
   End;
   If DM1.xDecAut = 'DEC' Then
      ImagAutDec.Picture.Assign(jpgDeclaracion);
   If DM1.xDecAut = 'AUT' Then
      ImagAutDec.Picture.Assign(jpgAutorizacion);
end;

procedure TFAutDec.btnCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFAutDec.BtnZoommasClick(Sender: TObject);
begin
ImagAutDec.Width := ImagAutDec.Width+20;
ImagAutDec.Height := ImagAutDec.Height + 20;
end;

procedure TFAutDec.fcShapeBtn1Click(Sender: TObject);
begin
ImagAutDec.Width := ImagAutDec.Width-20;
ImagAutDec.Height := ImagAutDec.Height - 20;
end;

procedure TFAutDec.fcShapeBtn2Click(Sender: TObject);
begin
ImagAutDec.AutoSize := true;
ImagAutDec.AutoSize := false;
ImagAutDec.Height := 429;
ImagAutDec.Width := 333;
end;

procedure TFAutDec.fcShapeBtn3Click(Sender: TObject);
begin
 ImaFirmaVerifica.Picture := FMantAsociado.ImaFirma.Picture;
 PnlFirmaVerifica.Top     := 113 ;
 PnlFirmaVerifica.Left    := 58  ;
 PnlFirmaVerifica.Visible := True;

end;

procedure TFAutDec.BitBtn1Click(Sender: TObject);
begin
 PnlFirmaVerifica.Visible:= False;
end;

procedure TFAutDec.FormActivate(Sender: TObject);
var xsql:string;
begin
   If DM1.xDecAut = 'DEC' Then
   Begin
      FAutDec.Caption := 'Declaración de descuento de aportes';
      stTitDecAut.Caption := 'Declaración de descuento de aportes';
   End;
   If DM1.xDecAut = 'AUT' Then
   Begin
      FAutDec.Caption := 'Autorización de descuento de aportes';
      stTitDecAut.Caption := 'Autorización de descuento de aportes';
   End;
   xSql := 'SELECT A.DOCUSUAUTORIZA, D.USERNOM, A.DOCFECREGAF, A.DOCOFIAUTORIZA, C.OFDESNOM, A.DOCDECLAASOIMG, A.DOCAUTDESCIMG, B.ASOAPENOMDNI'
   +' FROM GEMAP.T_AFILIACIONES A, APO201 B, APO110 C, GEMAP.T_USUARIO_NIVELES D'
   +' WHERE TDOCAFID IN (SELECT  MAX(TDOCAFID) TDOCAID FROM GEMAP.T_AFILIACIONES WHERE DOCASOID  = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
   +' AND DOCFECDESAUTORIZA IS NULL) AND A.DOCASOID = B.ASOID(+) AND A.DOCOFIAUTORIZA = C.OFDESID(+) AND A.DOCUSUAUTORIZA = D.USERID(+)';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   pnlasoapenom.Caption := DM1.cdsQry.FieldByName('ASOAPENOMDNI').AsString;
   pnlfecreg.Caption := DM1.cdsQry.FieldByName('DOCFECREGAF').AsString;
   pnlusuGEMAP.Caption := DM1.cdsQry.FieldByName('DOCUSUAUTORIZA').AsString;
   pnloficap.Caption := DM1.cdsQry.FieldByName('OFDESNOM').AsString;
   CargaImaDecAut;

end;

end.
