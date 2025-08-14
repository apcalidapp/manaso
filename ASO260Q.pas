unit ASO260Q;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, DB ;

type
  TFmuescarneextranjeria = class(TForm)
    btnCerrar: TBitBtn;
    Label3: TLabel;
    Panel3: TPanel;
    imgfoto: TImage;
    Label4: TLabel;
    Panel4: TPanel;
    imgfirma: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    imgcarneAnverso: TImage;
    Label2: TLabel;
    Panel2: TPanel;
    ImgCarneReverso: TImage;
    procedure btnCerrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmuescarneextranjeria: TFmuescarneextranjeria;

implementation

uses ASODM;

{$R *.dfm}

procedure TFmuescarneextranjeria.btnCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TFmuescarneextranjeria.FormActivate(Sender: TObject);
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


{
procedure TFMantAsociado.CargaImagenesFromDataBase;
begin




end;

}



end.
