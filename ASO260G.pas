// Inicio Uso Estándares   :  01/08/2011
// Unidad                  :  ASO260G.pas
// Formulario              :  FMantAsociadoConfirmaReniec
// Fecha de Creación       :  15/05/2018
// Autor                   :  Equipo de Desarrollo de Sistemas DM
// Objetivo                :  Datos Reniec
// Actualizaciones         :
// HPC_201801_MAS

//Inicio HPC_201801_MAS
unit ASO260G;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fcButton, fcImgBtn, fcShapeBtn, Grids, ValEdit, StdCtrls,
  Animate, GIFCtrl, ExtCtrls, Types, SIPCLIENT, jpeg, DBGrids;

type
  TFMantAsociadoConfirmaReniec = class(TForm)
    pnlConfirma: TPanel;
    ImgFotoConfirme: TImage;
    ImgFirmaConfirme: TImage;
    btnconfirma: TfcShapeBtn;
    StringGrid1: TStringGrid;
    GroupBox1: TGroupBox;
    lblFecAct: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblUsuAct: TLabel;
    lblMensaje: TLabel;
    lblMsj: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnconfirmaClick(Sender: TObject);
    procedure vlisConfirmeStringsChange(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    SearchResult         : PersonDataRecordType;
    Photo, Signature     : TByteDynArray;
    sDocument:String;
    sLastName1: string;
    sLastName2: string;
    sFirstName: string;
    sMerriedName:String;
    sMotherName:String;
    sFatherName:String;
    sCivilStateCode: string;
    sCivilState: string;
    sGender: string;
    sAltDocumentType:String;
    sAltDocumentTypeDes:String;
    sAltDocument:String;
    sVoteStatus:String;
    sRegisterDate:String;
    sExpeditionDate:String;
    sExpirationDate:String;
    sInstGrade:String;
    sInstGradeDes:String;
    sRestrictionCode:String;
    sRestrictionDes:String;
    sAddDepUbigCode:String;
    sDepartmentAddress:String;
    sAddProvUbigCode:String;
    sProvinceAddress:String;
    sAddDistUbigCode:String;
    sDistritAddress:String;
    sAddressUrbPrefix:String;
    sAddressUrbPrefixDes:String;
    sAddressUrb:String;
    sAddPrefix:String;
    sAddPrefixDes:String;
    sAddress:String;
    sAddressEt:String;
    sAddressBlock:String;
    sAddressBlockPrefix:String;
    sAddressBlockPrefixDes:String;
    sAddressInterior:String;
    sAddressIntPrefix:String;
    sAddressIntPrefixDes:String;
    sAddressLt:String;
    sAddressMz:String;
    sAddressNumber:String;
    sBornDate:String;
    sBornDepartmentUbigCode:String;
    sBornDepartment:String;
    sBonrProvinceUbigCode:String;
    sBornProvince:String;
    sBonrDistritUbigCode:String;
    sBornDistrit:String;
    nHeight:Double;
    sResultCode:String;
    sResultErrorDescription:String;
    dFechaNacimiento: Double;
    sUbigeoDom:String;
    xdbeLibDni: String;
    bConfirmado: boolean;
    bCancela: boolean;
    procedure SetImagenFoto(pImagenFoto: TJPEGImage);
    procedure SetImagenFirma(pImagenFirma: TJPEGImage);
    procedure MuestraDatos();
  end;

var
  FMantAsociadoConfirmaReniec: TFMantAsociadoConfirmaReniec;

implementation

uses ASODM;

{$R *.dfm}

procedure TFMantAsociadoConfirmaReniec.SetImagenFoto(pImagenFoto: TJPEGImage);
begin
  ImgFotoConfirme.Picture.Assign(pImagenFoto);
end;

procedure TFMantAsociadoConfirmaReniec.SetImagenFirma(pImagenFirma: TJPEGImage);
begin
  ImgFirmaConfirme.Picture.Assign(pImagenFirma);
end;

procedure TFMantAsociadoConfirmaReniec.MuestraDatos();
Var RowCount:integer;
begin


  // Establecer el número de columnas en 5
  StringGrid1.ColCount := 3;
  StringGrid1.RowCount := 37;
  StringGrid1.ColWidths[0] := 0;
  StringGrid1.ColWidths[1] := 155;
  StringGrid1.RowHeights[1] := 20;
  StringGrid1.Cells[1, 0] := 'Información';
  StringGrid1.Cells[1, 1] := 'Documento';
  StringGrid1.Cells[1, 2] := 'Apellido Paterno';
  StringGrid1.Cells[1, 3] := 'Apellido Materno';
  StringGrid1.Cells[1, 4] := 'Nombres';
  StringGrid1.Cells[1, 5] := 'Sexo';
  StringGrid1.Cells[1, 6] := 'Estado civil';
  StringGrid1.Cells[1, 7] := 'Fecha de nacimiento';
  StringGrid1.Cells[1, 8] := 'Apellidos de casada';
  StringGrid1.Cells[1, 9] := 'Nombre de la madre';
  StringGrid1.Cells[1, 10] := 'Nombre del padre';
  StringGrid1.Cells[1, 11] := 'Documento sustentatorio';
  StringGrid1.Cells[1, 12] := 'Votación';
  StringGrid1.Cells[1, 13] := 'Fecha de registro';
  StringGrid1.Cells[1, 14] := 'Fecha de expedición';
  StringGrid1.Cells[1, 15] := 'Fecha de expiración';
  StringGrid1.Cells[1, 16] := 'Grado de instrucción';
  StringGrid1.Cells[1, 17] := 'Departamento domiciliario';
  StringGrid1.Cells[1, 18] := 'Provincia domiciliario';
  StringGrid1.Cells[1, 19] := 'Distrito domiciliario';
  StringGrid1.Cells[1, 20] := 'Tipo de Urbanización';
  StringGrid1.Cells[1, 21] := 'Descripción de la Urbanización';
  StringGrid1.Cells[1, 22] := 'Código de la dirección';
  StringGrid1.Cells[1, 23] := 'Dirección';
  StringGrid1.Cells[1, 24] := 'Etapa';
  StringGrid1.Cells[1, 25] := 'Código de bloque';
  StringGrid1.Cells[1, 26] := 'Bloque';
  StringGrid1.Cells[1, 27] := 'Código de interior';
  StringGrid1.Cells[1, 28] := 'Interior';
  StringGrid1.Cells[1, 29] := 'Lote';
  StringGrid1.Cells[1, 30] := 'Manzana';
  StringGrid1.Cells[1, 31] := 'Número';
  StringGrid1.Cells[1, 32] := 'Departamento nacimiento';
  StringGrid1.Cells[1, 33] := 'Provincia nacimiento';
  StringGrid1.Cells[1, 34] := 'Distrito nacimiento';
  StringGrid1.Cells[1, 35] := 'Estatura';
  StringGrid1.Cells[1, 36] := 'Código de restricción';

  StringGrid1.ColWidths[2] := 245;
  StringGrid1.RowHeights[2] := 20;
  StringGrid1.Cells[2, 0] := 'Datos';
  StringGrid1.Cells[2, 1] := sDocument;
  StringGrid1.Cells[2, 2] := sLastName1;
  StringGrid1.Cells[2, 3] := sLastName2;
  StringGrid1.Cells[2, 4] := sFirstName;
  StringGrid1.Cells[2, 5] := copy(sGender,1,1)+'-'+sGender;
  StringGrid1.Cells[2, 6] := sCivilStateCode+'-'+sCivilState;
  StringGrid1.Cells[2, 7] := sBornDate;
  StringGrid1.Cells[2, 8] := sMerriedName;
  StringGrid1.Cells[2, 9] := sMotherName;
  StringGrid1.Cells[2, 10] := sFatherName;
  StringGrid1.Cells[2, 11] := sAltDocumentType+'-'+sAltDocumentTypeDes;
  StringGrid1.Cells[2, 12] := sVoteStatus;
  StringGrid1.Cells[2, 13] := sRegisterDate;
  StringGrid1.Cells[2, 14] := sExpeditionDate;
  StringGrid1.Cells[2, 15] := sExpirationDate;
  StringGrid1.Cells[2, 16] := sInstGrade+'-'+sInstGradeDes;
  StringGrid1.Cells[2, 17] := trim(sAddDepUbigCode)+'-'+trim(sDepartmentAddress);
  StringGrid1.Cells[2, 18] := trim(sAddProvUbigCode)+'-'+trim(sProvinceAddress);
  StringGrid1.Cells[2, 19] := trim(sAddDistUbigCode)+'-'+trim(sDistritAddress);
  StringGrid1.Cells[2, 20] := trim(sAddressUrbPrefix)+'-'+trim(sAddressUrbPrefixDes);
  StringGrid1.Cells[2, 21] := sAddressUrb;
  StringGrid1.Cells[2, 22] := sAddPrefix+'-'+sAddPrefixDes;
  StringGrid1.Cells[2, 23] := sAddress;
  StringGrid1.Cells[2, 24] := sAddressEt;
  StringGrid1.Cells[2, 25] := sAddressBlockPrefix+'-'+sAddressBlockPrefixDes;
  StringGrid1.Cells[2, 26] := sAddressBlock;
  StringGrid1.Cells[2, 27] := sAddressIntPrefix+'-'+sAddressIntPrefixDes;
  StringGrid1.Cells[2, 28] := sAddressInterior;
  StringGrid1.Cells[2, 29] := sAddressLt;
  StringGrid1.Cells[2, 30] := sAddressMz;
  StringGrid1.Cells[2, 31] := sAddressNumber;
  StringGrid1.Cells[2, 32] := trim(sBornDepartmentUbigCode)+'-'+trim(sBornDepartment);
  StringGrid1.Cells[2, 33] := trim(sBonrProvinceUbigCode)+'-'+trim(sBornProvince);
  StringGrid1.Cells[2, 34] := trim(sBonrDistritUbigCode)+'-'+trim(sBornDistrit);
  StringGrid1.Cells[2, 35] := FloatToStr(nHeight);
  StringGrid1.Cells[2, 36] := sRestrictionDes;

  {
   vlisConfirme.InsertRow('Documento',  sDocument, True);
   vlisConfirme.InsertRow('Apellido Paterno', sLastName1 , True);
   vlisConfirme.InsertRow('Apellido Materno', sLastName2, True);
   vlisConfirme.InsertRow('Nombres', sFirstName, True);
   vlisConfirme.InsertRow('Apellidos de casada', sMerriedName, True);
   vlisConfirme.InsertRow('Estado civil', sCivilStateCode+'-'+sCivilState, True);
   vlisConfirme.InsertRow('Sexo', copy(sGender,1,1)+'-'+sGender, True);

   vlisConfirme2.InsertRow('Nombre de la madre', sMotherName, True);
   vlisConfirme2.InsertRow('Nombre del padre', sFatherName, True);
   vlisConfirme2.InsertRow('Documento sustentatorio', sAltDocumentType+'-'+sAltDocumentTypeDes, True);
   vlisConfirme2.InsertRow('Número de doc. sustentatorio', sAltDocument, True);
   vlisConfirme2.InsertRow('Votación', sVoteStatus, True);
   vlisConfirme2.InsertRow('Fecha de registro', sRegisterDate, True);
   vlisConfirme2.InsertRow('Fecha de expedición', sExpeditionDate, True);
   vlisConfirme2.InsertRow('Fecha de expiración', sExpirationDate, True);
   vlisConfirme2.InsertRow('Grado de instrucción', sInstGrade+'-'+sInstGradeDes, True);
   vlisConfirme2.InsertRow('Departamento domiciliario', trim(sAddDepUbigCode)+'-'+trim(sDepartmentAddress), True);
   vlisConfirme2.InsertRow('Provincia domiciliario', trim(sAddProvUbigCode)+'-'+trim(sProvinceAddress), True);
   vlisConfirme2.InsertRow('Distrito domiciliario', trim(sAddDistUbigCode)+'-'+trim(sDistritAddress), True);
   vlisConfirme2.InsertRow('Tipo de Urbanización', trim(sAddressUrbPrefix)+'-'+trim(sAddressUrbPrefixDes), True);
   vlisConfirme2.InsertRow('Descripción de la Urbanización', sAddressUrb, True);
   vlisConfirme2.InsertRow('Código de la dirección', sAddPrefix+'-'+sAddPrefixDes, True);

   vlisConfirme2.InsertRow('Dirección', sAddress, True);
   vlisConfirme2.InsertRow('Etapa', sAddressEt, True);
   vlisConfirme2.InsertRow('Código de bloque', sAddressBlockPrefix+'-'+sAddressBlockPrefixDes, True);
   vlisConfirme2.InsertRow('Bloque', sAddressBlock, True);
   vlisConfirme2.InsertRow('Código de interior', sAddressIntPrefix+'-'+sAddressIntPrefixDes, True);
   vlisConfirme2.InsertRow('Interior', sAddressInterior, True);
   vlisConfirme2.InsertRow('Lote', sAddressLt, True);
   vlisConfirme2.InsertRow('Manzana', sAddressMz, True);
   vlisConfirme2.InsertRow('Número', sAddressNumber, True);
   vlisConfirme2.InsertRow('Fecha de nacimiento', sBornDate, True);
   vlisConfirme2.InsertRow('Departamento nacimiento', trim(sBornDepartmentUbigCode)+'-'+trim(sBornDepartment), True);
   vlisConfirme2.InsertRow('Provincia nacimiento', trim(sBonrProvinceUbigCode)+'-'+trim(sBornProvince), True);
   vlisConfirme2.InsertRow('Distrito nacimiento', trim(sBonrDistritUbigCode)+'-'+trim(sBornDistrit), True);
   vlisConfirme2.InsertRow('Estatura', FloatToStr(nHeight), True);
   //If Trim(sRestrictionCode) = '' Then xtmp := 'X-NINGUNO' Else xtmp := sRestrictionCode+'-'+sRestrictionDes;
   vlisConfirme.InsertRow('Código de restricción', sRestrictionDes, True);
   }
end;


procedure TFMantAsociadoConfirmaReniec.FormCreate(Sender: TObject);
begin
  bConfirmado := false;
  bCancela := false;
end;

procedure TFMantAsociadoConfirmaReniec.btnconfirmaClick(Sender: TObject);
begin
  //Pide confirmación final al usuario
  If MessageDlg('¿Está seguro de registrar nuevo docente?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
  Begin
    self.Close;
    exit;
  End;

  bConfirmado := true;
  self.Close;
end;

procedure TFMantAsociadoConfirmaReniec.vlisConfirmeStringsChange(
  Sender: TObject);
  var RowIndex: Integer;
begin

end;

procedure TFMantAsociadoConfirmaReniec.StringGrid1DrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  // Verificar si el registro actual es el que deseas cambiar de color
  if ( (ARow > 1) and (ARow <= 8) ) then
  begin
    //StringGrid1.Canvas.Brush.Color := clLime;
    StringGrid1.Canvas.Font.Color := clBlue;
  end;

  // Dibujar la celda
  StringGrid1.Canvas.FillRect(Rect);
  StringGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, StringGrid1.Cells[ACol, ARow]);
end;

procedure TFMantAsociadoConfirmaReniec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (bConfirmado) then  bCancela := false
   else  bCancela := true;

end;

end.
//Fin HPC_201801_MAS
