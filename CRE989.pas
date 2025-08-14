unit CRE989;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Wwdatsrc, DBClient, wwclient, StdCtrls, wwdblook, Mask,
  wwdbedit, Buttons, IdHTTP, uLkJSON;

type
  TfContactabilidadVerificada = class(TForm)
    dsContactabilidadCor: TwwDataSource;
    cdsContactabilidadCor: TwwClientDataSet;
    dsContactabilidadTel: TwwDataSource;
    cdsContactabilidadTel: TwwClientDataSet;
    GroupBoxCorreo: TGroupBox;
    lblValidarCorreo: TLabel;
    btnValidarCorreoToken: TBitBtn;
    btnNuevoCorreo: TBitBtn;
    btnGrabarCorreo: TBitBtn;
    dbeCorreo: TwwDBEdit;
    cbCorreo: TwwDBLookupCombo;
    btnCancelarCor: TBitBtn;
    btnActualizarCorreo: TBitBtn;
    GroupBox1: TGroupBox;
    lblValidarCelular: TLabel;
    cbTelefono: TwwDBLookupCombo;
    btnCancelarCelular: TBitBtn;
    btnGrabarCelular: TBitBtn;
    BitSalir: TBitBtn;
    btnActualizarCelular: TBitBtn;
    btnValidacionTokenCelular: TBitBtn;
    btnNuevoCelular: TBitBtn;
    txtcelular: TwwDBEdit;
    GroupBox2: TGroupBox;
    lblValidarFijo: TLabel;
    cbFijo: TwwDBLookupCombo;
    btnFijoCancelar: TBitBtn;
    btnGrabarFijo: TBitBtn;
    btnActualizarFijo: TBitBtn;
    btnNuevoFijo: TBitBtn;
    txtnumerofijo: TwwDBEdit;
    cbCodigoTelefono: TwwDBLookupCombo;
    cbTipoCelular: TwwDBLookupCombo;
    txttiponombrecelular: TwwDBEdit;
    cbTipoFijo: TwwDBLookupCombo;
    txttiponombrefijo: TwwDBEdit;
    cdsTipoCelular: TwwClientDataSet;
    dsTipoCelular: TwwDataSource;
    cdsTipoFijo: TwwClientDataSet;
    dsTipoFijo: TwwDataSource;
    cdsContactabilidadFijo: TwwClientDataSet;
    dsContactabilidadFijo: TwwDataSource;
    cdsCodigosTelefono: TwwClientDataSet;
    dsCodigosTelefono: TwwDataSource;
    btnModificarFijo: TBitBtn;
    cbTipoCorreo: TwwDBLookupCombo;
    txttiponombrecorreo: TwwDBEdit;
    cdsTipoCorreo: TwwClientDataSet;
    dsTipoCorreo: TwwDataSource;
    lbldepartamento: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnContactarCelular: TBitBtn;
    btnContactarFijo: TBitBtn;
    procedure cbTelefonoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure cbCorreoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure cbTelefonoKeyPress(Sender: TObject; var Key: Char);
    procedure cbCorreoKeyPress(Sender: TObject; var Key: Char);
    procedure seleccionarCelular(xTelefono:String);
    procedure seleccionarCorreo(xCorreo:String);
    procedure cbTelefonoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cbCorreoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnNuevoCorreoClick(Sender: TObject);
    procedure btnCancelarCorClick(Sender: TObject);
    procedure btnGrabarCorreoClick(Sender: TObject);
    procedure btnActualizarCorreoClick(Sender: TObject);
    procedure btnValidarCorreoTokenClick(Sender: TObject);
    procedure BitSalirClick(Sender: TObject);
    procedure btnNuevoCelularClick(Sender: TObject);
    procedure btnCancelarCelularClick(Sender: TObject);
    procedure btnGrabarCelularClick(Sender: TObject);
    procedure btnValidacionTokenCelularClick(Sender: TObject);
    procedure txtcelularKeyPress(Sender: TObject; var Key: Char);
    procedure btnActualizarCelularClick(Sender: TObject);
    Function Celular(xASOID:String):String;
    Function Correo(xASOID:String):String;
    Function Telefono(xASOID:String):String;
    Function EnviarTokenValidacion(ASODNI,USUREG,CODTIPCON,CODFUECON,TELEFONO,LINKVALID,CORREO:String):Integer;
    Function ValidacionContactoManual(TIPOVALIDACION,ASODNI,USUREG,CODTIPCON,CODFUECON,TELEFONO,CORREO,ZIPID,ASODIR,ASODIRREF,CODTOKEN:String):Integer;
    Function CorreoValidado(xASOID:String):String;
    Function CelularValidado(xASOID:String):String;
    procedure cbCodigoTelefonoNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure cbFijoNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure cbTipoCelularNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure cbTipoFijoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure cbTipoCelularCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cbTipoCelularKeyPress(Sender: TObject; var Key: Char);
    procedure cbTipoFijoKeyPress(Sender: TObject; var Key: Char);
    procedure cbCodigoTelefonoKeyPress(Sender: TObject; var Key: Char);
    procedure cbFijoKeyPress(Sender: TObject; var Key: Char);
    procedure btnNuevoFijoClick(Sender: TObject);
    procedure btnFijoCancelarClick(Sender: TObject);
    procedure cbCodigoTelefonoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cbTipoFijoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cbFijoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnActualizarFijoClick(Sender: TObject);
    procedure btnGrabarFijoClick(Sender: TObject);
    procedure btnModificarFijoClick(Sender: TObject);
    procedure cbTipoCorreoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure cbTipoCorreoKeyPress(Sender: TObject; var Key: Char);
    procedure cbTipoCorreoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnContactarCelularClick(Sender: TObject);
    procedure btnContactarFijoClick(Sender: TObject);
  private
    { Private declarations }
    procedure cargarCelulares();
    procedure cargarCorreos();
    procedure EnviarTokenCorreo;
    procedure EnviarTokenCelular;
    procedure cargarTipoCelular;
    procedure cargarTipoFijo;
    procedure cargarTipoCorreo;
    procedure seleccionarTipoCelular;
    procedure seleccionarTipoCorreo;
    procedure cargarTelefonosFijos;
    procedure cargarCodigosTelefono();
    procedure seleccionarFijo(xFijo:String);
    procedure seleccionarTipoFijo();
    procedure seleccionarCodigoTelefono();
    
  public
    { Public declarations }
    xASOID:String;
    xASODNI:String;
    xASONOMDNI:String;
  end;

var
  fContactabilidadVerificada: TfContactabilidadVerificada;

implementation

uses ASODM, ASO260;

{$R *.dfm}

procedure TfContactabilidadVerificada.cargarCelulares();
var
  xSQL:String;

  HTTP1: TIdHTTP;
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  sServidorWeb : String;
  jsonBase:TlkJSONbase;
  obj,oList:TlkJSONobject;
  i:integer;
begin
   Screen.Cursor := crHourGlass;
   xSQL:='SELECT ASOID,TELEFONO CELULAR,CORREO FECHAREGISTRO, CODFUECON, 0 PRIORIDAD,''NO VERIFICADO'' ESTADO,CORREO FUENTE,CODTIPCON,CORREO DESTIPCON FROM DB2ADMIN.SIO_CONTACTO_MOV WHERE ROWNUM=0';
   cdsContactabilidadTel.Close;
   cdsContactabilidadTel.DataRequest(xSQL);
   cdsContactabilidadTel.Open;
   cbTelefono.LookupField:='CELULAR';
   cbTelefono.LookupTable := cdsContactabilidadTel;
   cbTelefono.Selected.Clear;
   cbTelefono.Selected.Add('CELULAR'#9'10'#9'CELULAR'#9#9);
   cbTelefono.Selected.Add('DESTIPCON'#9'10'#9'TIPO'#9#9);
   cbTelefono.Selected.Add('FUENTE'#9'25'#9'FUENTE'#9#9);
   cbTelefono.Selected.Add('FECHAREGISTRO'#9'18'#9'FECHA'#9#9);
   cbTelefono.Selected.Add('ESTADO'#9'15'#9'ESTADO'#9#9);

   sServidorWeb:=DM1.CrgDescrip('COD_PAR=' + QuotedStr('01'), 'CRE_PAR_GEN_SIS', 'URL_SERVICE_GENERAL');
   sServidorWeb:=sServidorWeb+'/contactabilidad/listar';

   Json:='{'
        +  '"OPCION":1,"ASOID":"'+xASOID+'"'
        +'}';
   JsonToSend := TStringStream.Create(Utf8Encode(Json));
   try
    HTTP1 := TIdHTTP.Create(Self);
    HTTP1.Request.ContentType := 'application/json';
    try
      sResponse := HTTP1.Post(sServidorWeb, JsonToSend);
      jsonBase := TlkJSON.ParseText(sResponse);
      TlkJSONBase(oList) := TlkJSONobject(jsonBase);
      if oList.Count > 0 then
      Begin
         for i := 0 to (oList.Count - 1) do begin
           TlkJSONBase(obj) := oList.Child[i];
           cdsContactabilidadTel.Append;
           cdsContactabilidadTel.FieldByName('ASOID').AsString:=obj.Field['ASOID'].Value;
           cdsContactabilidadTel.FieldByName('CELULAR').AsString:=obj.Field['CELULAR'].Value;
           cdsContactabilidadTel.FieldByName('ESTADO').AsString:=obj.Field['ESTADO'].Value;
           cdsContactabilidadTel.FieldByName('FUENTE').AsString:=obj.Field['FUENTE'].Value;
           cdsContactabilidadTel.FieldByName('CODFUECON').AsString:=obj.Field['CODFUECON'].Value;
           cdsContactabilidadTel.FieldByName('FECHAREGISTRO').AsString:=obj.Field['FECHAREGISTRO'].Value;
           cdsContactabilidadTel.FieldByName('PRIORIDAD').AsString:=obj.Field['PRIORIDAD'].Value;
           cdsContactabilidadTel.FieldByName('DESTIPCON').AsString:=obj.Field['DESTIPCON'].Value;
           cdsContactabilidadTel.FieldByName('CODTIPCON').AsString:=obj.Field['CODTIPCON'].Value;
           cdsContactabilidadTel.Post;
         end;
      End;
    except
      on E: Exception do
      begin
        Screen.Cursor := crDefault;
        MessageDlg('NO ES POSIBLE CONECTAR CON EL SERVICIO DE CONTACTABILIDAD!', mtError,[mbOk],0);
      end;
    end;
   finally
    Screen.Cursor := crDefault;
    JsonToSend.Free;
    HTTP1.Free;
   end;
End;

procedure TfContactabilidadVerificada.cargarTelefonosFijos();
var
  xSQL:String;

  HTTP1: TIdHTTP;
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  sServidorWeb : String;
  jsonBase:TlkJSONbase;
  obj,oList:TlkJSONobject;
  i:integer;
begin
   Screen.Cursor := crHourGlass;
   xSQL:='SELECT ASOID,TELEFONO,CORREO FECHAREGISTRO, CODFUECON, 0 PRIORIDAD,''NO VERIFICADO'' ESTADO,CORREO FUENTE,CODTIPCON,CORREO DESTIPCON,TELEFONO CODTEL,TELEFONO NUMERO FROM DB2ADMIN.SIO_CONTACTO_MOV WHERE ROWNUM=0';
   cdsContactabilidadFijo.Close;
   cdsContactabilidadFijo.DataRequest(xSQL);
   cdsContactabilidadFijo.Open;
   cbFijo.LookupField:='TELEFONO';
   cbFijo.LookupTable := cdsContactabilidadFijo;
   cbFijo.Selected.Clear;
   cbFijo.Selected.Add('TELEFONO'#9'10'#9'TELÉFONO'#9#9);
   cbFijo.Selected.Add('DESTIPCON'#9'10'#9'TIPO'#9#9);
   cbFijo.Selected.Add('FUENTE'#9'25'#9'FUENTE'#9#9);
   cbFijo.Selected.Add('FECHAREGISTRO'#9'18'#9'FECHA'#9#9);
   cbFijo.Selected.Add('ESTADO'#9'15'#9'ESTADO'#9#9);

   sServidorWeb:=DM1.CrgDescrip('COD_PAR=' + QuotedStr('01'), 'CRE_PAR_GEN_SIS', 'URL_SERVICE_GENERAL');
   sServidorWeb:=sServidorWeb+'/contactabilidad/listar';

   Json:='{'
        +  '"OPCION":3,"ASOID":"'+xASOID+'"'
        +'}';
   JsonToSend := TStringStream.Create(Utf8Encode(Json));
   try
    HTTP1 := TIdHTTP.Create(Self);
    HTTP1.Request.ContentType := 'application/json';
    try
      sResponse := HTTP1.Post(sServidorWeb, JsonToSend);
      jsonBase := TlkJSON.ParseText(sResponse);
      TlkJSONBase(oList) := TlkJSONobject(jsonBase);
      if oList.Count > 0 then
      Begin
         for i := 0 to (oList.Count - 1) do begin
           TlkJSONBase(obj) := oList.Child[i];
           cdsContactabilidadFijo.Append;
           cdsContactabilidadFijo.FieldByName('ASOID').AsString:=obj.Field['ASOID'].Value;
           cdsContactabilidadFijo.FieldByName('TELEFONO').AsString:=obj.Field['TELEFONO'].Value;
           cdsContactabilidadFijo.FieldByName('ESTADO').AsString:=obj.Field['ESTADO'].Value;
           cdsContactabilidadFijo.FieldByName('FUENTE').AsString:=obj.Field['FUENTE'].Value;
           cdsContactabilidadFijo.FieldByName('CODFUECON').AsString:=obj.Field['CODFUECON'].Value;
           cdsContactabilidadFijo.FieldByName('FECHAREGISTRO').AsString:=obj.Field['FECHAREGISTRO'].Value;
           cdsContactabilidadFijo.FieldByName('PRIORIDAD').AsString:=obj.Field['PRIORIDAD'].Value;
           cdsContactabilidadFijo.FieldByName('DESTIPCON').AsString:=obj.Field['DESTIPCON'].Value;
           cdsContactabilidadFijo.FieldByName('CODTIPCON').AsString:=obj.Field['CODTIPCON'].Value;
           cdsContactabilidadFijo.FieldByName('CODTEL').AsString:=obj.Field['CODTEL'].Value;
           cdsContactabilidadFijo.FieldByName('NUMERO').AsString:=obj.Field['NUMERO'].Value;
           cdsContactabilidadFijo.Post;
         end;
      End;
    except
      on E: Exception do
      begin
        Screen.Cursor := crDefault;
        MessageDlg('NO ES POSIBLE CONECTAR CON EL SERVICIO DE CONTACTABILIDAD!', mtError,[mbOk],0);
      end;
    end;
   finally
    Screen.Cursor := crDefault;
    JsonToSend.Free;
    HTTP1.Free;
   end;
End;

procedure TfContactabilidadVerificada.cargarCodigosTelefono();
var
  xSQL:String;

  HTTP1: TIdHTTP;
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  sServidorWeb : String;
  jsonBase:TlkJSONbase;
  obj,oList:TlkJSONobject;
  i:integer;
begin
   Screen.Cursor := crHourGlass;
   xSQL:='SELECT DPTOID, DPTODES, DPTOABR, CODTEL FROM DB2ADMIN.TGE158 WHERE ROWNUM=0';
   cdsCodigosTelefono.Close;
   cdsCodigosTelefono.DataRequest(xSQL);
   cdsCodigosTelefono.Open;
   cbCodigoTelefono.LookupField:='DPTOID';
   cbCodigoTelefono.LookupTable := cdsCodigosTelefono;
   cbCodigoTelefono.Selected.Clear;
   cbCodigoTelefono.Selected.Add('CODTEL'#9'10'#9'CÓDIGO'#9#9);
   cbCodigoTelefono.Selected.Add('DPTODES'#9'10'#9'DEPARTAMENTO'#9#9);

   sServidorWeb:=DM1.CrgDescrip('COD_PAR=' + QuotedStr('01'), 'CRE_PAR_GEN_SIS', 'URL_SERVICE_GENERAL');
   sServidorWeb:=sServidorWeb+'/ubigeo/departamento';

   JsonToSend := TStringStream.Create(Utf8Encode(Json));
   try
    HTTP1 := TIdHTTP.Create(Self);
    HTTP1.Request.ContentType := 'application/json';
    try
      sResponse := HTTP1.Post(sServidorWeb, JsonToSend);
      jsonBase := TlkJSON.ParseText(sResponse);
      TlkJSONBase(oList) := TlkJSONobject(jsonBase);
      if oList.Count > 0 then
      Begin
         for i := 0 to (oList.Count - 1) do begin
           TlkJSONBase(obj) := oList.Child[i];
           cdsCodigosTelefono.Append;
           cdsCodigosTelefono.FieldByName('DPTOID').AsString:=obj.Field['DPTOID'].Value;
           cdsCodigosTelefono.FieldByName('DPTODES').AsString:=obj.Field['DPTODES'].Value;
           cdsCodigosTelefono.FieldByName('DPTOABR').AsString:=obj.Field['DPTOABR'].Value;
           cdsCodigosTelefono.FieldByName('CODTEL').AsString:=obj.Field['CODTEL'].Value;
           cdsCodigosTelefono.Post;
         end;
      End;
    except
      on E: Exception do
      begin
        Screen.Cursor := crDefault;
        MessageDlg('NO ES POSIBLE CONECTAR CON EL SERVICIO DE CONTACTABILIDAD!', mtError,[mbOk],0);
      end;
    end;
   finally
    Screen.Cursor := crDefault;
    JsonToSend.Free;
    HTTP1.Free;
   end;
End;

procedure TfContactabilidadVerificada.cargarCorreos();
var
  xSQL:String;

  HTTP1: TIdHTTP;
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  sServidorWeb : String;
  jsonBase:TlkJSONbase;
  obj,oList:TlkJSONobject;
  i:integer;
begin
   xSQL:='SELECT ASOID,CORREO,CORREO FECHAREGISTRO, CODFUECON, 0 PRIORIDAD,''NO VERIFICADO'' ESTADO,CORREO FUENTE,CODTIPCON,CORREO DESTIPCON FROM DB2ADMIN.SIO_CONTACTO_MOV WHERE ROWNUM=0';
   cdsContactabilidadCor.Close;
   cdsContactabilidadCor.DataRequest(xSQL);
   cdsContactabilidadCor.Open;
   cbCorreo.LookupField:='CORREO';
   cbCorreo.LookupTable := cdsContactabilidadCor;
   cbCorreo.Selected.Clear;
   cbCorreo.Selected.Add('CORREO'#9'50'#9'CORREO'#9#9);
   cbCorreo.Selected.Add('DESTIPCON'#9'10'#9'TIPO'#9#9);
   cbCorreo.Selected.Add('FUENTE'#9'25'#9'FUENTE'#9#9);
   cbCorreo.Selected.Add('FECHAREGISTRO'#9'18'#9'FECHA'#9#9);
   cbCorreo.Selected.Add('ESTADO'#9'10'#9'ESTADO'#9#9);

   sServidorWeb:=DM1.CrgDescrip('COD_PAR=' + QuotedStr('01'), 'CRE_PAR_GEN_SIS', 'URL_SERVICE_GENERAL');
   sServidorWeb:=sServidorWeb+'/contactabilidad/listar';
   Json:='{'
        +  '"OPCION":2,"ASOID":"'+xASOID+'"'
        +'}';
   JsonToSend := TStringStream.Create(Utf8Encode(Json));
   try
    HTTP1 := TIdHTTP.Create(Self);
    HTTP1.Request.ContentType := 'application/json';
    try
      sResponse := HTTP1.Post(sServidorWeb, JsonToSend);
      jsonBase := TlkJSON.ParseText(sResponse);
      TlkJSONBase(oList) := TlkJSONobject(jsonBase);
      if oList.Count > 0 then
      Begin
         for i := 0 to (oList.Count - 1) do begin
           TlkJSONBase(obj) := oList.Child[i];
           cdsContactabilidadCor.Append;
           cdsContactabilidadCor.FieldByName('ASOID').AsString:=obj.Field['ASOID'].Value;
           cdsContactabilidadCor.FieldByName('CORREO').AsString:=obj.Field['CORREO'].Value;
           cdsContactabilidadCor.FieldByName('ESTADO').AsString:=obj.Field['ESTADO'].Value;
           cdsContactabilidadCor.FieldByName('FUENTE').AsString:=obj.Field['FUENTE'].Value;
           cdsContactabilidadCor.FieldByName('CODFUECON').AsString:=obj.Field['CODFUECON'].Value;
           cdsContactabilidadCor.FieldByName('FECHAREGISTRO').AsString:=obj.Field['FECHAREGISTRO'].Value;
           cdsContactabilidadCor.FieldByName('PRIORIDAD').AsString:=obj.Field['PRIORIDAD'].Value;
           cdsContactabilidadCor.FieldByName('DESTIPCON').AsString:=obj.Field['DESTIPCON'].Value;
           cdsContactabilidadCor.FieldByName('CODTIPCON').AsString:=obj.Field['CODTIPCON'].Value;
           cdsContactabilidadCor.Post;
         end;
      End;
    except
      on E: Exception do
      begin
        Screen.Cursor := crDefault;
        MessageDlg('NO ES POSIBLE CONECTAR CON EL SERVICIO DE CONTACTABILIDAD!', mtError,[mbOk],0);
      end;
    end;
   finally
    Screen.Cursor := crDefault;
    JsonToSend.Free;
    HTTP1.Free;
   end;
End;

procedure TfContactabilidadVerificada.cbTelefonoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TfContactabilidadVerificada.cbCorreoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TfContactabilidadVerificada.FormActivate(Sender: TObject);
var xSQL:String;
  xCelular,xCorreo,xTelefono:String;
begin
   xCelular:= Celular(xAsoid);
   xCorreo:= Correo(xAsoid);
   xTelefono:= Telefono(xAsoid);

   lblValidarCorreo.Caption:='';
   lblValidarCelular.Caption:='';
   lblValidarFijo.Caption:='';

   cargarTipoCelular;
   cargarTipoFijo;
   cargarTipoCorreo;
   
   cargarCelulares();
   seleccionarCelular(xCelular);
   cargarCorreos();
   seleccionarCorreo(xCorreo);
   
   cargarTelefonosFijos();
   seleccionarFijo(xTelefono);

   dbeCorreo.Visible:=false;
   btnValidarCorreoToken.Visible:=true;
   btnNuevoCorreo.Visible:=true;
   btnGrabarCorreo.Visible:=false;
   btnCancelarCor.Visible:=false;
   btnActualizarCorreo.Visible:=true;

   txtcelular.Visible:=false;
   btnValidacionTokenCelular.Visible:=true;
   btnNuevoCorreo.Visible:=true;
   btnCancelarCelular.Visible:=false;
   btnGrabarCelular.Visible:=false;
   btnActualizarCelular.Visible:=true;

   cbCodigoTelefono.Visible:=false;
   txtnumerofijo.Visible:=false;
   btnModificarFijo.Visible:=true;
   lbldepartamento.Visible:=false;

   btnContactarCelular.Visible:=false;
   btnContactarFijo.Visible:=false;
   xSQL:='SELECT * FROM DB2ADMIN.TGE006 WHERE USERID='+QuotedStr(DM1.wUsuario)+' AND CMA=''S'' ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   IF DM1.cdsQry.RecordCount > 0 Then
   begin
      btnContactarCelular.Visible:=true;
      btnContactarFijo.Visible:=true;
   End;
end;

procedure TfContactabilidadVerificada.cbTelefonoKeyPress(Sender: TObject;
  var Key: Char);
begin
Key := #0;
end;

procedure TfContactabilidadVerificada.cbCorreoKeyPress(Sender: TObject;
  var Key: Char);
begin
Key := #0;
end;

procedure TfContactabilidadVerificada.seleccionarCelular(xTelefono:String);
begin
   lblValidarCelular.Caption:='';
   lblValidarCelular.Color:= $00BFD5FF;
   lblValidarCelular.Font.Color:=clRed;
   cbTelefono.Text:='';
   if (trim(xTelefono)<>'') and (cdsContactabilidadTel.Locate('CELULAR', VarArrayof([xTelefono]), [])) Then
   begin
      lblValidarCelular.Caption:=cdsContactabilidadTel.FieldByName('ESTADO').AsString;
      cbTelefono.Text:=cdsContactabilidadTel.FieldByName('CELULAR').AsString;
      cbTipoCelular.Text:=cdsContactabilidadTel.FieldByName('CODTIPCON').AsString;
      seleccionarTipoCelular();
      If lblValidarCelular.Caption='VERIFICADO' THEN
      Begin
         lblValidarCelular.Color:= clMoneyGreen;
         lblValidarCelular.Font.Color:=clGreen;
      End;
   end;
end;
procedure TfContactabilidadVerificada.seleccionarCorreo(xCorreo:String);
begin
   lblValidarCorreo.Color:= $00BFD5FF;
   lblValidarCorreo.Font.Color:=clRed;
   lblValidarCorreo.Caption:='';
   cbCorreo.Text:='';
   if (trim(xCorreo)<>'') and (cdsContactabilidadCor.Locate('CORREO', VarArrayof([xCorreo]), [])) Then
   begin
      lblValidarCorreo.Caption:=cdsContactabilidadCor.FieldByName('ESTADO').AsString;
      cbCorreo.Text:=cdsContactabilidadCor.FieldByName('CORREO').AsString;
      cbTipoCorreo.Text:=cdsContactabilidadCor.FieldByName('CODTIPCON').AsString;
      seleccionarTipoCorreo;
      If lblValidarCorreo.Caption='VERIFICADO' THEN
      Begin
         lblValidarCorreo.Color:= clMoneyGreen;
         lblValidarCorreo.Font.Color:=clGreen;
      End;
   end;
end;

procedure TfContactabilidadVerificada.seleccionarFijo(xFijo:String);
begin
   lblValidarFijo.Caption:='';
   lblValidarFijo.Color:= $00BFD5FF;
   lblValidarFijo.Font.Color:=clRed;
   cbFijo.Text:='';
   if (trim(xFijo)<>'') and (cdsContactabilidadFijo.Locate('TELEFONO', VarArrayof([xFijo]), [])) Then
   begin
      lblValidarFijo.Caption:=cdsContactabilidadFijo.FieldByName('ESTADO').AsString;
      cbFijo.Text:=cdsContactabilidadFijo.FieldByName('TELEFONO').AsString;
      cbTipoFijo.Text:=cdsContactabilidadFijo.FieldByName('CODTIPCON').AsString;
      seleccionarTipoFijo();
      If lblValidarFijo.Caption='VERIFICADO' THEN
      Begin
         lblValidarFijo.Color:= clMoneyGreen;
         lblValidarFijo.Font.Color:=clGreen;
      End;
   end;
end;

procedure TfContactabilidadVerificada.seleccionarCodigoTelefono();
begin
    txtnumerofijo.SetFocus;
    if Length(trim(cbCodigoTelefono.Text))=2 then
    begin
       txtnumerofijo.MaxLength:=7;
    end
    else
    begin
       txtnumerofijo.MaxLength:=6;
    End;
    lbldepartamento.Caption:='';
    If (trim(cbCodigoTelefono.Text)<>'') and (cdsCodigosTelefono.Locate('CODTEL', VarArrayof([cbCodigoTelefono.Text]), [])) Then
    Begin
        lbldepartamento.Caption:=cdsCodigosTelefono.FieldByName('DPTODES').AsString;
    End;
end;

procedure TfContactabilidadVerificada.cbTelefonoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   seleccionarCelular(cbTelefono.Text);
end;

procedure TfContactabilidadVerificada.cbCorreoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   seleccionarCorreo(cbCorreo.Text);
end;

procedure TfContactabilidadVerificada.btnNuevoCorreoClick(Sender: TObject);
begin
   lblValidarCorreo.Caption:='';
   btnCancelarCor.Visible:=true;
   btnValidarCorreoToken.Visible:=FALSE;
   cbCorreo.Visible:=False;
   dbeCorreo.Visible:=True;
   dbeCorreo.Text:='';
   dbeCorreo.SetFocus;
   btnCancelarCor.Visible:=true;
   btnGrabarCorreo.Visible:=True;
   btnNuevoCorreo.Visible:=False;
   btnActualizarCorreo.Visible:=False;
   cbTipoCorreo.Text:='';
   txttiponombrecorreo.Text:='';
end;

procedure TfContactabilidadVerificada.btnCancelarCorClick(Sender: TObject);
begin
  btnNuevoCorreo.Visible:=True;
  btnActualizarCorreo.Visible:=True;
  btnGrabarCorreo.Visible:=False;
  dbeCorreo.Color:=clBtnFace;
  dbeCorreo.Visible:=false;
  cbCorreo.Visible:=True;
  btnValidarCorreoToken.Visible:=True;
  btnCancelarCor.Visible:=False;
  dbeCorreo.Text:='';
  seleccionarCorreo(cbCorreo.Text);
end;

procedure TfContactabilidadVerificada.btnGrabarCorreoClick(
  Sender: TObject);
  var xSql,xCorrreo:String;
  Boton,codtoken:Integer;
begin
  xSql := 'SELECT DB2ADMIN.SF_SIO_VALIDAR_CORREO('+QuotedStr(dbeCorreo.Text)+') CORREO FROM DUAL';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSQL);
  DM1.cdsQry.Open;
  If DM1.cdsQry.FieldByName('CORREO').AsString = '' Then
  Begin
     MessageDlg('EL CORREO ELECTRÓNICO '+TRIM(dbeCorreo.Text)+' ES INVÁLIDO', mtInformation, [mbOk], 0);
     Exit;
  End;
  If trim(cbTipoCorreo.Text)='' Then
  Begin
     MessageDlg('SELECCIONE EL TIPO DE CORREO', mtInformation, [mbOk], 0);
     Exit;
  End;
  xCorrreo:= DM1.cdsQry.FieldByName('CORREO').AsString;
  Boton := Application.MessageBox (PAnsiChar('ESTÁ SEGURO DE GRABAR EL NUEVO CORREO '+xCorrreo),'AVISO',MB_YESNO+MB_ICONQUESTION);
  If Boton = ID_YES Then
  begin
      Screen.Cursor := crHourGlass;
      codtoken:=EnviarTokenValidacion(xASODNI,DM1.wUsuario,
       cbTipoCorreo.Text,'00011','','N',xCorrreo
      );
      if codtoken>0 then
      Begin
        cargarCorreos();
        seleccionarCorreo(xCorrreo);
        cbCorreo.Visible:=true;
        dbeCorreo.Visible:=false;
        btnCancelarCor.Visible:=false;
        btnGrabarCorreo.Visible:=false;
        btnNuevoCorreo.Visible:=true;
        btnValidarCorreoToken.Visible:=true;
        btnActualizarCorreo.Visible:=true;
      End;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfContactabilidadVerificada.btnActualizarCorreoClick(
  Sender: TObject);
  var
  xSQL,xCorreo:String;
begin
   cargarCorreos();
   xCorreo:= Correo(xAsoid);
   seleccionarCorreo(xCorreo);
end;

procedure TfContactabilidadVerificada.btnValidarCorreoTokenClick(
  Sender: TObject);
  var
  Boton:Integer;
begin
  if trim(cbCorreo.Text)='' Then
  begin
     MessageDlg('SELECCIONE UN CORREO ELECTRÓNICO', mtError, [mbOk], 0);
     Exit;
  end;
  If trim(cbTipoCorreo.Text)='' Then
  Begin
     MessageDlg('SELECCIONE EL TIPO DE CORREO', mtInformation, [mbOk], 0);
     Exit;
  End;
  Boton := Application.MessageBox (PAnsiChar('¿ESTÁ SEGURO DE GENERAR UN ENLACE DE VERIFICACIÓN POR CORREO ELECTRÓNICO?'),'AVISO',MB_YESNO+MB_ICONQUESTION);
  If Boton = ID_YES Then
  Begin
     EnviarTokenCorreo;
  end;
end;

procedure TfContactabilidadVerificada.EnviarTokenCorreo;
var
  codtoken:Integer;
  xSQL,xCorreo:String;
begin
   codtoken:=EnviarTokenValidacion(xASODNI,DM1.wUsuario,
     cbTipoCorreo.Text,'00011','','N',cbCorreo.Text
   );
   if codtoken>0 then
   Begin
     cargarCorreos();
     xCorreo:= Correo(xAsoid);
     seleccionarCorreo(xCorreo);
   End;
end;

procedure TfContactabilidadVerificada.EnviarTokenCelular;
var
  codtoken:Integer;
  xSQL,xCelular:String;
begin
   codtoken:=EnviarTokenValidacion(xASODNI,DM1.wUsuario,
      cbTipoCelular.Text,'00011',cbTelefono.Text,'S',''
   );
   if codtoken>0 then
   Begin
     cargarCelulares;
     xCelular:= Celular(xAsoid);
     seleccionarCelular(xCelular);
   End;
end;

procedure TfContactabilidadVerificada.BitSalirClick(Sender: TObject);
begin
Close
end;

procedure TfContactabilidadVerificada.btnNuevoCelularClick(
  Sender: TObject);
begin
   txtcelular.Text:='';
   txtcelular.Visible:=true;
   btnValidacionTokenCelular.Visible:=false;
   btnNuevoCelular.Visible:=false;
   btnCancelarCelular.Visible:=true;
   btnGrabarCelular.Visible:=true;
   btnActualizarCelular.Visible:=false;
   lblValidarCelular.Caption:='';
   cbTipoCelular.Text:='';
   txttiponombrecelular.Text:='';
   btnContactarCelular.Visible:=false;
   txtcelular.SetFocus;
end;

procedure TfContactabilidadVerificada.btnCancelarCelularClick(
  Sender: TObject);
begin
   txtcelular.Visible:=false;
   btnValidacionTokenCelular.Visible:=true;
   btnNuevoCelular.Visible:=true;
   btnCancelarCelular.Visible:=false;
   btnGrabarCelular.Visible:=false;
   btnActualizarCelular.Visible:=true;
   btnContactarCelular.Visible:=true;
   seleccionarCelular(cbTelefono.Text);
end;

procedure TfContactabilidadVerificada.btnGrabarCelularClick(
  Sender: TObject);
  var xSql,xCelular:String;
  codtoken,Boton:Integer;
begin
  xSql := 'SELECT DB2ADMIN.SF_SIO_VALIDAR_CELULAR('+QuotedStr(txtcelular.Text)+') CELULAR FROM DUAL';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSQL);
  DM1.cdsQry.Open;
  If DM1.cdsQry.FieldByName('CELULAR').AsString = '' Then
  Begin
     MessageDlg('EL TELÉFONO CELULAR '+TRIM(txtcelular.Text)+' ES INVÁLIDO', mtInformation, [mbOk], 0);
     Exit;
  End;
  If trim(cbTipoCelular.Text)='' Then
  Begin
     MessageDlg('SELECCIONE EL TIPO DE TELÉFONO CELULAR', mtInformation, [mbOk], 0);
     Exit;
  End;
  xCelular:= DM1.cdsQry.FieldByName('CELULAR').AsString;
  Boton := Application.MessageBox (PAnsiChar('ESTÁ SEGURO DE GRABAR EL NUEVO TELÉFONO CELULAR '+xCelular),'AVISO',MB_YESNO+MB_ICONQUESTION);
  If Boton = ID_YES Then
  begin
      Screen.Cursor := crHourGlass;
      codtoken:=EnviarTokenValidacion(xASODNI,DM1.wUsuario,
       cbTipoCelular.Text,'00011',xCelular,'S',''
      );
      if codtoken>0 then
      Begin
        cargarCelulares;
        seleccionarCelular(xCelular);
        txtcelular.Visible:=false;
        btnCancelarCelular.Visible:=false;
        btnGrabarCelular.Visible:=false;
        btnNuevoCelular.Visible:=true;
        btnValidacionTokenCelular.Visible:=true;
        btnActualizarCelular.Visible:=true;
      End;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfContactabilidadVerificada.btnValidacionTokenCelularClick(
  Sender: TObject);
var
  Boton:Integer;
begin
  if trim(cbTelefono.Text)='' Then
  begin
     MessageDlg('SELECCIONE UN TELÉFONO CELULAR', mtError, [mbOk], 0);
     Exit;
  end;
  If trim(cbTipoCelular.Text)='' Then
  Begin
     MessageDlg('SELECCIONE EL TIPO DE TELÉFONO CELULAR', mtInformation, [mbOk], 0);
     Exit;
  End;
  Boton := Application.MessageBox (PAnsiChar('¿ESTÁ SEGURO DE GENERAR UN ENLACE DE VERIFICACIÓN POR MENSAJE DE TEXTO?'),'AVISO',MB_YESNO+MB_ICONQUESTION);
  If Boton = ID_YES Then
  Begin
     EnviarTokenCelular;
  end;
end;

procedure TfContactabilidadVerificada.txtcelularKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ( StrScan('0123456789'+chr(7)+chr(8), Key) = nil ) then  Key := #0;
end;

procedure TfContactabilidadVerificada.btnActualizarCelularClick(
  Sender: TObject);
  var xSQL,xCelular:String;
begin
  cargarCelulares();
  xCelular:= Celular(xAsoid);
  seleccionarCelular(xCelular);
end;

Function TfContactabilidadVerificada.Celular(xASOID:String):String;
  var xSQL,xCelular:String;
begin
   xSQL := 'SELECT DB2ADMIN.SF_SIO_CONTACTO_CELULAR('+Quotedstr(xASOID)+') CELULAR FROM DUAL ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   If (DM1.cdsQry.RecordCount > 0) and (DM1.cdsQry.FieldByName('CELULAR').AsString<>'') Then
   begin
    xCelular:=DM1.cdsQry.FieldByName('CELULAR').AsString;
   End;
   Result:=xCelular;
End;

Function TfContactabilidadVerificada.Correo(xASOID:String):String;
  var xSQL,xCorreo:String;
begin
   xSQL := 'SELECT DB2ADMIN.SF_SIO_CONTACTO_CORREO('+Quotedstr(xASOID)+') CORREO FROM DUAL ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   If (DM1.cdsQry.RecordCount > 0) and (DM1.cdsQry.FieldByName('CORREO').AsString<>'') Then
   begin
    xCorreo:=DM1.cdsQry.FieldByName('CORREO').AsString;
   End;
   Result:=xCorreo;
End;

Function TfContactabilidadVerificada.Telefono(xASOID:String):String;
  var xSQL,xTelefono:String;
begin
   xSQL := 'SELECT DB2ADMIN.SF_SIO_CONTACTO_TELEFONO('+Quotedstr(xASOID)+') TELEFONO FROM DUAL ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   If (DM1.cdsQry.RecordCount > 0) and (DM1.cdsQry.FieldByName('TELEFONO').AsString<>'') Then
   begin
    xTelefono:=DM1.cdsQry.FieldByName('TELEFONO').AsString;
   End;
   Result:=xTelefono;
End;

Function TfContactabilidadVerificada.CorreoValidado(xASOID:String):String;
  var xSQL,xCorreo:String;
begin
   xSQL := 'SELECT CORREO FROM DB2ADMIN.SIO_CONTACTO_MOV WHERE ASOID='+Quotedstr(xASOID)+' AND CODTIPCON=''03'' AND ESTVAL=''S'' ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   If (DM1.cdsQry.RecordCount > 0) and (DM1.cdsQry.FieldByName('CORREO').AsString<>'') Then
   begin
    xCorreo:=DM1.cdsQry.FieldByName('CORREO').AsString;
   End;
   Result:=xCorreo;
End;

Function TfContactabilidadVerificada.CelularValidado(xASOID:String):String;
  var xSQL,xCelular:String;
begin
   xSQL := 'SELECT TELEFONO FROM DB2ADMIN.SIO_CONTACTO_MOV WHERE ASOID = '+Quotedstr(xASOID)+' AND CODTIPCON=''01'' AND ESTVAL=''S'' ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   If (DM1.cdsQry.RecordCount > 0) and (DM1.cdsQry.FieldByName('TELEFONO').AsString<>'') Then
   begin
    xCelular:=DM1.cdsQry.FieldByName('TELEFONO').AsString;
   End;
   Result:=xCelular;
End;
Function TfContactabilidadVerificada.EnviarTokenValidacion(ASODNI,USUREG,CODTIPCON,CODFUECON,TELEFONO,LINKVALID,CORREO:String):Integer;
var
 HTTP1: TIdHTTP;
 Json: string;
 sResponse: string;
 JsonToSend: TStringStream;
 sServidorWeb : String;
 jsonBase:TlkJSONbase;
 obj:TlkJSONobject;
 CODTOKEN:Integer;
begin
     Screen.Cursor := crHourGlass;
     try
       sServidorWeb:=DM1.CrgDescrip('COD_PAR=' + QuotedStr('01'), 'CRE_PAR_GEN_SIS', 'URL_SERVICE_GENERAL');
       sServidorWeb:=sServidorWeb+'/contactabilidad/generartoken';
       try
         HTTP1 := TIdHTTP.Create(Self);
         Json:='{'
              +  '"CODTIPCON":"'+CODTIPCON+'","CODFUECON":"'+CODFUECON+'","CORREO":"'+CORREO+'",'
              +  '"TELEFONO":"'+TELEFONO+'","LINKVALID":"'+LINKVALID+'",'
              +  '"ASODNI":"'+ASODNI+'",'
              +  '"USUREG":"'+USUREG+'" '
              +'}';
          JsonToSend := TStringStream.Create(Utf8Encode(Json));

          HTTP1.Request.ContentType := 'application/json';
          sResponse := HTTP1.Post(sServidorWeb, JsonToSend);
          jsonBase := TlkJSON.ParseText(sResponse);
          TlkJSONBase(obj) := TlkJSONobject(jsonBase);
          If StrToInt(obj.Field['ICONO'].Value)>0 THEN
          Begin
           CODTOKEN:= StrToInt(obj.Field['CODTOKEN'].Value);
          End;
          MessageDlg(obj.Field['MENSAJE'].Value, mtInformation,[mbOk],0);
      except
        on E: Exception do
        begin
          Screen.Cursor := crDefault;
          CODTOKEN:=-1;
          MessageDlg('NO ES POSIBLE CONECTAR CON EL SERVICIO DE CONTACTABILIDAD!', mtError,[mbOk],0);
        end;
      end;
    finally
      Screen.Cursor := crDefault;
      JsonToSend.Free;
      HTTP1.Free;
    end;
    RESULT:= CODTOKEN;
end;

procedure TfContactabilidadVerificada.cbCodigoTelefonoNotInList(
  Sender: TObject; LookupTable: TDataSet; NewValue: String;
  var Accept: Boolean);
begin
If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TfContactabilidadVerificada.cbFijoNotInList(
  Sender: TObject; LookupTable: TDataSet; NewValue: String;
  var Accept: Boolean);
begin
If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TfContactabilidadVerificada.cbTipoCelularNotInList(
  Sender: TObject; LookupTable: TDataSet; NewValue: String;
  var Accept: Boolean);
begin
If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TfContactabilidadVerificada.cbTipoFijoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TfContactabilidadVerificada.cargarTipoCelular();
var xSQL:String;
begin
    xSQL:='SELECT CODTIPCON, CODTIPCAB, DESTIPCON FROM DB2ADMIN.SIO_TIPO_CONTACTO_DET WHERE CODTIPCAB=''01'' ORDER BY CODTIPCON';
    cdsTipoCelular.Close;
    cdsTipoCelular.DataRequest(xSQL);
    cdsTipoCelular.Open;
    cbTipoCelular.LookupField:='CODTIPCON';
    cbTipoCelular.LookupTable := cdsTipoCelular;
    cbTipoCelular.Selected.Clear;
    cbTipoCelular.Selected.Add('CODTIPCON'#9'10'#9'CÓDIGO'#9#9);
    cbTipoCelular.Selected.Add('DESTIPCON'#9'25'#9'TIPO'#9#9);
End;

procedure TfContactabilidadVerificada.cargarTipoFijo();
var xSQL:String;
begin
    xSQL:='SELECT CODTIPCON, CODTIPCAB, DESTIPCON FROM DB2ADMIN.SIO_TIPO_CONTACTO_DET WHERE CODTIPCAB=''04'' ORDER BY CODTIPCON';
    cdsTipoFijo.Close;
    cdsTipoFijo.DataRequest(xSQL);
    cdsTipoFijo.Open;
    cbTipoFijo.LookupField:='CODTIPCON';
    cbTipoFijo.LookupTable := cdsTipoFijo;
    cbTipoFijo.Selected.Clear;
    cbTipoFijo.Selected.Add('CODTIPCON'#9'10'#9'CÓDIGO'#9#9);
    cbTipoFijo.Selected.Add('DESTIPCON'#9'25'#9'TIPO'#9#9);
End;

procedure TfContactabilidadVerificada.cargarTipoCorreo();
var xSQL:String;
begin
    xSQL:='SELECT CODTIPCON, CODTIPCAB, DESTIPCON FROM DB2ADMIN.SIO_TIPO_CONTACTO_DET WHERE CODTIPCAB=''02'' ORDER BY CODTIPCON';
    cdsTipoCorreo.Close;
    cdsTipoCorreo.DataRequest(xSQL);
    cdsTipoCorreo.Open;
    cbTipoCorreo.LookupField:='CODTIPCON';
    cbTipoCorreo.LookupTable := cdsTipoCorreo;
    cbTipoCorreo.Selected.Clear;
    cbTipoCorreo.Selected.Add('CODTIPCON'#9'10'#9'CÓDIGO'#9#9);
    cbTipoCorreo.Selected.Add('DESTIPCON'#9'25'#9'TIPO'#9#9);
End;

procedure TfContactabilidadVerificada.cbTipoCelularCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   seleccionarTipoCelular();
end;

procedure TfContactabilidadVerificada.seleccionarTipoCelular();
begin
   txttiponombrecelular.Text:='';
   If cdsTipoCelular.Locate('CODTIPCON', VarArrayof([cbTipoCelular.Text]), []) Then
   Begin
      txttiponombrecelular.Text := cdsTipoCelular.fieldbyname('DESTIPCON').AsString;
   END;
End;

procedure TfContactabilidadVerificada.seleccionarTipoFijo();
begin
   txttiponombrefijo.Text:='';
   If cdsTipoFijo.Locate('CODTIPCON', VarArrayof([cbTipoFijo.Text]), []) Then
   Begin
      txttiponombrefijo.Text := cdsTipoFijo.fieldbyname('DESTIPCON').AsString;
   END;
End;

procedure TfContactabilidadVerificada.seleccionarTipoCorreo();
begin
   txttiponombrecorreo.Text:='';
   If cdsTipoCorreo.Locate('CODTIPCON', VarArrayof([cbTipoCorreo.Text]), []) Then
   Begin
      txttiponombrecorreo.Text := cdsTipoCorreo.fieldbyname('DESTIPCON').AsString;
   END;
End;

procedure TfContactabilidadVerificada.cbTipoCelularKeyPress(
  Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfContactabilidadVerificada.cbTipoFijoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TfContactabilidadVerificada.cbCodigoTelefonoKeyPress(
  Sender: TObject; var Key: Char);
begin
Key := #0;
end;

procedure TfContactabilidadVerificada.cbFijoKeyPress(Sender: TObject;
  var Key: Char);
begin
Key := #0;
end;

procedure TfContactabilidadVerificada.btnNuevoFijoClick(Sender: TObject);
begin
   btnFijoCancelar.Visible:=true;
   btnNuevoFijo.Visible:=false;
   btnGrabarFijo.Visible:=true;
   cbCodigoTelefono.Visible:=true;
   txtnumerofijo.Visible:=true;
   cbFijo.Visible:=false;
   cbCodigoTelefono.Text:='';
   txtnumerofijo.Text:='';
   lblValidarFijo.Caption:='';
   btnModificarFijo.Visible:=false;
   btnActualizarFijo.Visible:=false;
   lbldepartamento.Visible:=true;
   cbTipoFijo.Text:='';
   txttiponombrefijo.Text:='';
   btnContactarFijo.Visible:=false;

   cargarCodigosTelefono();
   if (trim(FMantAsociado.lkcDpto.Text)<>'') and (cdsCodigosTelefono.Locate('DPTOID', VarArrayof([FMantAsociado.lkcDpto.Text]), [])) Then
   Begin
       cbCodigoTelefono.Text:=  cdsCodigosTelefono.fieldbyname('CODTEL').AsString;
   End;
   seleccionarCodigoTelefono();
end;

procedure TfContactabilidadVerificada.btnFijoCancelarClick(
  Sender: TObject);
begin
   btnFijoCancelar.Visible:=false;
   btnNuevoFijo.Visible:=true;
   btnGrabarFijo.Visible:=false;
   cbCodigoTelefono.Visible:=false;
   txtnumerofijo.Visible:=false;
   cbFijo.Visible:=true;
   cbCodigoTelefono.Text:='';
   txtnumerofijo.Text:='';
   btnModificarFijo.Visible:=true;
   lbldepartamento.Visible:=false;
   btnContactarFijo.Visible:=true;
   seleccionarFijo(cbFijo.Text);
end;

procedure TfContactabilidadVerificada.cbCodigoTelefonoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
    seleccionarCodigoTelefono;
end;
procedure TfContactabilidadVerificada.cbTipoFijoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   seleccionarTipoFijo;
end;

procedure TfContactabilidadVerificada.cbFijoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   seleccionarFijo(cbFijo.Text);
end;

procedure TfContactabilidadVerificada.btnActualizarFijoClick(
  Sender: TObject);
var
  xTelefono:String;
begin
  cargarTelefonosFijos();
  xTelefono:= Telefono(xAsoid);
  seleccionarFijo(xTelefono);
end;

procedure TfContactabilidadVerificada.btnGrabarFijoClick(Sender: TObject);
var xSql:String;
xTelefono:String;
Boton,codtoken:Integer;
begin
  xTelefono:=  cbCodigoTelefono.Text+ txtnumerofijo.Text;
  xSql := 'SELECT DB2ADMIN.SF_SIO_VALIDAR_TELEFONO('+QuotedStr(xTelefono)+') TELEFONO FROM DUAL';
  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(xSQL);
  DM1.cdsQry.Open;
  If DM1.cdsQry.FieldByName('TELEFONO').AsString = '' Then
  Begin
     MessageDlg('EL TELÉFONO FIJO '+TRIM(xTelefono)+' ES INVÁLIDO', mtInformation, [mbOk], 0);
     Exit;
  End;
  If trim(cbTipoFijo.Text)='' Then
  Begin
     MessageDlg('SELECCIONE EL TIPO DE TELÉFONO FIJO', mtInformation, [mbOk], 0);
     Exit;
  End;
  xTelefono:=DM1.cdsQry.FieldByName('TELEFONO').AsString;
  Boton := Application.MessageBox (PAnsiChar('ESTÁ SEGURO DE GRABAR EL NUEVO TELÉFONO FIJO '+xTelefono),'AVISO',MB_YESNO+MB_ICONQUESTION);
  If Boton = ID_YES Then
  begin
      Screen.Cursor := crHourGlass;
      codtoken:=EnviarTokenValidacion(xASODNI,DM1.wUsuario,
       cbTipoFijo.Text,'00011',xTelefono,'',''
      );
      if codtoken>0 then
      Begin
        cargarTelefonosFijos;
        seleccionarFijo(xTelefono);
        cbFijo.Visible:=true;
        cbCodigoTelefono.Visible:=false;
        txtnumerofijo.Visible:=false;
        btnFijoCancelar.Visible:=false;
        btnGrabarFijo.Visible:=false;
        btnNuevoFijo.Visible:=true;
        btnModificarFijo.Visible:=true;
        btnActualizarFijo.Visible:=true;
        lbldepartamento.Visible:=false;
      End;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfContactabilidadVerificada.btnModificarFijoClick(
  Sender: TObject);
var
xTelefono:String;
Boton,codtoken:Integer;
begin
  xTelefono:=cbFijo.Text;
  If trim(xTelefono)='' Then
  Begin
     MessageDlg('SELECCIONE UN TELÉFONO FIJO', mtInformation, [mbOk], 0);
     Exit;
  End;
  If trim(cbTipoFijo.Text)='' Then
  Begin
     MessageDlg('SELECCIONE EL TIPO DE TELÉFONO FIJO', mtInformation, [mbOk], 0);
     Exit;
  End;

  Boton := Application.MessageBox (PAnsiChar('ESTÁ SEGURO DE ACTUALIZAR EL TELÉFONO FIJO '+xTelefono),'AVISO',MB_YESNO+MB_ICONQUESTION);
  If Boton = ID_YES Then
  begin
      Screen.Cursor := crHourGlass;
      codtoken:=EnviarTokenValidacion(xASODNI,DM1.wUsuario,
       cbTipoFijo.Text,'00011',xTelefono,'',''
      );
      if codtoken>0 then
      Begin
        cargarTelefonosFijos;
        seleccionarFijo(xTelefono);
        cbFijo.Visible:=true;
        cbCodigoTelefono.Visible:=false;
        txtnumerofijo.Visible:=false;
        btnFijoCancelar.Visible:=false;
        btnGrabarFijo.Visible:=false;
        btnNuevoFijo.Visible:=true;
        btnModificarFijo.Visible:=true;
        btnActualizarFijo.Visible:=true;
        lbldepartamento.Visible:=false;
      End;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfContactabilidadVerificada.cbTipoCorreoNotInList(
  Sender: TObject; LookupTable: TDataSet; NewValue: String;
  var Accept: Boolean);
begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then
      Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TfContactabilidadVerificada.cbTipoCorreoKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := #0;
end;

procedure TfContactabilidadVerificada.cbTipoCorreoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  seleccionarTipoCorreo()
end;

procedure TfContactabilidadVerificada.btnContactarCelularClick(
  Sender: TObject);
  var xSQL,xCelular:String;
  Boton,RESP:Integer;
begin
    If trim(cbTipoCelular.Text)='' Then
    Begin
       MessageDlg('SELECCIONE EL TIPO DE TELÉFONO CELULAR', mtInformation, [mbOk], 0);
       Exit;
    End;
    Boton := Application.MessageBox (PAnsiChar('¿ESTÁ SEGURO QUE HA CONTACTADO AL DOCENTE '+xASONOMDNI+' CON EL TELÉFONO CELULAR '+cbTelefono.Text+' ?'),'Aviso',MB_YESNO+MB_ICONQUESTION);
    If Boton = ID_YES Then
    Begin
       RESP:=ValidacionContactoManual('MANUAL',xASODNI,DM1.wUsuario,
       cbTipoCelular.Text,'00011',cbTelefono.Text,'','','','','');
       If RESP > 0 Then
       Begin
          cargarCelulares;
          xCelular:= Celular(xAsoid);
          seleccionarCelular(xCelular);
       End;
    End;
end;

Function TfContactabilidadVerificada.ValidacionContactoManual(TIPOVALIDACION,ASODNI,USUREG,CODTIPCON,CODFUECON,TELEFONO,CORREO,ZIPID,ASODIR,ASODIRREF,CODTOKEN:String):Integer;
var
 HTTP1: TIdHTTP;
 Json: string;
 sResponse: string;
 JsonToSend: TStringStream;
 sServidorWeb : String;
 jsonBase:TlkJSONbase;
 obj:TlkJSONobject;
 ICONO:Integer;
begin
     Screen.Cursor := crHourGlass;
     try
       sServidorWeb:=DM1.CrgDescrip('COD_PAR=' + QuotedStr('01'), 'CRE_PAR_GEN_SIS', 'URL_SERVICE_GENERAL');
       sServidorWeb:=sServidorWeb+'/contactabilidad/grabar';
       try
         HTTP1 := TIdHTTP.Create(Self);
         Json:='{'
              +  '"CODTIPCON":"'+CODTIPCON+'","CODFUECON":"'+CODFUECON+'","CORREO":"'+CORREO+'",'
              +  '"TELEFONO":"'+TELEFONO+'",'
              +  '"ASODNI":"'+ASODNI+'","ZIPID":"'+ZIPID+'","ASODIR":"'+ASODIR+'","ASODIRREF":"'+ASODIRREF+'",'
              +  '"USUREG":"'+USUREG+'","TIPOVALIDACION":"'+TIPOVALIDACION+'","CODTOKEN":"'+CODTOKEN+'"'
              +'}';
          JsonToSend := TStringStream.Create(Utf8Encode(Json));

          HTTP1.Request.ContentType := 'application/json';
          sResponse := HTTP1.Post(sServidorWeb, JsonToSend);
          jsonBase := TlkJSON.ParseText(sResponse);
          TlkJSONBase(obj) := TlkJSONobject(jsonBase);
          ICONO:= StrToInt(obj.Field['ICONO'].Value);
          MessageDlg(obj.Field['MENSAJE'].Value, mtInformation,[mbOk],0);
      except
        on E: Exception do
        begin
          Screen.Cursor := crDefault;
          ICONO:=-1;
          MessageDlg('NO ES POSIBLE CONECTAR CON EL SERVICIO DE CONTACTABILIDAD!', mtError,[mbOk],0);
        end;
      end;
    finally
      Screen.Cursor := crDefault;
      JsonToSend.Free;
      HTTP1.Free;
    end;
    RESULT:= ICONO;
end;

procedure TfContactabilidadVerificada.btnContactarFijoClick(
  Sender: TObject);
var xSQL,xFijo:String;
  Boton,RESP:Integer;
begin
    If trim(cbFijo.Text)='' Then
    Begin
       MessageDlg('SELECCIONE UN TELÉFONO FIJO', mtInformation, [mbOk], 0);
       Exit;
    End;
    If trim(cbTipoFijo.Text)='' Then
    Begin
       MessageDlg('SELECCIONE EL TIPO DE TELÉFONO FIJO', mtInformation, [mbOk], 0);
       Exit;
    End;
    Boton := Application.MessageBox (PAnsiChar('¿ESTÁ SEGURO QUE HA CONTACTADO AL DOCENTE '+xASONOMDNI+' CON EL TELÉFONO FIJO '+cbFijo.Text+' ?'),'Aviso',MB_YESNO+MB_ICONQUESTION);
    If Boton = ID_YES Then
    Begin
       RESP:=ValidacionContactoManual('MANUAL',xASODNI,DM1.wUsuario,
       cbTipoFijo.Text,'00011',cbFijo.Text,'','','','','');
       If RESP > 0 Then
       Begin
          cargarTelefonosFijos;
          xFijo:= Telefono(xAsoid);
          seleccionarFijo(xFijo);
       End;
    End;
end;

end.
