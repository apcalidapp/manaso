unit ASO260P;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ExtDlgs, Mask, db,
  wwdbdatetimepicker;

type
  TFcarneextranjeria = class(TForm)
    Cerrar: TBitBtn;
    btncarextanv: TBitBtn;
    opdcarneanverso: TOpenPictureDialog;
    opdcarnereverso: TOpenPictureDialog;
    Label1: TLabel;
    btncarextrev: TBitBtn;
    Label2: TLabel;
    Panel1: TPanel;
    imgcarneAnverso: TImage;
    Panel2: TPanel;
    ImgCarneReverso: TImage;
    btnguardar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Panel3: TPanel;
    imgfoto: TImage;
    Panel4: TPanel;
    imgfirma: TImage;
    btnfoto: TBitBtn;
    btnfirma: TBitBtn;
    opdfoto: TOpenPictureDialog;
    opdfirma: TOpenPictureDialog;
    btnnuereg: TBitBtn;
    btncancela: TBitBtn;
    GroupBox1: TGroupBox;
    dbdtFecExpCarExt: TwwDBDateTimePicker;
    procedure CerrarClick(Sender: TObject);
    procedure BtnAnverso(Sender: TObject);
    procedure btncarextrevClick(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure btnfotoClick(Sender: TObject);
    procedure btnfirmaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnnueregClick(Sender: TObject);
    procedure btncancelaClick(Sender: TObject);
    procedure dbdtFecExpCarExtExit(Sender: TObject);
  private
    procedure CargaImagenes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcarneextranjeria: TFcarneextranjeria;

implementation

uses ASODM, ASO260;

{$R *.dfm}

procedure TFcarneextranjeria.CerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFcarneextranjeria.BtnAnverso(Sender: TObject);
var
  Jpg : TJPEGImage;
begin
   If opdCarneAnverso.Execute then
   Begin
      Jpg := TJPEGImage.Create;
      Try
         Jpg.LoadFromFile(opdCarneAnverso.FileName);
         imgcarneAnverso.Picture.LoadFromFile(opdCarneAnverso.FileName);
         // If Jpg.Width < 1280 Then
         // Begin
         //    MessageDlg('Imagen debe tener un minimo de 1280 pixels de ancho.', mtError, [mbAbort], 0);
         //    imgcarneAnverso.Picture := nil;
         //    Exit;
         // End;
      Finally
         Jpg.Free;
      End;
   End;
end;


procedure TFcarneextranjeria.btncarextrevClick(Sender: TObject);
var
  Jpg : TJPEGImage;
begin
   If opdCarneReverso.Execute then
   Begin
      Jpg := TJPEGImage.Create;
      Try
         Jpg.LoadFromFile(opdCarneReverso.FileName);
         ImgCarneReverso.Picture.LoadFromFile(opdCarneReverso.FileName);
         // If Jpg.Width < 1280 Then
         // Begin
         //    MessageDlg('Imagen debe tener un minimo de 1280 pixels de ancho.', mtError, [mbAbort], 0);
         //    ImgCarneReverso.Picture := nil;
         //    Exit;
         // End;
      Finally
         Jpg.Free;
      End;
   End;
end;

procedure TFcarneextranjeria.btnguardarClick(Sender: TObject);
Var xSql, xItem:String;
    JpgFoto    : TJPEGImage;
    JpgFirma   : TJPEGImage;
    JpgAnverso : TJPEGImage;
    JpgReverso : TJPEGImage;
begin

   If Trim(dbdtFecExpCarExt.Text) = '' Then
   Begin
      MessageDlg('Debe ingresar la fecha de caducidad del Carnet de Extranjería.', mtError,[mbOk], 0);
      Exit;
   End;

   If Trim(opdfoto.FileName) = '' Then
   Begin
      MessageDlg('Debe cargar la foto del asociado.', mtError,[mbOk], 0);
      Exit;
   End;
   If Trim(opdfirma.FileName) = '' Then
   Begin
      MessageDlg('Debe cargar la firma del asociado.', mtError,[mbOk], 0);
      Exit;
   End;
   If Trim(opdcarneanverso.FileName) = '' Then
   Begin
      MessageDlg('Debe cargar el carnet de extranjería del asociado (anverso).', mtError,[mbOk], 0);
      Exit;
   End;
   If Trim(opdcarnereverso.FileName) = '' Then
   Begin
      MessageDlg('Debe cargar el carnet de extranjería del asociado (reverso).', mtError,[mbOk], 0);
      Exit;
   End;

   JpgFoto    := TJPEGImage.Create;
   JpgFirma   := TJPEGImage.Create;
   JpgAnverso := TJPEGImage.Create;
   JpgReverso := TJPEGImage.Create;

   JpgFoto.LoadFromFile(opdfoto.FileName);
   JpgFirma.LoadFromFile(opdfirma.FileName);
   JpgAnverso.LoadFromFile(opdcarneanverso.FileName);
   JpgReverso.LoadFromFile(opdcarnereverso.FileName);

   If MessageDlg('¿Seguro que desea guardar las imagenes cargadas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      Try
         xSql := 'SELECT LPAD(NVL(MAX(ITEM),0)+1, 2,''0'') ITEM FROM ASO_CARNE_EXTRANJERIA WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         xItem := DM1.cdsQry.FieldByName('ITEM').AsString;
         xSql := 'SELECT ASOID, ESTADO, ITEM, IMAGEN_ANVERSO, IMAGEN_REVERSO, FOTO, FIRMA FROM ASO_CARNE_EXTRANJERIA';
         DM1.cdsAsociados.Close;
         DM1.cdsAsociados.DataRequest(xSql);
         DM1.cdsAsociados.Open;
         DM1.cdsAsociados.Insert;
         DM1.cdsAsociados.FieldByName('ASOID').AsString := DM1.cdsAso.FieldByName('ASOID').AsString;
         DM1.cdsAsociados.FieldByName('ESTADO').AsString := 'S';
         DM1.cdsAsociados.FieldByName('ITEM').AsString := xItem;
         DM1.cdsAsociados.FieldByName('IMAGEN_ANVERSO').Assign(JpgAnverso);
         DM1.cdsAsociados.FieldByName('IMAGEN_REVERSO').Assign(JpgReverso);
         DM1.cdsAsociados.FieldByName('FOTO').Assign(JpgFoto);
         DM1.cdsAsociados.FieldByName('FIRMA').Assign(JpgFirma);
         DM1.cdsAsociados.ApplyUpdates(0);
         xSql := 'UPDATE ASO_CARNE_EXTRANJERIA SET ASOAPENOM = '+QuotedStr(DM1.cdsAso.FieldByName('ASOAPENOM').AsString)
         +', TIPDOCCOD = '+QuotedStr(DM1.cdsAso.FieldByName('TIPDOCCOD').AsString)
         +', ASODOCNUM = '+QuotedStr(DM1.cdsAso.FieldByName('ASODOCNUM').AsString)
         +', FECCADCAREXT = '+QuotedStr(dbdtFecExpCarExt.Text)
         +', USUREG = '+QuotedStr(DM1.wUsuario)
         +',  FECREG = SYSDATE WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
         +' AND ITEM = '+QuotedStr(xItem);
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
         xSql := 'UPDATE DB2ADMIN.APO201 SET FECCADCAREXT = '+QuotedStr(dbdtFecExpCarExt.Text)+' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
         xSql := 'UPDATE DB2ADMIN.ASO_NUE_CLI SET FECCADCAREXT = '+QuotedStr(dbdtFecExpCarExt.Text)+' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
         DM1.cdsAso.Edit;
         DM1.cdsAso.FieldByName('FECCADCAREXT').AsDateTime := dbdtFecExpCarExt.Date;
         DM1.cdsAso.Post;
         xSql := 'UPDATE DB2ADMIN.ASO_CARNE_EXTRANJERIA SET ESTADO = ''N'' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND ITEM <> '+QuotedStr(xItem);
         DM1.DCOM1.AppServer.EjecutaSql(xSql);
         FMantAsociado.ImagAso.Picture  := imgfoto.Picture;
         FMantAsociado.ImaFirma.Picture := imgfirma.Picture;
         FMantAsociado.lblsinFoto.Visible := False;
         FMantAsociado.lblsinFirma.Visible := False;
         FMantAsociado.bitImpReniec.Enabled := True;
         MessageDlg('Se ha insertado en carne de extranjería del asociado.', mtConfirmation, [mbOk], 0);
      Finally
         JpgAnverso.Free;
         JpgReverso.Free;
         JpgFoto.Free;
         JpgFirma.Free;
      End;

      btnnuereg.Enabled := True;
      btncancela.Enabled := False;
      btnguardar.Enabled := False;
      btnfoto.Enabled := True;
      btnfirma.Enabled := True;
      btncarextanv.Enabled := True;
      btncarextrev.Enabled := True;

   End;
End;

procedure TFcarneextranjeria.btnfotoClick(Sender: TObject);
Var
  Jpg : TJPEGImage;
begin
   If opdFoto.Execute then
   Begin
      Jpg := TJPEGImage.Create;
      Try
         Jpg.LoadFromFile(opdFoto.FileName);
         imgfoto.Picture.LoadFromFile(opdFoto.FileName);
         // If Jpg.Width < 640 Then
         // Begin
         //    MessageDlg('Imagen debe tener un minimo de 640 pixels de ancho.', mtError, [mbAbort], 0);
         //   imgfoto.Picture := nil;
         //   Exit;
         // End;
      Finally
         Jpg.Free;
      End;
   End;
end;

procedure TFcarneextranjeria.btnfirmaClick(Sender: TObject);
Var
  Jpg : TJPEGImage;
begin
   If opdFirma.Execute then
   Begin
      Jpg := TJPEGImage.Create;
      Try
         Jpg.LoadFromFile(opdFirma.FileName);
         imgfirma.Picture.LoadFromFile(opdFirma.FileName);
         // If Jpg.Width < 840 Then
         // Begin
         //   MessageDlg('Imagen debe tener un minimo de 840 pixels de ancho.', mtError, [mbAbort], 0);
         //   imgfirma.Picture := nil;
         //   Exit;
         // End;
      Finally
         Jpg.Free;
      End;
   End;
end;

procedure TFcarneextranjeria.FormActivate(Sender: TObject);
begin
   btnnuereg.Enabled := True;
   btncancela.Enabled := False;
   btnguardar.Enabled := False;
   CargaImagenes;
end;

procedure TFcarneextranjeria.btnnueregClick(Sender: TObject);
begin
   btnnuereg.Enabled := False;
      btncancela.Enabled := True;
      btnguardar.Enabled := True;
      btnfoto.Enabled := True;
      btnfirma.Enabled := True;
      btncarextanv.Enabled := True;
      btncarextrev.Enabled := True;
      imgfoto.Picture := nil;
      imgfirma.Picture := nil;
      imgcarneAnverso.Picture := nil;
      ImgCarneReverso.Picture := nil;
end;

procedure TFcarneextranjeria.btncancelaClick(Sender: TObject);
begin
   btnnuereg.Enabled := True;
   btncancela.Enabled := False;
   btnguardar.Enabled := False;
   btnfoto.Enabled := False;
   btnfirma.Enabled := False;
   btncarextanv.Enabled := False;
   btncarextrev.Enabled := False;
   CargaImagenes;
end;

procedure TFcarneextranjeria.CargaImagenes;
Var xSql:String;
    JpgFoto, JpgFirma, JpgCarExtAnv, JpgCarExtRev : TJpegImage;
    StrFoto, StrFirma, StrCarExtAnv, StrCarExtRev : TMemoryStream;
begin
   xSql := 'SELECT FOTO, FIRMA, IMAGEN_ANVERSO, IMAGEN_REVERSO FROM ASO_CARNE_EXTRANJERIA WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
   +' AND ESTADO = ''S''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;

   JpgFoto      := Nil;
   StrFoto      := Nil;
   JpgFirma     := Nil;
   StrFirma     := Nil;
   JpgCarExtAnv := Nil;
   StrCarExtAnv := Nil;
   JpgCarExtRev := Nil;
   StrCarExtRev := Nil;

   Try
      StrFoto := TMemoryStream.Create;
      TBlobField(DM1.cdsQry.FieldByName('FOTO')).SaveToStream(StrFoto);

      StrFirma := TMemoryStream.Create;
      TBlobField(DM1.cdsQry.FieldByName('FIRMA')).SaveToStream(StrFirma);

      StrCarExtAnv := TMemoryStream.Create;
      TBlobField(DM1.cdsQry.FieldByName('IMAGEN_ANVERSO')).SaveToStream(StrCarExtAnv);

      StrCarExtRev := TMemoryStream.Create;
      TBlobField(DM1.cdsQry.FieldByName('IMAGEN_REVERSO')).SaveToStream(StrCarExtRev);

      If StrFoto.Size > 0 Then
      Begin
         JpgFoto := TJpegImage.Create;
         StrFoto.Position := 0;
         JpgFoto.LoadFromStream(StrFoto);
         imgfoto.Picture.Assign(JpgFoto);
      End
      Else JpgFoto := Nil;

      If StrFirma.Size > 0 Then
      Begin
         JpgFirma := TJpegImage.Create;
         StrFirma.Position := 0;
         JpgFirma.LoadFromStream(StrFirma);
         imgfirma.Picture.Assign(JpgFirma);
      End
      Else JpgFirma := Nil;

      If StrCarExtAnv.Size > 0 Then
      Begin
         JpgCarExtAnv := TJpegImage.Create;
         StrCarExtAnv.Position := 0;
         JpgCarExtAnv.LoadFromStream(StrCarExtAnv);
         imgcarneAnverso.Picture.Assign(JpgCarExtAnv);
      End
      Else JpgCarExtAnv := Nil;

      If StrCarExtRev.Size > 0 Then
      Begin
         JpgCarExtRev := TJpegImage.Create;
         StrCarExtRev.Position := 0;
         JpgCarExtRev.LoadFromStream(StrCarExtRev);
         ImgCarneReverso.Picture.Assign(JpgCarExtRev);
      End
      Else JpgCarExtAnv := Nil;
   Except
      JpgFoto := Nil;
      JpgFirma := Nil;
      JpgCarExtAnv := Nil;
      JpgCarExtRev := Nil;
   End;



end;

procedure TFcarneextranjeria.dbdtFecExpCarExtExit(Sender: TObject);
begin
   If dbdtFecExpCarExt.Date < DM1.FechaSys Then
   Begin
     MessageDlg('CE se encuentra vencido. Verificar.', mtError, [mbOk], 0);
     dbdtFecExpCarExt.Text := '';
     dbdtFecExpCarExt.SetFocus;
     Exit;
   End;
end;

End.
