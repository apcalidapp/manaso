// Inicio Uso Estándares : 01/08/2011
// Unidad                : ASO260.pas
// Formulario            : FMantAsociado
// Fecha de Creación     : 15/05/2018
// Autor                 : Equipo de Desarrollo de Sistemas DM
// Objetivo              : Mantenimiento de Asociados
// Actualizaciones:
// HPC_201801_MAS
// MAS_201901_HPC        : Homologación
//                       : Se añade registro de consentimiento de datos
// MAS_201902_HPC        : Se modifica un flag de 'N' a 'S'
// MAS_2019_04_HPC       : Cambio de versión
//Inicio HPC_201801_MAS
// MAS_201905_HPC        : Se captura codigo de area en la variable "wCodAre"
//                         Controla el acceso al mantenimiento de cuentas de ahorro para
//                         usuarios de previsión social
// HPC_201906_MAS        : Resoluciones - grabar y ver historial
// MAS_201907_HPC        : Se modifica reportes de cargo de rerepción de expedientes de beneficios
// MAS_201908_HPC        : la URL se cambió por una variable de BD
// MAS_201909_HPC        : Se añade botón para visualizar documentos de no cancelación
// MAS_202001_HPC        : Se valida para que el mensaje sea solo informativo y no restrictivo
//                         Solo temporal hasta el 01/05/2020 y solo para docentes nombrados despues del 01/12/2019
// MAS_202006_HPC        : Cambio de versión y botón para visualizar datos de contrato digital
// MAS_202102_HPC        : se adiciona al momento de grabar la actualización del Telefono1 y asoemail con los ultimos datos de contactabilidad.
// MAS_202103_HPC        : Cambio de versión y modificación de condición para grabar asociados con carnet de extranjeria
// MAS_202104_HPC        : Modificación en la estructura del regimen de pensión y Cambio de versión
// MAS_202105_HPC        : Se adiciona formato de Autorización de descuento
// MAS_202201_HPC        : Se modifica criterio para mostras la fecha de fallecimiento.
// MAS_202204_HPC        : Se valida que al momento de registrar el código modular del asociado este no exista en la base de datos maestra de asociados.
//                       : Cambio de Versión
// MAS_202303_HPC        : Se modificó la forma de acceso al LPDP y cambio de version
// MAS_202403_HPC        : Se añaden campo Turno-CE, estados del beneficio.
UNIT ASO260;

INTERFACE

USES
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, fcButton, fcImgBtn, fcShapeBtn, ExtCtrls, StdCtrls, Buttons,
   wwdblook, wwdbdatetimepicker, Mask, wwdbedit, ComCtrls, InvokeRegistry, Rio,
   SOAPHTTPClient, xmldom, types, jpeg, Grids, ValEdit, DB, DBClient,
   Wwdbigrd, Wwdbgrid, fcLabel, ppBands, ppCtrls,
   ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ppBarCod, IdBaseComponent, IdComponent,
   IdTCPConnection, IdTCPClient, IdFTP, IniFiles, ppStrtch, ppSubRpt,
   Wwdatsrc, wwclient, DBGrids, ppEndUsr, ppParameter, Wwdbdlg,
   WSUbicabilidad, XSBuiltIns, ImageDLLLoader, LinarBitmap, ExtDlgs, FileUtils, SIPSvc, SIPSvcUTIL, ICOLoader, JPEGLoader, PNGLoader, HIPSLoader, BMPLoader, PCXLoader, WMFLoader, ppVar,
   //Inicio MAS_202403_HPC
   ppRichTx,ShellApi,IdHTTP,  rxgif, Animate, GIFCtrl, uLkJSON, ppMemo;  
   //Final MAS_202403_HPC
TYPE

   TFMantAsociado = CLASS(TForm)
      bFirma: TBevel;
      ImaFirma: TImage;
      bFoto: TBevel;
      ImagAso: TImage;
      Shape1: TShape;
      lblAsoApeNom: TLabel;
      Shape7: TShape;
      Shape8: TShape;
      Label36: TLabel;
      Label37: TLabel;
      lblFallecido: TfcLabel;
      bitImpReniec: TBitBtn;
      gbIdentidadAso: TGroupBox;
    lblapepatdni: TLabel;
    lblapematdni: TLabel;
    lblnomdni: TLabel;
      Label25: TLabel;
      Label26: TLabel;
      Label14: TLabel;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      dbeLibDni: TwwDBEdit;
      Panel14: TPanel;
      dbeSexo: TwwDBEdit;
      Panel18: TPanel;
      edtanos: TwwDBEdit;
      pnlRENIEC1: TPanel;
      EdtApePatDni: TwwDBEdit;
      EdtApeMatDni: TwwDBEdit;
      EdtAsoNomDni: TwwDBEdit;
      pnlRENIEC2: TPanel;
      dbdtFecNac: TwwDBDateTimePicker;
      pnlRENIEC3: TPanel;
      DbLlSexo: TwwDBLookupCombo;
      btnactdir: TBitBtn;
      Panel19: TPanel;
      dbeDirec: TwwDBEdit;
      Panel1: TPanel;
      lkcDpto: TwwDBLookupCombo;
      edtDpto: TEdit;
      Panel2: TPanel;
      lkcProv: TwwDBLookupCombo;
      edtProv: TEdit;
      Panel3: TPanel;
      lkcDist: TwwDBLookupCombo;
      edtDist: TEdit;
      gbLaboralAso: TGroupBox;
      Label7: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      lblResNom: TLabel;
      lblFecNom: TLabel;
      lblResCes: TLabel;
      lblFecCes: TLabel;
      Label15: TLabel;
      Label18: TLabel;
      Label19: TLabel;
      Label20: TLabel;
      Label21: TLabel;
      msgReingreso: TLabel;
      DbLlTipAso: TwwDBLookupCombo;
      Panel10: TPanel;
      edtTipAso: TEdit;
      DbLlRegPen: TwwDBLookupCombo;
      Panel7: TPanel;
      edtRegPen: TEdit;
      DbLlAfp: TwwDBLookupCombo;
      Panel8: TPanel;
      EdtAfp: TEdit;
      pnlResoluciones: TPanel;
      dbeNroRes: TwwDBEdit;
      DBDTResNom: TwwDBDateTimePicker;
      dbeNroCes: TwwDBEdit;
      DBDTResCes: TwwDBDateTimePicker;
      DbLUniPro: TwwDBLookupCombo;
      Panel9: TPanel;
      dbeUproDes: TwwDBEdit;
      Panel4: TPanel;
      dbeUpagDes: TwwDBEdit;
      DbLUses: TwwDBLookupCombo;
      Panel5: TPanel;
      dbeUses: TwwDBEdit;
      measodeslab: TwwDBEdit;
      measodirlab: TwwDBEdit;
      lkcDpto2: TwwDBLookupCombo;
      lkcProv2: TwwDBLookupCombo;
      lkcDist2: TwwDBLookupCombo;
      DbLUniPag: TwwDBLookupCombo;
      pnlCodMod: TPanel;
      EdtCodMod: TwwDBEdit;
      lblPrefente: TLabel;
      pnlControl: TPanel;
      Shape2: TShape;
      BitReasignacion: TBitBtn;
      BitResol: TBitBtn;
      BitCuentas: TBitBtn;
      BitSocio: TBitBtn;
      BitPrest: TfcShapeBtn;
      BitMstApo: TfcShapeBtn;
      BitModifica: TBitBtn;
      BitAutDes: TBitBtn;
      BitGrabar: TBitBtn;
      BitVerifica: TBitBtn;
      BitSalir: TBitBtn;
      btnObservacion: TBitBtn;
      BitFichaAso: TBitBtn;
      bbtnN3: TBitBtn;
      bbtnCarta: TBitBtn;	
      pnlEstado: TPanel;
      lblEstado: TLabel;
      bbtnN1: TBitBtn;
      bitAutoriza: TfcShapeBtn;
      bitRechaza: TfcShapeBtn;
      Timer1: TTimer;
      CDSVALIDA: TClientDataSet;
      DSVALIDA: TDataSource;
      ppBDEReniec: TppBDEPipeline;
      PPR1: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppShape42: TppShape;
      ppDBBarCode1: TppDBBarCode;
      ppLabel22: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel30: TppLabel;
      ppLabel56: TppLabel;
      ppLabel58: TppLabel;
      ppMaquina: TppLabel;
      ppLabel80: TppLabel;
      pplCodMod: TppLabel;
      ppLApePat: TppLabel;
      ppLApeMat: TppLabel;
      ppLNombres: TppLabel;
      ppLDni: TppLabel;
      ppLFecNac: TppLabel;
      ppLsexo: TppLabel;
      pptelefono: TppLabel;
      ppLAsoCenLab: TppLabel;
      ppUsuario: TppLabel;
      ppLabel82: TppLabel;
      ppLabel84: TppLabel;
      ppFechaHora: TppLabel;
      ppLAsodir: TppLabel;
      ppLabel29: TppLabel;
      ppLUbigeoDir: TppLabel;
      ppLAsoDirLab: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLUbigeoLab: TppLabel;
      ppLabel33: TppLabel;
      ppImage2: TppImage;
      ppLine1: TppLine;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel43: TppLabel;
      ppLine3: TppLine;
      ppLabel44: TppLabel;
      ppLine4: TppLine;
      ppShape50: TppShape;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel49: TppLabel;
      ppLabel50: TppLabel;
      ppShape51: TppShape;
      ppShape52: TppShape;
      ppShape53: TppShape;
      ppShape94: TppShape;
      ppLabel51: TppLabel;
      ppLabel52: TppLabel;
      ppLabel53: TppLabel;
      ppLabel54: TppLabel;
      ppShape95: TppShape;
      ppShape96: TppShape;
      ppShape97: TppShape;
      ppLabel55: TppLabel;
      ppLabel57: TppLabel;
      ppLabel59: TppLabel;
      ppLabel60: TppLabel;
      ppShape98: TppShape;
      ppShape99: TppShape;
      ppShape100: TppShape;
      ppLabel61: TppLabel;
      ppLabel62: TppLabel;
      ppLabel63: TppLabel;
      ppLabel64: TppLabel;
      ppShape101: TppShape;
      ppLine9: TppLine;
      ppLabel65: TppLabel;
      ppShape54: TppShape;
      ppLabel66: TppLabel;
      ppShape55: TppShape;
      ppShape70: TppShape;
      ppLabel68: TppLabel;
      lblUniPro: TppLabel;
      lblUgel: TppLabel;
      lblCodPag: TppLabel;
      ppLabel76: TppLabel;
      ppLabel77: TppLabel;
      ppLabel78: TppLabel;
      ppLabel79: TppLabel;
      ppLabel81: TppLabel;
      ppLabel83: TppLabel;
      ppLabel85: TppLabel;
      ppLabel86: TppLabel;
      ppLabel87: TppLabel;
      ppLabel88: TppLabel;
      ppLabel89: TppLabel;
      ppLabel90: TppLabel;
      ppLabel91: TppLabel;
      ppLabel92: TppLabel;
      pplestciv: TppLabel;
      ppLabel93: TppLabel;
      ppLabel94: TppLabel;
      ppLabel95: TppLabel;
      ppShape46: TppShape;
      ppLabel96: TppLabel;
      ppShape47: TppShape;
      ppLabel97: TppLabel;
      ppShape48: TppShape;
      ppLDNIFLAG: TppLabel;
      ppLCarnetExtFlag: TppLabel;
      ppLCarnetIdentFlag: TppLabel;
      ppLabel100: TppLabel;
      ppLabel101: TppLabel;
      ppLCtaAhorro: TppLabel;
      ppLabel102: TppLabel;
      ppLine6: TppLine;
      ppLabel98: TppLabel;
      ppLabel99: TppLabel;
      ppLabel103: TppLabel;
      ppLabel104: TppLabel;
      ppLabel105: TppLabel;
      ppLTelefonoRef: TppLabel;
      ppLabel106: TppLabel;
      ppLabel107: TppLabel;
      ppLAsoTelLab: TppLabel;
      ppLabel108: TppLabel;
      ppLabel111: TppLabel;
      ppLabel112: TppLabel;
      ppLabel113: TppLabel;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLabel114: TppLabel;
      ppLine10: TppLine;
      ppImgfoto: TppImage;
      ppLabel115: TppLabel;
      ppLabel116: TppLabel;
      ppLgrado2: TppLabel;
      ppLgrado3: TppLabel;
      ppLgrado4: TppLabel;
      ppLgrado5: TppLabel;
      ppLCondViv2: TppLabel;
      ppLCondViv1: TppLabel;
      ppLCondViv3: TppLabel;
      ppLPropie1: TppLabel;
      ppLPropie2: TppLabel;
      ppLPropie3: TppLabel;
      ppLNegocioNo: TppLabel;
      ppLNegocioSi: TppLabel;
      ppLNroHijos: TppLabel;
      ppLInmueble: TppLabel;
      ppLine5: TppLine;
      ppLabel117: TppLabel;
      ppLabel23: TppLabel;
      ppLabel39: TppLabel;
      ppLabel67: TppLabel;
      ppLabel69: TppLabel;
      ppLabel70: TppLabel;
      ppLFResCes: TppLabel;
      ppLResCes: TppLabel;
      ppLabel72: TppLabel;
      ppLFResNom: TppLabel;
      ppLResNom: TppLabel;
      ppLabel73: TppLabel;
      ppLabel74: TppLabel;
      ppLabel71: TppLabel;
      ppLabel75: TppLabel;
      ppLabel109: TppLabel;
      ppLabel110: TppLabel;
      ppShape49: TppShape;
      ppShape56: TppShape;
      ppLDOFlag: TppLabel;
      ppLCEFlag: TppLabel;
      ppLabel38: TppLabel;
      ppLabel40: TppLabel;
      ppShape43: TppShape;
      ppLabel41: TppLabel;
      ppShape44: TppShape;
      ppLabel42: TppLabel;
      ppShape45: TppShape;
      ppLine2: TppLine;
      ppLRegPen1: TppLabel;
      ppLRegPen2: TppLabel;
      ppLRegPen3: TppLabel;
      pplAFP: TppLabel;
      ppLabel118: TppLabel;
      ppLabel119: TppLabel;
      pplVerificaReniec: TppLabel;
      pplEstadocta: TppLabel;
      ppLabel120: TppLabel;
      ppShape57: TppShape;
      ppLabel121: TppLabel;
      ppLabel122: TppLabel;
      ppLabel123: TppLabel;
      ppShape58: TppShape;
      ppLine11: TppLine;
      pplVehiculoNo: TppLabel;
      pplVehiculoSi: TppLabel;
      pplVehiculo: TppLabel;
      ppImgFrima: TppImage;
      ppLabel124: TppLabel;
      pplDatIncompletos: TppLabel;
      pplSinFot: TppLabel;
      pplSinFirma: TppLabel;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppLabel125: TppLabel;
      ppDetailBand3: TppDetailBand;
      ppDBText21: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLMaquina: TppLabel;
      ppLabel127: TppLabel;
      ppLusuario: TppLabel;
      ppLabel129: TppLabel;
      ppLabel130: TppLabel;
      ppLFechaHora: TppLabel;
      ppLine12: TppLine;
      pplAsoEmail: TppLabel;
      ppSummaryBand2: TppSummaryBand;
      PPDBP1: TppBDEPipeline;
      CDSLISRENIEC: TwwClientDataSet;
      DSLISRENIEC: TwwDataSource;
      PPR2: TppReport;
      ppdb1: TppDBPipeline;
      CDSINCOMPLETOS: TClientDataSet;
      DSINCOMPLETOS: TDataSource;
      CDSOBSSINRESOLVER: TClientDataSet;
      DSOBSSINRESOLVER: TDataSource;
      pnlPrefente: TPanel;
      btnactcenedu: TBitBtn;
      fcsbNoCan: TfcShapeBtn;
    dbeCenEduId: TwwDBEdit;
    Label27: TLabel;
      edtDpto2: TEdit;
      edtProv2: TEdit;
      edtDist2: TEdit;
    ppd3: TppDesigner;
    ppR3: TppReport;
    ppParameterList2: TppParameterList;
    ppParameterList1: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppShape59: TppShape;
    ppLabel126: TppLabel;
    ppLabel128: TppLabel;
    ppLabel131: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLCodMod2: TppLabel;
    pplapepat2: TppLabel;
    pplapemat2: TppLabel;
    ppLNombres2: TppLabel;
    ppLDNI2: TppLabel;
    ppLFecNac2: TppLabel;
    ppLSEXO2: TppLabel;
    ppLTelefono2: TppLabel;
    ppLAsoCenLab2: TppLabel;
    ppLAsodir2: TppLabel;
    ppLabel148: TppLabel;
    ppLUbigeoDir2: TppLabel;
    ppLAsoDirLab2: TppLabel;
    ppLabel151: TppLabel;
    ppLabel152: TppLabel;
    ppLUbigeoLab2: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLabel159: TppLabel;
    ppLabel161: TppLabel;
    ppLGradoInst2: TppLabel;
    ppLabel166: TppLabel;
    ppLUniPro2: TppLabel;
    ppLUgel2: TppLabel;
    ppLCodPag2: TppLabel;
    ppLabel170: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLabel178: TppLabel;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel182: TppLabel;
    ppLabel183: TppLabel;
    ppLEstCiv2: TppLabel;
    ppLNomPad: TppLabel;
    ppLFecAct: TppLabel;
    ppLabel185: TppLabel;
    ppLabel186: TppLabel;
    ppLabel187: TppLabel;
    ppLabel193: TppLabel;
    ppLabel194: TppLabel;
    ppLCtaAhorros2: TppLabel;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel198: TppLabel;
    ppLabel199: TppLabel;
    ppLabel200: TppLabel;
    ppLabel201: TppLabel;
    ppLTelefonoRef2: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLTelfCol2: TppLabel;
    ppLabel206: TppLabel;
    ppLine16: TppLine;
    ppImgfoto2: TppImage;
    ppLabel209: TppLabel;
    ppLTipAso2: TppLabel;
    ppLabel215: TppLabel;
    ppLabel216: TppLabel;
    ppLabel217: TppLabel;
    ppLabel218: TppLabel;
    ppLFResCes2: TppLabel;
    ppLResCes2: TppLabel;
    ppLFResNom2: TppLabel;
    ppLResNom2: TppLabel;
    ppLabel225: TppLabel;
    ppLabel226: TppLabel;
    ppLabel227: TppLabel;
    ppLabel228: TppLabel;
    ppLabel232: TppLabel;
    ppLTipoPension2: TppLabel;
    ppLAFP2: TppLabel;
    ppLEstCta2: TppLabel;
    ppLSINFOT2: TppLabel;
    ppLSINFIRMA2: TppLabel;
    ppLEmail: TppLabel;
    ppLmaquina_2: TppLabel;
    ppLabel249: TppLabel;
    ppLUsuario_2: TppLabel;
    ppLabel251: TppLabel;
    ppLabel252: TppLabel;
    ppLFechaHora_2: TppLabel;
    ppLabel255: TppLabel;
    ppLCondicionViv2: TppLabel;
    ppLabel267: TppLabel;
    ppShape81: TppShape;
    ppLabel268: TppLabel;
    ppShape82: TppShape;
    ppLabel271: TppLabel;
    ppLine20: TppLine;
    ppLine22: TppLine;
    ppLabel282: TppLabel;
    ppImage4: TppImage;
    ppLabel290: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel291: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText22: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLMaquina_3: TppLabel;
    ppLabel293: TppLabel;
    ppLusuario_3: TppLabel;
    ppLabel295: TppLabel;
    ppLabel296: TppLabel;
    ppLFechaHora_3: TppLabel;
    ppLine24: TppLine;
    pplValReniec: TppLabel;
    ppLabel132: TppLabel;
    ppLabel177: TppLabel;
    ppLabel160: TppLabel;
    ppLine13: TppLine;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    pplDatIncompletos2: TppLabel;
    pplblFallecido: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    edtEstadoCivil: TwwDBEdit;
    lblestciv: TLabel;
    ppHeaderBand5: TppHeaderBand;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDetailBand7: TppDetailBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText24: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText23: TppDBText;
    ppDBText27: TppDBText;
    ppDBText11: TppDBText;
    ppDBText6: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDesigner1: TppDesigner;
    btnCtaIndividual: TfcShapeBtn;
    BitFonSol: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    ppImage1: TppImage;
    lblapecasdni: TLabel;
    PnlRENIEC1B: TPanel;
    EdtApeCasDni: TwwDBEdit;
    BitFoto: TPanel;
    ImageBoton: TImage;
    btnHojaCargoExpediente: TBitBtn;
    bgHojaCargoExp: TGroupBox;
    lblHojaCargoExpFecha: TLabel;
    lblHojaCargoExpUsuario: TLabel;
    Label22: TLabel;
    Label31: TLabel;
    pnlCtaTeleAhorro: TPanel;
    dbeCuenta: TwwDBEdit;
    Label23: TLabel;
    Panel17: TPanel;
    dbeSitCta: TwwDBEdit;
    Label52: TLabel;
    Panel20: TPanel;
    dbeCargo: TwwDBEdit;
    Label29: TLabel;
    dblcdCodLeyPen: TwwDBLookupCombo;
    edtCodLeyPen: TwwDBEdit;
    lblCodPensionistaTit: TLabel;
    edtCodPensionista: TwwDBEdit;
    Label32: TLabel;
    dblcdCodPrestacion: TwwDBLookupCombo;
    edtdesprestacion: TwwDBEdit;
    dblTipDoc: TwwDBLookupCombo;
    edtTipDoc: TEdit;
    pnlRENIEC4: TPanel;
    edtnumdoc: TwwDBEdit;
    dblEstadoCivil: TwwDBLookupCombo;
    btnAsignarRegalo: TBitBtn;
    pnlRegPension: TPanel;
    pnlCodPension: TPanel;
    lblversion: TLabel;
    btnContactabilidad: TBitBtn;
    pprEnvioClaveWeb: TppReport;
    ppParameterList3: TppParameterList;
    ppDetailBand8: TppDetailBand;
    ppImage5: TppImage;
    pplNombreClaveWeb: TppLabel;
    pplApePatClaveWeb: TppLabel;
    pplApeMatClaveWeb: TppLabel;
    pplDocIdeClaveWeb: TppLabel;
    pplAsoDirClaveWeb: TppLabel;
    pplRefDirClaveWeb: TppLabel;
    pplDisDirClaveWeb: TppLabel;
    pplProDirClaveWeb: TppLabel;
    pplDepDirClaveWeb: TppLabel;
    pplTelFijClaveWeb: TppLabel;
    pplTelCelClaveWeb: TppLabel;
    pplEmailClaveWeb: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    fcsbConsentimiento: TfcShapeBtn;
    pprHojaCargoExpSedCen: TppReport;
    fcDeclaracion: TfcShapeBtn;
    fcAutorizacion: TfcShapeBtn;
    imgFirma: TImage;
    imgFoto: TImage;
    pnlDatosdigitales: TPanel;
    Button1: TButton;
    Panel6: TPanel;
    edtcelulardigital: TEdit;
    edtCorreodigital: TEdit;
    Label33: TLabel;
    Label34: TLabel;
    edtfuente: TEdit;
    dbgHistorico: TwwDBGrid;
    ppParameterList4: TppParameterList;
    ppHeaderBand4: TppHeaderBand;
    ppImage3: TppImage;
    ppLabel190: TppLabel;
    ppLblTitular: TppLabel;
    pplblDNI: TppLabel;
    pplblTelefonos: TppLabel;
    pplblCorreo: TppLabel;
    pplblUsuario: TppLabel;
    pplblOficina: TppLabel;
    ppLabel208: TppLabel;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    ppLabel184: TppLabel;
    ppLabel188: TppLabel;
    ppletiDNIhojcar: TppLabel;
    ppLine14: TppLine;
    ppLabel195: TppLabel;
    ppLabel169: TppLabel;
    pplFCargo: TppLabel;
    ppLabel192: TppLabel;
    ppLabel202: TppLabel;
    ppLabel205: TppLabel;
    ppLabel207: TppLabel;
    ppLabel210: TppLabel;
    ppLabel211: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel212: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel213: TppLabel;
    pptipobeneficio: TppLabel;
    ppLabel191: TppLabel;
    btnActualizaReniec: TfcShapeBtn;     
    // Inicio: MAS_202309_HPC
    // Nuevos componentes de eqtiquetas
    lblTurnoCE: TLabel;
    meturnoce: TwwDBEdit;
    ppmcuerpohojcargo: TppMemo;
    lbltitestben: TLabel;
    pnlTipBen: TPanel;
    edtTipBen: TEdit;
    edtEstBen: TEdit;
    btncodpago: TBitBtn;
    pnlEstBen: TPanel;
    pnlcodpago: TPanel;
    dbeCodPag: TwwDBEdit;
    ppRReniec: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape41: TppShape;
    ppLabel21: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape79: TppShape;
    ppShape78: TppShape;
    ppShape76: TppShape;
    ppShape77: TppShape;
    ppShape75: TppShape;
    ppShape74: TppShape;
    ppShape40: TppShape;
    ppShape39: TppShape;
    ppShape29: TppShape;
    ppShape19: TppShape;
    ppShape69: TppShape;
    ppShape71: TppShape;
    ppShape32: TppShape;
    ppShape67: TppShape;
    ppShape66: TppShape;
    ppShape65: TppShape;
    ppShape64: TppShape;
    ppShape31: TppShape;
    ppShape28: TppShape;
    ppShape26: TppShape;
    ppShape21: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppShape20: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape27: TppShape;
    ppShape33: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppShape34: TppShape;
    ppShape35: TppShape;
    ppShape36: TppShape;
    ppShape37: TppShape;
    ppShape38: TppShape;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppShape2: TppShape;
    ppFirma: TppImage;
    ppFoto: TppImage;
    ppLabel143: TppLabel;
    ppLabel144: TppLabel;
    pplDocAltRepRen: TppLabel;
    ppShape68: TppShape;
    ppLabel146: TppLabel;
    pplEstCivRepRen: TppLabel;
    pplSexoRepRen: TppLabel;
    pplEstVotRepRen: TppLabel;
    pplGraInsRepRen: TppLabel;
    pplResRepRen: TppLabel;
    ppShape72: TppShape;
    ppLabel145: TppLabel;
    ppShape73: TppShape;
    pplLugDomRepRen: TppLabel;
    ppLabel17: TppLabel;
    ppShape30: TppShape;
    pplPreUrbImpRen: TppLabel;
    ppLabel20: TppLabel;
    pplDesUrbImpRen: TppLabel;
    ppShape60: TppShape;
    ppShape61: TppShape;
    ppShape62: TppShape;
    ppLabel141: TppLabel;
    ppShape63: TppShape;
    pplPreDirImpRen: TppLabel;
    ppLabel147: TppLabel;
    pplDesDirImpRen: TppLabel;
    ppLabel142: TppLabel;
    pplEtaDirImpRen: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    pplPreBloImpRen: TppLabel;
    pplDesBloImpRen: TppLabel;
    ppShape80: TppShape;
    ppShape83: TppShape;
    ppShape84: TppShape;
    ppShape85: TppShape;
    ppLabel153: TppLabel;
    ppLabel162: TppLabel;
    pplPreIntImpren: TppLabel;
    pplDesIntImpRen: TppLabel;
    ppShape86: TppShape;
    ppShape87: TppShape;
    ppLabel163: TppLabel;
    pplNumDirImpRen: TppLabel;
    ppShape88: TppShape;
    ppShape89: TppShape;
    ppShape90: TppShape;
    ppShape91: TppShape;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    pplManImpren: TppLabel;
    pplLotImpren: TppLabel;
    ppLNumLib: TppLabel;

    ppLabel214: TppLabel;
    pplDNIRen: TppLabel;
    pplApePatRen: TppLabel;
    pplApeMatRen: TppLabel;
    pplNomRen: TppLabel;
    ppLApeCasada: TppLabel;


    ppLabel224: TppLabel;
    ppLFecIns: TppLabel;
    ppLFecEmiDoc: TppLabel;
    ppLFecExp: TppLabel;

    ppLLugNac: TppLabel;

    ppLUsuAct: TppLabel;
    ppFooterBand1: TppFooterBand;
    pplFecNacRen: TppLabel;
    lblsinFoto: TfcLabel;
    lblsinFirma: TfcLabel;
    pplblsinFoto: TppLabel;
    pplblsinFirma: TppLabel;
    ppLNomMad: TppLabel;
    ppLEstatura: TppLabel;
    ppLNumdocsus: TppLabel;
    lbleticarext: TLabel;
    pnlRENIEC5: TPanel;
    dbdtFecExpCarExt: TwwDBDateTimePicker;
    cdscarga: TClientDataSet;
      PROCEDURE BitPrestClick(Sender: TObject);
      PROCEDURE BitMstApoClick(Sender: TObject);
      PROCEDURE BitModificaClick(Sender: TObject);
      PROCEDURE BitAutDesClick(Sender: TObject);
      PROCEDURE BitGrabarClick(Sender: TObject);
      PROCEDURE grabar;
      PROCEDURE FormActivate(Sender: TObject);
      PROCEDURE FormClose(Sender: TObject; VAR Action: TCloseAction);
      PROCEDURE FormCreate(Sender: TObject);
      PROCEDURE FormKeyPress(Sender: TObject; VAR Key: Char);
      PROCEDURE DbLlSexoChange(Sender: TObject);
      PROCEDURE DbLlTipAsoChange(Sender: TObject);
      PROCEDURE lkcDptoChange(Sender: TObject);
      PROCEDURE lkcProvChange(Sender: TObject);
      PROCEDURE lkcDistChange(Sender: TObject);
      PROCEDURE DbLlRegPenChange(Sender: TObject);
      PROCEDURE DbLlRegPenExit(Sender: TObject);
      PROCEDURE DbLlAfpChange(Sender: TObject);
      PROCEDURE DbLUniProChange(Sender: TObject);
      PROCEDURE DbLUniPagChange(Sender: TObject);
      PROCEDURE DbLUsesChange(Sender: TObject);
      PROCEDURE lkcDpto2Change(Sender: TObject);
      PROCEDURE lkcProv2Change(Sender: TObject);
      PROCEDURE lkcDist2Change(Sender: TObject);
      PROCEDURE BitResolClick(Sender: TObject);
      PROCEDURE BitCuentasClick(Sender: TObject);
      PROCEDURE BitSocioClick(Sender: TObject);
      PROCEDURE dbeUproDesChange(Sender: TObject);
      PROCEDURE dbeUpagDesChange(Sender: TObject);
      PROCEDURE edtDptoChange(Sender: TObject);
      PROCEDURE edtProvChange(Sender: TObject);
      PROCEDURE edtDpto2Change(Sender: TObject);
      PROCEDURE edtProv2Change(Sender: TObject);
      PROCEDURE BitSalirClick(Sender: TObject);
      PROCEDURE dbdtFecNacChange(Sender: TObject);
      PROCEDURE dbdtFecNacExit(Sender: TObject);
      PROCEDURE Ingresomax();
      PROCEDURE EdtCodModExit(Sender: TObject);
      PROCEDURE ImageBotonClick(Sender: TObject);
      PROCEDURE BitReasignacionClick(Sender: TObject);
      PROCEDURE BitVerificaClick(Sender: TObject);
      PROCEDURE btnActualizaReniecClick(Sender: TObject);
      PROCEDURE Timer1Timer(Sender: TObject);
      PROCEDURE btnObservacionClick(Sender: TObject);
      PROCEDURE DBDTResCesExit(Sender: TObject);
      PROCEDURE dbeLibDniExit(Sender: TObject);
      PROCEDURE GrabacionXX();
      PROCEDURE Grabacion2();
      PROCEDURE bitImpReniecClick(Sender: TObject);
      PROCEDURE BitFichaAsoClick(Sender: TObject);
      PROCEDURE DbLlTipAsoExit(Sender: TObject);
      PROCEDURE Button10Click(Sender: TObject);
      PROCEDURE btnactdirClick(Sender: TObject);
      PROCEDURE dbeTel1Enter(Sender: TObject);
      PROCEDURE dbeTel2Enter(Sender: TObject);
      PROCEDURE bitAutorizaClick(Sender: TObject);
      PROCEDURE bitRechazaClick(Sender: TObject);
      FUNCTION validaAsoDniNuevo(xDni: STRING): boolean;
      PROCEDURE bbtnN3Click(Sender: TObject);
      PROCEDURE bbtnCartaClick(Sender: TObject);
      PROCEDURE bbtnN1Click(Sender: TObject);
      PROCEDURE fcShapeBtn1Click(Sender: TObject);
      PROCEDURE btnactceneduClick(Sender: TObject);
      procedure FechaFall;
    procedure btnacttelClick(Sender: TObject);
    procedure edtCodPensionistaKeyPress(Sender: TObject; var Key: Char);
    procedure btnCtaIndividualClick(Sender: TObject);
    procedure BitFonSolClick(Sender: TObject);
    procedure dbeCodPagExit(Sender: TObject);
    procedure dblcdCodPrestacionExit(Sender: TObject);
    procedure dblcdCodLeyPenExit(Sender: TObject);
    procedure btnHojaCargoExpedienteClick(Sender: TObject);
    procedure dblTipDocChange(Sender: TObject);
    procedure edtnumdoc1KeyPress(Sender: TObject; var Key: Char);
    procedure edtnumdoc1Exit(Sender: TObject);
    procedure btnAsignarRegaloClick(Sender: TObject);
    procedure btnContactabilidadClick(Sender: TObject);
    Procedure LlenaConfirmacion(xAsoDni:String);
    procedure pprHojaCargoExpSedCenPrintingComplete(Sender: TObject);
    procedure fcsbConsentimientoClick(Sender: TObject);
    procedure pprEnvioClaveWebPrintingComplete(Sender: TObject);
    procedure pprHojaCargoExpSedCenPrintDialogClose(Sender: TObject);
    procedure fcDeclaracionClick(Sender: TObject);
    procedure fcAutorizacionClick(Sender: TObject);
    procedure CreaDM_CtaInd;
    procedure fcsbNoCanClick(Sender: TObject);
    procedure btndatdigitalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btncodpagoClick(Sender: TObject);
    procedure btnInscarextClick(Sender: TObject);
    procedure edtnumdocExit(Sender: TObject);
    procedure dbdtFecExpCarExtExit(Sender: TObject);
    procedure edtnumdocKeyPress(Sender: TObject; var Key: Char);
    procedure dbeLibDniKeyPress(Sender: TObject; var Key: Char);
   Private
    { Private declarations }
      FUNCTION MaxNroItem(xAsoId: STRING): STRING;
      FUNCTION validaAsoDni(xDni: STRING): boolean;
      PROCEDURE ActivaFoco;
      PROCEDURE GrabaArchivo(xImage: TByteDynArray; NomArchivo: STRING);
      PROCEDURE deshabilitaBotones;
      PROCEDURE GrabaLogImpFicha();
      PROCEDURE CargaMemStreamImg();
      PROCEDURE llenaCamposValida;
      PROCEDURE VerificaCamposValidados();
      PROCEDURE ValAsoPrev(xnombres: STRING);
      FUNCTION GrabaApo201: Boolean;
      Procedure GrabarSexo;
      procedure ConsultaReniec;
      PROCEDURE DeGifJpg(xGif, xJpg: STRING);
      PROCEDURE GrabafotoAtabla(xDni: STRING);
      Procedure BorraFotos; 
      Function Validacionautomatica(xDNi,xAsoid:String):Boolean;
      Procedure GrabaValidacion();
      procedure fn_muestra_msj_hoja_cargo_exp(psAsoid: string);
      Function estadocivil(xestado: String):String;
      Procedure editaRENIEC();
      Function GrabaApo201NO_DNI: Boolean;
      Function validaNumerodoc(xnumerodoc:String):Boolean;
      procedure VisbtnNoCancelacion;
   Public
    { Public declarations }
      xcodcargo : String;
      xsinvalidar: integer;
      xactimp:String;
      Reg : TlkJSONobject;
      edtanos2, xReniec, xgrabo, xvalido, xYaGrabe: STRING;
      SearchResult: CPersonData2;
      Photo, Signature: TByteDynArray;
      FindByDocumentResult: Int64;
      //Reg : CPersonData2;
      sFirmaCarta: STRING;
      Cargado: boolean;
      xusuRENIEC,xActRENIEC : String;
//Inicio MAS_201908_HPC
//Variable para dirección de Reniec
      V_URL_RENIEC :String;
      Jpg01,Jpg02 : TJpegImage;
      Stream01,Stream02: TMemoryStream;
//Fin MAS_201908_HPC
      xTIPDOCCOD : String;
      flagFallecido:boolean;
//Inicio MAS_202303_HPC
      CONCONSENTIMIENTO:string;
//Fin MAS_202303_HPC
      Procedure Apo201_NueCLi();
      PROCEDURE SetTabla(sTabla: STRING);
      PROCEDURE pintaCamposValidados(xform: tform);
      PROCEDURE Registro_Aud(xAsoId, xSecuencia, xCodReg: STRING);
      FUNCTION CodReg(): STRING;
      PROCEDURE VerificaSinData(xVerData, xfaltante: STRING);
      FUNCTION VerifGraba(): Boolean;
      PROCEDURE DesactivaPantPrincipal;
      PROCEDURE ActivaPantPrincipal;
      PROCEDURE FichaActualizacion2();
      PROCEDURE ObsSinResolver(xasoid: STRING);
      PROCEDURE validar();
      PROCEDURE ModiDestinofTickes();
      PROCEDURE ExisteSolicitud;
      PROCEDURE ActivaSalir;
      FUNCTION AsignaSolicitud: STRING;
      FUNCTION AsignaAsoId: STRING;
      PROCEDURE CargaFicha;
      PROCEDURE ActualizaColegios;
      FUNCTION emailValido(CONST Value: String): boolean;
      FUNCTION CheckAllowed(CONST s: String): boolean;
      PROCEDURE ValidarAsignarRegalo;
      procedure imprimehojacargo;
      procedure grabaimp_hojacargo;
      PROCEDURE CargaImagenes;
      procedure CargaImagenesFromDataBase;
      Procedure ActivaBotonConsentimiento;
   END;


VAR
   FMantAsociado: TFMantAsociado;
   SearchResult: CPersonData2;
   ISipObj : ISIPService;
   xModifDNI: boolean;
   xInsertaTicket : boolean;

CONST
   MARGEN = 8; //8 Pixels

IMPLEMENTATION


USES  ASODM, DateUtils,  Math,
  ASO908,  ASO936, ASO260J, ASO260H, ASO916, ASO958B,ASO964,ASO938,ASO943,ASO260C,
  ASO958D, ASO260G, ASO260F, ASO260E, ASO907, ASO903B, ASO261,ASO260K,ASO959,
// Inicio  MAS_201901_HPC : Consulta de Contactabilidad
  ASO957, ASO260I, ASO900, ASO944, ASO948, ASO260A,ASO260N,
    // Inicio: MAS_201901_HPC
  // Nuevas unidades de consentimiento de datos
  // Inicio: MAS_201907_HPC
  // Se añade nueva unidad "ASO260L"
  // ASO276, ASO269, ASO268;
  ASO276,  ASO260L, PREDMCI, PRE295CI, ASO205B,
  CRE989, ASO260M, ASO260O, ASO271, COB903, ASO260P, ASO260Q, ASO260R;
  // Fin: MAS_201907_HPC
  // Fin: MAS_201901_HPC
// Fin  MAS_201901_HPC : Consulta de Contactabilidad
{$R *.dfm}

PROCEDURE TFMantAsociado.SetTabla(sTabla: STRING);
BEGIN
   DM1.sAPO201 := sTabla;
END;

PROCEDURE TFMantAsociado.deshabilitaBotones;
BEGIN
  shape2.Enabled:=false;
  BitPrest.Enabled:=false;
  BitMstApo.Enabled:=false;
  BitModifica.Enabled:=false;
  BitFichaAso.Enabled:=false;
  BitAutDes.Enabled:=false;
  bbtnCarta.Enabled:=false;
  BitGrabar.Enabled:=false;
  bbtnN3.Enabled:=false;
  BitVerifica.Enabled:=false;
  btnObservacion.Enabled:=false;
  BitReasignacion.Enabled:=false;
  BitResol.Enabled:=false;
  BitCuentas.Enabled:=false;
  BitSocio.Enabled:=false;
  btncodpago.Enabled := False;

END;

procedure TFMantAsociado.ConsultaReniec;
VAR
   dwToken, FindByNameResult: Int64;
   lin: integer;
   arr: CPersonDataMember2;
   xDNI:String;
   codOpcion,xfechaFallecido,xFallecido:String;
BEGIN
   // Validando que no sea extranjero
   // If (DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '04') Or  ( Length(Trim(DM1.cdsAso.FieldByName('ASODNI').AsString)) <> 8) Then
   If (dblTipDoc.Text = '04') Then
   Begin
      MessageDlg('Docente extranjero.', mtWarning,[mbOk],0);
      Exit;
   End;
   If (Length(Trim(dbeLibDni.Text)) <> 8) Then
   Begin
      MessageDlg('DNI no valido.', mtWarning,[mbOk],0);
      Exit;
   End;   
   // Begin
   //   MessageDlg('Docente extranjero o DNI no valido.', mtWarning,[mbOk],0);
   //   Exit;
   // End;
  bitImpReniec.Enabled:= false;
  xDNI:=edtnumdoc.Text;
  if (xDNI = '') then
  begin
    xDNI:=dbeLibDni.Text;
  end;
  if ( (DM1.XINSERTA = '10') or (DM1.XINSERTA = '11') ) then
  begin
  end
  else
  begin
     xFallecido:=DM1.DevuelveValor('APO201', 'FALLECIDO', 'ASODNI', (xDNI));
     If(xFallecido = 'S') then
     begin
        flagFallecido:=true;
        lblFallecido.Visible:=true;
        bitImpReniec.Enabled:= true;
        MessageDlg('DOCENTE FALLECIDO !!!', mtError,[mbOk],0);
     end;
  end;
  if ( DM1.xInsert = '1' ) then
  begin  
     codOpcion:='000386';
  end
  else
  begin
    codOpcion:='000385';
  end;
  Try
     Reg :=DM1.ConsultaReniec(Trim(xDNI),codOpcion,DM1.wUsuario,false);
  Except
     On E: Exception do
     Begin
        MessageDlg('NO ES POSIBLE CONECTAR CON EL SERVICIO CONSULTA RENIEC!', mtError,[mbOk],0);
        Reg:= nil;
        Exit;
     End;
  End;
  try
    if ( Reg.Field['ERROR'].value <> null ) then
    begin
      MessageDlg(Reg.Field['MENSAJE'].Value, mtError,[mbOk],0);
      Exit;
    end;
  except
    on E: Exception do
    begin
    end;
  end;
  if ( Reg.Field['MENSAJE'].value <> null ) then
  begin
    MessageDlg(Reg.Field['MENSAJE'].Value, mtError,[mbOk],0);
    if (Reg.Field['ICONO'].value = 0) then
       Exit;
  end;

  if ( (DM1.XINSERTA = '10') or (DM1.XINSERTA = '11') ) then
  begin
  end
  else
  begin
     xFallecido:=DM1.DevuelveValor('APO201', 'FALLECIDO', 'ASODNI', (xDNI));
     If(xFallecido = 'S') then
     begin
      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString := VarToStrDef(Reg.Field['APEPAT'].Value,'');
      DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString := VarToStrDef(Reg.Field['APEMAT'].Value,'');
      DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString := VarToStrDef(Reg.Field['APECAS'].Value,'');
      DM1.cdsAso.FieldByName('ASONOMDNI').AsString    := VarToStrDef(Reg.Field['NOMBRE'].Value,'');
      DM1.cdsAso.FieldByName('ASOFECNAC').AsString    := VarToStrDef(Reg.Field['FECNAC'].Value,'');
      DM1.cdsAso.FieldByName('ASOSEXO').AsString := copy(VarToStrDef(Reg.Field['SEXO'].Value,''),1,1);
      DM1.cdsAso.FieldByName('ESTCIVID').AsString := DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,''),2);
      flagFallecido:=true;
      lblFallecido.Visible:=true;
      bitImpReniec.Enabled:= true;
      edtEstadoCivil.EditText := VarToStrDef(Reg.Field['ESTCIV'].Value,'');
      MessageDlg('DOCENTE FALLECIDO !!!', mtError,[mbOk],0);
     end;
  end;

  if ( (DM1.XINSERTA = '11') ) then      //NUEVO
  begin
    LlenaConfirmacion(xDNI);
  end
  else if ( (DM1.XINSERTA = '10') ) then  //NUEVO_MODIFICA
  begin
     if ( (DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString <> VarToStrDef(Reg.Field['APEPAT'].Value,'')) or (DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString <> VarToStrDef(Reg.Field['APEMAT'].Value,''))  or
          (DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString <> VarToStrDef(Reg.Field['APECAS'].Value,'')) or (DM1.cdsAso.FieldByName('ASONOMDNI').AsString <> VarToStrDef(Reg.Field['NOMBRE'].Value,''))  or
           (DM1.cdsAso.FieldByName('ASOFECNAC').AsString <> VarToStrDef(Reg.Field['FECNAC'].Value,'')) or (DM1.cdsAso.FieldByName('ASOSEXO').AsString <> copy(VarToStrDef(Reg.Field['SEXO'].Value,''),1,1))
            or (DM1.cdsAso.FieldByName('ESTCIVID').AsString <> DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,''),2)) ) then
     begin
       LlenaConfirmacion(xDNI);
       pintaCamposValidados(Self);
     end
     else
     begin
       bitImpReniec.Enabled:=true;
       btnActualizaReniec.Enabled:=false;
       btnActualizaReniec.Font.Color := clWhite;
       xReniec:= 'S';
       xActRENIEC:='S';
       GrabarSexo;
     end;
  end
  else   //MODIFICA
  begin
    if ( (DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString <> VarToStrDef(Reg.Field['APEPAT'].Value,'')) or (DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString <> VarToStrDef(Reg.Field['APEMAT'].Value,''))  or
          (DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString <> VarToStrDef(Reg.Field['APECAS'].Value,'')) or (DM1.cdsAso.FieldByName('ASONOMDNI').AsString <> VarToStrDef(Reg.Field['NOMBRE'].Value,''))  or
           (DM1.cdsAso.FieldByName('ASOFECNAC').AsString <> VarToStrDef(Reg.Field['FECNAC'].Value,'')) or (DM1.cdsAso.FieldByName('ASOSEXO').AsString <> copy(VarToStrDef(Reg.Field['SEXO'].Value,''),1,1))
            or (DM1.cdsAso.FieldByName('ESTCIVID').AsString <> DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,''),2)) ) then
     begin
       LlenaConfirmacion(xDNI);
       pintaCamposValidados(Self);
     end
  else
  begin
    DM1.cdsAso.Close;
    DM1.cdsAso.DataRequest(DM1.XSQL_global);
    DM1.cdsAso.Open;
    IF ( (DbLlSexo.Text = '') OR (Dm1.cdsAso.Fieldbyname('ESTCIVID').AsString='') ) THEN   GrabarSexo;
    Dm1.cdsUSES.Locate('ESTCIVID',Dm1.cdsAso.Fieldbyname('ESTCIVID').AsString,[]);
    IF DbLlSexo.Text = 'F' THEN
    begin
       dblEstadoCivil.Text := DM1.cdsUSES.FieldByName('ESTCIVDESFEM').AsString;
       edtEstadoCivil.EditText := dblEstadoCivil.Text;
    end
    Else
    begin
      dblEstadoCivil.Text := DM1.cdsUSES.FieldByName('ESTCIVDES').AsString;
      edtEstadoCivil.EditText := dblEstadoCivil.Text;
    end;
       btnActualizaReniec.Enabled:=false;
       btnActualizaReniec.Font.Color := clWhite;
    bitImpReniec.Enabled:=true;
    xReniec:= 'S';
    xActRENIEC:='S';
    pintaCamposValidados(Self);
  end;
  end;
  //carga imagenes del response del json
  ShowImageFromBase64(Reg.Field['FOTO'].Value, imagAso);
  ShowImageFromBase64(Reg.Field['FIRMAJPG'].Value, imaFirma);
  ImageBoton.Picture.Assign(imagAso.Picture);
  ImageBoton.Enabled:=true;
  lblsinFoto.Visible:=false;
  lblsinFirma.Visible:=false;
End;

Procedure TFMantAsociado.LlenaConfirmacion(xAsoDni:String);
Var xFirma, xFoto: String;
PictureFoto,PictureFirma: TPicture;
Begin
   //carga imagenes del response del json
   ShowImageFromBase64(Reg.Field['FOTO'].Value, imgFoto);
   ShowImageFromBase64(Reg.Field['FIRMAJPG'].Value, imgFirma);
   FMantAsociadoConfirmaReniec := TFMantAsociadoConfirmaReniec.create(self);
   PictureFoto := TPicture.Create;
   PictureFirma := TPicture.Create;
   PictureFoto.Graphic := imgFoto.Picture.Graphic;
   PictureFirma.Graphic := imgFirma.Picture.Graphic;
   FMantAsociadoConfirmaReniec.ImgFotoConfirme.Picture.Assign(PictureFoto);
   FMantAsociadoConfirmaReniec.ImgFirmaConfirme.Picture.Assign(PictureFirma);
   
   FMantAsociadoConfirmaReniec.sDocument               := VarToStrDef(Reg.Field['ASODNI'].Value,'');
   FMantAsociadoConfirmaReniec.sLastName1              := VarToStrDef(Reg.Field['APEPAT'].Value,'');
   FMantAsociadoConfirmaReniec.sLastName2              := VarToStrDef(Reg.Field['APEMAT'].Value,'');
   FMantAsociadoConfirmaReniec.sFirstName              := VarToStrDef(Reg.Field['NOMBRE'].Value,'');
   FMantAsociadoConfirmaReniec.sMerriedName            := VarToStrDef(Reg.Field['APECAS'].Value,'');
   FMantAsociadoConfirmaReniec.sMotherName             := VarToStrDef(Reg.Field['NOMMAD'].Value,'');
   FMantAsociadoConfirmaReniec.sFatherName             := VarToStrDef(Reg.Field['NOMPAD'].Value,'');
   FMantAsociadoConfirmaReniec.sCivilStateCode         := VarToStrDef(Reg.Field['CODESTCIV'].Value,'');
   FMantAsociadoConfirmaReniec.sCivilState             := VarToStrDef(Reg.Field['ESTCIV'].Value,'');
   FMantAsociadoConfirmaReniec.sGender                 := VarToStrDef(Reg.Field['SEXO'].Value,'');
   FMantAsociadoConfirmaReniec.sAltDocumentType        := VarToStrDef(Reg.Field['CODDOCSUS'].Value,'');
   FMantAsociadoConfirmaReniec.sAltDocumentTypeDes     := VarToStrDef(Reg.Field['DESDOCSUS'].Value,'');
   FMantAsociadoConfirmaReniec.sAltDocument            := VarToStrDef(Reg.Field['NUMDOCSUS'].Value,'');
   FMantAsociadoConfirmaReniec.sVoteStatus             := VarToStrDef(Reg.Field['FLACONVOT'].Value,'');
   FMantAsociadoConfirmaReniec.sRegisterDate           := VarToStrDef(Reg.Field['FECINS'].Value,'');
   FMantAsociadoConfirmaReniec.sExpeditionDate         := VarToStrDef(Reg.Field['FECEMIDOC'].Value,'');
   FMantAsociadoConfirmaReniec.sExpirationDate         := VarToStrDef(Reg.Field['FECEXP'].Value,'');
   FMantAsociadoConfirmaReniec.sInstGrade              := VarToStrDef(Reg.Field['CODGRAINS'].Value,'');
   FMantAsociadoConfirmaReniec.sInstGradeDes           := VarToStrDef(Reg.Field['DESGRAINS'].Value,'');
   FMantAsociadoConfirmaReniec.sRestrictionCode        := VarToStrDef(Reg.Field['CODRES'].Value,'');
   FMantAsociadoConfirmaReniec.sRestrictionDes         := VarToStrDef(Reg.Field['RESTRICCIONES'].Value,'');
   FMantAsociadoConfirmaReniec.sAddDepUbigCode         := VarToStrDef(Reg.Field['CODUBIDEPDOM'].Value,'');
   FMantAsociadoConfirmaReniec.sDepartmentAddress      := VarToStrDef(Reg.Field['DESDEPDOM'].Value,'');
   FMantAsociadoConfirmaReniec.sAddProvUbigCode        := VarToStrDef(Reg.Field['CODUBIPRODOM'].Value,'');
   FMantAsociadoConfirmaReniec.sProvinceAddress        := VarToStrDef(Reg.Field['DESPRODOM'].Value,'');
   FMantAsociadoConfirmaReniec.sAddDistUbigCode        := VarToStrDef(Reg.Field['CODUBIDISDOM'].Value,'');
   FMantAsociadoConfirmaReniec.sDistritAddress         := VarToStrDef(Reg.Field['DESDISDOM'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressUrbPrefix       := VarToStrDef(Reg.Field['PRECODURBAN'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressUrbPrefixDes    := VarToStrDef(Reg.Field['PREDESURBAN'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressUrb             := VarToStrDef(Reg.Field['DESURBAN'].Value,'');
   FMantAsociadoConfirmaReniec.sAddPrefix              := VarToStrDef(Reg.Field['PRECODDIRECC'].Value,'');
   FMantAsociadoConfirmaReniec.sAddPrefixDes           := VarToStrDef(Reg.Field['PREDESDIRECC'].Value,'');
   FMantAsociadoConfirmaReniec.sAddress                := VarToStrDef(Reg.Field['DESDIRECC'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressEt              := VarToStrDef(Reg.Field['DESETAPA'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressBlock           := VarToStrDef(Reg.Field['DESBLOCK'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressBlockPrefix     := VarToStrDef(Reg.Field['PRECODBLOCK'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressBlockPrefixDes  := VarToStrDef(Reg.Field['PREDESBLOCK'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressIntPrefix       := VarToStrDef(Reg.Field['PRECODINTER'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressIntPrefixDes    := VarToStrDef(Reg.Field['PREDESINTER'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressInterior        := VarToStrDef(Reg.Field['DESINTER'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressLt              := VarToStrDef(Reg.Field['DESLOTE'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressMz              := VarToStrDef(Reg.Field['DESMANZA'].Value,'');
   FMantAsociadoConfirmaReniec.sAddressNumber          := VarToStrDef(Reg.Field['NUMDIRECC'].Value,'');
   FMantAsociadoConfirmaReniec.sBornDate               := VarToStrDef(Reg.Field['FECNAC'].Value,'');
   FMantAsociadoConfirmaReniec.sBornDepartmentUbigCode := VarToStrDef(Reg.Field['CODUBIDEPNAC'].Value,'');
   FMantAsociadoConfirmaReniec.sBornDepartment         := VarToStrDef(Reg.Field['DESDEPNAC'].Value,'');
   FMantAsociadoConfirmaReniec.sBonrProvinceUbigCode   := VarToStrDef(Reg.Field['CODUBIPRONAC'].Value,'');
   FMantAsociadoConfirmaReniec.sBornProvince           := VarToStrDef(Reg.Field['DESPRONAC'].Value,'');
   FMantAsociadoConfirmaReniec.sBonrDistritUbigCode    := VarToStrDef(Reg.Field['CODUBIDISNAC'].Value,'');
   FMantAsociadoConfirmaReniec.sBornDistrit            := VarToStrDef(Reg.Field['DESDISNAC'].Value,'');
   FMantAsociadoConfirmaReniec.nHeight                 := StrToFloat(VarToStrDef(Reg.Field['ESTATURA'].Value,''));
   FMantAsociadoConfirmaReniec.lblFecAct.Caption       := VarToStrDef(Reg.Field['FECACT'].Value,'');
   FMantAsociadoConfirmaReniec.lblUsuAct.Caption       := VarToStrDef(Reg.Field['USUACT'].Value,'');
   FMantAsociadoConfirmaReniec.lblMsj.Caption          := VarToStrDef(Reg.Field['MENSAJE'].Value,'');
   FMantAsociadoConfirmaReniec.MuestraDatos;
   FMantAsociadoConfirmaReniec.ShowModal;
   If FMantAsociadoConfirmaReniec.bCancela Then
   begin
     bitImpReniec.Enabled:=true;
     xReniec:= 'S';
     xActRENIEC:='S';
   end;
   If FMantAsociadoConfirmaReniec.bConfirmado Then
   begin
    grabar;
   end;
   FMantAsociadoConfirmaReniec.Free;
End;

PROCEDURE TFMantAsociado.bitImpReniecClick(Sender: TObject);
VAR XSQL:STRING;
xFirma,xFoto:String;
PictureFoto,PictureFirma: TPicture;
BEGIN
   If dblTipDoc.Text = '04' Then
   Begin
      Try
         Fmuescarneextranjeria := TFmuescarneextranjeria.Create(Self);
         Fmuescarneextranjeria.ShowModal;
      Finally
         Fmuescarneextranjeria.Free;
      End;
      Exit;
   End;
   try
      if ( Reg.Field['ERROR'].value <> null ) then
      begin
         MessageDlg(Reg.Field['MENSAJE'].Value, mtError,[mbOk],0);
         Exit;
      end;
   except
   on E: Exception do
      begin
      end;
   end;

   if ( (Reg.Field['ICONO'].value = 0) and (Reg.Field['MENSAJE2'].value <> null) ) then
   begin
      MessageDlg(Reg.Field['MENSAJE2'].Value+'!!!. -'+Reg.Field['MENSAJE'].Value, mtError,[mbOk],0);
      Exit;
   end;

   // presentar FOTO
   if(Reg.Field['FOTO'].Value <> '') then
   begin
     try
       //carga imagenes del response del json
       ShowImageFromBase64(Reg.Field['FOTO'].Value, imgFoto);
	 Except
       pplblsinFoto.Visible:=true;
	 end;
   end;
   // presentar FIRMA
   if(Reg.Field['FIRMA'].Value <> '') then
   begin
     try
     //carga imagenes del response del json
       ShowImageFromBase64(Reg.Field['FIRMAJPG'].Value, imgFirma);
	 Except
       pplblsinFirma.Visible:=true;
	 end;
   end;
   pplDocAltRepRen.Caption := VarToStrDef(Reg.Field['CODDOCSUS'].Value,'')+'-'+VarToStrDef(Reg.Field['DESDOCSUS'].Value,'');
   pplEstCivRepRen.Caption := VarToStrDef(Reg.Field['CODESTCIV'].Value,'') +'-'+VarToStrDef(Reg.Field['ESTCIV'].Value,'');
   pplSexoRepRen.Caption   := Copy(VarToStrDef(Reg.Field['SEXO'].Value,''),1,1) +'-'+VarToStrDef(Reg.Field['SEXO'].Value,'');
   pplEstVotRepRen.Caption := VarToStrDef(Reg.Field['FLACONVOT'].Value,'')+'-'+VarToStrDef(Reg.Field['DESVOT'].Value,'');
   pplGraInsRepRen.Caption := VarToStrDef(Reg.Field['CODGRAINS'].Value,'')+'-'+VarToStrDef(Reg.Field['GRAINS'].Value,'');
   pplResRepRen.Caption    := VarToStrDef(Reg.Field['CODRES'].Value,'')+'-'+VarToStrDef(Reg.Field['RESTRICCIONES'].Value,'');
   pplLugDomRepRen.Caption := VarToStrDef(Reg.Field['LUGDOM'].Value,'');
   pplPreUrbImpRen.Caption := VarToStrDef(Reg.Field['PRECODURBAN'].Value,'')+'-'+VarToStrDef(Reg.Field['PREDESURBAN'].Value,'');
   pplPreUrbImpRen.Caption := VarToStrDef(Reg.Field['PRECODURBAN'].Value,'')+'-'+VarToStrDef(Reg.Field['PREDESURBAN'].Value,'');
   pplDesUrbImpRen.Caption := VarToStrDef(Reg.Field['DESURBAN'].Value,'');
   pplPreDirImpRen.Caption := VarToStrDef(Reg.Field['PRECODDIRECC'].Value,'')+'-'+VarToStrDef(Reg.Field['PREDESDIRECC'].Value,'');
   pplDesDirImpRen.Caption := VarToStrDef(Reg.Field['DESDIRECC'].Value,'');
   pplNumDirImpRen.Caption := VarToStrDef(Reg.Field['NUMDIRECC'].Value,'');
   pplEtaDirImpRen.Caption := VarToStrDef(Reg.Field['DESETAPA'].Value,'');
   pplPreBloImpRen.Caption := VarToStrDef(Reg.Field['PRECODBLOCK'].Value,'')+'-'+ VarToStrDef(Reg.Field['PREDESBLOCK'].Value,'');
   pplDesBloImpRen.Caption := VarToStrDef(Reg.Field['DESBLOCK'].Value,'');
   pplPreIntImpren.Caption := VarToStrDef(Reg.Field['PRECODINTER'].Value,'')+'-'+VarToStrDef(Reg.Field['PREDESINTER'].Value,'');
   pplDesIntImpRen.Caption := VarToStrDef(Reg.Field['DESINTER'].Value,'');
   pplManImpren.Caption    := VarToStrDef(Reg.Field['DESMANZA'].Value,'');
   pplLotImpren.Caption    := VarToStrDef(Reg.Field['DESLOTE'].Value,'');
   ppLNumLib.Caption    :=  VarToStrDef(Reg.Field['NUMLIB'].Value,'');
   pplDNIRen.Caption       :=  VarToStrDef(Reg.Field['ASODNI'].Value,'');
   pplApePatRen.Caption    := VarToStrDef(Reg.Field['APEPAT'].Value,'');
   pplApeMatRen.Caption    := VarToStrDef(Reg.Field['APEMAT'].Value,'');
   pplNomRen.Caption   := VarToStrDef(Reg.Field['NOMBRE'].Value,'');
   ppLApeCasada.Caption := VarToStrDef(Reg.Field['APECAS'].Value,'');
   ppLNomPad.Caption    :=  VarToStrDef(Reg.Field['NOMPAD'].Value,'');
   ppLNomMad.Caption    := VarToStrDef(Reg.Field['NOMMAD'].Value,'');
   ppLEstatura.Caption  := VarToStrDef(Reg.Field['ESTATURA'].Value,'');
   ppLNumdocsus.Caption := VarToStrDef(Reg.Field['NUMDOCSUS'].Value,'');
   ppLFecIns.Caption    := VarToStrDef(Reg.Field['FECINS'].Value,'');
   ppLFecEmiDoc.Caption := VarToStrDef(Reg.Field['FECEMIDOC'].Value,'');
   ppLFecExp.Caption    := VarToStrDef(Reg.Field['FECEXP'].Value,'');
   pplFecNacRen.Caption    := VarToStrDef(Reg.Field['FECNAC'].Value,'');
   ppLLugNac.Caption    := VarToStrDef(Reg.Field['LUGNAC'].Value,'');
   ppLFecAct.Caption    := VarToStrDef(Reg.Field['FECACT'].Value,'');
   ppLUsuAct.Caption    := VarToStrDef(Reg.Field['USUACT'].Value,'');
   PictureFoto := TPicture.Create;
   PictureFirma := TPicture.Create;
   PictureFoto.Graphic := imgFoto.Picture.Graphic;
   PictureFirma.Graphic := imgFirma.Picture.Graphic;
   ppFoto.Picture.Assign(PictureFoto);
   ppFirma.Picture.Assign(PictureFirma);
   ppRReniec.Print;
   ppRReniec.Stop;



END;

Procedure TFMantAsociado.grabar;
Var
   xsql, xAsoDni, xAsoid, xSolicitud: String;
   xSexo, xEstCiv, xrestriccion, xgrains:String;
   xItem : String;
   xasotipid,xCuenta :  String;

   xAsoApeNomDni: String;
   wsUbica: WSUbicabilidadSoap;
   dir: ASO_UBICA_DIR_HIS;
   fecAct: TXSDateTime;
   hayRegReniec: boolean;
   hayRegPrevioReniec: boolean;
   xfechaFallecido,xSQLFallecido: String;
   xExiste: Real;
Begin
   //Adicionar en Solicitud de Cliente Nuevo
   IF ( DM1.xInsert = '1' ) then
   BEGIN
      //Si aun no tiene asignado un código de solicitud
      If DM1.cdsAso.fieldbyname('SOLICITUD').AsString = '' Then
      Begin
         xSolicitud := AsignaSolicitud;
         xAsoid := AsignaAsoId;
         xSQL := 'INSERT INTO ' + DM1.sAPO201 + ' (SOLICITUD, ASOID, ASODNI, EST_AUT_CLI,ASODOCNUM,TIPDOCCOD)'
            + ' VALUES (''' + xSolicitud + ''', ''' + xAsoid + ''', ''' + trim(dbeLibDni.Text) + ''', ''NU'','''+trim(dbeLibDni.Text)+''','''+dblTipDoc.Text+''')';
         dm1.cdsQry2.Close;
         dm1.cdsQry2.DataRequest(xSQL);
         dm1.cdsQry2.Execute;
         Apo201_NueCLi;
         xSQL := 'SELECT '+DM1.XSELECT+' FROM ' + DM1.sAPO201 + ' WHERE SOLICITUD = ''' + xSolicitud + ''' AND ASOID = ' + QuotedStr(Trim(xAsoid));
         DM1.sAso_where := 'SOLICITUD = ''' + xSolicitud + ''' AND ';
         DM1.cdsAso.Close;
         DM1.cdsAso.DataRequest(xSQL);
         DM1.cdsAso.Open;
         xAsoId := DM1.cdsAso.fieldbyname('ASOID').AsString;
      End;
      xAsoDni := Trim(dbeLibDni.Text);
      //Asigno Valores Capturados
      xasoid := DM1.cdsAso.FieldByName('ASOID').AsString;
      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString := VarToStrDef(Reg.Field['APEPAT'].Value,'');
      DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString := VarToStrDef(Reg.Field['APEMAT'].Value,'');
      DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString := VarToStrDef(Reg.Field['APECAS'].Value,'');
      DM1.cdsAso.FieldByName('ASONOMDNI').AsString    := VarToStrDef(Reg.Field['NOMBRE'].Value,'');
      DM1.cdsAso.FieldByName('ASOFECNAC').AsString    := VarToStrDef(Reg.Field['FECNAC'].Value,'');
      If DM1.sAPO201 = 'ASO_NUE_CLI' Then
      Begin
         // Se captura los datos de los padrones
         xSql := 'Select Max(ASOCODMOD) ASOCODMOD, Max(ASOTIPID) ASOTIPID, Max(REGPENID) REGPENID, Max(UPROID) UPROID, Max(UPAGOID) UPAGOID, Max(USEID) USEID,'
         +' Max(ASOCODPAGO) ASOCODPAGO, Max(CARGO) CARGO, Max(CASE WHEN LENGTH(TRIM(ASONCTA)) = 10 THEN ASONCTA ELSE NULL END) ASONCTA,'
         +' Max(CASE WHEN LENGTH(TRIM(ASONCTA)) = 10 THEN ''A'' ELSE NULL END) SITCTA, Max(CODMOD) CODMOD, Max(CARLAB) CARLAB, Max(SITACT) SITACT,'
         +' Max(TIPSER) TIPSER, Max(HABER) HABER, Max(LIQUIDO) LIQUIDO From ASO_PAD_HIS'
         +' where ASODNI = '+QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString)+' AND CODPAD IN (SELECT MAX(CODPAD) CODPAD  FROM ASO_PAD_HIS WHERE ASODNI = '+QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString)+')';
         DM1.cdsQry2.Close;
         DM1.cdsQry2.DataRequest(xsql);
         DM1.cdsQry2.Open;
         If DM1.cdsQry2.FieldByName('ASOCODMOD').AsString <> '' Then
         Begin
            DM1.cdsAso.FieldByName('ASOCODMOD').AsString  := DM1.cdsQry2.FieldByName('ASOCODMOD').AsString;
            If DM1.cdsQry2.FieldByName('ASOTIPID').AsString = 'DO' Then
               xasotipid := 'VO'
            Else
               xasotipid := DM1.cdsQry2.FieldByName('ASOTIPID').AsString;
            DM1.cdsAso.FieldByName('ASOTIPID').AsString   := xasotipid;
            DM1.cdsAso.FieldByName('REGPENID').AsString   := DM1.cdsQry2.FieldByName('REGPENID').AsString;
            DM1.cdsAso.FieldByName('UPROID').AsString     := DM1.cdsQry2.FieldByName('UPROID').AsString;
            DM1.cdsAso.FieldByName('UPAGOID').AsString    := DM1.cdsQry2.FieldByName('UPAGOID').AsString;
            DM1.cdsAso.FieldByName('USEID').AsString      := DM1.cdsQry2.FieldByName('USEID').AsString;
            DM1.cdsAso.FieldByName('ASOCODPAGO').AsString := DM1.cdsQry2.FieldByName('ASOCODPAGO').AsString;
            DM1.cdsAso.FieldByName('CARGO').AsString      := DM1.cdsQry2.FieldByName('CARGO').AsString;
            DM1.cdsAso.FieldByName('ASONCTA').AsString    := DM1.cdsQry2.FieldByName('ASONCTA').AsString;
            DM1.cdsAso.FieldByName('SITCTA').AsString     := DM1.cdsQry2.FieldByName('SITCTA').AsString;
            // Se captura datos del colegio
            xSql := 'SELECT CENEDUID, NOMCENEDU, DIREC, TELEFONO, UBIGEO_DIR FROM ASO_CEN_EDU WHERE CODMOD = '+QuotedStr(DM1.cdsQry2.FieldByName('CODMOD').AsString)
            +' AND CENEDUID IN (SELECT MAX(CENEDUID) FROM ASO_CEN_EDU WHERE CODMOD = '+QuotedStr(DM1.cdsQry2.FieldByName('CODMOD').AsString)+')';
            DM1.cdsQry3.Close;
            DM1.cdsQry3.DataRequest(xSql);
            DM1.cdsQry3.Open;
            If DM1.cdsQry3.FieldByName('CENEDUID').AsString <> '' Then
            Begin
               DM1.cdsAso.FieldByName('CENEDUID').AsString    := DM1.cdsQry3.FieldByName('CENEDUID').AsString;
               DM1.cdsAso.FieldByName('ASODESLAB').AsString   := DM1.cdsQry3.FieldByName('NOMCENEDU').AsString;
               DM1.cdsAso.FieldByName('ASODIRLAB').AsString   := DM1.cdsQry3.FieldByName('DIREC').AsString;
               DM1.cdsAso.FieldByName('ASODPTLABID').AsString := Copy(DM1.cdsQry3.FieldByName('UBIGEO_DIR').AsString,1,2);
               DM1.cdsAso.FieldByName('ASOPRVLABID').AsString := Copy(DM1.cdsQry3.FieldByName('UBIGEO_DIR').AsString,1,4);
               DM1.cdsAso.FieldByName('ASODSTLABID').AsString := DM1.cdsQry3.FieldByName('UBIGEO_DIR').AsString;
               DM1.cdsAso.FieldByName('ASOTELLAB').AsString   := DM1.cdsQry3.FieldByName('TELEFONO').AsString;
            End;
         End;
      End;
      //carga imagenes
      ShowImageFromBase64(Reg.Field['FOTO'].Value, imagAso);
      ShowImageFromBase64(Reg.Field['FIRMAJPG'].Value, imaFirma);
      //valida fallecido
      xfechaFallecido:=DM1.DevuelveValor('ASO_NUE_CLI', 'ASOFECFAL', 'ASODNI', (xAsoDni));
      If( ((VarToStrDef(Reg.Field['CODRES'].Value,'')) = 'A') and (xfechaFallecido = '')    ) then
      begin
         xSQLFallecido:= ' ,ASOFECFAL=SYSDATE, CODAPLIFAL=''043''  ';
      end;
      // Actualizando Sexo
      If dblTipDoc.Text=xTIPDOCCOD then
      Begin
         DM1.cdsAso.FieldByName('ASOSEXO').AsString := copy(VarToStrDef(Reg.Field['SEXO'].Value,''),1,1);
      End;
      xAsoApeNomDni := '';
      If Trim(VarToStrDef(Reg.Field['APEPAT'].Value,'') ) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(VarToStrDef(Reg.Field['APEPAT'].Value,'') )+ ' ';
      If Trim(VarToStrDef(Reg.Field['APEMAT'].Value,'') ) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(VarToStrDef(Reg.Field['APEMAT'].Value,'') )+ ' ';
      If Trim(VarToStrDef(Reg.Field['APECAS'].Value,'') ) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(VarToStrDef(Reg.Field['APECAS'].Value,'') ) + ' ';
      xAsoApeNomDni := xAsoApeNomDni + Trim(VarToStrDef(Reg.Field['NOMBRE'].Value,''));
      // 1
      XSQL := 'UPDATE DB2ADMIN.' + DM1.sAPO201
      + ' SET ASOAPEPATDNI = ' + QuotedStr(Trim(VarToStrDef(Reg.Field['APEPAT'].Value,'')))+ ','
      + ' ASOAPEMATDNI = ' + QuotedStr(Trim(VarToStrDef(Reg.Field['APEMAT'].Value,''))) + ','
      + ' ASONOMDNI = ' + QuotedStr(Trim(VarToStrDef(Reg.Field['NOMBRE'].Value,''))) + ','
      + ' ASOAPECASDNI = ' + QuotedStr(Trim(VarToStrDef(Reg.Field['APECAS'].Value,''))) + ','
      + ' ASOAPENOMDNI = ' + QuotedStr(xAsoApeNomDni) + ','
      + ' ASOSEXO = ' + QuotedStr(Trim(DM1.cdsAso.FieldByName('ASOSEXO').AsString))+','
      + ' ASODNI = ' + QuotedStr(Trim(dbeLibDni.Text))+','
      + ' ACTARCREN = ' + QuotedStr('S')+', '
      + ' ASOFECNAC = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOFECNAC').AsString)
      + xSQLFallecido
      + ' WHERE ' + DM1.sAso_where + ' ASOID = ' + QuotedStr(xasoid);
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      // Se actualiza el campo ESTCIVID desde RENIEC solo si el campo esta vacio.
      If Length(Trim(DM1.cdsAso.FieldByName('ESTCIVID').AsString)) = 0 Then
      Begin
         DM1.cdsAso.FieldByName('ESTCIVID').AsString := DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,''),2);
         edtEstadoCivil.EditText := VarToStrDef(Reg.Field['ESTCIV'].Value,'');
         // Actualizando en el APO201
         XSQL := 'UPDATE ' + DM1.sAPO201+ ' SET ESTCIVID = ' + QuotedStr(DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,'0'),2))+' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         // Tomando valor para el campo Item
         XSQL := 'SELECT LPAD(MAX(ITEM+1),5,''0'') ITEM FROM APO206 WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(XSQL);
         DM1.cdsQry.Open;
         If DM1.cdsQry.FieldByName('ITEM').AsString = '' Then xItem := '01' Else xItem := DM1.cdsQry.FieldByName('ITEM').AsString;
            XSQL := 'INSERT INTO APO206 (ASOID, ASOCODMOD, FREG, HREG, PERIODO, ESTCIVID, USUARIO, ITEM, CARLAB, SITACT, TIPSER, AINGFAM, AINGMAG) VALUES ('
         +QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+','
         +QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString)+', TO_DATE(SYSDATE), SYSDATE, TO_CHAR(SYSDATE,''YYYYMM''),'
         +QuotedStr(DM1.cdsAso.FieldByName('ESTCIVID').AsString)+','
         +QuotedStr(DM1.wUsuario)+','
         +QuotedStr(xItem)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('CARLAB').AsString)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('SITACT').AsString)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('TIPSER').AsString)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('HABER').AsString)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('LIQUIDO').AsString)+')';
         DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      End;
      bitImpReniec.Enabled := True;
      Timer1.Enabled := False;
      ActivaPantPrincipal;
      dbeLibDni.Enabled := False;
      edtnumdoc.Enabled := False;
      IF DM1.xCnd = 'AUT' THEN
      BEGIN
         bitAutoriza.Visible := True;
         bitRechaza.Visible := True;
         bbtnN1.Visible := True;
      END;
   END
   ELSE
   BEGIN
      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString := VarToStrDef(Reg.Field['APEPAT'].Value,'');
      DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString := VarToStrDef(Reg.Field['APEMAT'].Value,'');
      DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString := VarToStrDef(Reg.Field['APECAS'].Value,'');
      DM1.cdsAso.FieldByName('ASONOMDNI').AsString    := VarToStrDef(Reg.Field['NOMBRE'].Value,'');
      DM1.cdsAso.FieldByName('ASOFECNAC').AsString    := VarToStrDef(Reg.Field['FECNAC'].Value,'');
      xAsoApeNomDni := '';
      If Trim(VarToStrDef(Reg.Field['APEPAT'].Value,'') ) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(VarToStrDef(Reg.Field['APEPAT'].Value,'') )+ ' ';
      If Trim(VarToStrDef(Reg.Field['APEMAT'].Value,'') ) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(VarToStrDef(Reg.Field['APEMAT'].Value,'') )+ ' ';
      If Trim(VarToStrDef(Reg.Field['APECAS'].Value,'') ) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(VarToStrDef(Reg.Field['APECAS'].Value,'') ) + ' ';
      xAsoApeNomDni := xAsoApeNomDni + Trim(VarToStrDef(Reg.Field['NOMBRE'].Value,''));
      //valida fallecido
      xfechaFallecido:=DM1.DevuelveValor('APO201', 'ASOFECFAL', 'ASODNI', (xAsoDni));
      If( ((VarToStrDef(Reg.Field['CODRES'].Value,'')) = 'A') and (xfechaFallecido = '')    ) then
      begin
         xSQLFallecido:= ' ,ASOFECFAL=SYSDATE, CODAPLIFAL=''043''  ';
      end;
      // Actualizando Sexo
      If dblTipDoc.Text=xTIPDOCCOD then
      Begin
         DM1.cdsAso.FieldByName('ASOSEXO').AsString := copy(VarToStrDef(Reg.Field['SEXO'].Value,''),1,1);
      End;
      // 2
      XSQL := 'UPDATE DB2ADMIN.' + DM1.sAPO201
      + ' SET ASOAPEPATDNI = ' + QuotedStr(Trim(VarToStrDef(Reg.Field['APEPAT'].Value,'')))+ ','
      + ' ASOAPEMATDNI = ' + QuotedStr(Trim(VarToStrDef(Reg.Field['APEMAT'].Value,''))) + ','
      + ' ASONOMDNI = ' + QuotedStr(Trim(VarToStrDef(Reg.Field['NOMBRE'].Value,''))) + ','
      + ' ASOAPECASDNI = ' + QuotedStr(Trim(VarToStrDef(Reg.Field['APECAS'].Value,''))) + ','
      + ' ASOAPENOMDNI = ' + QuotedStr(xAsoApeNomDni) + ','
      + ' ASOSEXO = ' + QuotedStr(Trim(DM1.cdsAso.FieldByName('ASOSEXO').AsString))+','
      + ' ASODNI = ' + QuotedStr(Trim(dbeLibDni.Text))+','
      + ' ACTARCREN = ' + QuotedStr('S')+', '
      + ' ASOFECNAC = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOFECNAC').AsString)
      + xSQLFallecido
      + ' WHERE ' + DM1.sAso_where + ' ASOID = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);

      //Se captura los datos de los padrones
      xSql := 'Select Max(ASOCODMOD) ASOCODMOD, Max(ASOTIPID) ASOTIPID, Max(REGPENID) REGPENID, Max(UPROID) UPROID, Max(UPAGOID) UPAGOID, Max(USEID) USEID,'
      +' Max(ASOCODPAGO) ASOCODPAGO, Max(CARGO) CARGO, Max(CASE WHEN LENGTH(TRIM(ASONCTA)) = 10 THEN ASONCTA ELSE NULL END) ASONCTA,'
      +' Max(CASE WHEN LENGTH(TRIM(ASONCTA)) = 10 THEN ''A'' ELSE NULL END) SITCTA, Max(CODMOD) CODMOD, Max(CARLAB) CARLAB, Max(SITACT) SITACT,'
      +' Max(TIPSER) TIPSER, Max(HABER) HABER, Max(LIQUIDO) LIQUIDO From ASO_PAD_HIS'
      +' where ASODNI = '+QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString)+' AND CODPAD IN (SELECT MAX(CODPAD) CODPAD  FROM ASO_PAD_HIS WHERE ASODNI = '+QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString)+')';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xsql);
      DM1.cdsQry2.Open;

      //obtener estado civil
      xSql := ' SELECT COUNT(1) EXISTE FROM APO206 WHERE ASOID='+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
      DM1.cdsSobrino.Close;
      DM1.cdsSobrino.DataRequest(xsql);
      DM1.cdsSobrino.Open;
      xExiste:=StrToFloat(DM1.cdsSobrino.FieldByName('EXISTE').AsString);

      // Se actualiza el campo ESTCIVID desde RENIEC solo si el campo esta vacio.
      //DM1.cdsAso.FieldByName('ESTCIVID').AsString := DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,''),2);
      edtEstadoCivil.EditText := VarToStrDef(Reg.Field['ESTCIV'].Value,'');
      If ( (Length(Trim(DM1.cdsAso.FieldByName('ESTCIVID').AsString)) = 0) OR (xExiste <= 0)
         OR ((DM1.cdsAso.FieldByName('ESTCIVID').AsString <> DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,''),2))) ) Then
      Begin
         // Actualizando en el APO201
         XSQL := 'UPDATE ' + DM1.sAPO201+ ' SET ESTCIVID = ' + QuotedStr(DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,'0'),2))+' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         // Tomando valor para el campo Item
         XSQL := 'SELECT LPAD(MAX(ITEM+1),5,''0'') ITEM FROM APO206 WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(XSQL);
         DM1.cdsQry.Open;
         If DM1.cdsQry.FieldByName('ITEM').AsString = '' Then xItem := '01' Else xItem := DM1.cdsQry.FieldByName('ITEM').AsString;
         XSQL := 'INSERT INTO APO206 (ASOID, ASOCODMOD, FREG, HREG, PERIODO, ESTCIVID, USUARIO, ITEM, CARLAB, SITACT, TIPSER, AINGFAM, AINGMAG) VALUES ('
         +QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+','
         +QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString)+', TO_DATE(SYSDATE), SYSDATE, TO_CHAR(SYSDATE,''YYYYMM''),'
         +QuotedStr(DM1.cdsAso.FieldByName('ESTCIVID').AsString)+','
         +QuotedStr(DM1.wUsuario)+','
         +QuotedStr(xItem)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('CARLAB').AsString)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('SITACT').AsString)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('TIPSER').AsString)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('HABER').AsString)+','
         +QuotedStr(DM1.cdsQry2.FieldByName('LIQUIDO').AsString)+')';
         DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      End;
   END;
   xReniec:= 'S';
   xActRENIEC:='S';
   btnActualizaReniec.visible := True;
   btnActualizaReniec.Enabled:=false;
   btnActualizaReniec.Font.Color := clWhite;
   bitImpReniec.Enabled:= true;
END;


Procedure TFMantAsociado.GrabarSexo;
Var
xSql,xItem:String;
xExiste:double;
Begin
   // Se captura los datos de los padrones
      xSql := 'Select Max(ASOCODMOD) ASOCODMOD, Max(ASOTIPID) ASOTIPID, Max(REGPENID) REGPENID, Max(UPROID) UPROID, Max(UPAGOID) UPAGOID, Max(USEID) USEID,'
      +' Max(ASOCODPAGO) ASOCODPAGO, Max(CARGO) CARGO, Max(CASE WHEN LENGTH(TRIM(ASONCTA)) = 10 THEN ASONCTA ELSE NULL END) ASONCTA,'
      +' Max(CASE WHEN LENGTH(TRIM(ASONCTA)) = 10 THEN ''A'' ELSE NULL END) SITCTA, Max(CODMOD) CODMOD, Max(CARLAB) CARLAB, Max(SITACT) SITACT,'
      +' Max(TIPSER) TIPSER, Max(HABER) HABER, Max(LIQUIDO) LIQUIDO From ASO_PAD_HIS'
      +' where ASODNI = '+QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString)+' AND CODPAD IN (SELECT MAX(CODPAD) CODPAD  FROM ASO_PAD_HIS WHERE ASODNI = '+QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString)+')';
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xsql);
      DM1.cdsQry2.Open;

       //obtener estado civil
       xSql := ' SELECT COUNT(1) EXISTE FROM APO206 WHERE ASOID='+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
       DM1.cdsSobrino.Close;
       DM1.cdsSobrino.DataRequest(xsql);
       DM1.cdsSobrino.Open;
       xExiste:=StrToFloat(DM1.cdsSobrino.FieldByName('EXISTE').AsString);
       DM1.cdsAso.Edit;

       //actualiza sexo
       If (DbLlSexo.Text = '') then
       begin
         If dblTipDoc.Text=xTIPDOCCOD then
        Begin
         DM1.cdsAso.FieldByName('ASOSEXO').AsString := copy(VarToStrDef(Reg.Field['SEXO'].Value,''),1,1);

         XSQL := 'UPDATE ' + DM1.sAPO201
         + ' SET ASOSEXO = ' + QuotedStr(Trim(DM1.cdsAso.FieldByName('ASOSEXO').AsString))
         + ' WHERE ' + DM1.sAso_where + ' ASOID = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.DCOM1.AppServer.EjecutaSql(xSQL);
        End;
       end;

       // Se actualiza el campo ESTCIVID desde RENIEC solo si el campo esta vacio.
       If ( (Length(Trim(DM1.cdsAso.FieldByName('ESTCIVID').AsString)) = 0) OR (xExiste <= 0) ) Then
       Begin
        DM1.cdsAso.Edit;
        DM1.cdsAso.FieldByName('ESTCIVID').AsString := DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,''),2);
        edtEstadoCivil.EditText := VarToStrDef(Reg.Field['ESTCIV'].Value,'');
        // Actualizando en el APO201
        XSQL := 'UPDATE ' + DM1.sAPO201+ ' SET ESTCIVID = ' + QuotedStr(DM1.StrZero(VarToStrDef(Reg.Field['CODESTCIV'].Value,'0'),2))+' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
        DM1.DCOM1.AppServer.EjecutaSql(xSQL);
        // Tomando valor para el campo Item
        XSQL := 'SELECT LPAD(MAX(ITEM+1),5,''0'') ITEM FROM APO206 WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
        DM1.cdsQry.Close;
        DM1.cdsQry.DataRequest(XSQL);
        DM1.cdsQry.Open;
        If DM1.cdsQry.FieldByName('ITEM').AsString = '' Then xItem := '01' Else xItem := DM1.cdsQry.FieldByName('ITEM').AsString;
        XSQL := 'INSERT INTO APO206 (ASOID, ASOCODMOD, FREG, HREG, PERIODO, ESTCIVID, USUARIO, ITEM, CARLAB, SITACT, TIPSER, AINGFAM, AINGMAG) VALUES ('
        +QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+','
        +QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString)+', TO_DATE(SYSDATE), SYSDATE, TO_CHAR(SYSDATE,''YYYYMM''),'
        +QuotedStr(DM1.cdsAso.FieldByName('ESTCIVID').AsString)+','
        +QuotedStr(DM1.wUsuario)+','
        +QuotedStr(xItem)+','
        +QuotedStr(DM1.cdsQry2.FieldByName('CARLAB').AsString)+','
        +QuotedStr(DM1.cdsQry2.FieldByName('SITACT').AsString)+','
        +QuotedStr(DM1.cdsQry2.FieldByName('TIPSER').AsString)+','
        +QuotedStr(DM1.cdsQry2.FieldByName('HABER').AsString)+','
        +QuotedStr(DM1.cdsQry2.FieldByName('LIQUIDO').AsString)+')';
        DM1.DCOM1.AppServer.EjecutaSql(xSQL);
       End;
End;

procedure TFMantAsociado.CargaImagenesFromDataBase;
begin

   Jpg01 := NIL;
   Stream01 := NIL;
   Jpg02 := NIL;
   Stream02 := NIL;

   TRY
      Stream01 := TMemoryStream.Create;
      TBlobField(DM1.cdsQry26.FieldByName('FOTO')).SaveToStream(Stream01);
      Stream02 := TMemoryStream.Create;
      TBlobField(DM1.cdsQry26.FieldByName('FIRMA')).SaveToStream(Stream02);


      IF Stream01.Size > 0 THEN
      BEGIN
         Jpg01 := TJpegImage.Create;
         Stream01.Position := 0;
         Jpg01.LoadFromStream(Stream01);
         imgFoto.Picture.Assign(Jpg01);
      END
      ELSE
         Jpg01 := NIL;

      IF Stream02.Size > 0 THEN
      BEGIN
         jpg02 := TJpegImage.Create;
         Stream02.Position := 0;
         jpg02.LoadFromStream(Stream02);
         imgFirma.Picture.Assign(Jpg02);

      END
      ELSE
         Jpg02 := NIL;


   EXCEPT
      Jpg01 := NIL;
      Jpg02 := NIL
   END;
end;

PROCEDURE TFMantAsociado.ActivaSalir;
BEGIN
   gbIdentidadAso.Enabled := False;
   gbLaboralAso.Enabled := False;
   pnlRegPension.Enabled := False;
   pnlCodPension.Enabled := False;
   BitReasignacion.Visible := False;
   BitResol.Visible := False;
   BitCuentas.Visible := False;
   BitSocio.Visible   := False;
   btncodpago.Visible := False;
   BitModifica.Visible := False;
   BitGrabar.Visible := False;
   BitVerifica.Visible := False;
   BitPrest.Visible := False;
   BitMstApo.Visible := False;
   BitAutDes.Visible := False;
   bbtnCarta.Visible := False;
END;

FUNCTION TFMantAsociado.GrabaApo201: Boolean;
Var xAsoApeNomDni,xsql:String;
//Inicio MAS_202102_HPC
//Se adiciona la grabación del ultimo telefono de la contactabilidad
   xasotelf1,xASOEMAIL: String;
//Final MAS_202102_HPC

BEGIN
   xAsoApeNomDni := '';
   If Trim(DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString)+ ' ';
   If Trim(DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString)+ ' ';
   If Trim(DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString)+ ' ';
   xAsoApeNomDni := xAsoApeNomDni + Trim(DM1.cdsAso.FieldByName('ASONOMDNI').AsString);
//Inicio MAS_202102_HPC
//Se adiciona la grabación del ultimo telefono de la contactabilidad
     xASOEMAIL :='';
     xasotelf1 :='';
     XSQL:='SELECT DB2ADMIN.SF_SIO_CONTACTO_CORREO('+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+')  xcorreo, '
          +'       DB2ADMIN.SF_SIO_CONTACTO_CELULAR('+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+') xtelefono FROM DUAL';
     DM1.cdsGrupos.Close;
     DM1.cdsGrupos.DataRequest(xsql);
     DM1.cdsGrupos.Open;
     xASOEMAIL:=dm1.cdsGrupos.fieldbyname('xcorreo').AsString;
     xasotelf1:=dm1.cdsGrupos.fieldbyname('xtelefono').AsString;
//Final MAS_202102_HPC

   XSQL := 'UPDATE ' + DM1.sAPO201 + ' SET ' +
      '      ASOAPENOM   =' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPENOM').AsString) + ',' +
      '      ASOAPEPAT   =' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPEPAT').AsString) + ',' +
      '      ASOAPEMAT   =' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPEMAT').AsString) + ',' +
      '      ASOAPECASDNI =' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString) + ',' +
      '      ASONOMBRES  =' + QuotedStr(DM1.cdsAso.FieldByName('ASONOMBRES').AsString) + ',' +
//Inicio MAS_202102_HPC
//Se adiciona la grabación del ultimo telefono de la contactabilidad
//    '      ASOEMAIL    =' + QuotedStr(DM1.cdsAso.FieldByName('ASOEMAIL').AsString) + ',' +
      '      ASOEMAIL    =' + QuotedStr(xASOEMAIL) + ',' +
//Final MAS_202102_HPC
      '      ASOAPENOMDNI=' + QuotedStr(xAsoApeNomDni) + ',' +
      '      ASODPTO     =' + QuotedStr(trim(lkcDpto.Text)) + ',' +
      '      CIUDID      =' + QuotedStr(trim(lkcProv.Text)) + ',' +
      '      ZIPID       =' + QuotedStr(trim(lkcDist.Text)) + ',' +
      '      ASODIR      =' + QuotedStr(Copy(Trim(dbeDirec.Text), 1, 250)) + ',' +
      '      ASOAPEPATDNI=' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString) + ',' +
      '      ASOAPEMATDNI=' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString) + ',' +
      '      ASONOMDNI   =' + QuotedStr(DM1.cdsAso.FieldByName('ASONOMDNI').AsString) + ',' +
      '      ASODNI      =' + QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString) + ',' +
      '      ASOFECNAC   =' + QuotedStr(DM1.cdsAso.FieldByName('ASOFECNAC').AsString) + ',' +
      '      ASOSEXO     =' + QuotedStr(DM1.cdsAso.FieldByName('ASOSEXO').AsString) + ',' +
//Inicio MAS_202102_HPC
//Se adiciona la grabación del ultimo telefono de la contactabilidad
//    '      ASOTELF1    =' + QuotedStr(DM1.cdsAso.FieldByName('ASOTELF1').AsString) + ',' +
      '      ASOTELF1    =' + QuotedStr(xasotelf1) + ',' +
//Final MAS_202102_HPC
      '      ASOTELF2    =' + QuotedStr(DM1.cdsAso.FieldByName('ASOTELF2').AsString) + ',' +
      '      ASOCODMOD   =' + QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString) + ',' +
      '      ASOTIPID    =' + QuotedStr(DbLlTipAso.Text) + ',' +
      '      ASOSITID    =' + QuotedStr(DM1.cdsAso.FieldByName('ASOSITID').AsString) + ',' +
      '      REGPENID    =' + QuotedStr(DbLlRegPen.Text) + ',' +
      '      CODAFP      =' + QuotedStr(DbLlAfp.Text) + ',' +
      '      UPROID      =' + QuotedStr(DM1.cdsAso.FieldByName('UPROID').AsString) + ',' +
      '      UPAGOID     =' + QuotedStr(DM1.cdsAso.FieldByName('UPAGOID').AsString) + ',' +
      '      USEID       =' + QuotedStr(DM1.cdsAso.FieldByName('USEID').AsString) + ',' +
      '      ASORESNOM   =' + QuotedStr(DM1.cdsAso.FieldByName('ASORESNOM').AsString) + ',' +
      '      ASOFRESNOM  =' + QuotedStr(DM1.cdsAso.FieldByName('ASOFRESNOM').AsString) + ',' +
      '      ASORESCESE  =' + QuotedStr(DM1.cdsAso.FieldByName('ASORESCESE').AsString) + ',' +
      '      ASOFRESCESE =' + QuotedStr(DM1.cdsAso.FieldByName('ASOFRESCESE').AsString) + ',' +
      '      ASOCODPAGO  =' + QuotedStr(DM1.cdsAso.FieldByName('ASOCODPAGO').AsString) + ',' +
      '      ASONCTA     =' + QuotedStr(DM1.cdsAso.FieldByName('ASONCTA').AsString) + ',' +
      '      SITCTA      =' + QuotedStr(DM1.cdsAso.FieldByName('SITCTA').AsString) + ',' +
      '      ASODESLAB   =' + QuotedStr(DM1.cdsAso.FieldByName('ASODESLAB').AsString) + ',' +
      '      ASODIRLAB   =' + QuotedStr(DM1.cdsAso.FieldByName('ASODIRLAB').AsString) + ',' +
      '      ASOTELLAB   =' + QuotedStr(DM1.cdsAso.FieldByName('ASOTELLAB').AsString) + ',' +
      '      ASODPTLABID =' + QuotedStr(trim(lkcDpto2.Text)) + ',' +
      '      ASOPRVLABID =' + QuotedStr(trim(lkcProv2.Text)) + ',' +
      '      ASODSTLABID =' + QuotedStr(trim(lkcDist2.Text)) + ',' +
      '      CENEDUID    =' + QuotedStr(trim(dbeCenEduId.Text)) + ',' +
      '      USUARIO     =' + QuotedStr(DM1.wUsuario) + ',' +
      '      FREG        =' + QuotedStr(DateToStr(DM1.FechaSys)) + ',' +
      '      HREG        =    SYSDATE,' +
     // '      ACTARCREN   =' + QuotedStr(DM1.cdsAso.FieldByName('ACTARCREN').AsString) +
      ' WHERE ASOID= ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
   DM1.DCOM1.AppServer.EjecutaSql(xSQL);
   result := true;
END;

PROCEDURE TFMantAsociado.BitPrestClick(Sender: TObject);
VAR
   xAsoId: STRING;
BEGIN
   TRY
      fMstPrest := TfMstPrest.create(self);
      xAsoId := DM1.cdsAso.fieldbyname('ASOID').AsString;
      TRY
         FOtorPre := TfOtorPre.create(self);
         FOtorPre.LimPrestamos;
         FOtorPre.CrgPrestamos;
      EXCEPT
      END;
      fMstPrest.Showmodal;
   FINALLY
      fMstPrest.free;
   END;
END;

PROCEDURE TFMantAsociado.BitMstApoClick(Sender: TObject);
BEGIN
   IF (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO') THEN
   BEGIN
      ShowMessage('Opción para Docentes Activos (DO), Nuevos (VO) y Cesantes (CE)');
      Exit;
   END;
   TRY
      fRegApor := TfRegApor.create(self);
      fRegApor.Showmodal;
   FINALLY
      fRegApor.free;
   END;
END;

PROCEDURE TFMantAsociado.BitModificaClick(Sender: TObject);
VAR
   xSQL, xAsoId, xverifica: STRING;
   xPerAct, xUltApo, xUltActPad: String;
   xValidarCelular:Integer;
   xValidarCorreo:Integer;
BEGIN
   xSQL := 'SELECT * FROM DB2ADMIN.SIO_CONTACTO_MOV WHERE CODTIPCAB=''01'' AND ASOID=' + QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString) + ' AND ESTVAL=''S'' ';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSQL);
   DM1.cdsQry2.Open;
   xValidarCelular:= DM1.cdsQry2.RecordCount;

   xSQL := 'SELECT * FROM DB2ADMIN.SIO_CONTACTO_MOV WHERE CODTIPCAB=''02'' AND ASOID=' + QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString) + ' AND ESTVAL=''S'' ';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSQL);
   DM1.cdsQry2.Open;
   xValidarCorreo:= DM1.cdsQry2.RecordCount;

   If (xValidarCelular = 0) or (xValidarCorreo=0) Then
   Begin
      Try
         MessageDlg('LA INFORMACIÓN DE CONTACTABILIDAD NO ESTÁ ACTUALIZADA', mtInformation, [mbOk], 0);
         FContactabilidadVerificada := TfContactabilidadVerificada.create(Self);
         FContactabilidadVerificada.xASOID :=DM1.cdsAso.fieldbyname('ASOID').AsString;
         FContactabilidadVerificada.xASODNI :=DM1.cdsAso.fieldbyname('ASODNI').AsString;
         FContactabilidadVerificada.xASONOMDNI :=DM1.cdsAso.FieldByName('ASONOMDNI').AsString;
         FContactabilidadVerificada.ShowModal;
      Finally
         FContactabilidadVerificada.Free;
      End;
   End;

   DM1.xInsert := '0';

   {
   If (Copy(DM1.CrgArea(DM1.wUsuario), 8, 2) = 'N3') Then
   Begin
     dblTipDoc.Enabled:= True;
   End
   Else
   Begin
     dblTipDoc.Enabled:= False;
   End;
   }



   IF (DM1.xOfiDes = '01') or (Length(Trim(DM1.cdsAso.FieldByName('ASOID').AsString))>0) Then
   BEGIN
      IF DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' THEN
      BEGIN
         // IF DM1.cdsAso.FieldByName('ACTARCREN').AsString <> 'S'  THEN
         If ((DM1.cdsAso.FieldByName('ACTARCREN').AsString <> 'S') And (DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '10')) Then
         BEGIN
            Timer1.Enabled := True;
            btnActualizaReniec.Caption := 'Captura de RENIEC ';
         END
         ELSE
         BEGIN
            Timer1.Enabled := False;
            btnActualizaReniec.Font.Color := clWhite;
         END;
      END;
   END
   ELSE
   BEGIN
      btnActualizaReniec.Visible := False;
   END;
   xAsoId := DM1.cdsAso.FieldByName('ASOID').AsString;
   IF MaxNroItem(xAsoId) <> '000' THEN
   BEGIN
      xSQL := 'SELECT ESTADO,OBSERVACION,ITEM '
         + '  FROM ASO007 '
         + ' WHERE ASOID=' + QuotedStr(xAsoId) + ' AND ITEM=' + QuotedStr(MaxNroItem(xAsoId));
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSQL);
      DM1.cdsQry2.Open;
      IF DM1.cdsQry2.RecordCount > 0 THEN
      BEGIN
         IF DM1.cdsQry2.fieldbyname('ESTADO').AsString = 'I' THEN
         BEGIN
            MessageDlg(' El Registro Se Encuentra INACTIVO Por  :  ' + StrUpper(pChar(DM1.cdsQry2.fieldbyname('OBSERVACION').AsString)), mtError, [mbOk], 0);
            DM1.cdsQry2.Close;
            Exit;
         END;
      END;
      DM1.cdsQry2.Close;
   END;

   // Validación CESANTES ONP
   If DM1.sAPO201 = 'APO201' Then
   Begin
      // Validación Cesantes ONP
      If (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE') And (DM1.cdsAso.FieldByName('REGPENID').AsString = '02') Then
      Begin
         xSQL := 'SELECT MAX(PERIODO) PERIODO FROM APO206 WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.cdsSolicitud.Close;
         DM1.cdsSolicitud.DataRequest(xSQL);
         DM1.cdsSolicitud.Open;
         xSQL := 'Select Max(TO_CHAR(PVSLFECBE,''YYYYMM'')) PVSLFECBE From PVS306 Where ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND PVSESTLIQ NOT IN (''04'',''13'')';
         DM1.cdsFPago.Close;
         DM1.cdsFPago.DataRequest(xSQL);
         DM1.cdsFPago.Open;
         If ((Trim(DM1.cdsSolicitud.FieldByName('PERIODO').AsString) <> '') And (Trim(DM1.cdsFPago.FieldByName('PVSLFECBE').AsString) <> '')) And
             (DM1.cdsSolicitud.FieldByName('PERIODO').AsString  > DM1.cdsFPago.FieldByName('PVSLFECBE').AsString) Then
         Begin
            xSQL := 'UPDATE ASO003 SET IDESTADO = ''02'', OBSERVACION = '+QuotedStr('VALIDADO AUTOMATICAMENTE POR FIGURAR EN PADRON ONP')
            +', USRVERIFICA = '+QuotedStr(DM1.wUsuario)+ ', FHVERIFICA = SYSDATE WHERE ASOID='+QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)+' AND IDESTADO IS NULL';
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         End
         Else
         Begin
            xSQL := 'SELECT A.ASOID,A.FHREGISTRO,A.USUARIO,A.OFDESID,B.OFDESNOM FROM ASO003 A , APO110 B WHERE ASOID=' + QuotedStr(Trim(xAsoId))+' AND DATGENERAL IS NOT NULL AND IDESTADO IS NULL AND A.OFDESID = B.OFDESID';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSQL);
            DM1.cdsQry.Open;
            If DM1.cdsQry.RecordCount > 0 Then
            Begin
               MessageDlg(' Los Datos Del ASOCIADO Se Encuentran Pendiente De Verificación Por El SUPERVISOR De La Oficina De  :  ' + DM1.cdsQry.FieldByName('OFDESNOM').AsString, mtError, [mbOk], 0);
               DM1.cdsQry.Close;
               Exit;
            End;
         End;
      End;
      // Periodo actual
      xSQL := 'SELECT MAX(TO_CHAR(ADD_MONTHS(SYSDATE,- 2),''YYYYMM'')) PERACT FROM DUAL';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      xPerAct := DM1.cdsQry.FieldByName('PERACT').AsString;
      // ultimo aporte
      xSQL := 'SELECT MAX(TRANSANO||TRANSMES) ULTAPO FROM APO301 WHERE ASOID = '+QuotedStr(xAsoId)+' AND NVL(TRANSMTO,0)-NVL(TRANSMTODEV,0) > 0';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      xUltApo := DM1.cdsQry.FieldByName('ULTAPO').AsString;
      // Ultimo padron
      xSQL := 'SELECT MAX(PERIODO) ULTACTPAD FROM APO206 WHERE ASOID = '+QuotedStr(xAsoId) +' AND NVL(AINGFAM,0) > 0 and ide_pad is not null';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      xUltActPad := DM1.cdsQry.FieldByName('ULTACTPAD').AsString;
      // Validación automatica para cesantes con liquidación, regimen de pension AFP
      xverifica := 'N';
      If (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE') And (DM1.cdsAso.FieldByName('REGPENID').AsString = '03') Then
      Begin
         xverifica := 'S';
         // Verificar si cuenta con liquidación
         xSQL := 'Select PVSLBENNR From PVS306 Where ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' And PVSESTLIQ = ''02''';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         If Trim(DM1.cdsQry.FieldByName('PVSLBENNR').AsString) = '' Then xverifica := 'N';
         xSQL := 'Select TO_CHAR(Sysdate,''YYYY'')-TO_CHAR(ASOFECNAC,''YYYY'') EDAD From apo201 Where ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         If DM1.cdsQry.FieldByName('EDAD').AsInteger > 85 Then xverifica := 'N';
         xSQL := 'SELECT MAX(FECEMIDOC) FECEMIDOC FROM SIOREN.SIO_CONSULTA_IDENTIDAD Where DNI = '+QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         If Trim(DM1.cdsQry.FieldByName('FECEMIDOC').AsString) = '' Then xverifica := 'N';
         If Trim(DM1.cdsAso.FieldByName('ASOAPENOM').AsString) <> Trim(DM1.cdsAso.FieldByName('ASOAPENOMDNI').AsString) Then xverifica := 'N';
         If xverifica = 'S' Then
         Begin
            xSQL := 'UPDATE ASO003 SET IDESTADO = ''02'', OBSERVACION = '+QuotedStr('VALIDADO AUTOMATICAMENTE POR PRESENTAR INTEGRIDAD DE DATOS')
            +', USRVERIFICA = '+QuotedStr(DM1.wUsuario)+ ', FHVERIFICA = SYSDATE WHERE ASOID='+QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)+' AND IDESTADO IS NULL';
            Try
               DM1.DCOM1.AppServer.EjecutaSql(xSQL);
            Except
               ShowMessage('Error al Grabar Validación');
               Exit;
            End;
         End
         Else
         Begin
            xSQL := 'SELECT A.ASOID,A.FHREGISTRO,A.USUARIO,A.OFDESID,B.OFDESNOM FROM ASO003 A , APO110 B WHERE ASOID=' + QuotedStr(Trim(xAsoId))+' AND DATGENERAL IS NOT NULL AND IDESTADO IS NULL AND A.OFDESID = B.OFDESID';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSQL);
            DM1.cdsQry.Open;
            If DM1.cdsQry.RecordCount > 0 Then
            Begin
               MessageDlg('Los Datos Del ASOCIADO Se Encuentran Pendiente De Verificación Por El SUPERVISOR De La Oficina De  :  ' + DM1.cdsQry.FieldByName('OFDESNOM').AsString, mtError, [mbOk], 0);
               Exit;
            End;
         End;
      End;
      if ((DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'DO') Or ((DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE') and (DM1.cdsAso.FieldByName('REGPENID').AsString = '01')) Or (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO')) and
         ((xPerAct <= xUltApo) Or (xPerAct <= xUltActPad)) then
      Begin
        xSql := 'UPDATE ASO003 SET IDESTADO = ''02'', OBSERVACION = '+QuotedStr('VALIDADO AUTOMATICAMENTE POR TENER ANTIGUEDAD DE APORTES O ACTUALIZACION POR PADRON MENOR O IGUAL A DOS MESES')
        +', USRVERIFICA = '+QuotedStr(DM1.wUsuario)+ ', FHVERIFICA = SYSDATE WHERE ASOID='+QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)+' AND IDESTADO IS NULL';
        DM1.DCOM1.AppServer.EjecutaSql(xSql);
      End;

      If (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'DO') Then
      Begin
         If DM1.UsuarioLiquidador( DM1.wUsuario ) Then
         Begin
            // Alcualiza estado
            xSql := 'UPDATE ASO003 SET IDESTADO = ''02'', OBSERVACION = '+QuotedStr('VALIDADO AUTOMATICAMENTE POR TRAMITE DE BENEFICIO PREVISIONAL')
            +', USRVERIFICA = '+QuotedStr(DM1.wUsuario)+ ', FHVERIFICA = SYSDATE WHERE ASOID='+QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)+' AND IDESTADO IS NULL';
            Try
               DM1.DCOM1.AppServer.EjecutaSql(xSql);
            Except
               ShowMessage('Error al Grabar Validación');
               Exit;
            End;
         End;
      End
      Else
      Begin
         xSQL := 'SELECT A.ASOID,A.FHREGISTRO,A.USUARIO,A.OFDESID,B.OFDESNOM FROM ASO003 A , APO110 B'
         +' WHERE ASOID=' + QuotedStr(Trim(xAsoId))+' AND DATGENERAL IS NOT NULL AND'
         +' IDESTADO IS NULL AND A.OFDESID=B.OFDESID';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount > 0 Then
         Begin
            MessageDlg(' Los Datos Del ASOCIADO Se Encuentran Pendiente De Verificación Por El SUPERVISOR De La Oficina De  :  ' + DM1.cdsQry.FieldByName('OFDESNOM').AsString, mtError, [mbOk], 0);
            DM1.cdsQry.Close;
            Exit;
         End;
         DM1.cdsQry.Close;
      End;
   End;

  IF DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' THEN
  BEGIN
     gbIdentidadAso.Enabled := True;
     gbLaboralAso.Enabled := True;
     pnlRegPension.Enabled := True;
     pnlCodPension.Enabled := True;
     BitModifica.Enabled := False;
     BitGrabar.Enabled := True;
     fcsbConsentimiento.Enabled := True;
  END
  ELSE
  BEGIN
     gbIdentidadAso.Enabled := True;
     dbeLibDni.Enabled := false;
     edtnumdoc.Enabled := False;
     btnactdir.Enabled := True;
     BitGrabar.Enabled := True;
     If Length(Trim(edtTipBen.Text))=0 Then
     Begin
         xSQL := 'SELECT 1 FROM RES_TEC_1 C WHERE C.ASOID='+QuotedStr(Trim(xAsoId))+' AND NVL(C.ACUMULADO,0)>0 AND C.PERIODO= (SELECT MAX(PERIODO)-1 FROM RES_TEC_1)';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount>0 Then
         Begin
            pnlRegPension.Enabled := True;
            pnlCodPension.Enabled := True;
         End;
     End;
  END;
//Inicio MAS_202104_HPC 
  if ((DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '02')) or
     ((DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '04')) then
//Fin MAS_202104_HPC 
  begin
    edtCodPensionista.Enabled := true;
    dblcdCodLeyPen.Enabled := true;
    dblcdCodPrestacion.Enabled := True;
    pnlCodPension.Enabled := True;
  end
  else
  begin
    IF Cargado then
    begin
      edtCodPensionista.Text := '';
      edtCodPensionista.Enabled := false;
      dblcdCodLeyPen.Text := '';
      dblcdCodLeyPen.Enabled := false;
      dblcdCodLeyPen.Color := $00E8FFFF;
      dblcdCodPrestacion.Text := '';
      dblcdCodPrestacion.Enabled := false;
      dblcdCodPrestacion.Color := $00E8FFFF;
      pnlCodPension.Enabled := False;
    end;
  end;

  IF DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' THEN
  BEGIN
     IF dbeLibDni.Text = '' THEN
        dbeLibDni.Enabled := True
     ELSE
     BEGIN
        IF DM1.sAPO201 = 'APO201' THEN
        BEGIN
           IF (DM1.cdsAso.FieldByName('VALCODMODDNI').AsString = 'N') AND
              (Copy(DM1.CrgArea(DM1.wUsuario), 4, 2) = '01') AND // origen
              (Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) = '03') THEN // nivel
           BEGIN
              dbeLibDni.Enabled := True;
              xModifDNI := True;
           END
           ELSE
           Begin
              dbeLibDni.Enabled := False;
              edtnumdoc.Enabled := False;
           End;
        END
        ELSE
        BEGIN
           dbeLibDni.Enabled := False;
           edtnumdoc.Enabled := False;
        END;
     END;
  END;

  TRY
     ActivaFoco;
  EXCEPT
  END;

END;

FUNCTION TFMantAsociado.MaxNroItem(xAsoId: STRING): STRING;
VAR
   xSQL: STRING;
BEGIN
   xSQL := 'SELECT MAX(ITEM) ITEM FROM ASO007 WHERE ASOID=' + QuotedStr(xAsoId);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   IF DM1.cdsQry.RecordCount > 0 THEN
   BEGIN
      Result := DM1.cdsQry.FieldByName('ITEM').AsString;
   END
   ELSE
      Result := '000';

   DM1.cdsQry.Close;
END;

PROCEDURE TFMantAsociado.ActivaFoco;
VAR
   i, xFoco: Integer;
BEGIN
   xFoco := 0;
   FOR i := 0 TO FMantAsociado.ComponentCount - 1 DO
   BEGIN
      IF (FMantAsociado.Components[i].ClassName = 'TwwDBEdit') OR (FMantAsociado.Components[i].ClassName = 'TwwDBDateTimePicker') OR (FMantAsociado.Components[i].ClassName = 'TwwDBLookupCombo') THEN
      BEGIN
         IF TwwDBEdit(FMantAsociado.Components[i]).Enabled THEN
         BEGIN
            xFoco := 0;
            Break;
         END;

         IF TwwDBDateTimePicker(FMantAsociado.Components[i]).Enabled THEN
         BEGIN
            xFoco := 1;
            Break;
         END;

         IF TwwDBLookupCombo(FMantAsociado.Components[i]).Enabled THEN
         BEGIN
            xFoco := 2;
            Break;
         END;
      END;
   END;
   DbLlTipAso.Enabled := False;
   IF DM1.sAPO201 = 'ASO_NUE_CLI' THEN
      DbLlTipAso.Enabled := True;

   IF EdtCodMod.Text = '' THEN
      pnlCodMod.Enabled := True;

END;

PROCEDURE TFMantAsociado.BitAutDesClick(Sender: TObject);
VAR
   xCodReg, xAsoId, xsql: STRING;
   Boton: Integer;
BEGIN
   IF (BitGrabar.Enabled) AND (BitGrabar.Visible) THEN
   BEGIN
      ShowMessage('Debe [Grabar] para continuar...');
      Exit;
   END;

   BEGIN
    // Actualiza Flag de Solo Aportes
      xAsoId := DM1.cdsAso.FieldByName('ASOID').AsString;

      DM1.xautdes := 'A';

      TRY
        Fautdes := TFautdes.Create(Self);
        Fautdes.sFirmaCarta := sFirmaCarta;
        IF (DM1.cdsAso.fieldbyname('ASOTIPID').AsString = 'CE') THEN
          BEGIN
            Fautdes.sConsulta := 'S';
          END
        ELSE
          BEGIN
            Fautdes.sConsulta := '';
          END;
        Fautdes.ShowModal;
      FINALLY
        Fautdes.Free;
      END;

   end;
END;

PROCEDURE TFMantAsociado.BitGrabarClick(Sender: TObject);
VAR
   xAsoid,XSQL,xDNI: STRING;
BEGIN
  xDNI:=edtnumdoc.Text;
  if (xDNI = '') then
  begin
    xDNI:=dbeLibDni.Text;
  end;
  IF (xDNI = '') THEN
  BEGIN
    MessageDlg(' Falta completar datos', mtError, [mbOk], 0);
    Exit;
  END;

   IF (dblTipDoc.Text = '10') And (xReniec <> 'S') THEN
   BEGIN
      MessageDlg(' Falta Capturar Datos de RENIEC', mtError, [mbOk], 0);
      Exit;
   END;
   If (Length(Trim(DM1.cdsAso.FieldByName('ASOID').AsString))=0) AND (dm1.xInsert <> '1') Then
   begin
      ShowMessage('Primero debe Selecionar un Asociado Activo');
      exit;
   end;
   If pnlCodMod.Enabled and not DM1.FG_VALIDA_CODIGO_MODULAR(EdtCodMod.Text) then exit;
   // Inicio: MAS_202204_HPC
   // Se valida que codigo modular no sea repetido.
   If pnlCodMod.Enabled And Not DM1.Validacodmodrepetido(EdtCodMod.Text, DM1.cdsAso.FieldByName('ASOID').AsString) Then Exit;
   // Fin: MAS_202204_HPC   

   if (copy(DM1.cdsAso.FieldByname('ASONCTA').AsString,1,3)='CI_') and
      (copy(DM1.cdsAso.FieldByname('ASOTIPID').AsString,1,3)<>'CE') then
   Begin
      Beep;
      MessageDlg('El Tipo de Asociado debe ser CEsante si hay Cuenta Interna asignada', mtError, [mbOk], 0);
      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByname('ASOTIPID').AsString := 'CE';
      DM1.cdsAso.Post;
      DbLlTipAso.SetFocus;
      Exit;
   End;

   xAsoId := DM1.cdsAso.fieldbyname('ASOID').AsString;

   IF Length(TRIM(dblTipDoc.Text))= 0 Then
   BEGIN
      MessageDlg('Falta ingresar el Tipo de Documento', mtError, [mbOk], 0);
      Exit;
   END;

   IF Length(Trim(edtTipAso.Text)) = 0 THEN
   BEGIN
       If Not (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0) Then
       Begin
          MessageDlg('Tipo de Asociado no Catalogado.', mtError, [mbOk], 0);
          Exit;
       End;
   END;

   IF (DbLlTipAso.Text = 'DO') AND (dm1.xInsert <> '1') THEN
   BEGIN
      IF Length(Trim(dbeCodPag.Text)) = 0 THEN
      BEGIN
         If Not (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0) Then
         Begin
             MessageDlg('Falta Ingresar El CODIGO DE PAGO', mtError, [mbOk], 0);
             Exit;
         End;
      END;

  If Not (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0) Then
  Begin
      IF (Length(Trim(dbeLibDni.Text)) = 0)   and (dblTipDoc.Text=xTIPDOCCOD) THEN
      BEGIN
         MessageDlg('Falta Ingresar El D.N.I.', mtError, [mbOk], 0);
         Exit;
      END;
  End;
   END;

   If Not (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0) Then
   Begin
       IF (DbLlTipAso.Text = 'DO') AND (DM1.cdsAso.FieldByName('CENEDUID').AsString =
          '') THEN
       BEGIN
          MessageDlg(' Asigne el colegio al asociado ', mtError, [mbOk], 0);
          Exit;
       END;
   End;

   IF (DbLlTipAso.Text = 'CE') AND (dm1.xInsert <> '1') THEN
   BEGIN
      IF Length(Trim(dbeCodPag.Text)) = 0 THEN
      BEGIN
         If Not (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0) Then
         Begin
             MessageDlg(' Falta Ingresar El CODIGO DE PAGO ', mtError, [mbOk], 0);
             Exit;
         End;
      END;

      IF (Length(Trim(dbeLibDni.Text)) = 0) and (dblTipDoc.Text=xTIPDOCCOD) THEN
      BEGIN
         If Not (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0) Then
         Begin
             MessageDlg(' Falta Ingresar El D.N.I. ', mtError, [mbOk], 0);
             Exit;
         End;
      END;
  If Not (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0) Then
  Begin
      IF Length(Trim(dbeNroCes.Text)) = 0 THEN
      BEGIN
         MessageDlg(' Falta Ingresar El NUMERO De La RESOLUCION DE CESE ', mtError, [mbOk], 0);
         Exit;
      END;
  End;
  If Not (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0) Then
  Begin
      IF Length(Trim(DBDTResCes.Text)) = 0 THEN
      BEGIN
         MessageDlg(' Falta Ingresar La FECHA De La RESOLUCION DE CESE ', mtError, [mbOk], 0);
         Exit;
      END;
  End;
   END;
//Inicio MAS_202104_HPC 
   If ((Trim(DbLlTipAso.Text) = 'CE') And (Trim(DbLlRegPen.Text) = '02') ) or
      (Trim(DbLlTipAso.Text) = 'CE') And (Trim(DbLlRegPen.Text)  = '04') Then
//Fin MAS_202104_HPC 
   Begin
      If Trim(dblcdCodLeyPen.Text) = '' Then
      Begin
         MessageDlg('Debe ingresar el Código de Ley de Pensión', mtError, [mbOk], 0);
         dblcdCodLeyPen.SetFocus;
         Exit;
      End;
      If Trim(edtCodPensionista.Text) = '' Then
      Begin
        MessageDlg('Debe ingresar el Código de Pensionista', mtError, [mbOk], 0);
        edtCodPensionista.SetFocus;
        Exit;
      End;
      If Trim(dblcdCodPrestacion.Text) = '' Then
      Begin
         MessageDlg('Debe ingresar el Código de prestación', mtError, [mbOk], 0);
         dblcdCodPrestacion.SetFocus;
         Exit;
      End;
   End;
   If (DM1.xInsert <> '1') And (DbLlTipAso.Text <> 'CE') Then
   Begin
    Try
      If (DM1.cdsUse.Active = True) And (DM1.cdsUse.FieldByName('DPTOID').AsString <> lkcDpto2.Text) Then
      Begin
         MessageDlg('EL DEPARTAMENTO DEL COLEGIO NO CORRESPONDE AL DEPARTAMENTO DE LA UGEL !', mtInformation, [mbOk], 0);
      End;
    EXCEPT
    END;


   End;
  //Verifica otras condiciones de grabacion
   IF NOT VerifGraba THEN exit;

   IF DM1.xInsert = '1' THEN       //nuevo
   Begin
      If dblTipDoc.Text<>xTIPDOCCOD Then  GrabaApo201NO_DNI;
      ValAsoPrev(trim(EdtApePatDni.Text) + ' ' + trim(EdtApeMatDni.Text));
   End
   ELSE
//Inicio MAS_202104_HPC
   begin
      Grabacion2;
      DM1.Cargacampos;
   end;
//Fin MAS_202104_HPC 

END;

PROCEDURE TFMantAsociado.Registro_Aud(xAsoId, xSecuencia, xCodReg: STRING);
VAR
   xSQL: STRING;
BEGIN
   IF Length(Trim(xCodReg)) = 0 THEN
   BEGIN
      MessageDlg(' No Se Grabo Log De USUARIO Informe al Equipo De Sistemas ', mtError, [mbOk], 0);
      Exit;
   END;
   Screen.Cursor := crHourGlass;
   xSQL := 'INSERT INTO APO201_LOG(ASOID, ASOCODMOD, ASOCODAUX, ASOCODPAGO, ASOAPEPAT, ASOAPEMAT, ASONOMBRES, ASOAPENOM, USEID, UPROID, ' +
      'UPAGOID, ASORESNOM, ASOFRESNOM, RESID, REGPENID, ASOSITID, ASOFACT, ASOTIPID, VIAID, VIANOMBRE, ASONUMDIR, ASOFDPTO, ASODPTO, ' +
      'ZONAID, ZONANOMB, UBIGEOID, DPTOID, PAISID, REFDOM, ASOFECNAC, ASOTELF1, ASOTELF2, TIPDOCCOD, ASODOCNUM, ASOLIBMIL, ASORUC, ESTCIVID, ' +
      'ASOSEXO, ASOEMAIL, BANCOID, ASONCTA, SITCTA, ASODNI, GRAACID, GRAINSID, PROFID, ASOFMOV, ASOFLUGING, ASODIR, USUARIO, HREG, FREG, ASOLUGEST, ' +
      'FECTEREST, TIEMPOEST, ASOLNACID, ASORESCESE, ASOFRESCESE, FGARANTE, ZIPID, CIUDID, ARCHIVOFTP, CIAID, FLAGVAR, ASOAPNCRE, FLGFSOL, ESTCLF, ' +
      'OBSERVA, USR_CREA, FEC_CREA, USR_BEN, FEC_BEN, CTASER, CARGO, VARIASCUOT, CRENCUOTA, NFUSION, IDIMAGE, FSINLIQ, ASODESCOL, ASODIRCOL, ASOZIPCOL, ' +
      'ASOAPEPATDNI, ASOAPEMATDNI, ASONOMDNI, ASOAPENOMDNI, ASODESLAB, ASODIRLAB, ASODPTLABID, ASOPRVLABID, ASODSTLABID, ASOTELLAB, DPTNACID, PRVNACID, ' +
      'DSTNACID, VIALABID, ZONALABID, FECACT, INDICADOR, CCOSID, PASSWORD, CODAFP, USUARIO_AUD, REGISTRO_AUD, SECUENCIA, CODREG, MODULOID,VALCODMODDNI,ACTARCREN,REINGRESO, CENEDUID) ' +
      'SELECT ASOID, ASOCODMOD, ASOCODAUX, ASOCODPAGO, ASOAPEPAT, ' +
      'ASOAPEMAT, ASONOMBRES, ASOAPENOM, USEID, UPROID, UPAGOID, ASORESNOM, ASOFRESNOM, RESID, REGPENID, ASOSITID, ASOFACT, ASOTIPID, VIAID, VIANOMBRE, ' +
      'ASONUMDIR, ASOFDPTO, ASODPTO, ZONAID, ZONANOMB, UBIGEOID, DPTOID, PAISID, REFDOM, ASOFECNAC, ASOTELF1, ASOTELF2, TIPDOCCOD, ASODOCNUM, ASOLIBMIL, ' +
      'ASORUC, ESTCIVID, ASOSEXO, ASOEMAIL, BANCOID, ASONCTA, SITCTA, ASODNI, GRAACID, GRAINSID, PROFID, ASOFMOV, ASOFLUGING, ASODIR, USUARIO, HREG, FREG, ' +
      'ASOLUGEST, FECTEREST, TIEMPOEST, ASOLNACID, ASORESCESE, ASOFRESCESE, FGARANTE, ZIPID, CIUDID, ARCHIVOFTP, CIAID, FLAGVAR, ASOAPNCRE, FLGFSOL, ESTCLF, ' +
      'OBSERVA, USR_CREA, FEC_CREA, USR_BEN, FEC_BEN, CTASER, CARGO, VARIASCUOT, CRENCUOTA, NFUSION, IDIMAGE, FSINLIQ, ASODESCOL, ASODIRCOL, ASOZIPCOL, ASOAPEPATDNI, ' +
      'ASOAPEMATDNI, ASONOMDNI, ASOAPENOMDNI, ASODESLAB, ASODIRLAB, ASODPTLABID, ASOPRVLABID, ASODSTLABID, ASOTELLAB, DPTNACID, PRVNACID, DSTNACID, VIALABID, ZONALABID, ' +
      'FECACT, INDICADOR, CCOSID, PASSWORD, CODAFP,' + QuotedStr(DM1.wUsuario) + ',SYSDATE,' + QuotedStr(xSecuencia) + ',' + QuotedStr(xCodReg) + ',''ASO'',VALCODMODDNI,ACTARCREN,REINGRESO, CENEDUID FROM APO201 WHERE ASOID=' + QuotedStr(xAsoId);
   DM1.DCOM1.AppServer.EjecutaSql(xSQL);
   Screen.Cursor := crDefault;
END;

FUNCTION TFMantAsociado.CodReg: STRING;
VAR
   xSQL, xResAbn: STRING;
   xCorAbn: Integer;
BEGIN
   DM1.cdsListaCred.Close;
   xSQL := 'SELECT CREAREA,CORREANO,TIPO,ASOID FROM CRE206 WHERE CORREANO=' + QuotedStr(Copy(DateToStr(DM1.FechaSys), 7, 4)) + ' AND CREAREA=''ASO'' AND TIPO=''1''';
   DM1.cdsListaCred.DataRequest(xSQL);
   DM1.cdsListaCred.Open;
   IF DM1.cdsListaCred.RecordCount = 1 THEN
   BEGIN
      xCorAbn := StrToInt(DM1.cdsListaCred.fieldbyname('ASOID').AsString) + 1;
      xResAbn := Format('%.10d', [xCorAbn]);
      DM1.cdsListaCred.Edit;
      DM1.cdsListaCred.fieldbyname('ASOID').AsString := xResAbn;
      DM1.cdsListaCred.ApplyUpdates(0);
      Result := xResAbn;
   END;
   DM1.cdsListaCred.Close;
END;

PROCEDURE TFMantAsociado.FormActivate(Sender: TObject);
VAR
   xWhere : STRING;
   xSql : STRING;
   xSegundaVez : STRING;
   xDNI:String;
   JpgFoto, JpgFirma: TJpegImage;
   StrFoto, StrFirma: TMemoryStream;
BEGIN

   xDNI:=dbeLibDni.Text;
   If (dblTipDoc.Text='10') then
   Begin
      Reg:= DM1.get_DatosReniecLocal(xDNI);
      //carga imagenes
      If (Reg.count>10) then
      Begin
         try
            ShowImageFromBase64(Reg.Field['FOTO'].Value, imagAso);
            ShowImageFromBase64(Reg.Field['FIRMAJPG'].Value, imaFirma);
            ImageBoton.Picture := ImagAso.Picture;
            ImageBoton.Enabled:=true;
         except
            on E: Exception do
            begin
               ImageBoton.Enabled:=false;
               lblsinFoto.Visible:=true;
               lblsinFirma.Visible:=true;
            end;
         end;
         bitImpReniec.Enabled:=true;
         xReniec:= 'S';
         xActRENIEC:='S';
      End
      Else
      Begin
         bitImpReniec.Enabled:=false;
         ImageBoton.Enabled:=false;
      End;
   End;
   If (dblTipDoc.Text = '04') then
   Begin
      xSql := 'SELECT FOTO, FIRMA, IMAGEN_ANVERSO, IMAGEN_REVERSO FROM ASO_CARNE_EXTRANJERIA WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
      +' AND ESTADO = ''S''';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      JpgFoto      := Nil;
      StrFoto      := Nil;
      JpgFirma     := Nil;
      StrFirma     := Nil;
      Try
         StrFoto := TMemoryStream.Create;
         TBlobField(DM1.cdsQry.FieldByName('FOTO')).SaveToStream(StrFoto);
         StrFirma := TMemoryStream.Create;
         TBlobField(DM1.cdsQry.FieldByName('FIRMA')).SaveToStream(StrFirma);
         If StrFoto.Size > 0 Then
         Begin
            JpgFoto := TJpegImage.Create;
            StrFoto.Position := 0;
            JpgFoto.LoadFromStream(StrFoto);
            ImagAso.Picture.Assign(JpgFoto);
         End
         Else JpgFoto := Nil;
         If StrFirma.Size > 0 Then
         Begin
            JpgFirma := TJpegImage.Create;
            StrFirma.Position := 0;
            JpgFirma.LoadFromStream(StrFirma);
            ImaFirma.Picture.Assign(JpgFirma);
         End
         Else JpgFirma := Nil;
      Except
         JpgFoto := Nil;
         JpgFirma := Nil;
      End;
   End;


   If (DbLUniPro.Text <>'') then DbLUniProChange(self);
   If (DbLUniPag.Text <>'') then DbLUniPagChange(self);
   If (DbLUses.Text <>'') then DbLUsesChange(self);

   // Inicio: MAS_201909_HPC
   // Actualiza imagenes de los documentos de no cancelación
   VisbtnNoCancelacion;
   // Fin: MAS_201909_HPC

   //Activa botones declaracion y autorizacion con color azul si existe data en canal de afiliacion web
   xSql := ' SELECT CODGES,G.DNI,R.FOTO, R.FIRMA from ASO_GESTION_AFILIACION G '
           +' LEFT JOIN SIOREN.SIO_CONSULTA_IDENTIDAD R  '
           +' ON R.DNI=G.DNI '
           +' INNER JOIN APO201 A  ON G.DNI=A.ASODNI WHERE A.ASOID='+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
           +' AND G.FECADJDOC IS NOT NULL AND G.CODESTSOL =''01'' AND A.AUTDESAPO=''S'' ';
   DM1.cdsQry26.Close;
   DM1.cdsQry26.DataRequest(xSql);
   DM1.cdsQry26.Open;

   if DM1.cdsQry26.RecordCount > 0 then
   begin
      fcDeclaracion.Visible := True;
      fcDeclaracion.Color:= $FFA533;
      fcDeclaracion.Hint:='Canal Digital';
      fcAutorizacion.Visible := True;
      fcAutorizacion.Color:= $FFA533;
      fcAutorizacion.Hint:='Canal Digital';
   end
   else
   begin
      // Inicio: MAS_201907_HPC
      // Se controla los botones para mostrar información recepcionada por GEMAP
      xSql := 'SELECT DOCDECLAASOIMG, DOCAUTDESCIMG FROM GEMAP.T_AFILIACIONES'
        +' WHERE TDOCAFID IN (SELECT MAX(TDOCAFID) TDOCAID FROM GEMAP.T_AFILIACIONES WHERE DOCASOID  = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
        +' AND DOCFECDESAUTORIZA IS NULL)';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.FieldByName('DOCDECLAASOIMG').AsString <> '' Then fcDeclaracion.Visible := True Else fcDeclaracion.Visible := False;
      If DM1.cdsQry.FieldByName('DOCAUTDESCIMG').AsString <> '' Then fcAutorizacion.Visible := True Else fcAutorizacion.Visible := False;
      fcDeclaracion.Hint:='Gemap';
      fcAutorizacion.Hint:='Gemap';
      // Fin: MAS_201907_HPC
   end;

   // Inicio: MAS_201905_HPC
   // Se captura codigo de oficina en la variable "wCodAre"
   xSql := 'SELECT CODARE FROM SEGURIDAD.M_USUARIO WHERE ID_USUARIO = '+QuotedStr(DM1.wUsuario);
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   DM1.wCodAre  := DM1.cdsQry.FieldByName('CODARE').AsString;
   // Fin: MAS_201905_HPC
  // Inicio: MAS_201901_HPC
  // Esta linea ya no se utilizará
  // DM1.sAPO201 :='APO201';
  // Controla a que tipos de asociados se le da el acceso
  If ((DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'DO') Or (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE') Or (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO'))
     And (DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S') Then
     fcsbConsentimiento.Visible := True
  Else
     fcsbConsentimiento.Visible := False;
  // Fin: MAS_201901_HPC
   dblcdCodLeyPen.Selected.Clear;
   dblcdCodLeyPen.Selected.Add('CODLEYPEN'#9'2'#9'Código'#9#9);
   dblcdCodLeyPen.Selected.Add('DESLEYPEN'#9'15'#9'Descripción'#9#9);

   dblcdCodPrestacion.Selected.Clear;
   dblcdCodPrestacion.Selected.Add('CODPRE'#9'2'#9'Código'#9#9);
   dblcdCodPrestacion.Selected.Add('DESPRE'#9'15'#9'Descripción'#9#9);
   Cargado := false;
   xSql := 'SELECT dptoid, dptodes, dptoabr, codtel FROM APO158';
   DM1.cdsPadre.Close;
   DM1.cdsPadre.DataRequest(xSql);
   DM1.cdsPadre.Open;
   dbeDirec.Text := DM1.cdsAso.FieldByName('ASODIR').AsString;

   IF (DM1.cdsAso.FieldByName('AUTDESAPO').AsString <> 'S') AND
      ((DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'DO'))  THEN
   BEGIN
      TRY
         FMantAsociadoAutDes := TFMantAsociadoAutDes.Create(self);
         FMantAsociadoAutDes.MostrarDcto(false);
         FMantAsociadoAutDes.ShowModal;
      FINALLY
         FMantAsociadoAutDes.Free;
      END;
   END;

   If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '04' Then
   Begin
      xSql := 'SELECT CASE WHEN IMAGEN_ANVERSO IS NOT NULL THEN ''S'' ELSE ''N'' END IMAGEN_ANVERSO,'
      +' CASE WHEN IMAGEN_REVERSO IS NOT NULL THEN ''S'' ELSE ''N'' END IMAGEN_REVERSO,'
      +' CASE WHEN FOTO IS NOT NULL THEN ''S'' ELSE ''N'' END FOTO,'
      +' CASE WHEN FIRMA IS NOT NULL THEN ''S'' ELSE ''N'' END FIRMA'
      +' FROM ASO_CARNE_EXTRANJERIA WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND NVL(ESTADO,''X'') = ''S''';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If (DM1.cdsQry.FieldByName('IMAGEN_ANVERSO').AsString = 'N') Or
         (DM1.cdsQry.FieldByName('IMAGEN_REVERSO').AsString = 'N') Or
         (DM1.cdsQry.FieldByName('FOTO').AsString = 'N') Or
         (DM1.cdsQry.FieldByName('FIRMA').AsString = 'N') Or
         (DM1.cdsAso.FieldByName('FECCADCAREXT').AsDateTime < Now) Then
      Begin
         Try
            FMenCarnetExt := TFMenCarnetExt.create(self);
            FMenCarnetExt.Showmodal;
         Finally
            FMenCarnetExt.free;
         End;
      End;
   End;

   xSegundaVez:='N';
   IF DM1.cdsAso.FieldByName('AUTDESAPO').AsString = 'S' THEN
   BEGIN
      // Si UPROID Marcada para cambiar
      xWhere := 'UPROID=''' + DM1.cdsAso.fieldbyname('UPROID').AsString + '''';
      if DM1.DisplayDescrip('prvTGE', 'APO102', 'FLGDESAPO', xWhere, 'FLGDESAPO')='S' then
      begin
         xWhere := 'ASOID=''' + DM1.cdsAso.fieldbyname('ASOID').AsString + '''';
         sFirmaCarta := DM1.DisplayDescrip('prvTGE', 'APOSINCARTA', 'AUTODESC, ASOID', xWhere, 'AUTODESC');

         if sFirmaCarta='' then
         begin
            xSQL:='insert into db2admin.aposincarta '
                    + '(oficautorizo, departamento, unidadproceso, unidadpago, ugel, apellidosnombres, fechaautorizacion, '
                    +  'autodesc, asoid, asodni, asocodmod, fecreg, usureg, ofdesid, flg_seg_fir) '
                    +'values ( '
                    +  QuotedStr(DM1.cdsAso.FieldByName('ofiregautdescuo').AsString)+', '
                    +  QuotedStr(edtDpto.Text)+', '
                    +  QuotedStr(dbeUproDes.Text)+', '
                    +  QuotedStr(dbeUpagDes.Text)+', '
                    +  QuotedStr(dbeUses.Text)+', '
                    +  QuotedStr(DM1.cdsAso.FieldByName('ASOAPENOM').AsString)+', '
                    +  QuotedStr(copy(DM1.cdsAso.FieldByName('FECAUTDESCUO').AsString,1,10))+', '
                    +  QuotedStr('S')+', '
                    +  QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+', '
                    +  QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString)+', '
                    +  QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString)+', '
                    +  'NULL, NULL, NULL, ''N'' )';
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
            xSegundaVez:='S';
         end
         else
         begin

         end;
      end;
   END;
   IF (DM1.cdsAso.FieldByName('AUTDESAPO').AsString <> 'S') AND
      ((DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'DO') OR (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'VO')) THEN
   Begin
      xWhere := 'ASOID=''' + DM1.cdsAso.fieldbyname('ASOID').AsString + '''';
      sFirmaCarta := DM1.DisplayDescrip('prvTGE', 'APOSINCARTA', 'AUTODESC, ASOID', xWhere, 'AUTODESC');
      IF sFirmaCarta = 'S' THEN
      BEGIN
         TRY
            FMantAsociadoAutDes := TFMantAsociadoAutDes.Create(self);
            if xSegundaVez='S' then
            begin
               FMantAsociadoAutDes.fcLabel1.Caption:='Regularización del Descuento del Aporte por Segunda Vez';
            end;
            FMantAsociadoAutDes.MostrarDcto(True);
            FMantAsociadoAutDes.ShowModal;
         FINALLY
            FMantAsociadoAutDes.Free;
         END;
      END;
   End;

   xSQL := 'SELECT ASOID'
          +' FROM COB_FSC_DEUDA_FSC_CAB'
          +' WHERE ASOID='+ QuotedStr( DM1.cdsAso.fieldbyname('ASOID').AsString ) + ' AND ID_EST_FSC <> ''13'' ';

   If DM1.CountReg(xSQL) > 0 Then
   BEGIN
      MessageDlg('El asociado tiene créditos aplicados con el FSC !!!', mtInformation, [mbOk], 0);
   END;


   If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '04' Then
   Begin

      If Trim(dbdtFecExpCarExt.Text) = '' Then
      Begin
         MessageDlg('Debe ingresar fecha de caducidad del carnet de extranjería.', mtError, [mbOk], 0);
      End;

      If dbdtFecExpCarExt.Date < DM1.FechaSys Then
      Begin
         MessageDlg('Carnet de extranjeria se encuentra vencido debe proceder ha actualizar.', mtError, [mbOk], 0);
      End;
   End;


   xgrabo := 'N';
   xvalido := 'N';
   xYaGrabe := 'N';
   edtRegPen.Text := DM1.RecuperaDatos('APO105', 'REGPENID', Trim(DM1.cdsAso.FieldByName('REGPENID').asstring), 'REGPENDES');

   IF DM1.xInsert <> '1' THEN
      edtTipAso.Text := DM1.RecuperaDatos('APO107', 'ASOTIPID', DM1.cdsAso.fieldbyname('ASOTIPID').AsString, 'ASOTIPDES');
   IF DbLlTipAso.text = 'CO' THEN
   BEGIN
      lblResNom.Caption := 'N° Contrato';
      lblFecNom.Caption := 'Fec.Inicio';
      lblResCes.Caption := '';
      dbeNroCes.Visible := False;
      lblFecCes.Caption := 'Fec.Fin';
   END
   ELSE
   BEGIN
      lblResNom.Caption := 'N°Resol.Nomb';
      lblFecNom.Caption := 'Fecha';
      lblResCes.Caption := 'N°Resol.Cese';
      dbeNroCes.Visible := True;
      lblFecCes.Caption := 'Fecha';
   END;
   IF (DM1.xOfiDes > '01') and (Length(TRIM(DM1.cdsAso.FieldByName('ASOID').AsString))=0) THEN

   BEGIN
      btnActualizaReniec.Visible := False;
   END;


   edtTipBen.Text := '';
   edtEstBen.Text := '';
//   If (DM1.cdsAso.FieldByName('ASOTIPID').AsString='CE') OR (DM1.cdsAso.FieldByName('ASOTIPID').AsString='DO') then
//   Begin
   xSql := 'Select Case When A.PVSLBENNR Is Not Null Then ''LIQUIDADO'' When A.PVSLBENNR Is Null Then ''EN TRAMITE'' End ESTLIQ,'
   +' B.BENEFDES From PVS301 A, TGE186 B Where A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' And A.PVSESTADO Not In (''04'',''13'') And A.PVSTIPBEN = B.TIPBENEF';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   edtTipBen.Text := DM1.cdsQry.FieldByName('ESTLIQ').AsString;
   edtEstBen.Text := DM1.cdsQry.FieldByName('BENEFDES').AsString;
   If Trim(edtTipBen.Text) = '' Then
   Begin
      xSql := 'Select C.BENEFDES, ''LIQUIDADO'' ESTLIQ From APO201 A, PVS315 B, TGE186 C'
      +' Where A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' And'
      +'((A.ASOID = B.ASOID) Or'
      +' (A.ASOCODMOD = B.COD_MOD And Substr(A.ASOAPENOM,1,5) = Substr(B.NOM_GEN,1,5)) Or'
      +' (A.ASODNI = B.LIB_ELE And Substr(A.ASOAPENOM,1,5) = Substr(B.NOM_GEN,1,5)) Or'
      +' (A.ASOAPENOM = B.NOM_GEN And A.ASODNI = B.LIB_ELE) Or'
      +' (A.ASOAPENOM = B.NOM_GEN And A.ASOCODMOD = B.COD_MOD)'
      +')'
      +' And B.COD_BEN = C.TIPBENEF';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      edtTipBen.Text := DM1.cdsQry.FieldByName('ESTLIQ').AsString;
      edtEstBen.Text := DM1.cdsQry.FieldByName('BENEFDES').AsString;
   End;
   If (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE') And (Trim(edtTipBen.Text) = '') Then
   Begin
      edtEstBen.Text := 'OFICIO';
   End;
   If Trim(edtEstBen.Text) <> '' Then
   Begin
      edtTipBen.Font.Color := clRed;
      edtEstBen.Font.Color := clRed;
      lbltitestben.Visible := True;
      pnlTipBen.Visible := True;
      pnlEstBen.Visible := True;
   End
   Else
   Begin
      lbltitestben.Visible := False;
      pnlTipBen.Visible := False;
      pnlEstBen.Visible := False;
   End;
   Ingresomax;
   // ImageBoton.Picture := ImagAso.Picture;
   // IF NOT BitFoto.Enabled THEN ImageBoton.Visible := False;

   ObsSinResolver(DM1.cdsAso.FieldByName('ASOID').AsString);
   IF CDSOBSSINRESOLVER.RecordCount > 0 THEN
   BEGIN
      TRY
         FMantAsociadoObsSinRes := TFMantAsociadoObsSinRes.Create(self);
         FMantAsociadoObsSinRes.EnlazarDatos(DSOBSSINRESOLVER);
         FMantAsociadoObsSinRes.ShowModal;
      FINALLY
         CDSOBSSINRESOLVER.EmptyDataSet;
         FMantAsociadoObsSinRes.Free;
         pnlControl.Enabled := true;
      END;
   END;
  // Cargando datos del colegio
   ActualizaColegios;
   Cargado := true;

    xSQL := ' SELECT ASOID,  '
        +  ' EXTRACT(YEAR FROM NUMTOYMINTERVAL(MONTHS_BETWEEN(TRUNC(SYSDATE),ASOFECNAC),''month'')) EDAD '
        +  ' FROM APO201     '
        +  ' WHERE EXTRACT(YEAR FROM NUMTOYMINTERVAL(MONTHS_BETWEEN(TRUNC(SYSDATE),ASOFECNAC),''month'')) >= 65 '
        +  '       AND ASOID='+ QuotedStr( DM1.cdsAso.fieldbyname('ASOID').AsString )
        +  '       AND ASOTIPID = ''DO''   ';

   If DM1.CountReg(xSQL) > 0 Then
   BEGIN
      MessageDlg('DOCENTE TIENE MAS DE 65 AÑOS DE EDAD PROXIMO A ' + #13#10 + '    CESAR SEGÚN LEY DE REFORMA MAGISTERIAL', mtInformation, [mbOk], 0);
      edtanos.Font.Color := clWhite;
      edtanos.Color := clRed;

   END
   Else
   BEGIN
      edtanos.Font.Color := clNavy;               // "$00E8FFFF";
      edtanos.Color := clWhite;
   END;
   if EdtCodMod.Text <> '' then DM1.FG_VALIDA_CODIGO_MODULAR(EdtCodMod.Text);

   ValidarAsignarRegalo;
   // Inicio: MAS_201901_HPC
   // Activar boton de consentimiento de datos
   ActivaBotonConsentimiento;
   // Fin: MAS_201901_HPC

   If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '04' Then
   Begin
      lblapepatdni.Caption := 'Apellido Paterno (CE)';
      lblapematdni.Caption := 'Apellido Materno (CE)';
      lblapecasdni.Caption := 'Apellido de Casada (CE)';
      lblnomdni.Caption    := 'Nombres (CE)';
      lbleticarext.Visible := True;
      pnlRENIEC5.Visible := True;
   End
   Else
   Begin
      lblapepatdni.Caption := 'Apellido Paterno (DNI)';
      lblapematdni.Caption := 'Apellido Materno (DNI)';
      lblapecasdni.Caption := 'Apellido de Casada (DNI)';
      lblnomdni.Caption    := 'Nombres (DNI)';
      lbleticarext.Visible := False;
      pnlRENIEC5.Visible := False;
   End;

END;

PROCEDURE TFMantAsociado.FormClose(Sender: TObject; VAR Action: TCloseAction);
VAR
   xAsoId: STRING;
BEGIN
   TRY
      IF (DM1.cdsAso.State = dsInsert) OR (DM1.cdsAso.State = dsEdit) THEN
         DM1.cdsAso.CancelUpdates;

      IF DM1.cdsAso.fieldbyname('ASOID').AsString = '' THEN Exit;

      If (flagFallecido = false) then
      begin
      IF (DM1.cdsAso.fieldbyname('ASOCODMOD').AsString = '')
         OR (DM1.cdsAso.fieldbyname('ASOTIPID').AsString = '') THEN
      BEGIN
         ShowMessage('Advertencia : Falta registrar datos...');
         Exit;
      END;
      end;
      
      BorraFotos;
      xAsoId := DM1.cdsAso.fieldbyname('ASOID').AsString;
      DM1.cdsAso.Close;
      DM1.DCOM1.Connected := False;
      Application.Terminate;
  // Inicio: MAS_201901_HPC
  // Activar boton de consentimiento de datos 
      Exit;
  // Fin: MAS_201901_HPC
   EXCEPT
   END;
END;

PROCEDURE TFMantAsociado.FormCreate(Sender: TObject);
VAR
   inifile: TIniFile;
   xIP_Reniec,XSQL: STRING;
BEGIN
   //Carga URL DE RENIEC
   XSQL:='Select url_ser_reniec From db2admin.cre_par_gen_sis ';
   DM1.cdsConsulta.Close;
   DM1.cdsConsulta.DataRequest(XSQL);
   DM1.cdsConsulta.Open;
   V_URL_RENIEC := TRIM(DM1.cdsConsulta.FieldByname('url_ser_reniec').AsString);
   DM1.cdsConsulta.Close;
//Fin MAS_201908_HPC

   Cargado := false;
   IF DM1.xInsert = '1' THEN
   BEGIN
      XSQL := 'SELECT solicitud, asoid, asocodmod, asocodaux, asocodpago, asoapepat, asoapemat, asonombres, asoapenom, useid, uproid,'+
              'upagoid, asoresnom, asofresnom, resid, regpenid, asositid, asofact, asotipid, viaid, vianombre, asonumdir, asofdpto,'+
              'asodpto, zonaid, zonanomb, ubigeoid, dptoid, paisid, refdom, asofecnac, asotelf1, asotelf2, tipdoccod, asodocnum,'+
              'asolibmil, asoruc, estcivid, asosexo, asoemail, bancoid, asoncta, sitcta, asodni, graacid, grainsid, profid, asofmov,'+
              'asofluging, asodir, usuario, hreg, freg, asolugest, fecterest, tiempoest, asolnacid, asorescese, asofrescese, fgarante,'+
              'zipid, ciudid, archivoftp, ciaid, flagvar, asoapncre, flgfsol, estclf, observa, usr_crea, fec_crea, usr_ben, fec_ben, ctaser,'+
              'cargo, variascuot, crencuota, nfusion, idimage, fsinliq, asodescol, asodircol, asozipcol, asoapepatdni, asoapematdni, asonomdni,'+
              'asoapenomdni, asodeslab, asodirlab, asodptlabid, asoprvlabid, asodstlabid, asotellab, dptnacid, prvnacid, dstnacid, vialabid,'+
              'zonalabid, fecact, indicador, ccosid, password, codafp, deshabilitado, valida_ci, tcreacion, regverif, codmodant, valcodmoddni,'+
              'actarcrenant, actarcren, reingreso, autdesapo, fecautdesapo, usuregautdesapo, ofiregautdesapo, codmodautdesapo, codarchivo,'+
              'gencodbar, envautdes, corenvautdes, codtiplug, numdirviv, nummanviv, numlotviv, desintviv, desrefviv, codurbviv, desurbviv,'+
              'numetaviv, desetaviv, numintviv, nomdirviv, anoenv, envio, codotrdocide, numotrdocide, codmotdestapo, autdescuo, fecautdescuo,'+
              'usuregautdescuo, ofiregautdescuo, codmodautdescuo, mdfasodir, mdfzipid, mdfcntreg, mdfusrmod, mdffecmod, emicarta, desmanviv,'+
              'codmotdestcuo, fecactpad, est_aut_cli, usu_aut_cli, fec_aut_cli, obs_aut_cli, usu_cre_cli, fec_cre_cli, obs_aut_cli_uge,'+
              'obs_aut_cli_pad, obs_aut_cli_otr, ceneduid, fallecido, tipo_fall_id, codtiptel1, codreftel1, codtiptel2, codreftel2, codpension,'+
              'fecregautdesapo, codleypen, codblocharen, numblocharen, coddepintren, desdepintren, asoapecasdni, asoaptser, fecactsit, codciutelfij1,'+
              'codciutelfij2, fecreccadaps, usureccadaps, codmotautcadaps, codpre, nvl(validaaporte,''S'') validaaporte, AUTDESAPOFORMATO, D_COD_TUR, FECCADCAREXT'+
              ' FROM ASO_NUE_CLI WHERE ASOID = ''AAAAAAAAAA''';
      DM1.cdsAso.Close;
      DM1.cdsAso.DataRequest(XSQL);
      DM1.cdsAso.Open;
      DM1.cdsAso.Insert;
   END;
   DM1.BlqComponentes(Self);
   lkcDpto2.Enabled := False;
   xSQL := 'SELECT ESTCIVID,ESTCIVDES,ESTCIVDESFEM FROM TGE125 ORDER BY ESTCIVID';
   DM1.cdsUSES.Close;
   DM1.cdsUSES.DataRequest(xSQL);
   DM1.cdsUSES.Open;
   dblEstadoCivil.LookupTable := DM1.cdsUSES;
   dblEstadoCivil.Selected.Clear;
   IF DbLlSexo.Text = 'F' THEN
   begin
      dblEstadoCivil.LookupField := 'ESTCIVDESFEM';
      dblEstadoCivil.Selected.Add('ESTCIVDESFEM'#9'15'#9'Estado'#9#9);
   end
   Else
   begin
      dblEstadoCivil.LookupField := 'ESTCIVDES';
      dblEstadoCivil.Selected.Add('ESTCIVDES'#9'15'#9'Estado'#9#9);
   end;
   xTIPDOCCOD := DM1.CrgDescrip('FLGACT=''S'' AND FLGDNI=''S'' ','TGE159','TIPDOCCOD');
   // xTIPDOCCOD := DM1.cdsAso.FieldByName('TIPDOCCOD').AsString;

   xSQL:='SELECT TIPDOCCOD,TIPDOCABR,FLGDNI,LONCAM FROM TGE159 WHERE TIPDOCCOD IN (''04'', ''10'') AND FLGACT=''S''';
   DM1.cdsCbcos.Close;
   DM1.cdsCbcos.DataRequest(xSQL);
   DM1.cdsCbcos.Open;
   dblTipDoc.LookupTable:= Dm1.cdsCbcos;
   dblTipDoc.LookupField:= 'TIPDOCCOD';
   dblTipDoc.Selected.Clear;
   dblTipDoc.Selected.Add('TIPDOCCOD'#9'02'#9'Cod.'#9#9);
   dblTipDoc.Selected.Add('TIPDOCABR'#9'02'#9'Descripción'#9#9);
   dblTipDocChange(Self);

   dblTipDoc.Text := Dm1.cdsAso.Fieldbyname('TIPDOCCOD').AsString;

  IF DM1.xInsert <> '1' THEN
  BEGIN
    XSQL := 'SELECT I1.ESTCIV FROM SIOREN.SIO_CONSULTA_IDENTIDAD I1 WHERE I1.DNI = ' + QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString);    
    DM1.cdsQry25.Close;
    DM1.cdsQry25.DataRequest(XSQL);
    DM1.cdsQry25.Open;
    DM1.cdsQry25.Close;
    Dm1.cdsUSES.Locate('ESTCIVID',Dm1.cdsAso.Fieldbyname('ESTCIVID').AsString,[]);
    IF DbLlSexo.Text = 'F' THEN
    begin
       dblEstadoCivil.Text := DM1.cdsUSES.FieldByName('ESTCIVDESFEM').AsString;
       edtEstadoCivil.EditText := dblEstadoCivil.Text;
    end
    Else
    begin
      dblEstadoCivil.Text := DM1.cdsUSES.FieldByName('ESTCIVDES').AsString;
      edtEstadoCivil.EditText := dblEstadoCivil.Text;
    end;
    
  END;

     DM1.cdsOfidesAso.Close;
     DM1.cdsOfidesAso.DataRequest('SELECT VALDATASO,ACTDATREN FROM APO110 WHERE OFDESID=''' + DM1.xOfiDes + ''' ');
     DM1.cdsOfidesAso.Open;

   IF DM1.cdsOfidesAso.FieldByName('VALDATASO').AsString = 'S' THEN
      BitVerifica.Enabled := True
   ELSE
      BitVerifica.Enabled := False;

   DM1.cdsQry.Close;
   DM1.cdsQry.IndexFieldNames := '';

   BitPrest.Enabled := True; //siempre activo a no ser que sea insert

   IF DM1.xInsert = '0' THEN //Cuando se Modifica no se debe tener acceso a estos campos
   BEGIN
      DbLUniPro.Enabled := False;
      DbLUniPag.Enabled := False;
      DbLUses.Enabled := False;
      pnlResoluciones.Enabled := False;
      DM1.xDNI := DM1.cdsAso.FieldByName('ASODNI').AsString;
   END;

   IF DM1.xInsert = '1' THEN //Cuando se Adiciona no debe tener acceso a estos botones
   BEGIN
      BitPrest.Enabled := False;
      BitMstApo.Enabled := False;
      BitModifica.Enabled := False;
      BitVerifica.Enabled := False;
      btnObservacion.Enabled := False;
      BitReasignacion.Enabled := False;
      BitResol.Enabled := False;
      BitCuentas.Enabled := False;
      BitSocio.Enabled   := False;
      btncodpago.Enabled := False;
      DbLUniPro.Enabled := True;
      DbLUniPag.Enabled := True;
      DbLUses.Enabled := True;
      // pnlResoluciones.Enabled := True;
      DbLlTipAso.Text := 'CE';
      edtTipAso.Text := 'CESANTE';
      btnActualizaReniec.Enabled:=true;
      btnActualizaReniec.Visible:=true;
   END;

   IF DM1.cdsAso.FieldByName('VALCODMODDNI').AsString = 'S' THEN
   BEGIN
      dbeLibDni.Enabled := False;
      dbeLibDni.Color := $0097FF97
   END
   ELSE
      dbeLibDni.Enabled := dbeLibDni.Enabled;

   IF DM1.cdsAso.FieldByName('REINGRESO').AsString = 'S' THEN
      msgReingreso.Visible := True
   ELSE
      msgReingreso.Visible := False;

   xSQL:='SELECT asoid, fecval, usuval, equusu, ofiusu, campo, feccad, datval, objeto, status, usudesval, fecdesval, obsdesval '
        +'FROM VAL_DAT_ASO WHERE ASOID='''+DM1.cdsAso.FieldByName('ASOID').AsString + ''' AND STATUS=''S''';
   DM1.cdsVAL_DAT_ASO.Close;
   DM1.cdsVAL_DAT_ASO.DataRequest(XSQL);
   DM1.cdsVAL_DAT_ASO.Open;

   llenaCamposValida;
   VerificaCamposValidados;
   If xsinvalidar>0 Then
   Begin
     Validacionautomatica(DM1.cdsAso.FieldbyName('ASODNI').AsString,DM1.cdsAso.FieldbyName('ASOID').AsString);
   End;
    VerificaCamposValidados;
   pintaCamposValidados(Self);


   IF DM1.sAPO201 = 'APO201' THEN
   BEGIN
      bbtnN3.Visible := False;
   END;

  //Si en Fallecido tiene acceso solo a ver la primera pantalla
  //El Nivel 03 puede modificar datos de un fallecido
   IF (DM1.CrgDescrip('ASOID=' + QuotedStr(Trim(DM1.cdsAso.FieldByName('ASOID').AsString)) + ' AND PVSESTADO NOT IN (''04'',''13'')', 'PVS301', 'PVSTIPBEN') = '02') AND
      (Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) < '03') THEN
   BEGIN
      BitPrest.Enabled := True;
      BitMstApo.Enabled := True;
      btnObservacion.Enabled := True;
      BitModifica.Enabled := False;
      BitVerifica.Enabled := False;
      BitReasignacion.Enabled := False;
      BitResol.Enabled := False;
      BitCuentas.Enabled := False;
      BitSocio.Enabled   := False;
      btncodpago.Enabled := False;
      BitGrabar.Enabled := False;
      lblFallecido.Visible := True;
   END
   ELSE
      IF (DM1.CrgDescrip('ASOID=' + QuotedStr(Trim(DM1.cdsAso.FieldByName('ASOID').AsString)) + ' AND PVSESTADO NOT IN (''04'',''13'')', 'PVS301', 'PVSTIPBEN') = '02') AND
      (Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) = '03') THEN
         lblFallecido.Visible := True
      ELSE
         lblFallecido.Visible := False;

  IF DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' THEN
    lblFallecido.Visible := false
  ELSE
    lblFallecido.Visible := true;

  IF DM1.cdsAso.FieldByName('FALLECIDO').AsString = 'S' THEN
  BEGIN
    IF DM1.cdsAso.FieldByName('ASOSEXO').AsString = 'M' THEN
      lblFallecido.Caption := 'FALLECIDO'
    ELSE
      lblFallecido.Caption := 'FALLECIDA';
    FechaFall; // se añade a Etiqueta de Fallecido, la fecha de Fallecimiento
    //No se pueden realizar Validaciones
    BitVerifica.Enabled := false;
  END;

   IF DM1.xInsert = '1' THEN
   BEGIN
      lblAsoApeNom.Caption := 'Ingreso de Nuevo Asociado';
      gbIdentidadAso.Enabled := True;
      gbLaboralAso.Enabled := True;
      pnlRegPension.Enabled := True;
      pnlCodPension.Enabled := True;
      BitModifica.Enabled := False;
      BitGrabar.Enabled := True;
      pnlCodMod.Enabled := True;
      // pnlResoluciones.Enabled := True;
   END;

   IF DM1.XINSERTA = '10' THEN
   BEGIN
      BitGrabar.Enabled := False;
   end;
   IF DM1.xCnd = 'DESAUT' THEN
   BEGIN
    bitAutoriza.Caption := 'Desautorizar';
   END;
   fn_muestra_msj_hoja_cargo_exp(DM1.cdsAso.FieldByName('ASOID').AsString);
//Inicio MAS_202104_HPC
   pnlCodPension.Enabled := False;
//Fin MAS_202104_HPC 
END;

PROCEDURE TFMantAsociado.FormKeyPress(Sender: TObject; VAR Key: Char);
BEGIN
   IF Key = #13 THEN
   BEGIN
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   END
END;

PROCEDURE TFMantAsociado.DbLlSexoChange(Sender: TObject);
BEGIN
   IF DM1.cdsSexo.Locate('ID', DbLlSexo.Text, []) THEN
   BEGIN
      dbeSexo.Text := DM1.cdsSexo.FieldByName('DESCRIP').asstring
   END
   ELSE
   BEGIN
      IF Length(DbLlSexo.Text) <> 2 THEN
      BEGIN
         Beep;
         dbeSexo.Text := '';
      END;

   END;

   IF DbLlSexo.Text = 'F' THEN
   begin
      dblEstadoCivil.LookupField := 'ESTCIVDESFEM';
      dblEstadoCivil.Selected.Clear;
      dblEstadoCivil.Selected.Add('ESTCIVDESFEM'#9'15'#9'Estado'#9#9);
   end
   Else
   begin
      dblEstadoCivil.LookupField := 'ESTCIVDES';
      dblEstadoCivil.Selected.Clear;
      dblEstadoCivil.Selected.Add('ESTCIVDES'#9'15'#9'Estado'#9#9);
   end;

   If  DM1.xInsert  <> '1' Then
   Begin
     dblTipDoc.Enabled := False;
     edtnumdoc.Enabled := False;
   End;
END;

PROCEDURE TFMantAsociado.DbLlTipAsoChange(Sender: TObject);
BEGIN
   IF DM1.cdsTAso.Locate('ASOTIPID', DbLlTipAso.Text, []) THEN
   BEGIN
      edtTipAso.Text := DM1.cdsTAso.FieldByName('ASOTIPDES').asstring;
//Inicio MAS_202104_HPC 
      if ((DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '02')) or
         ((DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '04')) then
//Fin MAS_202104_HPC 
      begin
        edtCodPensionista.Enabled := true;
        dblcdCodLeyPen.Enabled := true;
        dblcdCodPrestacion.Enabled := True;
        pnlCodPension.Enabled := True;
      end
      else
      begin
        IF Cargado then
        begin
          edtCodPensionista.Text := '';
          edtCodPensionista.Enabled := false;
          dblcdCodLeyPen.Text := '';
          dblcdCodLeyPen.Enabled := false;
          dblcdCodLeyPen.Color := $00E8FFFF;
          dblcdCodPrestacion.Text := '';
          dblcdCodPrestacion.Enabled := false;
          dblcdCodPrestacion.Color := $00E8FFFF;
          pnlCodPension.Enabled := False;
        end;
      end;
   END
   ELSE
   BEGIN
      IF Cargado and (Length(DbLlTipAso.Text) <> 2) then
      begin
        edtCodPensionista.Text := '';
        edtCodPensionista.Enabled := false;

        dblcdCodLeyPen.Text := '';
        dblcdCodLeyPen.Enabled := false;
        dblcdCodLeyPen.Color := $00E8FFFF;
        dblcdCodPrestacion.Text := '';
        dblcdCodPrestacion.Enabled := false;
        dblcdCodPrestacion.Color := $00E8FFFF;
        pnlCodPension.Enabled := False;
        Beep;
        edtTipAso.Text := '';
      end;
   END;
END;

PROCEDURE TFMantAsociado.lkcDptoChange(Sender: TObject);
BEGIN
   IF DM1.cdsPadre.Active = True Then
     Begin
        IF DM1.cdsPadre.Locate('DPTOID', VarArrayof([lkcDpto.text]), []) THEN
           BEGIN
             EdtDpto.Text := DM1.cdsPadre.FieldByName('DPTODES').Asstring;
             IF lkcDpto.Enabled THEN
                lkcProv.Enabled := True;
           END
        ELSE
          BEGIN
           IF Length(lkcDpto.Text) <> 2 THEN
            BEGIN
             Beep;
             lkcProv.Enabled := False;
             EdtDpto.Text := '';
            END;
          END;
     End;
END;

PROCEDURE TFMantAsociado.lkcProvChange(Sender: TObject);
BEGIN
   IF DM1.cdsHijo.Active and DM1.cdsHijo.Locate('PROVID', lkcProv.Text, []) THEN
   BEGIN
      edtProv.Text := DM1.cdsHijo.FieldByName('PROVDES').AsString;
      IF lkcProv.Enabled THEN
         lkcDist.Enabled := True;
   END
   ELSE
   BEGIN
      edtProv.Text := '';
      lkcDist.Enabled := False;
   END;
END;

PROCEDURE TFMantAsociado.lkcDistChange(Sender: TObject);
BEGIN
   IF DM1.cdsSAso.Active and DM1.cdsSAso.Locate('ZIPID', lkcDist.Text, []) THEN
   begin   
      edtDist.Text := DM1.cdsSAso.FieldByName('ZIPDES').AsString;
   end
   ELSE
   begin
      edtDist.Text := '';
   end;
END;

//Inicio MAS_202104_HPC
PROCEDURE TFMantAsociado.DbLlRegPenChange(Sender: TObject);
var xsql:String;
BEGIN
    pnlCodPension.Enabled   := False;

   IF DM1.cdsResol.Locate('REGPENID', DbLlRegPen.Text, []) THEN
   BEGIN

      edtRegPen.Text := DM1.cdsResol.FieldByName('REGPENDES').AsString;
      IF DbLlRegPen.Text = '03' THEN
         DbLlAfp.Enabled := True
      ELSE
      BEGIN
         DbLlAfp.Text := '';
         DbLlAfp.Enabled := False;
      END;
//    if (DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '02') then
      if ((DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '02')) OR
         ((DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '04')) then
      begin
        dblcdCodLeyPen.Enabled := true;
        dblcdCodLeyPen.Color := clWindow;
        edtCodPensionista.Enabled := true;
        dblcdCodPrestacion.Enabled := true;
        dblcdCodPrestacion.Color := clWindow;
        pnlCodPension.Enabled := True;

        xSql := 'SELECT CODPRE, DESPRE FROM ASO_COD_PRE_MAE WHERE NVL(FLAACT,''X'') = ''S'' AND REGPEN='''+DM1.cdsResol.Fieldbyname('REGPEN').Asstring+''' ORDER BY CODPRE';
        DM1.cdsCodPrestacion.Close;
        DM1.cdsCodPrestacion.DataRequest(xSql);
        DM1.cdsCodPrestacion.Open;
        DM1.cdsCodPrestacion.Locate('CODPRE',dblcdCodPrestacion.Text,[]);

        xSQL := 'SELECT CODLEYPEN, DESLEYPEN FROM ASO_LEY_PEN_MAE WHERE REGPEN='''+DM1.cdsResol.Fieldbyname('REGPEN').Asstring+''' ORDER BY CODLEYPEN';
        DM1.cdsCodLeyPen.Close;
        DM1.cdsCodLeyPen.DataRequest(xSql);
        DM1.cdsCodLeyPen.Open;
        DM1.cdsCodLeyPen.Locate('CODLEYPEN',dblcdCodPrestacion.Text,[]);

     end
//Fin MAS_202104_HPC 
      else
      begin
        if Cargado then
        begin
          dblcdCodLeyPen.Text := '';
          dblcdCodLeyPen.Enabled := false;
          dblcdCodLeyPen.Color := $00E8FFFF;
          edtCodPensionista.Text := '';
          edtCodPensionista.Enabled := false;
          dblcdCodPrestacion.Text := '';
          dblcdCodPrestacion.Enabled := false;
          dblcdCodPrestacion.Color := $00E8FFFF;
          pnlCodPension.Enabled := False;
        end;
      end;
   END
   ELSE
   BEGIN
      IF Cargado and (Length(DbLlRegPen.Text) <> 2) THEN
      BEGIN
         Beep;
         dblcdCodLeyPen.Text := '';
         dblcdCodLeyPen.Enabled := false;
         dblcdCodLeyPen.Color := $00E8FFFF;
         edtCodPensionista.Text := '';
         edtCodPensionista.Enabled := false;
         edtRegPen.Text := '';
         dblcdCodPrestacion.Text := '';
         dblcdCodPrestacion.Enabled := false;
         dblcdCodPrestacion.Color := $00E8FFFF;
         pnlCodPension.Enabled := False;
      END;
   END;
//Inicio MAS_202104_HPC 
   dblcdCodLeyPen.Text     := '';
   edtCodLeyPen.Text       := '';
   dblcdCodPrestacion.Text := '';
   edtdesprestacion.Text   := '';
   edtCodPensionista.Text  := '';
//Fin MAS_202104_HPC 
END;

PROCEDURE TFMantAsociado.DbLlRegPenExit(Sender: TObject);
BEGIN
   IF Trim(DbLlRegPen.Text) = '03' THEN
      DbLlAfp.Enabled := True
   ELSE
   BEGIN
      DbLlAfp.Text := '';
      DbLlAfp.Enabled := False;
   END;
END;

PROCEDURE TFMantAsociado.DbLlAfpChange(Sender: TObject);
BEGIN
   IF DM1.cdscarta.Locate('IDAFP', DbLlAfp.Text, []) THEN
   BEGIN
      EdtAfp.Text := DM1.cdscarta.FieldByName('PROVDES').AsString
   END
   ELSE
   BEGIN
      IF Length(DbLlAfp.Text) <> 2 THEN
      BEGIN
         Beep;
         EdtAfp.Text := '';
      END;
   END
END;

PROCEDURE TFMantAsociado.DbLUniProChange(Sender: TObject);
BEGIN
   IF DM1.cdsUPro.Locate('UPROID', VarArrayof([DbLUniPro.text]), []) THEN
   BEGIN
      dbeUproDes.Text := DM1.cdsUPro.FieldByName('UPRONOM').AsString
   END
   ELSE
   BEGIN
      IF Length(DbLUniPro.Text) <> 3 THEN
      BEGIN
         Beep;
         dbeUproDes.Text := '';
      END;
   END
END;

PROCEDURE TFMantAsociado.DbLUniPagChange(Sender: TObject);
BEGIN
   IF DM1.cdsUPago.Locate('UPROID;UPAGOID', VarArrayof([DbLUniPro.Text, DbLUniPag.Text]), []) THEN
   BEGIN
      dbeUpagDes.Text := DM1.cdsUPago.FieldByName('UPAGONOM').Asstring;
   END
   ELSE
   BEGIN
      IF Length(DbLUniPag.Text) <> 2 THEN
      BEGIN
         Beep;
         dbeUpagDes.Text := '';
      END;
   END;
   DbLUsesChange(self);
END;

PROCEDURE TFMantAsociado.DbLUsesChange(Sender: TObject);
BEGIN
   IF DM1.cdsUse.Locate('UPROID;UPAGOID;USEID', VarArrayof([DbLUniPro.Text, DbLUniPag.Text, DbLUses.Text]), []) THEN
   BEGIN
      dbeUses.Text := DM1.cdsUse.FieldByName('USENOM').AsString;
   END
   ELSE
   BEGIN
      IF Length(DbLUses.Text) <> 2 THEN
      BEGIN
         Beep;
         dbeUses.Text := '';
      END;
   END
END;

PROCEDURE TFMantAsociado.lkcDpto2Change(Sender: TObject);
BEGIN
   IF DM1.cdsRec.Locate('DPTOID', lkcDpto2.Text, []) THEN
   BEGIN
      EdtDpto2.Text := DM1.cdsRec.FieldByName('DPTODES').asstring;
   END
   ELSE
   BEGIN
      IF Length(lkcDpto2.Text) <> 2 THEN
      BEGIN
         Beep;
         EdtDpto2.Text := '';
         lkcProv2.Enabled := False;
      END;
   END
END;

PROCEDURE TFMantAsociado.lkcProv2Change(Sender: TObject);
BEGIN
   IF DM1.cdsTRela.Locate('PROVID', lkcProv2.Text, []) THEN
   BEGIN
      EdtProv2.Text := DM1.cdsTRela.FieldByName('PROVDES').asstring;
   END
   ELSE
   BEGIN
      EdtProv2.Text := '';
      lkcDist2.Enabled := False;
   END;
END;

PROCEDURE TFMantAsociado.lkcDist2Change(Sender: TObject);
BEGIN
   IF DM1.cdsQry7.Active and DM1.cdsQry7.Locate('ZIPID', lkcDist2.Text, []) THEN
      EdtDist2.Text := DM1.cdsQry7.FieldByName('ZIPDES').asstring
   ELSE
      EdtDist2.Text := '';

END;

PROCEDURE TFMantAsociado.BitResolClick(Sender: TObject);
VAR
   xSQL, xAsoid: STRING;
BEGIN
   IF (BitGrabar.Enabled) AND (BitGrabar.Visible) THEN
   BEGIN
      ShowMessage('Debe [Grabar] para continuar...');
      Exit;
   END;

   If  (DM1.cdsAso.fieldbyname('FALLECIDO').AsString <> 'S') Then
   Begin
       xAsoId := DM1.cdsAso.fieldbyname('ASOID').AsString;
       IF Length(trim(xAsoid)) = 0 THEN
       BEGIN
          MessageDlg('Es Asociado Nuevo, No Se Puede Ingresar Informacion Por Esta Opción', mtError, [mbOk], 0);
          Exit;
       END;
       TRY
          fResNomb2 := TfResNomb2.create(self);
          DM1.cdsRecursos.Close;
          xSQL := 'SELECT TIPRESID,TIPRESDES FROM APO104';
          DM1.cdsRecursos.DataRequest(xSQL);
          DM1.cdsRecursos.Open;

          IF DM1.sAPO201 = 'APO201' THEN
          BEGIN
             DM1.sResolucion := 'ASO_RESOLUCIONES';
             DM1.XSELECT     := 'asoid, asocodmod, asocodaux, asoresnom, asofresnom, asorescese, asofrescese, resvig, correlativo,'
                               +'usuario, freg, hreg, liquidado, numliq, fecliq, reingreso, anulado, obsanu, usuanu, fecanu, numexpliq,'
                               +'fecexpliq,obs ';
             DM1.sReso_where := '';
          END
          ELSE
          BEGIN
             DM1.sResolucion := 'ASO_RESOLUCIONES_NUE';
             DM1.XSELECT     := 'solicitud, asoid, asocodmod, asocodaux, asoresnom, asofresnom, asorescese, asofrescese, resvig,'
                               +'correlativo, usuario,freg, hreg, liquidado, numliq, fecliq, reingreso, anulado, obsanu, usuanu,'
                               +'fecanu, numexpliq, fecexpliq ';
             DM1.sReso_where := 'SOLICITUD=''' + DM1.cdsAso.fieldbyname('SOLICITUD').AsString + ''' and ';
          END;

          xSQL := 'SELECT '+DM1.XSELECT+' FROM ' + DM1.sResolucion + ' WHERE ' + DM1.sReso_where + ' ASOID=' + QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString) + ' ORDER BY CORRELATIVO ';
          DM1.cdsGradoA.Close;
          DM1.cdsGradoA.DataRequest(xSQL);
          DM1.cdsGradoA.Open;
          IF DM1.cdsGradoA.RecordCount > 1 THEN DM1.cdsGradoA.First;
          fResNomb2.Showmodal;
       FINALLY
          DM1.cdsRecursos.Close;
          DM1.cdsGradoA.Close;
          fResNomb2.Free;
       END;

       IF DM1.cdsAso.FieldByName('REINGRESO').AsString = 'S' THEN
          msgReingreso.Visible := True
       ELSE
          msgReingreso.Visible := False;

      IF DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' THEN
      BEGIN
        ModiDestinofTickes;
      END;
   End
   Else
   Begin
       If  (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0)Then
       begin
            xAsoId := DM1.cdsAso.fieldbyname('ASOID').AsString;
           IF Length(trim(xAsoid)) = 0 THEN
           BEGIN
              MessageDlg('Es Asociado Nuevo, No Se Puede Ingresar Informacion Por Esta Opción', mtError, [mbOk], 0);
              Exit;
           END;
           TRY
              fResNomb2 := TfResNomb2.create(self);
              DM1.cdsRecursos.Close;
              xSQL := 'SELECT TIPRESID,TIPRESDES FROM APO104';
              DM1.cdsRecursos.DataRequest(xSQL);
              DM1.cdsRecursos.Open;

              IF DM1.sAPO201 = 'APO201' THEN
              BEGIN
                 DM1.sResolucion := 'ASO_RESOLUCIONES';
                 DM1.XSELECT     := 'asoid, asocodmod, asocodaux, asoresnom, asofresnom, asorescese, asofrescese, resvig, correlativo,'
                                   +'usuario, freg, hreg, liquidado, numliq, fecliq, reingreso, anulado, obsanu, usuanu, fecanu, numexpliq,'
                                   +'fecexpliq,obs ';
                 DM1.sReso_where := '';
              END
              ELSE
              BEGIN
                 DM1.sResolucion := 'ASO_RESOLUCIONES_NUE';
                 DM1.XSELECT     := 'solicitud, asoid, asocodmod, asocodaux, asoresnom, asofresnom, asorescese, asofrescese, resvig,'
                                    +'correlativo, usuario,freg, hreg, liquidado, numliq, fecliq, reingreso, anulado, obsanu, usuanu,'
                                    +'fecanu, numexpliq, fecexpliq ';
                 DM1.sReso_where := 'SOLICITUD=''' + DM1.cdsAso.fieldbyname('SOLICITUD').AsString + ''' and ';
              END;

              xSQL := 'SELECT '+DM1.XSELECT+' FROM ' + DM1.sResolucion + ' WHERE ' + DM1.sReso_where + ' ASOID=' + QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString) + ' ORDER BY CORRELATIVO ';
              DM1.cdsGradoA.Close;
              DM1.cdsGradoA.DataRequest(xSQL);
              DM1.cdsGradoA.Open;
              IF DM1.cdsGradoA.RecordCount > 1 THEN DM1.cdsGradoA.First;
              fResNomb2.Showmodal;
           FINALLY
              DM1.cdsRecursos.Close;
              DM1.cdsGradoA.Close;
              fResNomb2.Free;
           END;

           IF DM1.cdsAso.FieldByName('REINGRESO').AsString = 'S' THEN
              msgReingreso.Visible := True
           ELSE
              msgReingreso.Visible := False;
       End
       Else
       Begin
           MessageDlg('No puede modificar fecha Resolución de Nombramiento porque tiene Expediente en Trámite', mtError, [mbOk], 0);
           Exit;
       End;
   End;
END;

PROCEDURE TFMantAsociado.BitCuentasClick(Sender: TObject);
VAR
   xSQL, xasoid: STRING;
BEGIN
   IF (BitGrabar.Enabled) AND (BitGrabar.Visible) THEN
   BEGIN
      ShowMessage('Debe [Grabar] para continuar...');
      Exit;
   END;

   xAsoId := DM1.cdsAso.fieldbyname('ASOID').AsString;
   IF Length(trim(xAsoid)) = 0 THEN
   BEGIN
      MessageDlg('Es Asociado Nuevo, No se puede Ingresar Informacion por esta Opción', mtError, [mbOk], 0);
      Exit;
   END;

   // Inicio: MAS_201905_HPC 	
   // Solo permite el acceso al mantenimiento de cuenta de ahorros para usuario de previsión social 
   If DM1.wCodAre  <> '22' Then
   Begin
      MessageDlg('Opción solo para usuarios de la unidad de Previsión Social.', mtInformation, [mbOk],0);
      Exit;
   End;
   // Fin: MAS_201905_HPC

   TRY
      fCtasAhorro := TfCtasAhorro.create(self);
      DM1.cdsRecursos.Close;
      xSQL := 'SELECT BANCOID,BANCONOM FROM TGE105 ORDER BY CPTOID';
      DM1.cdsRecursos.DataRequest(xSQL);
      DM1.cdsRecursos.Open;
      xSQL := 'SELECT SITCTAID,SITCTADES FROM COB103 ORDER BY SITCTAID';
      DM1.cdsSitCta.Close;
      DM1.cdsSitCta.DataRequest(xSQL);
      DM1.cdsSitCta.Open;
      xSql := 'SELECT A.ASOITEM, ASOID, ASOCODMOD, ASOCODAUX, ASOAPENOM, ASONCTA, SITCTA,B.SITCTADES, A.USUARIO, A.FREG, A.HREG, ASOITEM, A.BANCOID, C.BANCONOM'
      +' FROM APO207 A,COB103 B,TGE105 C WHERE A.SITCTA  = B.SITCTAID AND A.BANCOID = C.BANCOID'
      +' AND ASOID = '+QuotedStr(DM1.cdsAso.fieldbyname('ASOID').AsString)+' ORDER BY A.ASOITEM DESC';
      DM1.cdsGradoA.Close;
      DM1.cdsGradoA.DataRequest(xSQL);
      DM1.cdsGradoA.Open;
      IF DM1.cdsGradoA.RecordCount > 1 THEN DM1.cdsGradoA.First;
      fCtasAhorro.Showmodal;
   FINALLY
      DM1.cdsGradoA.Close;
      DM1.cdsRecursos.Close;
      DM1.cdsSitCta.Close;
      fCtasAhorro.Free;
   END;

  IF DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' THEN
  BEGIN
    ModiDestinofTickes;
  END;
END;

PROCEDURE TFMantAsociado.BitSocioClick(Sender: TObject);
VAR
   xSQL, xAsoId: STRING;
BEGIN
   IF (BitGrabar.Enabled) AND (BitGrabar.Visible) THEN
   BEGIN
      ShowMessage('Debe [Grabar] para continuar...');
      Exit;
   END;

   xAsoId := DM1.cdsAso.FieldByName('ASOID').AsString;

   IF Length(trim(xAsoid)) = 0 THEN
   BEGIN
      MessageDlg('Es Asociado Nuevo, No Se Puede Ingresar Informacion Por Esta Opcion', mtError, [mbOk], 0);
      Exit;
   END;

   IF DM1.xCnd <> 'VRF' THEN
   BEGIN
      xSQL := 'SELECT A.ASOID,A.FHREGISTRO,A.USUARIO,A.OFDESID,B.OFDESNOM '
         + '     FROM ASO003 A, APO110 B '
         + '    WHERE ASOID=' + QuotedStr(Trim(xAsoId)) + ' AND'
         + '          DATSOCIOECO IS NOT NULL AND'
         + '          IDESTADO IS NULL AND'
         + '          A.OFDESID=B.OFDESID';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      IF DM1.cdsQry.RecordCount > 0 THEN
      BEGIN
    // Inicio: MAS_202001_HPC
    // Se valida para que el mensaje sea solo informativo y no restrictivo
    // Solo temporal hasta el 01/05/2020 y solo para docentes nombrados despues del 01/12/2019
         MessageDlg(' Los datos del Asociado se Encuentran Pendiente De Verificación Por El SUPERVISOR De La Oficina De  :  ' + DM1.cdsQry.FieldByName('OFDESNOM').AsString, mtError, [mbOk], 0);
         // DM1.cdsQry.Close;
         //Exit;
         xSql := 'SELECT ASOID, ASOAPENOMDNI FROM APO201 WHERE ASOID = '+QuotedStr(Trim(xAsoId))
         +' AND ASOTIPID = ''DO'' '
         +' AND ASOFRESNOM >= ''01/12/2019'''
         +' AND TO_DATE(SYSDATE) <= ''01/05/2020''';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount = 0 Then
         BEGIN
          DM1.cdsQry.Close;
          Exit;
         END;
     //Fin MAS_202001_HPC
      END;
      DM1.cdsQry.Close;
   END;

   TRY
      xSQL := 'SELECT GRAINSID,GRAINSABR FROM TGE119 ORDER BY GRAINSID';
      DM1.cdsGradoI.Close;
      DM1.cdsGradoI.DataRequest(xSQL);
      DM1.cdsGradoI.Open;

      xSQL := 'SELECT TIPVIVID,TIPVIVABR FROM APO109 ORDER BY TIPVIVID';
      DM1.cdsReclamo.Close;
      DM1.cdsReclamo.DataRequest(xSql);
      DM1.cdsReclamo.Open;

      xSQL := 'SELECT PARENID,PARENABR FROM TGE149 ORDER BY PARENID';
      DM1.cdsTVia.Close;
      DM1.cdsTVia.DataRequest(xSQL);
      DM1.cdsTVia.Open;
      fDatosSocEco := TfDatosSocEco.create(self);

      IF DM1.xCnd = 'VRF' THEN
      BEGIN

      END;

      IF DM1.xCnd = 'AUT' THEN
      BEGIN
      END;

      fDatosSocEco.Showmodal;
   FINALLY

      fDatosSocEco.free;
   END;

  IF DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' THEN
  BEGIN
    ModiDestinofTickes;
  END;
END;

PROCEDURE TFMantAsociado.dbeUproDesChange(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   xSQL := 'SELECT UPROID,UPAGOID,UPAGONOM FROM APO103 WHERE UPROID=' + QuotedStr(Trim(DbLUniPro.Text));
   DM1.cdsUPago.Close;
   DM1.cdsUPago.DataRequest(xSQL);
   DM1.cdsUPago.Open;
   IF DbLUniPro.Enabled THEN DbLUniPag.Enabled := True;
   DbLUniPag.LookupTable := DM1.cdsUPago;
END;

PROCEDURE TFMantAsociado.dbeUpagDesChange(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   xSQL := 'SELECT UPROID,UPAGOID,USEID,USENOM,DPTOID FROM APO101 WHERE NVL(FDESHABILITADO,''S'') =''N'' AND UPAGOID=' + QuotedStr(Trim(DbLUniPag.Text)) + ' AND SUBSTR(USENOM,1,1)<>''X'' ';
   DM1.cdsUSE.Close;
   DM1.cdsUSE.DataRequest(xSQL);
   DM1.cdsUSE.Open;
   DbLUses.LookupTable := DM1.CdsUSE;
   IF DbLUniPro.Enabled THEN DbLUses.Enabled := True;
END;

PROCEDURE TFMantAsociado.edtDptoChange(Sender: TObject);
VAR
   xSql: STRING;
BEGIN
   xSql := 'SELECT DPTOID||CIUDID AS PROVID, CIUDDES AS PROVDES FROM TGE121'
         + ' WHERE DPTOID = ' + QuotedStr(lkcDpto.Text);
   DM1.cdsHijo.Close;
   DM1.cdsHijo.DataRequest(xSql);
   DM1.cdsHijo.Open;
END;

PROCEDURE TFMantAsociado.edtProvChange(Sender: TObject);
VAR
   xSql: STRING;
BEGIN
   xSql := 'SELECT zipid, zipabr, zipdes, ciudid, dptoid FROM APO122 WHERE CIUDID= ' + QuotedStr(TRIM(lkcProv.Text));
   DM1.cdsSAso.Close;
   DM1.cdsSAso.DataRequest(xSql);
   DM1.cdsSAso.Open;
END;

PROCEDURE TFMantAsociado.edtDpto2Change(Sender: TObject);
BEGIN
   DM1.cdsTRela.Close;
   DM1.cdsTRela.DataRequest('SELECT DPTOID||CIUDID AS PROVID,' +
      'CIUDDES AS PROVDES' +
      ' FROM TGE121' +
      ' WHERE DPTOID=''' + TRIM(lkcDpto2.Text) + ''' ');
   DM1.cdsTRela.Open;
END;

PROCEDURE TFMantAsociado.edtProv2Change(Sender: TObject);
BEGIN
   DM1.cdsQry7.Close;
   DM1.cdsQry7.DataRequest('SELECT zipid, zipabr, zipdes, ciudid, dptoid FROM APO122 WHERE CIUDID=''' + TRIM(lkcProv2.Text) + ''' ');
   DM1.cdsQry7.Open;
END;

// Se retira la actualización del campo ESTCIVID en el APO201, desde el APO206 al momento de presionar el boton SALIR.
PROCEDURE TFMantAsociado.BitSalirClick(Sender: TObject);
Var xSql:String;
BEGIN

   IF (xYaGrabe <> 'S') AND (BitGrabar.Enabled) AND (dm1.xentra <> 'S') THEN
   BEGIN
      IF MessageDlg('NO GRABO INFORMACION, ESTA SEGURO(A) DE SALIR', mtConfirmation, [mbYes, mbNo], 0) = mrNo THEN exit;
   END;

   IF (xvalido <> 'S') AND (BitVerifica.Enabled) AND (xsinvalidar > 0) AND (dm1.xentra <> 'S') THEN
   BEGIN
      IF MessageDlg('NO VALIDO INFORMACION, ESTA SEGURO(A) DE SALIR', mtConfirmation, [mbYes, mbNo], 0) = mrNo THEN exit;
   END;

   // Inicio: MAS_201901_HPC
   // Verificar si se imprimio la hoja de consentimiento de datos
//Inicio MAS_202303_HPC
   xSql := 'SELECT NVL(LPDIMP,''N'') LPDIMP, LPDPTIPCON,LPDAREORI FROM ASO_LPDP_CON_DET WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
//Fin MAS_202303_HPC
   +' AND LPDPNUMCON IN  (SELECT MAX(LPDPNUMCON)  FROM ASO_LPDP_CON_DET WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
//Inicio MAS_202303_HPC
   If (DM1.cdsQry.FieldByName('LPDIMP').AsString = 'N') And (DM1.cdsQry.FieldByName('LPDPTIPCON').AsString = 'T') And (DM1.cdsQry.FieldByName('LPDAREORI').AsString <> '12')  Then
      If MessageDlg('Tiene Impresión pendiente de Consentimiento de Datos,'+#13+'¿ Está seguro(a) de salir?' ,mtConfirmation, [mbYes, mbNo], 0) = mrNo then
         Exit;
   close;
END;

PROCEDURE TFMantAsociado.dbdtFecNacChange(Sender: TObject);
BEGIN

END;

//Verifica condiciones de grabacion
FUNCTION TFMantAsociado.VerifGraba: Boolean;
BEGIN

   Result := True;

   // Mientras no este fallecido y no este liquidado
   If Not (DM1.cdsAso.fieldbyname('FALLECIDO').AsString = 'S') and (length(edtTipBen.text)=0) Then
   Begin

      IF (Length(trim(dbeLibDni.Text)) <> 8) and  (dblTipDoc.Text=xTIPDOCCOD) THEN
      BEGIN
         MessageDlg('DNI Incorrecto...', mtError, [mbOk], 0);
         Result := False;
      END;

      IF  (dblTipDoc.Text<>xTIPDOCCOD) and (Length(Trim(dblEstadoCivil.Text))=0) Then
      BEGIN
         MessageDlg('Debe Ingresar Estado Civil', mtError, [mbOk], 0);
         Result := False;
      END;
      
      IF  (dblTipDoc.Text<>xTIPDOCCOD) and (Length(Trim(edtnumdoc.Text))=0) Then
      BEGIN
         MessageDlg('Debe Ingresar número de documento de identificación', mtError, [mbOk], 0);
         Result := False;
      END;

      IF Length(Trim(EdtApePatDNI.Text)) + Length(Trim(EdtApeMatDNI.Text)) = 0 THEN
      BEGIN
         MessageDlg('Debe Ingresar Apellidos !!!', mtError, [mbOk], 0);
         Result := False;
      END;

      IF Length(Trim(EdtAsoNomDNI.Text)) = 0 THEN
      BEGIN
         MessageDlg('Debe Ingresar El Nombre Del Asociado !!!', mtError, [mbOk], 0);
         Result := False;
      END;

      IF Length(trim(dbdtFecNac.Text)) = 0 THEN
      BEGIN
         MessageDlg('Debe Ingresar La Fecha De Nacimiento Del Asociado!!!', mtError, [mbOk], 0);
         Result := False;
      END;

      dbdtFecNacExit(self);

      IF DbLUniPro.Enabled THEN
      BEGIN

         dbeUproDesChange(self);
         IF Length(Trim(dbeUproDes.Text)) = 0 THEN
         BEGIN
            MessageDlg('Debe Seleccionar Una Unidad De Proceso !!!', mtError, [mbOk], 0);
            Result := False;
         END;

      DbLUniPagChange(self);
      IF Length(Trim(dbeUpagDes.Text)) = 0 THEN
      BEGIN
         MessageDlg('Debe Seleccionar Una Unidad De Pago !!!', mtError, [mbOk], 0);
         Result := False;
      END;

      DbLUsesChange(self);
      IF Length(Trim(dbeUses.Text)) = 0 THEN
      BEGIN
         MessageDlg('Debe Seleccionar Una Use/Ugel !!!', mtError, [mbOk], 0);
         Result := False;
      END;

   END;

   {
   IF Length(Trim(dbeCodPag.Text)) = 0 THEN
   BEGIN
      MessageDlg(' Falta Ingresar El CODIGO DE PAGO ', mtError, [mbOk], 0);
      Result := False;
   END;
   }

   IF Length(Trim(EdtCodMod.Text)) = 0 THEN
   BEGIN
      MessageDlg('Debe Ingresar El Codigo Modular !!!', mtError, [mbOk], 0);
      Result := False;
   END
   ELSE
      IF DM1.xInsert = '1' THEN
      BEGIN
         EdtCodMod.Text := Format('%.10d', [StrToInt64(EdtCodMod.Text)]);
         IF Length(Trim(EdtCodMod.Text)) <> 10 THEN
         BEGIN
            MessageDlg('El Codigo Modular Debe Ser De 10 Caracteres!!!', mtError, [mbOk], 0);
            Result := False;
         END;
      END;

   IF (dm1.xInsert = '1') AND (DbLlTipAso.Text = 'CE') THEN
   BEGIN
      IF DBDTResCes.Date > StrToDate('31/12/1996') THEN
      BEGIN
         MessageDlg(' Fecha de Cese debe ser Maximo hasta el 31/12/1996 ', mtError, [mbOk], 0);
         Result := False;
      END;
   END;

   IF (LengtH(trim(dbeNroCes.Text)) = 0) AND (DbLlTipAso.Text = 'CE') THEN
   BEGIN
      MessageDlg(' Falta Ingresar El NUMERO De La RESOLUCION DE CESE ', mtError, [mbOk], 0);
      Result := False;
   END;

   IF (lengTH(trim(DBDTResCes.Text)) = 0) AND (DbLlTipAso.Text = 'CE') THEN
   BEGIN
      MessageDlg(' Falta Ingresar La FECHA De La RESOLUCION DE CESE ', mtError, [mbOk], 0);
      Result := False;
   END;
End;

END;

PROCEDURE TFMantAsociado.dbdtFecNacExit(Sender: TObject);
BEGIN
   IF dbdtFecNac.Date > StrToDate('30/12/1899') THEN
   BEGIN
      edtanos.Text := DM1.tiempoTranscurrido(dm1.FechaSys, dbdtFecNac.Date);
      edtanos2 := FloatToStr(int(YearSpan(dm1.FechaSys, dbdtFecNac.Date)));
      IF (dm1.Valores(edtanos2) < 18) OR (dm1.Valores(edtanos2) > 100) THEN
      BEGIN
         MessageDlg('El Rango de Edad debe estar entre 18 y 100 !!!', mtError, [mbOk], 0);
         edtanos.Font.Color := clred;
         dbdtFecNac.SetFocus;
         exit;
      END
      ELSE
         edtanos.Font.Color := clBlack;
   END;
END;

//define el ingreso máximo de caracteres
PROCEDURE TFMantAsociado.Ingresomax;
BEGIN
   EdtApePatDni.MaxLength := DM1.cdsAso.FieldByName('ASOAPEPATDNI').Size;
   EdtApeMatDni.MaxLength := DM1.cdsAso.FieldByName('ASOAPEMATDNI').Size; 
   EdtApeCasDni.MaxLength :=  DM1.cdsAso.FieldByName('ASOAPECASDNI').Size;
   EdtAsoNomDni.MaxLength := DM1.cdsAso.FieldByName('ASONOMDNI').Size;
   // dbeLibDni.MaxLength := DM1.cdsAso.FieldByName('ASODNI').Size;
   dbeLibDni.MaxLength := 8;   
   dbeDirec.MaxLength := DM1.cdsAso.FieldByName('ASODIR').Size;
END;

PROCEDURE TFMantAsociado.EdtCodModExit(Sender: TObject);
BEGIN
   IF Length(trim(EdtCodMod.Text)) > 0 THEN
   BEGIN
      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByName('ASOCODMOD').AsString := Format('%.10d', [StrToInt64(EdtCodMod.Text)]);
   END;
END;

PROCEDURE TFMantAsociado.ImageBotonClick(Sender: TObject);
BEGIN
   DM1.xSgr := 'IDE';
   fIdentAso := TfIdentAso.Create(self);
   If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '10' Then
      DM1.CargaImagenesDNI(Trim(DM1.cdsAso.FieldByName('ASODNI').AsString),'fIdentAso');
   fIdentAso.ImagAso.Picture := FMantAsociado.ImagAso.Picture;
   fIdentAso.ImaFirma.Picture := FMantAsociado.ImaFirma.Picture;
   fIdentAso.Showmodal;
   fIdentAso.free;

END;

PROCEDURE TFMantAsociado.BitReasignacionClick(Sender: TObject);
VAR
   xSQL, xAsoId: STRING;
BEGIN
   IF (BitGrabar.Enabled) AND (BitGrabar.Visible) THEN
   BEGIN
      ShowMessage('Debe [Grabar] para continuar...');
      Exit;
   END;

   xAsoId := DM1.cdsAso.FieldByName('ASOID').AsString;

   IF MaxNroItem(xAsoId) <> '000' THEN
   BEGIN
      xSQL := 'SELECT ESTADO,OBSERVACION,ITEM FROM ASO007 WHERE ASOID=' + QuotedStr(xAsoId) + ' AND ITEM=' + QuotedStr(MaxNroItem(xAsoId));
      DM1.cdsQry2.Close;
      DM1.cdsQry2.DataRequest(xSQL);
      DM1.cdsQry2.Open;
      IF DM1.cdsQry2.RecordCount > 0 THEN
      BEGIN
         IF DM1.cdsQry2.fieldbyname('ESTADO').AsString = 'I' THEN
         BEGIN
            MessageDlg(' El Registro Se Encuentra INACTIVO Por  :  ' + StrUpper(pChar(DM1.cdsQry2.fieldbyname('OBSERVACION').AsString)), mtError, [mbOk], 0);
            DM1.cdsQry2.Close;
            Exit;
         END;
      END;
      DM1.cdsQry2.Close;
   END;

   IF DM1.xCnd <> 'VRF' THEN
   BEGIN
      xSQL := 'SELECT A.ASOID,A.FHREGISTRO,A.USUARIO,A.OFDESID,B.OFDESNOM FROM ASO003 A , APO110 B WHERE ASOID=' + QuotedStr(Trim(xAsoId)) + ' AND REASIGNACION IS NOT NULL  AND IDESTADO IS NULL AND A.OFDESID=B.OFDESID   ';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      IF DM1.cdsQry.RecordCount > 0 THEN
      BEGIN
         // Inicio: MAS_202001_HPC
         // Se valida para que el mensaje sea solo informativo y no restrictivo
         // Solo temporal hasta el 01/05/2020 y solo para docentes nombrados despues del 01/12/2019
         MessageDlg(' Los Datos Del ASOCIADO Se Encuentran Pendiente De Verificación Por El SUPERVISOR De La Oficina De  :  ' + DM1.cdsQry.FieldByName('OFDESNOM').AsString, mtError, [mbOk], 0);
         //DM1.cdsQry.Close;
         //Exit;
         xSql := 'SELECT ASOID, ASOAPENOMDNI FROM APO201 WHERE ASOID = '+QuotedStr(Trim(xAsoId))
         +' AND ASOTIPID = ''DO'' '
         +' AND ASOFRESNOM >= ''01/12/2019'''
         +' AND TO_DATE(SYSDATE) <= ''01/05/2020''';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         If DM1.cdsQry.RecordCount = 0 Then
         BEGIN
          DM1.cdsQry.Close;
          Exit;
         END;
         //Fin MAS_202001_HPC
      END;
      DM1.cdsQry.Close;
   END;
   TRY
      xSQL := 'SELECT UPROID,UPRONOM FROM APO102';
      DM1.cdsUPro.Close;
      DM1.cdsUPro.DataRequest(xSQL);
      DM1.cdsUPro.Open;
      fNueAsociado := TfNueAsociado.create(self);
      fNueAsociado.Caption := 'Mantenimiento De Asociados / Reasignación';

      IF DM1.xCnd = 'VRF' THEN
      BEGIN
         fNueAsociado.Pan01.Enabled := False;
         fNueAsociado.Pan02.Enabled := False;
         fNueAsociado.Pan03.Enabled := False;
         fNueAsociado.Pan04.Enabled := False;
         fNueAsociado.Pan05.Enabled := False;
         fNueAsociado.BitGrabar.Enabled := False;
      END;
      IF DM1.xCnd = 'AUT' THEN
      BEGIN
         fNueAsociado.Pan01.Enabled := False;
         fNueAsociado.Pan02.Enabled := False;
         fNueAsociado.Pan03.Enabled := False;
         fNueAsociado.Pan04.Enabled := False;
         fNueAsociado.Pan05.Enabled := False;
         fNueAsociado.BitGrabar.Enabled := False;
      END;

      IF DM1.xOfiDes > '01' THEN
      BEGIN
         fNueAsociado.Pan01.Enabled := False;
         fNueAsociado.Pan02.Enabled := False;
         fNueAsociado.Pan03.Enabled := False;
         fNueAsociado.Pan04.Enabled := False;
         fNueAsociado.Pan05.Enabled := False;
         fNueAsociado.BitGrabar.Enabled := False;
         IF ((DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE') AND (DM1.cdsAso.FieldByName('REGPENID').AsString = '01')) OR
            (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO') OR (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'VO') THEN
         BEGIN
            fNueAsociado.Pan03.Enabled := True;
            fNueAsociado.BitGrabar.Enabled := True;
            fNueAsociado.mecodcargo.Enabled := True;
         END;
      END;

      IF (DM1.sAPO201 = 'APO201') AND (Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) < '03') THEN
      BEGIN
         fNueAsociado.Pan01.Enabled := False;
         fNueAsociado.Pan02.Enabled := False;
         fNueAsociado.Pan03.Enabled := False;
         fNueAsociado.Pan04.Enabled := False;
         fNueAsociado.Pan05.Enabled := False;
         fNueAsociado.BitGrabar.Enabled := False;
         fNueAsociado.mecodcargo.Enabled := False;
      END;

// Habilita actualizacion de Código Modular, Apellidos y Nombres para Nivel 3 de Sede Central
      IF (DM1.xOfiDes = '01') and (DM1.sAPO201 = 'APO201') and (Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) = '03') THEN
      BEGIN
         fNueAsociado.Pan03.Enabled := True;
         fNueAsociado.Pan04.Enabled := True;
         fNueAsociado.Pan05.Enabled := True;
      END;
      IF (DM1.sAPO201 = 'ASO_NUE_CLI') AND (Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) < '03') THEN
      BEGIN
         fNueAsociado.Pan01.Enabled := True;
         fNueAsociado.Pan02.Enabled := True;
         fNueAsociado.BitGrabar.Enabled := True;
      END;

      fNueAsociado.Pan01.Enabled := True;
      fNueAsociado.Pan02.Enabled := True;
      fNueAsociado.BitGrabar.Enabled := True;

      IF DM1.cdsAso.FieldByName('VALCODMODDNI').AsString = 'S' THEN
      BEGIN
         fNueAsociado.Pan03.Enabled := False;
         fNueAsociado.EdtCodMod.Color := $0097FF97
      END
      ELSE
         fNueAsociado.Pan03.Enabled := True;

// Habilita actualizacion de Código Modular, Apellidos y Nombres para Nivel 3 de Sede Central
      IF (DM1.xOfiDes = '01') and (DM1.sAPO201 = 'APO201') and (Copy(DM1.CrgArea(DM1.wUsuario), 6, 2) = '03') THEN
      BEGIN
      END
      ELSE
      BEGIN
      fNueAsociado.Pan04.Enabled := False;
      fNueAsociado.Pan05.Enabled := False;
      END;

      fNueAsociado.Showmodal;
   FINALLY
      fNueAsociado.Close;
      fNueAsociado.free;
   END;

  IF DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' THEN
  BEGIN
    ModiDestinofTickes;
  END;
END;

PROCEDURE TFMantAsociado.BitVerificaClick(Sender: TObject);
// Var xSql:String;
BEGIN
   IF (BitGrabar.Enabled) AND (BitGrabar.Visible) THEN
   BEGIN
      ShowMessage('Debe [Grabar] para continuar...');
      Exit;
   END;

   IF DM1.xOfiDes > '01' THEN
   BEGIN
      IF DM1.sAPO201 <> 'APO201' THEN
      BEGIN
         Exit;
      END;
   END;

   IF xgrabo = 'S' THEN //Marca los campos actualizados de RENIEC en forma automatica
   BEGIN

      IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOAPEPATDNI']), []) THEN
      BEGIN
         CDSVALIDA.Edit;
         CDSVALIDA.FieldByName('FLAG').AsString := '1';
      END;
      IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOAPECASDNI']), []) THEN
      BEGIN
         CDSVALIDA.Edit;
         CDSVALIDA.FieldByName('FLAG').AsString := '1';
      END;
      IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOAPEMATDNI']), []) THEN
      BEGIN
         CDSVALIDA.Edit;
         CDSVALIDA.FieldByName('FLAG').AsString := '1';
      END;
      IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOFECNAC']), []) THEN
      BEGIN
         CDSVALIDA.Edit;
         CDSVALIDA.FieldByName('FLAG').AsString := '1';
      END;
      IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOSEXO']), []) THEN
      BEGIN
         CDSVALIDA.Edit;
         CDSVALIDA.FieldByName('FLAG').AsString := '1';
      END;
      IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASONOMDNI']), []) THEN
      BEGIN
         CDSVALIDA.Edit;
         CDSVALIDA.FieldByName('FLAG').AsString := '1';
      END;

      If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '10' Then
      Begin
         IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASODNI']), []) THEN
         BEGIN
            CDSVALIDA.Edit;
            CDSVALIDA.FieldByName('FLAG').AsString := '1';
         END;
      End;

      If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '04' Then
      Begin
         IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASODOCNUM']), []) THEN
         BEGIN
            CDSVALIDA.Edit;
            CDSVALIDA.FieldByName('FLAG').AsString := '1';
         END;
      End;




   END;

   TRY
      CDSVALIDA.First;
      FMantAsociadoDatosValidar := TFMantAsociadoDatosValidar.Create(self);
      FMantAsociadoDatosValidar.xsinvalidar := self.xsinvalidar;
      FMantAsociadoDatosValidar.xReniec := self.xReniec;
      FMantAsociadoDatosValidar.xTipDoc := dblTipDoc.Text;
      FMantAsociadoDatosValidar.xvalido := self.xvalido;
      FMantAsociadoDatosValidar.EnlazarDatos(DSVALIDA);

      FMantAsociadoDatosValidar.ShowModal;

      self.xsinvalidar := FMantAsociadoDatosValidar.xsinvalidar;
      self.xReniec := FMantAsociadoDatosValidar.xReniec;

      IF NOT FMantAsociadoDatosValidar.bPintarCamposValidados THEN
         exit;

      pintaCamposValidados(self);

      ActivaPantPrincipal;
      IF DM1.xInsert <> '1' THEN
         BitGrabarClick(SELF)
      ELSE
      BEGIN
         VerificaCamposValidados;
         gbIdentidadAso.Enabled := False;
         gbLaboralAso.Enabled := False;
         pnlRegPension.Enabled := False;
         pnlCodPension.Enabled := False;
      END;
      ActivaPantPrincipal;
   FINALLY
      FMantAsociadoDatosValidar.Free;
   END;

   IF BitGrabar.Enabled THEN
      ActivaPantPrincipal
   ELSE
      pnlControl.Enabled := True;

   IF DM1.xCnd = 'AUT' THEN
      ActivaPantPrincipal;
END;

//Las imágenes las carga a Memoria stream
Procedure TFMantAsociado.CargaMemStreamImg;
Begin
   // Foto
   DM1.Jpg    := Nil;
   DM1.Stream := Nil;
   DM1.jpg    := TJPEGImage.Create;
   DM1.Stream := TMemoryStream.Create;
   DM1.Stream.Position := 0;
   DM1.Jpg.LoadFromStream(DM1.Stream);
   DM1.jpg.LoadFromFile('C:\Solexes\_Fot'+Trim(dbeLibDni.Text)+'.JPG');
   //crea una corriente en memoria
   DM1.Stream := TMemoryStream.Create;
   //Graba en la corriente el archivo Jpg
   DM1.Jpg.SaveToStream(DM1.Stream);
   DM1.Stream.Position := 0;
   // Firma
   DM1.JpgFirma    := Nil;
   DM1.StreamFirma := Nil;
   DM1.jpgFirma    := TJPEGImage.Create;
   DM1.StreamFirma := TMemoryStream.Create;
   DM1.StreamFirma.Position := 0;
   DM1.jpgFirma.LoadFromStream(DM1.StreamFirma);
   DM1.jpgFirma.LoadFromFile('C:\Solexes\_Fir'+Trim(dbeLibDni.Text)+'.JPG');
   //crea una corriente en memoria
   DM1.StreamFirma := TMemoryStream.Create;
   //Graba en la corriente el archivo Jpg
   DM1.jpgFirma.SaveToStream(DM1.StreamFirma);
   DM1.StreamFirma.Position := 0;
End;


PROCEDURE TFMantAsociado.btnActualizaReniecClick(Sender: TObject);
BEGIN
   If dblTipDoc.Text = '10' Then
   Begin
      If (DM1.xOfiDes <> '01') AND
         (Length(Trim(DM1.cdsAso.FieldByName('ASOID').AsString))=0) Then
      Begin
         ShowMessage('Debe consultar los datos de RENIEC por la Sede Central, comuníquese con el área de Actualización de Datos');
         Exit;
      End;
      If (dblTipDoc.Text = '04') Then
      Begin
         MessageDlg('Docente extranjero, no permitido actualizar Reniec...', mtError, [mbOk], 0);
         Exit;
      End;
      If (Length(trim(dbeLibDni.Text)) <> 8) Then
      Begin
         MessageDlg('DNI Incorrecto...', mtError, [mbOk], 0);
         Exit;
      End;
      If (dm1.xInsert = '1') then
        Begin
      If validaAsoDniNuevo(dbeLibDni.Text) Then
      Begin
        MessageDlg('DNI Ya Existe, Solicitud fue creada', mtError, [mbOk], 0);
          If (gbIdentidadAso.Enabled) And (dbeLibDni.Enabled) Then
             dbeLibDni.SetFocus;
        exit;
      End;
      End;
      If (dm1.xInsert = '1') And (Length(trim(dbeLibDni.Text)) <> 0) Then
      Begin
         If validaAsoDni(trim(dbeLibDni.Text)) Then
         Begin
            MessageDlg('DNI Ya Existe en Maestro de Asociados', mtError, [mbOk], 0);
            If (gbIdentidadAso.Enabled) And (dbeLibDni.Enabled) Then dbeLibDni.SetFocus;
               Exit;
         End;
      End;
      Screen.Cursor := crHourGlass;
      try
         // If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '10' Then
         If dblTipDoc.Text = '10' Then
            ConsultaReniec;
      finally
         Screen.Cursor := crDefault;
      end;
      Screen.Cursor := crDefault;
   End;

   If dblTipDoc.Text = '04' Then
   Begin
      If DM1.xInsert = '1' Then
      Begin
         MessageDlg('Debe grabar antes de proceder a cargar las imagenes.', mtError, [mbOk], 0);
         Exit;
      End;

      If DM1.xInsert = '0' Then
      Begin

         // If Copy(DM1.CrgArea(DM1.wUsuario),6,2) < '03' Then
         // Begin
         //   ShowMessage('Sólo el Nivel 03 puede acceder a esta Opción');
         //   Exit;
         // End;

         // Inicio
         // Los usuarios de asociados en sede central y todos los usuarios de asociados nivel 03, podrán registrar las imagenes de foto, firma, carné de extranjeria y fecha de caducidad del carné de extranjeria.
         If ((Copy(DM1.CrgArea(DM1.wUsuario),1,3) = 'ASO') And (DM1.xOfiDes = '01')) Or ((Copy(DM1.CrgArea(DM1.wUsuario),1,3) = 'ASO') And (Copy(DM1.CrgArea(DM1.wUsuario),6,2) = '03')) Then
         Begin
            Try
               Fcarneextranjeria := TFcarneextranjeria.Create(Self);
               Fcarneextranjeria.ShowModal;
            Finally
               Fcarneextranjeria.Free;
            End;
         End
         Else
         Begin
            ShowMessage('Sólo disponible para el nivel 03.');
            Exit;
         End;
         // Fin
      End;
   End;
End;


PROCEDURE TFMantAsociado.ActivaPantPrincipal;
BEGIN
   IF NOT BitModifica.Enabled THEN gbIdentidadAso.Enabled := True;
   IF NOT BitModifica.Enabled THEN
   Begin
    gbLaboralAso.Enabled := True;

        pnlRegPension.Enabled := True;
        pnlCodPension.Enabled := True;
   End;
   pnlControl.Enabled := True;
   IF DM1.xCnd = 'AUT' THEN
   BEGIN
      gbIdentidadAso.Enabled := True;
      bitAutoriza.Caption := 'Autorizar';
      // IF DM1.cdsAso.FieldByName('ACTARCREN').AsString = 'S' THEN
      IF ( (DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '10') and (DM1.cdsAso.FieldByName('ACTARCREN').AsString = 'S') )
           or  ( DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '04' )  THEN      
      BEGIN
         bitAutoriza.Visible := true;
         bitRechaza.Visible := true;
         bbtnN1.Visible := true;
         bitAutoriza.Enabled := true;
         bitRechaza.Enabled := true;
         bbtnN1.Enabled := true;
      END
      ELSE
      BEGIN
         bitAutoriza.Visible := False;
         bitRechaza.Visible := False;
         bbtnN1.Visible := False;
      END;
   END;
   IF DM1.xCnd = 'DESAUT' THEN
   BEGIN
      gbIdentidadAso.Enabled := False;
      bitAutoriza.Caption := 'Desautorizar';
      bitAutoriza.Visible := true;
      bitRechaza.Visible := False;
      bbtnN1.Visible := False;
      bitAutoriza.Enabled := true;
      bitRechaza.Enabled := False;
      bbtnN1.Enabled := False;
   END;
END;

PROCEDURE TFMantAsociado.DesactivaPantPrincipal;
BEGIN
   gbIdentidadAso.Enabled := False;
   gbLaboralAso.Enabled := False;
   pnlRegPension.Enabled := False;
   pnlCodPension.Enabled := False;
   pnlControl.Enabled := False;
   bitAutoriza.Enabled := False;
   bitRechaza.Enabled := False;
   bbtnN1.Visible := False;
END;

PROCEDURE TFMantAsociado.Timer1Timer(Sender: TObject);
BEGIN
   IF btnActualizaReniec.Font.Color = clred THEN
      btnActualizaReniec.Font.Color := clwhite
   ELSE
      btnActualizaReniec.Font.Color := clred;
END;

//Llena los Campos a Validarr
PROCEDURE TFMantAsociado.llenaCamposValida;
VAR
   xsql: STRING;
BEGIN
   DM1.cdsCamposValida.First;
   CDSVALIDA.EmptyDataSet;
   WHILE NOT DM1.cdsCamposValida.Eof DO
   BEGIN
       CDSVALIDA.Insert;
       CDSVALIDA.FieldByName('Descripcion').AsString := DM1.cdsCamposValida.FieldByName('Descripcion').AsString;
       CDSVALIDA.FieldByName('Flag').AsString        := DM1.cdsCamposValida.FieldByName('Flag').AsString;
       CDSVALIDA.FieldByName('Campo').AsString       := DM1.cdsCamposValida.FieldByName('Campo').AsString;
       CDSVALIDA.FieldByName('Objeto').AsString      := DM1.cdsCamposValida.FieldByName('Objeto').AsString;
       CDSVALIDA.FieldByName('Tiempo').AsInteger     := DM1.cdsCamposValida.FieldByName('Tiempo').AsInteger;
       DM1.cdsCamposValida.Next;
   END;
   CDSVALIDA.First;
END;

PROCEDURE TFMantAsociado.pintaCamposValidados(xForm: tForm);
VAR
   xsql, xcomponente, permanente: STRING;
   i, alerta: integer;
   dFechaSys : tDateTime;
BEGIN
      xSQL:='SELECT asoid, fecval, usuval, equusu, ofiusu, campo, feccad, datval, objeto, status, usudesval, fecdesval, obsdesval '
        +'FROM VAL_DAT_ASO WHERE ASOID='''+DM1.cdsAso.FieldByName('ASOID').AsString + ''' AND STATUS=''S''';
   DM1.cdsVAL_DAT_ASO.Close;
   DM1.cdsVAL_DAT_ASO.DataRequest(XSQL);
   DM1.cdsVAL_DAT_ASO.Open;

   DM1.cdsVAL_DAT_ASO.First;

   dFechaSys := dm1.FechaSys;

   WHILE NOT DM1.cdsVAL_DAT_ASO.Eof DO
   BEGIN
      xcomponente := trim(DM1.cdsVAL_DAT_ASO.FieldByName('OBJETO').AsString);
      FOR i := 0 TO xform.ComponentCount - 1 DO
      BEGIN
         IF UpperCase(xcomponente) = UpperCase(xForm.Components[i].Name) THEN
         BEGIN
            DM1.cdsCamposValida.First;
            DM1.cdsCamposValida.SetKey;
            DM1.cdsCamposValida.FieldByName('CAMPO').AsString := DM1.cdsVAL_DAT_ASO.FieldByName('CAMPO').AsString;
            DM1.cdsCamposValida.GotoKey;

            alerta     := DM1.cdsCamposValida.FieldByName('TIEALE').AsInteger;
            permanente := DM1.cdsCamposValida.FieldByName('VALPER').AsString;
            IF dblTipDoc.Text=xTIPDOCCOD Then
            TwwDBEdit(xForm.Components[i]).Enabled := False;
            IF DM1.cdsVAL_DAT_ASO.FieldByName('FECCAD').AsDateTime - dFechaSys <= alerta THEN
               TwwDBEdit(xForm.Components[i]).Color := clYellow
            ELSE
               TwwDBEdit(xForm.Components[i]).Color := $0097FF97;
            IF (DM1.cdsVAL_DAT_ASO.FieldByName('FECCAD').AsDateTime - dFechaSys <= 0) AND (permanente <> 'S') THEN
            BEGIN
               TwwDBEdit(xForm.Components[i]).Color := clWindow;
               TwwDBEdit(xForm.Components[i]).Enabled := True;
               DM1.cdsVAL_DAT_ASO.Edit;
               DM1.cdsVAL_DAT_ASO.FieldByName('STATUS').AsString := '';
               DM1.cdsVAL_DAT_ASO.ApplyUpdates(-1);
            END;
            IF permanente = 'S' THEN
            BEGIN
               TwwDBEdit(xForm.Components[i]).Color := $0097FF97;
               IF dblTipDoc.Text=xTIPDOCCOD Then
               TwwDBEdit(xForm.Components[i]).Enabled := False;
            END;
            Break;
         END;
      END;

      DM1.cdsVAL_DAT_ASO.Next;
   END;

END;

PROCEDURE TFMantAsociado.btnObservacionClick(Sender: TObject);
BEGIN
   TRY
      If Length(Trim(DM1.cdsAso.FieldByName('ASOID').AsString))=0 Then
      begin
       ShowMessage('Primero debe Selecionar un Asociado Activo');
       exit;
      end;
      FMantAsociadoObservacion := TFMantAsociadoObservacion.Create(self);
      FMantAsociadoObservacion.ShowModal;
   FINALLY
      FMantAsociadoObservacion.Free;
   END;
END;

PROCEDURE TFMantAsociado.DBDTResCesExit(Sender: TObject);
BEGIN
   IF (dm1.xInsert = '1') AND (DbLlTipAso.Text = 'CE') THEN
   BEGIN
      IF DBDTResCes.Date > StrToDate('31/12/1996') THEN
      BEGIN
         MessageDlg(' Fecha de Cese debe ser Maximo hasta el 31/12/1996 ', mtError, [mbOk], 0);
         DBDTResCes.SetFocus;
      END;
   END;

   IF DbLlTipAso.Text = 'CO' THEN
   BEGIN
      IF DBDTResCes.Date <= Date THEN
      BEGIN
         MessageDlg(' La fecha de fin de Contrato ha Caducado ', mtError, [mbOk], 0);
      END;
   END;

END;

FUNCTION TFMantAsociado.validaAsoDni(xDni: STRING): boolean;
VAR
   xsql: STRING;
BEGIN
   XSQL := 'SELECT ''1'' FROM APO201 WHERE ASODNI=' + QuotedStr(XDni);
   DM1.cdsMGrupo.Close;
   DM1.cdsMGrupo.DataRequest(XSQL);
   DM1.cdsMGrupo.Open;

   IF DM1.cdsMGrupo.RecordCount > 0 THEN
      Result := True
   ELSE
      Result := False;
   DM1.cdsMGrupo.Close;
   DM1.cdsMGrupo.IndexFieldNames := '';
END;

FUNCTION TFMantAsociado.validaAsoDniNuevo(xDni: STRING): boolean;
VAR
   xsql: STRING;
BEGIN

   XSQL := 'SELECT ''1'' FROM ASO_NUE_CLI WHERE ASODNI=' + QuotedStr(XDni) + ' and EST_AUT_CLI<>''RE''';
   DM1.cdsMGrupo.Close;
   DM1.cdsMGrupo.DataRequest(XSQL);
   DM1.cdsMGrupo.Open;

   IF DM1.cdsMGrupo.RecordCount > 0 THEN
      Result := True
   ELSE
      Result := False;
   DM1.cdsMGrupo.Close;
   DM1.cdsMGrupo.IndexFieldNames := '';
END;

PROCEDURE TFMantAsociado.dbeLibDniExit(Sender: TObject);
BEGIN
   If dblTipDoc.Focused Then Exit;
   If BitSalir.Focused Then Exit;
   If dm1.xInsert = '1' Then
   Begin
      If dblTipDoc.Text = '04' Then
      Begin
         If Length(Trim(edtnumdoc.Text)) <> 9 Then
         Begin
            MessageDlg('Número de CE es de 9 digitos.', mtError, [mbOk], 0);
            edtnumdoc.SetFocus;
            Exit;
         End;
      End
      Else
      Begin
         If Length(Trim(dbeLibDni.Text)) <> 8 Then
         Begin
            MessageDlg('Número de DNI es de 8 digitos.', mtError, [mbOk], 0);
            dbeLibDni.SetFocus;
            Exit;
         End;
      End;
   End;


   IF ( ((dm1.xInsert = '1') AND (Length(trim(dbeLibDni.Text)) <> 0)) OR (xModifDNI) ) AND (dblTipDoc.Text=xTIPDOCCOD) THEN
   BEGIN
      IF NOT xModifDNI THEN
      BEGIN
         IF validaAsoDni(trim(dbeLibDni.Text)) THEN
         BEGIN
            MessageDlg('DNI Ya Existe en Maestro de Asociados', mtError, [mbOk], 0);
            IF (gbIdentidadAso.Enabled) AND (dbeLibDni.Enabled) THEN dbeLibDni.SetFocus;
            Exit;
         END;
      END;
   END;
END;

PROCEDURE TFMantAsociado.ValAsoPrev(xnombres: STRING);
BEGIN
   TRY
      FMantAsociadoIguApeLiqAnt := TFMantAsociadoIguApeLiqAnt.Create(self);
      FMantAsociadoIguApeLiqAnt.CargarDatos(xnombres);
      If FMantAsociadoIguApeLiqAnt.bExistenDatos = true Then
         FMantAsociadoIguApeLiqAnt.ShowModal;
      IF NOT FMantAsociadoIguApeLiqAnt.bExistenDatos THEN
         Grabacion2
      ELSE
         IF FMantAsociadoIguApeLiqAnt.bExistenDatos AND FMantAsociadoIguApeLiqAnt.bConfirmado THEN
            Grabacion2;
   FINALLY
      FMantAsociadoIguApeLiqAnt.Free;
   END;
END;

PROCEDURE TFMantAsociado.GrabacionXX;

VAR
   xAsoid, xCodReg, xSQL, vAsoid, vAsoCodAux, xantes: STRING;
   Boton,xItem: Integer;
BEGIN
   xAsoId := DM1.cdsAso.fieldbyname('ASOID').AsString;
   IF DM1.xInsert = '1' THEN
   BEGIN
      Boton := Application.MessageBox('Esta Seguro De Crear Este Nuevo Asociado?', 'Mantenimiento y Control De Asociados', MB_YESNO + MB_ICONQUESTION);
   END
   ELSE
   BEGIN
      Boton := Application.MessageBox('Esta Seguro De Actualizar Datos Del Asociado?', 'Mantenimiento y Control De Asociados', MB_YESNO + MB_ICONQUESTION);
   END;

   IF Boton = ID_YES THEN
   BEGIN
      IF ((xReniec <> 'S') AND (dblTipDoc.Text=xTIPDOCCOD) ) THEN
      BEGIN
         MessageDlg(' Falta Capturar Datos de RENIEC', mtError, [mbOk], 0);
         Exit;
      END

      ELSE
         IF (xvalido <> 'S') AND (BitVerifica.Enabled) AND (xsinvalidar > 0) THEN
         BEGIN
            MessageDlg('Existen Datos Sin Validar ....', mtError, [mbOk], 0);
            BitVerificaClick(self);
            exit;
         END

         ELSE
            IF (xgrabo = 'S') AND (xvalido = 'N') AND (xsinvalidar > 0) AND (dm1.xInsert <> '1') THEN // Validacion de los campos actualizados de RENIEC en forma automatica,siempre que no halla sido validado
            BEGIN
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOAPEPATDNI']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOAPEMATDNI']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOFECNAC']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOSEXO']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASONOMDNI']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               If DM1.cdsAso.FieldByName('TIPDOCCODM').AsString = '10' Then
               Begin
                  IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASODNI']), []) THEN
                  BEGIN
                     CDSVALIDA.Edit;
                     CDSVALIDA.FieldByName('FLAG').AsString := '1';
                  END;
               End;
               If DM1.cdsAso.FieldByName('TIPDOCCODM').AsString = '04' Then
               Begin
                  IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASONUMDOC']), []) THEN
                  BEGIN
                     CDSVALIDA.Edit;
                     CDSVALIDA.FieldByName('FLAG').AsString := '1';
                  END;
               End;

               xgrabo := 'N';
               fcShapeBtn1Click(Self);
            END;

      Screen.Cursor := crHourGlass;
      IF DM1.xInsert = '1' THEN
      BEGIN
         vAsoid := DM1.AsignaAsoId(DM1.sAPO201);
         vAsoCodAux := DM1.AsignaNroAux(DM1.sAPO201, EdtCodMod.Text);
         DM1.cdsAso.FieldByName('ASOID').AsString := vAsoid;
         DM1.cdsAso.FieldByName('ASOCODAUX').AsString := vAsoCodAux;
         DM1.cdsAso.ApplyUpdates(0);
         xAsoid := vAsoid;

         IF Length(TRIM(DM1.cdsAso.FieldByName('ASORESNOM').AsString)) <> 0 THEN
         BEGIN
            xSQL := 'INSERT INTO APO205(ASOID,ASOCODMOD,ASOCODAUX,ASONRES,ASOFRES,RESID,RESFVIG,FREG,HREG,USUARIO) ' +
               'VALUES (' + QuotedStr(xAsoId) + ',' + QuotedStr(DM1.cdsAso.fieldbyname('ASOCODMOD').AsString) + ',' + QuotedStr(DM1.cdsAso.fieldbyname('ASOCODAUX').AsString) + ',' +
               QuotedStr(DM1.cdsAso.fieldbyname('ASORESNOM').AsString) + ',' + QuotedStr(DM1.cdsAso.fieldbyname('ASOFRESNOM').AsString) + ',''01'',''S'',' + QuotedStr(DateToStr(DM1.FechaSys)) + ',SYSDATE,' + QuotedStr(DM1.wUsuario) + ')';
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         END;

         IF Length(TRIM(DM1.cdsAso.FieldByName('ASORESCESE').AsString)) <> 0 THEN
         BEGIN
            xSQL := 'INSERT INTO APO205(ASOID,ASOCODMOD,ASOCODAUX,ASONRES,ASOFRES,RESID,RESFVIG,FREG,HREG,USUARIO) ' +
               'VALUES (' + QuotedStr(xAsoId) + ',' + QuotedStr(DM1.cdsAso.fieldbyname('ASOCODMOD').AsString) + ',' + QuotedStr(DM1.cdsAso.fieldbyname('ASOCODAUX').AsString) + ',' +
               QuotedStr(DM1.cdsAso.fieldbyname('ASORESCESE').AsString) + ',' + QuotedStr(DM1.cdsAso.fieldbyname('ASOFRESCESE').AsString) + ',''04'',''S'',' + QuotedStr(DateToStr(DM1.FechaSys)) + ',SYSDATE,' + QuotedStr(DM1.wUsuario) + ')';
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         END;
      END;

      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByName('ASOAPENOM').AsString := TRIM(DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString) + ' ' + TRIM(DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString) + ' ' + TRIM(DM1.cdsAso.FieldByName('ASONOMDNI').AsString);
      DM1.cdsAso.FieldByName('ASOAPEPAT').AsString := TRIM(DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString);
      DM1.cdsAso.FieldByName('ASOAPEMAT').AsString := TRIM(DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString);
      DM1.cdsAso.FieldByName('ASONOMBRES').AsString := TRIM(DM1.cdsAso.FieldByName('ASONOMDNI').AsString);

      xCodReg := CodReg;
      Registro_Aud(xAsoId, '0', xCodReg);
      DM1.cdsAso.ApplyUpdates(-1);

      Apo201_NueCLi;
      DM1.cdsAsoX.Close;
      DM1.cdsAsoX.DataRequest('SELECT '+DM1.XSELECT+' FROM ' + DM1.sAPO201 + ' WHERE ' + DM1.sAso_where + ' ASOID=' + QuotedStr(Trim(xAsoId)));
      DM1.cdsAsoX.Open;
      IF DM1.cdsAsoX.RecordCount > 0 THEN
      BEGIN
         DM1.cdsAsoX.Edit;
         DM1.cdsAsoX.fieldbyname('ASOAPENOMDNI').AsString := Trim(EdtApePatDni.Text) + ' ' + Trim(EdtApeMatDni.Text) + ' ' + Trim(EdtAsoNomDni.Text);
         DM1.cdsAsoX.fieldbyname('ASODPTLABID').AsString := Trim(lkcDpto2.Text);
         DM1.cdsAsoX.fieldbyname('ASOPRVLABID').AsString := Trim(lkcProv2.Text);
         DM1.cdsAsoX.fieldbyname('ASODSTLABID').AsString := Trim(lkcDist2.Text);
         DM1.cdsAsoX.fieldbyname('ASODPTO').AsString := Trim(lkcDpto.Text);
         DM1.cdsAsoX.fieldbyname('CIUDID').AsString := Trim(lkcProv.Text);
         DM1.cdsAsoX.fieldbyname('ZIPID').AsString := Trim(lkcDist.Text);
         DM1.cdsAsoX.ApplyUpdates(0);
         DM1.cdsAso.ApplyUpdates(0);
         Registro_Aud(xAsoId, '1', xCodReg);

         DM1.cdsAso.Close;
         Apo201_NueCLi;
         DM1.cdsAso.DataRequest('SELECT '+DM1.XSELECT+' FROM ' + DM1.sAPO201 + ' WHERE ' + DM1.sAso_where + ' ASOID=' + QuotedStr(Trim(xAsoId)));
         DM1.cdsAso.Open;

         lkcDpto2.Text := DM1.cdsAso.fieldbyname('ASODPTLABID').AsString;
         lkcProv2.Text := DM1.cdsAso.fieldbyname('ASOPRVLABID').AsString;
         lkcDist2.Text := DM1.cdsAso.fieldbyname('ASODSTLABID').AsString;
         edtProv2.Text := DM1.CrgDescrip('DPTOID||CIUDID=' + QuotedStr(Trim(lkcProv2.Text)), 'TGE121', 'CIUDDES');
         edtDist2.Text := DM1.CrgDescrip('ZIPID=' + QuotedStr(Trim(lkcDist2.Text)), 'APO122', 'ZIPDES');
         DbLUniProChange(self);
         DbLUniPagChange(self);
         DbLUsesChange(self);

         IF DM1.xOfiDes > '01' THEN
         BEGIN
            xSQL := 'SELECT ASOID,FHREGISTRO FROM ASO003 WHERE ASOID=' + QuotedStr(Trim(xAsoId)) + ' AND IDESTADO IS NULL ';
            DM1.cdsQry.Close;
            DM1.cdsQry.DataRequest(xSQL);
            DM1.cdsQry.Open;
            IF DM1.cdsQry.RecordCount > 0 THEN
            BEGIN
               xSQL := 'UPDATE ASO003 SET DATGENERAL=''S'' WHERE ASOID=' + QuotedStr(Trim(xAsoId)) + ' AND IDESTADO IS NULL ';
            END
            ELSE
            BEGIN

            DM1.cdsQry.Close;
            xSQL := 'SELECT MAX(ITEM) ITEM FROM ASO003 WHERE ASOID='+ QuotedStr(Trim(xAsoId));
            DM1.cdsQry.DataRequest(xSQL);
            DM1.cdsQry.Open;
            xItem := DM1.cdsQry.FieldByName('ITEM').AsInteger;

            xSQL := 'INSERT INTO ASO003(ASOID, ASOAPENOM, USUARIO, FHREGISTRO, OFDESID, DATGENERAL, ITEM) VALUES ' +
                  '( ' + QuotedStr(Trim(xAsoId)) + ',' + QuotedStr(Trim(EdtApePatDni.Text) + ' ' + Trim(EdtApeMatDni.Text) + ' ' + Trim(EdtAsoNomDni.Text)) + ',' + QuotedStr(DM1.wUsuario) + ',SYSDATE,' + QuotedStr(DM1.xOfiDes) + ',''S'','+IntToStr(xItem+1)+' )';

            END;
            DM1.cdsQry.Close;
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         END;

         IF (DM1.xCnd <> 'M') AND (DM1.xCnd <> 'AUT') THEN DM1.CrgDatos;
         IF DM1.xSgr = 'N' THEN Close;
         xantes := DM1.xInsert;
         DM1.xInsert := '0';
         FMantAsociado.FormCreate(self);
         DM1.xInsert := xantes;
         BitModifica.Enabled := True;
         BitGrabar.Enabled := False;
         gbIdentidadAso.Enabled := False;
         gbLaboralAso.Enabled := False;
         pnlRegPension.Enabled := False;
         pnlCodPension.Enabled := False;
         Timer1.Enabled := False;
         MessageDlg(' <<< Se Grabo Con Exito >>> ', mtInformation, [mbOk], 0);
         xYaGrabe := 'S';
      END
      ELSE
         MessageDlg(' <<< NO se Grabo, comuniquese con sistemas>>> ', mtInformation, [mbOk], 0);

   END;

   Screen.Cursor := crDefault;
END;

PROCEDURE TFMantAsociado.VerificaCamposValidados;
VAR
   xsql: STRING;
BEGIN

   DM1.cdsCamposValida.First;
   dm1.cdsVAL_DAT_ASO.First;

   xSql := 'SELECT COUNT(1) CANT FROM APO103 U WHERE U.UPROID = ' + QuotedStr(DM1.cdsAso.FieldByName('UPROID').AsString)
     + ' AND U.UPAGOID = ' + QuotedStr(DM1.cdsAso.FieldByName('UPAGOID').AsString) + ' AND U.FLGESCFIS = ''S''';
   DM1.cdsQry25.Close;
   DM1.cdsQry25.DataRequest(xSQL);
   DM1.cdsQry25.Open;

   xsinvalidar := 0;
   WHILE NOT dm1.cdsCamposValida.Eof DO
   BEGIN



      IF dm1.cdsVAL_DAT_ASO.Locate('CAMPO', VarArrayOf([DM1.cdsCamposValida.FieldByName('CAMPO').AsString]), []) THEN
      BEGIN
         IF CDSVALIDA.Locate('CAMPO', VarArrayOf([DM1.cdsCamposValida.FieldByName('CAMPO').AsString]), []) THEN
         BEGIN
            CDSVALIDA.Edit;
            CDSVALIDA.FieldByName('VALIDADO').AsString := '1';
         END
         ELSE
           if ( ((DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '02'))
             or
             ((DM1.sAPO201 = 'ASO_NUE_CLI') and (DM1.cdsQry25.FieldByName('CANT').AsInteger > 0)) ) then
           begin
             //no valida la cuenta de ahorros
           end
           else
           begin
               xsinvalidar := xsinvalidar + 1;
           end;
      END
      ELSE
         if ( ((DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '02'))
           or
           ((DM1.sAPO201 = 'ASO_NUE_CLI') and (DM1.cdsQry25.FieldByName('CANT').AsInteger > 0)) ) then
         begin
           //no valida la cuenta de ahorros
         end
         else
         begin
            xsinvalidar := xsinvalidar + 1;
         end;
      dm1.cdsCamposValida.Next;
   END;
   DM1.cdsQry25.Close;
END;


Procedure TFMantAsociado.Grabacion2;
Var
   xCodReg, xSQL, vAsoCodAux, xantes, xvalcodmoddni, xAsoApenomDNI: String;
   xasoid: String;
   xasotelf1,xASOEMAIL: String;
   xestcivid,xasodocnum:String;
   wsUbica: WSUbicabilidadSoap;
   tel: ASO_UBICA_TELF_HIS;
   email: ASO_UBICA_EMAIL_HIS;
   dir: ASO_UBICA_DIR_HIS;
   fecAct: TXSDateTime;
   xItem: Integer;
Begin
   xasoid := Trim(DM1.cdsAso.FieldByName('ASOID').AsString);
   Begin
      Screen.Cursor := crHourGlass;
      xCodReg := CodReg; //Genera Numero de Log
      If '10' + trim(dbeLibDni.Text) = trim(EdtCodMod.Text) Then
      Begin
         xvalcodmoddni     := 'S';
         dbeLibDni.Enabled := False;
         dbeLibDni.Color   := $0097FF97
      End
      Else
         xvalcodmoddni := 'N';
      If DM1.cdsAso.FieldByName('ASOCODAUX').AsString = '' Then
      Begin
         vAsoCodAux := DM1.AsignaNroAux(DM1.sAPO201, EdtCodMod.Text);
         DM1.cdsAso.Edit;
         DM1.cdsAso.FieldByName('ASOCODAUX').AsString := vAsoCodAux;
      End;
      // registra el nuevo dato de Ubicabilidad
      If DM1.sAPO201 = 'APO201' Then
      Begin
         xSql := 'SELECT ASOEMAIL, CENEDUID FROM ' + DM1.sAPO201 + ' WHERE ASOID = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString);
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSql);
         DM1.cdsQry.Open;
         if DM1.cdsQry.RecordCount > 0 then
         begin
           if (Trim(DM1.cdsAso.FieldByName('CENEDUID').AsString) <> '')
           and
             (DM1.cdsQry.FieldByName('CENEDUID').AsString <> Trim(DM1.cdsAso.FieldByName('CENEDUID').AsString))
           then
           begin
             xSql := 'SELECT C.UBIGEO_DIR, C.NOMCENEDU, C.DIREC FROM ASO_CEN_EDU C WHERE C.CENEDUID = ' + QuotedStr(DM1.cdsAso.FieldByName('CENEDUID').AsString);
             DM1.cdsClaCre.Close;
             DM1.cdsClaCre.DataRequest(xSql);
             DM1.cdsClaCre.Open;
             if DM1.cdsClaCre.RecordCount > 0 then
             begin
               fecAct := TXSDateTime.Create;
               wsUbica := GetWSUbicabilidadSoap(false, '');
               dir := ASO_UBICA_DIR_HIS.Create;
               dir.ASOID := DM1.cdsAso.FieldByName('ASOID').AsString;
               dir.CODPROV := 3; //Previsión
               dir.CODPROC := 3; //Actualización de Datos
               dir.CODTIPDIR := 2; //Laboral
               dir.CODDPTO_TRANSACCIONAL := Copy(Trim(DM1.cdsClaCre.FieldByName('UBIGEO_DIR').AsString),1,2);
               dir.CODPRV_TRANSACCIONAL := Copy(Trim(DM1.cdsClaCre.FieldByName('UBIGEO_DIR').AsString),1,4);
               dir.CODDIST_TRANSACCIONAL := Copy(Trim(DM1.cdsClaCre.FieldByName('UBIGEO_DIR').AsString),1,6);
               fecAct.AsDateTime := DM1.FechaSys();
               dir.FECACT := fecAct;
               dir.ASODIR := Trim(DM1.cdsClaCre.FieldByName('DIREC').AsString);
               dir.DESOBS := 'CEN.EDU.: ' + Trim(DM1.cdsClaCre.FieldByName('NOMCENEDU').AsString);
               dir.USUREG := DM1.wUsuario;
               // wsUbica.Crear_Ubicabilidad_Direccion(dir);
               dir.Free;
             end;
           end;
         end;
       end;
      IF (pnlResoluciones.Enabled) AND (DM1.sAPO201 = 'ASO_NUE_CLI') THEN
      BEGIN
      //Inserta en ASO_RESOLUCIONES
         XSQL := 'INSERT INTO ASO_RESOLUCIONES_NUE (SOLICITUD, ASOID,ASOCODMOD,ASOCODAUX,ASORESNOM,ASOFRESNOM,ASORESCESE,ASOFRESCESE,RESVIG,CORRELATIVO,USUARIO,FREG,HREG,REINGRESO) VALUES (' +
            QuotedStr(DM1.cdsAso.FieldByName('SOLICITUD').AsString) + ',' +
            QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ',' +
            QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString) + ',' +
            QuotedStr(DM1.cdsAso.FieldByName('ASOCODAUX').AsString) + ',' +
            QuotedStr(dbeNroRes.Text) + ',' +
            QuotedStr(DBDTResNom.Text) + ',' +
            QuotedStr(dbeNroCes.Text) + ',' +
            QuotedStr(DBDTResCes.Text) + ',' +
            QuotedStr('S') + ',' +
            QuotedStr('01') + ',' +
            QuotedStr(DM1.wUsuario) + ',' +
            QuotedStr(DateToStr(DM1.FechaSys)) + ',SYSDATE,' +
            QuotedStr('N') + ')';
         DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      END;
      xAsoApeNomDni := '';
      If Trim(DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString)+ ' ';
      If Trim(DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString)+ ' ';
      If Trim(DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString)+ ' ';
      xAsoApeNomDni := xAsoApeNomDni + Trim(DM1.cdsAso.FieldByName('ASONOMDNI').AsString);
      Registro_Aud(xAsoId, '0', xCodReg); //Antes del Cambio
      If dblTipDoc.Text <> xTIPDOCCOD Then
      Begin
        estadocivil(dblEstadoCivil.Text);
        xestcivid  :=Dm1.cdsUSES.Fieldbyname('ESTCIVID').AsString;
        xasodocnum :=edtnumdoc.Text;
      End
      Else
      Begin
        estadocivil(edtEstadoCivil.Text);
        xestcivid  :=Dm1.cdsUSES.Fieldbyname('ESTCIVID').AsString;
        xasodocnum :=dbeLibDni.Text;
      End;

//Inicio MAS_202102_HPC
//Se adiciona la grabación del ultimo telefono de la contactabilidad
     xASOEMAIL :='';
     xasotelf1 :='';
     XSQL:='SELECT DB2ADMIN.SF_SIO_CONTACTO_CORREO('+QuotedStr(XASOID)+')  xcorreo, '
          +'       DB2ADMIN.SF_SIO_CONTACTO_CELULAR('+QuotedStr(XASOID)+') xtelefono FROM DUAL';
     DM1.cdsGrupos.Close;
     DM1.cdsGrupos.DataRequest(xsql);
     DM1.cdsGrupos.Open;
     xASOEMAIL:=dm1.cdsGrupos.fieldbyname('xcorreo').AsString;
     xasotelf1:=dm1.cdsGrupos.fieldbyname('xtelefono').AsString;
//Final MAS_202102_HPC

      XSQL := 'UPDATE ' + DM1.sAPO201 + ' SET ' +
      'ASOAPENOM=' + QuotedStr(xAsoApeNomDni)+ ',' +
      'ASOAPEPAT=' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString) + ',' +
      'ASOAPEMAT=' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString) + ',' +
      'ASONOMBRES=' + QuotedStr(DM1.cdsAso.FieldByName('ASONOMDNI').AsString) + ',' +
      'ASOEMAIL=' + QuotedStr(xASOEMAIL)+ ','+
      'TIPDOCCOD='+ QuotedStr(dbltipdoc.Text) + ',' +
      'ASOAPENOMDNI=' + QuotedStr(xAsoApenomDNI) + ',' +
      'ESTCIVID='+ QuotedStr(trim(xestcivid)) + ',' +
      'ASODOCNUM='+QuotedStr(trim(xasodocnum)) + ',' +
      'ASODPTO=' + QuotedStr(trim(lkcDpto.Text)) + ',' +
       'CIUDID=' + QuotedStr(trim(lkcProv.Text)) + ',' +
       'ZIPID=' + QuotedStr(trim(lkcDist.Text)) + ',' +
       'ASODIR=' + QuotedStr(Copy(Trim(dbeDirec.Text), 1, 250)) + ',' +
       'ASOAPEPATDNI=' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPEPATDNI').AsString) + ',' +
       'ASOAPEMATDNI=' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPEMATDNI').AsString) + ',' +
       'ASOAPECASDNI=' + QuotedStr(DM1.cdsAso.FieldByName('ASOAPECASDNI').AsString) + ',' +
       'ASONOMDNI=' + QuotedStr(DM1.cdsAso.FieldByName('ASONOMDNI').AsString) + ',' +
       'ASODNI=' + QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString) + ',' +
       'ASOFECNAC=' + QuotedStr(DM1.cdsAso.FieldByName('ASOFECNAC').AsString) + ',' +
       'ASOSEXO=' + QuotedStr(DM1.cdsAso.FieldByName('ASOSEXO').AsString) + ',' +
       'ASOTELF1=' +QuotedStr(xasotelf1)+','+
       'ASOTELF2=' + QuotedStr(DM1.cdsAso.FieldByName('ASOTELF2').AsString) + ',' +
       'ASOCODMOD=' + QuotedStr(DM1.cdsAso.FieldByName('ASOCODMOD').AsString) + ',' +
       'ASOCODAUX=' + QuotedStr(DM1.cdsAso.FieldByName('ASOCODAUX').AsString) + ',' +
       'ASOTIPID=' + QuotedStr(DbLlTipAso.Text) + ',' +
       'REGPENID=' + QuotedStr(DbLlRegPen.Text) + ',' +
       'CODAFP=' + QuotedStr(DbLlAfp.Text) + ',' +
       'UPROID=' + QuotedStr(DM1.cdsAso.FieldByName('UPROID').AsString) + ',' +
       'UPAGOID=' + QuotedStr(DM1.cdsAso.FieldByName('UPAGOID').AsString) + ',' +
       'USEID=' + QuotedStr(DM1.cdsAso.FieldByName('USEID').AsString) + ',' +
       'ASORESNOM=' + QuotedStr(DM1.cdsAso.FieldByName('ASORESNOM').AsString) + ',' +
       'ASOFRESNOM=' + QuotedStr(DM1.cdsAso.FieldByName('ASOFRESNOM').AsString) + ',' +
       'ASORESCESE=' + QuotedStr(DM1.cdsAso.FieldByName('ASORESCESE').AsString) + ',' +
       'ASOFRESCESE=' + QuotedStr(DM1.cdsAso.FieldByName('ASOFRESCESE').AsString) + ',' +
       'ASOCODPAGO=' + QuotedStr(DM1.cdsAso.FieldByName('ASOCODPAGO').AsString) + ',' +
       'ASONCTA=' + QuotedStr(DM1.cdsAso.FieldByName('ASONCTA').AsString) + ',' +
       'CARGO=' + QuotedStr(DM1.cdsAso.FieldByName('CARGO').AsString) + ',' +
       'SITCTA=' + QuotedStr(DM1.cdsAso.FieldByName('SITCTA').AsString) + ',' +
       'ASODESLAB=' + QuotedStr(DM1.cdsAso.FieldByName('ASODESLAB').AsString) + ',' +
         'ASODIRLAB=' + QuotedStr(DM1.cdsAso.FieldByName('ASODIRLAB').AsString) + ',' +
         'ASOTELLAB=' + QuotedStr(DM1.cdsAso.FieldByName('ASOTELLAB').AsString) + ',' +
         'ASODPTLABID=' + QuotedStr(trim(lkcDpto2.Text)) + ',' +
         'ASOPRVLABID=' + QuotedStr(trim(lkcProv2.Text)) + ',' +
         'ASODSTLABID=' + QuotedStr(trim(lkcDist2.Text)) + ',' +
         'CENEDUID=' + QuotedStr(dbeCenEduId.Text) + ',' +
         'VALCODMODDNI=' + QuotedStr(xvalcodmoddni) + ',' +
         'USUARIO=' + QuotedStr(DM1.wUsuario) + ',' +
         'FREG=' + QuotedStr(DateToStr(DM1.FechaSys)) + ',' +
         'HREG=SYSDATE,';
         IF (DM1.sAPO201='ASO_NUE_CLI') THEN
         BEGIN
           XSQL:= XSQL +  ' ACTARCREN=' + QuotedStr(DM1.cdsAso.FieldByName('ACTARCREN').AsString) +',';
         END;
         XSQL:= XSQL + ' CODPENSION=' + QuotedStr(edtCodPensionista.Text) +','+
         'CODLEYPEN=' + QuotedStr(dblcdCodLeyPen.Text) + ','+
         'CODPRE=' + QuotedStr(dblcdCodPrestacion.Text) +
         ' WHERE ' + DM1.sAso_where + ' ASOID= ' + QuotedStr(XASOID);
      DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      Registro_Aud(xAsoId, '1', xCodReg);
      IF (DM1.xOfiDes > '01') AND (DM1.xOfiDes <> '27') THEN
      BEGIN
         xSQL := 'SELECT ASOID,FHREGISTRO FROM ASO003 WHERE ASOID=' + QuotedStr(Trim(xAsoId)) + ' AND IDESTADO IS NULL ';
         DM1.cdsQry.Close;
         DM1.cdsQry.DataRequest(xSQL);
         DM1.cdsQry.Open;
         IF DM1.sAPO201 = 'APO201' THEN
         BEGIN
            IF DM1.cdsQry.RecordCount > 0 THEN
            BEGIN
               xSQL := 'UPDATE ASO003 SET DATGENERAL=''S'' WHERE ASOID=' + QuotedStr(Trim(xAsoId)) + ' AND IDESTADO IS NULL ';
            END
            ELSE
            BEGIN
               DM1.cdsQry.Close;
               xSQL := 'SELECT MAX(ITEM) ITEM FROM ASO003 WHERE ASOID='+ QuotedStr(Trim(xAsoId));
               DM1.cdsQry.DataRequest(xSQL);
               DM1.cdsQry.Open;
               xItem := DM1.cdsQry.FieldByName('ITEM').AsInteger;
               xSQL := 'INSERT INTO ASO003(ASOID, ASOAPENOM, USUARIO, FHREGISTRO, OFDESID, DATGENERAL, ITEM) VALUES ' +
                 '( ' + QuotedStr(Trim(xAsoId)) + ',' + QuotedStr(Trim(EdtApePatDni.Text) + ' ' + Trim(EdtApeMatDni.Text) + ' ' + Trim(EdtAsoNomDni.Text)) + ',' + QuotedStr(DM1.wUsuario) + ',SYSDATE,' + QuotedStr(DM1.xOfiDes) + ',''S'','+IntToStr(xItem+1)+' )';
            END;
            DM1.cdsQry.Close;
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         END;
      END;
      // IF (DM1.cdsAso.fieldbyname('ACTARCREN').AsString <> 'S') AND (xReniec = 'S') and (dblTipDoc.Text=xTIPDOCCOD) THEN
      IF ((xReniec <> 'S') and (dblTipDoc.Text=xTIPDOCCOD) ) THEN
      BEGIN
         IF DM1.xOfiDes = '01' THEN
            MessageDlg(' Falta Capturar Datos de RENIEC', mtError, [mbOk], 0);
      END
      ELSE
      BEGIN
         IF ((xvalido <> 'S') AND (BitVerifica.Enabled AND BitVerifica.Visible) AND (xsinvalidar > 0)) or
             (xActRENIEC='S') THEN
         Begin
           Validacionautomatica(DM1.cdsAso.FieldbyName('ASODNI').AsString,DM1.cdsAso.FieldbyName('ASOID').AsString);
           pintaCamposValidados(Self);
           VerificaCamposValidados;
         End;
         IF (xvalido <> 'S') AND (BitVerifica.Enabled AND BitVerifica.Visible) AND (xsinvalidar > 0) THEN
         BEGIN
            IF MessageDlg('Existen Datos Sin Validar.... Desea Validarlos?', mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
            BEGIN
               BitGrabar.Enabled := False;
               BitVerificaClick(self);
               exit;
            END;
         END
         ELSE
            IF (xgrabo = 'S') AND (xvalido = 'N') AND (xsinvalidar > 0) AND (dm1.xInsert <> '1') THEN // Validacion de los campos actualizados de RENIEC en forma automatica,siempre que no halla sido validado
            BEGIN
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOAPEPATDNI']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOAPEMATDNI']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOFECNAC']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASOSEXO']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASONOMDNI']), []) THEN
               BEGIN
                  CDSVALIDA.Edit;
                  CDSVALIDA.FieldByName('FLAG').AsString := '1';
               END;
               If DM1.cdsAso.FieldByName('TIPDOCCODM').AsString = '10' Then
               Begin
                  IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASONDNI']), []) THEN
                  BEGIN
                     CDSVALIDA.Edit;
                     CDSVALIDA.FieldByName('FLAG').AsString := '1';
                  END;
               End;
               If DM1.cdsAso.FieldByName('TIPDOCCODM').AsString = '04' Then
               Begin
                  IF CDSVALIDA.Locate('CAMPO', VarArrayOf(['ASONUMDOC']), []) THEN
                  BEGIN
                     CDSVALIDA.Edit;
                     CDSVALIDA.FieldByName('FLAG').AsString := '1';
                  END;
               End;
               xgrabo := 'N';
               BitGrabar.Enabled := False;
               fcShapeBtn1Click(Self);
            END;
      END;
      IF (DM1.xCnd <> 'M') AND (DM1.xCnd <> 'AUT') THEN DM1.CrgDatos;
      IF DM1.xSgr = 'N' THEN Close;
      xantes := DM1.xInsert;
      DM1.xInsert := '0';
      DM1.cdsAso.Close;
      Apo201_NueCLi;
      DM1.cdsAso.DataRequest('SELECT '+DM1.XSELECT+' FROM ' + DM1.sAPO201 + ' WHERE ' + DM1.sAso_where + ' ASOID=' + QuotedStr(Trim(xAsoId)));
      DM1.cdsAso.Open;
      FMantAsociado.FormCreate(self);
      DM1.xInsert := xantes;
      BitModifica.Enabled := True;
      BitGrabar.Enabled := False;
      gbIdentidadAso.Enabled := False;
      gbLaboralAso.Enabled := False;
      pnlRegPension.Enabled := False;
      pnlCodPension.Enabled := False;
      edtProv2.Text := DM1.CrgDescrip('DPTOID||CIUDID=' + QuotedStr(Trim(lkcProv2.Text)), 'TGE121', 'CIUDDES');
      edtDist2.Text := DM1.CrgDescrip('ZIPID=' + QuotedStr(Trim(lkcDist2.Text)), 'APO122', 'ZIPDES');
      edtTipAso.Text := DM1.CrgDescrip('ASOTIPID=' + QuotedStr(Trim(DbLlTipAso.Text)), 'APO107', 'ASOTIPDES');
      DbLUniProChange(self);
      DbLUniPagChange(self);
      DbLUsesChange(self);
      lblAsoApeNom.Caption := DM1.cdsAso.fieldbyname('ASOAPENOM').AsString + ' (Dato de Planillas)';

     ValidarAsignarRegalo;
     MessageDlg('<<<Se Grabó Con Exito>>>', mtInformation, [mbOk], 0);
      IF DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S' THEN
      BEGIN
        xInsertaTicket := False;
        ModiDestinofTickes;
        xInsertaTicket := True;
      END;
   END;
END;

//Verifica el campo sin data
PROCEDURE TFMantAsociado.VerificaSinData(xVerData, xfaLtante: STRING);
BEGIN
   IF Length(trim(xVerData)) = 0 THEN
   BEGIN
      DM1.xsindata := DM1.xsindata + 1;
      CDSINCOMPLETOS.Insert;
      CDSINCOMPLETOS.FieldByName('CAMPO').AsString := xfaltante;
   END;
END;

PROCEDURE TFMantAsociado.BitFichaAsoClick(Sender: TObject);
BEGIN
  // Inicio: MAS_201901_HPC
  // Mensaje de alerta 
   If Length(Trim(DM1.cdsAso.FieldByName('ASOID').AsString))=0 Then
   begin
     ShowMessage('Primero debe Selecionar un Asociado Activo');
     exit;
   end;
  // Fin: MAS_201901_HPC
   FichaActualizacion2;
END;

PROCEDURE TFMantAsociado.DbLlTipAsoExit(Sender: TObject);
BEGIN
   IF Length(trim(edtTipAso.Text)) = 0 THEN
   BEGIN
      Beep;
      MessageDlg('Tipo de Asociado no Catalogado...', mtError, [mbOk], 0);
      DbLlTipAso.SetFocus;
      Exit;
   END;

   if (copy(DM1.cdsAso.FieldByname('ASONCTA').AsString,1,3)='CI_') and
      (copy(DM1.cdsAso.FieldByname('ASOTIPID').AsString,1,3)<>'CE') then
   Begin
      Beep;
      MessageDlg('El Tipo de Asociado debe ser CEsante si hay Cuenta Interna asignada', mtError, [mbOk], 0);
      DM1.cdsAso.Edit;
      DM1.cdsAso.FieldByname('ASOTIPID').AsString := 'CE';
      DM1.cdsAso.Post;
      DbLlTipAso.SetFocus;
      Exit;
   End;

   IF DbLlTipAso.text = 'CO' THEN
   BEGIN
      lblResNom.Caption := 'N° Contrato';
      lblFecNom.Caption := 'Fec.Inicio';
      lblResCes.Caption := '';
      dbeNroCes.Visible := False;
      lblFecCes.Caption := 'Fec.Fin';
   END
   ELSE
   BEGIN
      lblResNom.Caption := 'N°Resol.Nomb';
      lblFecNom.Caption := 'Fecha';
      lblResCes.Caption := 'N°Resol.Cese';
      dbeNroCes.Visible := True;
      lblFecCes.Caption := 'Fecha';
   END;
END;

PROCEDURE TFMantAsociado.Button10Click(Sender: TObject);
BEGIN
   ActivaPantPrincipal;
END;

//IBservaciones sin resolver
PROCEDURE TFMantAsociado.ObsSinResolver(xasoid: STRING);
VAR
   xsql: STRING;
BEGIN
   CDSOBSSINRESOLVER.EmptyDataSet;
   XSQL := 'SELECT A.ASOID, A.CODOBS, C.OFDESNOM OFICINA, B.DESOBS, CASE WHEN B.RECOBS = ''S'' THEN ''RESTRICTIVO'' ELSE ''NO RESTRICTIVO'' END CARACTER,'
   +' A.OBSERVA COMENTARIO, A.USUARIO, A.FECHA, A.EQUUSU, A.OFIUSU FROM OBSERVACION_ASOCIADO A,  ASO_TIP_OBS_MAN B, APO110 C'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND  A.CODOBS = B.CODOBS AND A.OFIUSU = C.OFDESID'
   +' ORDER BY A.FECHA DESC';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(XSQL);
   DM1.cdsQry.Open;
   IF Dm1.cdsQry.RecordCount > 0 THEN
   BEGIN
      IF Dm1.cdsQry.FieldByName('CODOBS').AsString <> '07' THEN //Si es 07 las observaciones ya fueron resueltas
      BEGIN
         WHILE NOT Dm1.cdsQry.Eof DO
         BEGIN
            IF Dm1.cdsQry.FieldByName('CODOBS').AsString = '07' THEN Break;
            CDSOBSSINRESOLVER.Insert;
            CDSOBSSINRESOLVER.FieldByName('PROCEDENCIA').AsString := 'ASOCIADOS';
            CDSOBSSINRESOLVER.FieldByName('OFICINA').AsString := Dm1.cdsQry.FieldByName('OFICINA').AsString;
            CDSOBSSINRESOLVER.FieldByName('OBSERVACION').AsString := Dm1.cdsQry.FieldByName('DESOBS').AsString;
            CDSOBSSINRESOLVER.FieldByName('COMENTARIO').AsString := Dm1.cdsQry.FieldByName('COMENTARIO').AsString;
            CDSOBSSINRESOLVER.FieldByName('CARACTER').AsString := Dm1.cdsQry.FieldByName('CARACTER').AsString;
            CDSOBSSINRESOLVER.FieldByName('USUARIO').AsString := Dm1.cdsQry.FieldByName('USUARIO').AsString;
            CDSOBSSINRESOLVER.FieldByName('FECHA').AsString := Dm1.cdsQry.FieldByName('FECHA').AsString;
            Dm1.cdsQry.Next
         END;
      END;
   END;
   XSQL := 'Select C.OFDESNOM, A.MTOOBSR, A.FECOBSR, A.USROBSR From OBS000 A, USERTABLE B, APO110 C'
   +' Where A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
   +' And A.FECAPRO Is Null And A.USROBSR = B.USERNOM And B.ORIGEN = C.OFDESID';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsql);
   DM1.cdsQry.Open;
   IF Dm1.cdsQry.RecordCount > 0 THEN
   BEGIN
      WHILE NOT Dm1.cdsQry.Eof DO
      BEGIN
         CDSOBSSINRESOLVER.Insert;
         CDSOBSSINRESOLVER.FieldByName('PROCEDENCIA').AsString := 'CREDITOS';
         CDSOBSSINRESOLVER.FieldByName('CARACTER').AsString := 'RESTRICTIVO';
         CDSOBSSINRESOLVER.FieldByName('OFICINA').AsString := Dm1.cdsQry.FieldByName('OFDESNOM').AsString;
         CDSOBSSINRESOLVER.FieldByName('OBSERVACION').AsString := Dm1.cdsQry.FieldByName('MTOOBSR').AsString;
         CDSOBSSINRESOLVER.FieldByName('FECHA').AsString := Dm1.cdsQry.FieldByName('FECOBSR').AsString;
         CDSOBSSINRESOLVER.FieldByName('USUARIO').AsString := Dm1.cdsQry.FieldByName('USROBSR').AsString;
         Dm1.cdsQry.Next
      END;
   END;
   DM1.cdsQry.IndexFieldNames := '';
   CDSOBSSINRESOLVER.Last;
   DM1.cdsQry.Close;
END;

//Valida si existe algun campo en blanco;
PROCEDURE TFMantAsociado.validar;
VAR
   xValReniec: STRING;
   xSql: string;
BEGIN
   CDSINCOMPLETOS.EmptyDataSet;
   DM1.xsindata := 0;

   If dblTipDoc.Text = '04' Then
   Begin
      xSql := 'SELECT IMAGEN_ANVERSO, IMAGEN_REVERSO, FOTO, FIRMA FROM ASO_CARNE_EXTRANJERIA'
      +' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND NVL(ESTADO,''X'') = ''S''';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      VerificaSinData(DM1.cdsQry.FieldByName('IMAGEN_ANVERSO').AsString, 'IMAGEN CE ANVERSO');
      VerificaSinData(DM1.cdsQry.FieldByName('IMAGEN_REVERSO').AsString, 'IMAGEN CE REVERSO');
      VerificaSinData(DM1.cdsQry.FieldByName('FOTO').AsString, 'FOTO CE');
      VerificaSinData(DM1.cdsQry.FieldByName('FIRMA').AsString, 'FIRMA CE');
   End;

   VerificaSinData(EdtCodMod.Text, 'CODIGO MODULAR');
   VerificaSinData(EdtAsoNomDni.Text, 'NOMBRES');
   IF Length(trim(ppLApePat2.Caption)) + Length(trim(ppLApeMat2.Caption)) = 0 THEN VerificaSinData(EdtApePatDni.Text, 'APELLIDO PATERNO y/o APELLIDO MATERNO');
   VerificaSinData(DbLlRegPen.Text, 'REGIMEN DE PENSION');
   IF TRIM(DbLlRegPen.Text) = '03' THEN VerificaSinData(DbLlAfp.Text, 'AFP');
   VerificaSinData(DbLUniPro.Text, 'UNIDAD DE PROCESO');
   VerificaSinData(DbLUniPag.Text, 'UNIDAD DE PAGO');
   DM1.cdsGradoI.Close;
   xsql := 'SELECT GRAINSTID,CONVIVID,TIPPROID,INMUEBLE,NROHIJOS,ESTCIVID,VEHICULO FROM ' +
      '(SELECT MAX(ITEM) ITEM FROM APO206 WHERE ASOID=''' + DM1.cdsAso.FieldByName('ASOID').AsString + ''') A, APO206 B ' +
      'Where ASOID=''' + DM1.cdsAso.FieldByName('ASOID').AsString + ''' AND A.ITEM=B.ITEM ';
   DM1.cdsGradoI.DataRequest(XSQL);
   DM1.cdsGradoI.Open;

   VerificaSinData(DM1.cdsGradoI.FieldByName('ESTCIVID').AsString, 'ESTADO CIVIL');

   If DbLlTipAso.Text<>'VO' Then
      Begin
        VerificaSinData(dm1.cdsGradoI.FieldByName('GRAINSTID').AsString, 'GRADO DE INSTRUCCION');
        VerificaSinData(DM1.cdsGradoI.FieldByName('CONVIVID').AsString, 'CONDICION DE VIVIENDA');
      End;
   VerificaSinData(DbLUses.Text, 'USE/UGEL');

   xSql := 'SELECT COUNT(1) CANT FROM APO103 U WHERE U.UPROID = ' + QuotedStr(DM1.cdsAso.FieldByName('UPROID').AsString)
     + ' AND U.UPAGOID = ' + QuotedStr(DM1.cdsAso.FieldByName('UPAGOID').AsString) + ' AND U.FLGESCFIS = ''S''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   if ( ((DbLlTipAso.Text = 'CE') and (DbLlRegPen.Text = '02'))
     or
     ((DM1.sAPO201 = 'ASO_NUE_CLI') and (DM1.cdsQry.FieldByName('CANT').AsInteger > 0)) ) then
   begin
   end
   else
   begin
     VerificaSinData(dbeCuenta.Text, 'CUENTA DE AHORRO');
     VerificaSinData(dbeSitCta.Text, 'SITUACION DE LA CUENTA');
   end;
   DM1.cdsQry.Close;

   IF (dbeCuenta.Text <> '') AND (dbeSitCta.Text <> '') THEN
   BEGIN
      xSQL := 'SELECT ASOID, ASONCTA, SITCTA '
         + '  FROM APO207 '
         + ' WHERE ASOID   =' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
         + '   AND ASONCTA =' + QuotedStr(dbeCuenta.Text)
         + '   AND SITCTA  =' + QuotedStr(dbeSitCta.Text);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSQL);
      DM1.cdsQry.Open;
      IF DM1.cdsQry.RecordCount <= 0 THEN
      BEGIN
         VerificaSinData('', 'CUENTA DE AHORRO EN DETALLE');
         VerificaSinData('', 'SITUACION DE CUENTA EN DETALLE');
      END;
   END;

   VerificaSinData(dbeCargo.Text, 'CODIGO DE CARGO');
   VerificaSinData(dbeCodPag.Text, 'CODIGO DE PAGO');
   VerificaSinData(DbLlSexo.Text, 'SEXO');
   VerificaSinData(DbLlTipAso.Text, 'TIPO DE ASOCIADO');
   IF (DbLlTipAso.Text = 'DO') OR (DbLlTipAso.Text = 'VO') THEN
   BEGIN
      VerificaSinData(dbeNroRes.Text, 'NRO DE RESOLUCION DE NOMBRAMIENTO');
      VerificaSinData(DBDTResNom.Text, 'FECHA DE RESOLUCION DE NOMBRAMIENTO');
   END
   ELSE
      IF DbLlTipAso.Text = 'CE' THEN
      BEGIN
         VerificaSinData(dbeNroCes.Text, 'NRO DE RESOLUCION DE CESE');
         VerificaSinData(DBDTResCes.Text, 'FECHA DE RESOLUCION DE CESE');
      END
      ELSE
         IF DbLlTipAso.Text = 'CO' THEN
         BEGIN
            VerificaSinData(dbeNroRes.Text, 'NRO DE CONTRATO');
            VerificaSinData(DBDTResNom.Text, 'FECHA DE INICIO DE CONTRATO');
            VerificaSinData(DBDTResCes.Text, 'FECHA DE FIN DE CONTRATO');
         END;


      If dblTipDoc.Text=xTIPDOCCOD Then
      //If dblTipDoc.Text = '10' Then
         VerificaSinData(dbeLibDni.Text, 'DNI');

      If dblTipDoc.Text<>xTIPDOCCOD Then
         VerificaSinData(edtnumdoc.Text, 'CE');



      VerificaSinData(dbdtFecNac.Text, 'FECHA DE NACIMIENTO');

      If DbLlTipAso.Text<>'VO' Then
         Begin
             VerificaSinData(dbeDirec.Text, 'DIRECCION (DOMICILIO)');
             VerificaSinData(lkcDpto.Text, 'DEPARTAMENTO (DOMICILIO)');
             VerificaSinData(lkcProv.Text, 'PROVINCIA (DOMICILIO)');
             VerificaSinData(lkcDist.Text, 'DISTRITO (DOMICILIO)');
         End;

   IF (DbLlTipAso.Text = 'DO') OR (DbLlTipAso.Text = 'VO') OR (DbLlTipAso.Text = 'CO') THEN
   BEGIN
      VerificaSinData(measodeslab.Text, 'CENTRO LABORAL');
      VerificaSinData(measodirlab.Text, 'DIRECCION (CENTRO LABORAL)');
      VerificaSinData(lkcDpto2.Text, 'DEPARTAMENTO (CENTRO LABORAL)');
      VerificaSinData(lkcProv2.Text, 'PROVINCIA (CENTRO LABORAL)');
      VerificaSinData(lkcDist2.Text, 'DISTRITO (CENTRO LABORAL )');
   END;

   IF (DM1.vanos >= 100) AND (DbLlTipAso.Text = 'CE') THEN
   BEGIN
      DM1.xsindata := DM1.xsindata + 1;
      CDSINCOMPLETOS.Insert;
      CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'PASO LIMITE DE EDAD';
   END;

  //Verifica Foto y Firma Reniec
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest('SELECT IDFIRMA, IDASO, ACTDATREN FROM APO110 WHERE OFDESID=''' + DM1.xOfiDes + '''');
   DM1.cdsGradoI.Open;
   xValReniec := DM1.cdsGradoI.FieldByName('ACTDATREN').AsString;

   IF ((dm1.xFto = 'N') OR (dm1.xFto = '')) AND (DM1.cdsGradoI.FieldByName('IDASO').AsString = 'S') THEN
   BEGIN
      DM1.xsindata := DM1.xsindata + 1;
      CDSINCOMPLETOS.Insert;
      CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'SIN FOTO'
   END;

   IF ((dm1.xFma = 'N') OR (dm1.xFma = '')) AND (DM1.cdsGradoI.FieldByName('IDFIRMA').AsString = 'S') THEN
   BEGIN
      DM1.xsindata := DM1.xsindata + 1;
      CDSINCOMPLETOS.Insert;
      CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'SIN FIRMA'
   END;

   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest('SELECT ACTARCREN, AUTDESAPO, ASOTIPID FROM ' + DM1.sAPO201 + ' WHERE ' + DM1.sAso_where + ' ASOID=''' + DM1.cdsAso.FieldByName('ASOID').AsString + '''');
   DM1.cdsGradoI.Open;

   IF DM1.sAPO201 = 'APO201' THEN
   BEGIN
      IF (DM1.cdsGradoI.FieldByName('ASOTIPID').AsString = 'VO') AND (DM1.cdsGradoI.FieldByName('AUTDESAPO').AsString <> 'S') THEN
      BEGIN
         DM1.xsindata := DM1.xsindata + 1;
         CDSINCOMPLETOS.Insert;
         CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'NO AUTORIZO DSCTO. DE APORTES';
      END;
   END;

   IF DM1.sAPO201 = 'APO201' THEN
   BEGIN
      // IF (xValReniec = 'S') AND (Trim(DM1.cdsGradoI.FieldByName('ACTARCREN').AsString) <> 'S') THEN
      IF (xValReniec = 'S') AND ( (Trim(DM1.cdsGradoI.FieldByName('ACTARCREN').AsString) <> 'S') and (dblTipDoc.Text = '10') ) THEN
      BEGIN
         DM1.xsindata := DM1.xsindata + 1;
         CDSINCOMPLETOS.Insert;
         CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'NO ACTUALIZO DE RENIEC';
      END;
   END
   ELSE
   BEGIN
      IF DM1.xOfiDes = '01' THEN
      BEGIN
         IF (xValReniec = 'S') AND ((xActRENIEC <> 'S') and (dblTipDoc.Text = '10') ) THEN
         BEGIN
            DM1.xsindata := DM1.xsindata + 1;
            CDSINCOMPLETOS.Insert;
            CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'NO ACTUALIZO DE RENIEC';
         END;
      END;
   END;

  //Descuento de aportes
   IF (DM1.cdsGradoI.FieldByName('ASOTIPID').AsString = 'DO') AND (DM1.cdsGradoI.FieldByName('AUTDESAPO').AsString <> 'S') THEN
   BEGIN
      DM1.xsindata := DM1.xsindata + 1;
      CDSINCOMPLETOS.Insert;
      CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'NO AUTORIZO DSCTO. DE APORTES';
   END;

   IF DM1.sAPO201 = 'APO201' THEN
   BEGIN
    //Si no Valido todos los datos
      IF xsinvalidar > 0 THEN
      BEGIN
         DM1.xsindata := DM1.xsindata + 1;
         CDSINCOMPLETOS.Insert;
         CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'EXISTEN DATOS SIN VALIDAR'
      END;
   END
   ELSE
   BEGIN
      IF DM1.xOfiDes = '01' THEN
      BEGIN
      //Si no Valido todos los datos
         IF xsinvalidar > 0 THEN
         BEGIN
            DM1.xsindata := DM1.xsindata + 1;
            CDSINCOMPLETOS.Insert;
            CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'EXISTEN DATOS SIN VALIDAR'
         END;
      END;
   END;


   // Verifica si se cargo imagen del carne de extranjeria
   If DM1.cdsAso.FieldByName('TIPDOCCOD').AsString = '04' Then
   Begin
      xSql := 'SELECT ASOID FROM ASO_CARNE_EXTRANJERIA WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
      +' AND IMAGEN_ANVERSO IS NOT NULL OR IMAGEN_REVERSO IS NOT NULL AND ESTADO = ''S''';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      If DM1.cdsQry.RecNo = 0 Then
      Begin
         CDSINCOMPLETOS.Insert;
         CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'NO CARGÓ CARNET DE EXTRANJERÍA';
      End;
   End;

   CDSINCOMPLETOS.First;
END;

//Modifica el destino del Tickets
PROCEDURE TFMantAsociado.ModiDestinofTickes;
VAR
   xdestino,XSQL: STRING;
BEGIN
  //Verifica si toda la informacion esta ingresada
   Validar;

  //Solo pasa a Creditos si esta actualizado toda su informacin
   IF DM1.xsindata = 0 THEN
      xdestino := 'CRE'
   ELSE
      xdestino := 'ASO';

  //Manda a la Etiquetera Inserta en ASO_TICKETS_DESTINO
   TRY
  // controla la adicion en tickets, para que inserte sólo una vez
      IF (DM1.xInsert = '1') and (xInsertaTicket) THEN
      BEGIN
         XSQL := 'INSERT INTO TICKET.ASO_TICKETS_DESTINO (ASOID,ASODNI,FECACT,OPERACION) VALUES(' +
            QuotedStr(TRIM(DM1.cdsAso.FieldByName('Asoid').AsString)) + ',' +
            QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString) + ',SYSDATE,' +
            QuotedStr(xdestino) + ')';
         DM1.DCOM1.AppServer.EjecutaSql(xsql);
      END
      ELSE
      BEGIN
         xSQL := 'SELECT asoid, asodni, fecact, operacion, motivo FROM TICKET.ASO_TICKETS_DESTINO '
            + ' WHERE ASOID=''' + Trim(DM1.cdsAso.FieldByName('Asoid').AsString) + ''' ';
         DM1.cdsReclamo1.Close;
         DM1.cdsReclamo1.DataRequest(xSQL);
         DM1.cdsReclamo1.Open;
         IF DM1.cdsReclamo1.RecordCount > 0 THEN
            XSQL := 'UPDATE TICKET.ASO_TICKETS_DESTINO '
               + '   SET ASODNI    = ''' + dbeLibDni.Text + ''', '
               + '       OPERACION = ''' + xdestino + ''' WHERE ASOID=''' + Trim(DM1.cdsAso.FieldByName('Asoid').AsString) + ''' '
         ELSE
            XSQL := 'INSERT INTO TICKET.ASO_TICKETS_DESTINO (ASOID,ASODNI,FECACT,OPERACION) VALUES(' + QuotedStr(TRIM(DM1.cdsAso.FieldByName('Asoid').AsString)) + ',' + QuotedStr(DM1.cdsAso.FieldByName('ASODNI').AsString) + ',SYSDATE,' + QuotedStr(xdestino) + ')';

         DM1.DCOM1.AppServer.EjecutaSql(xsql);
      END;
   EXCEPT
   END;

   IF DM1.xsindata > 0 THEN
   BEGIN
      TRY
         FMantAsociadoCompletar := TFMantAsociadoCompletar.create(self);
         FMantAsociadoCompletar.EnlazarDatos(self.DSINCOMPLETOS);
         FMantAsociadoCompletar.ShowModal;
      FINALLY
         FMantAsociadoCompletar.Free;
      END;
   END;
END;

//Inserta registro en el Log de Impresion de Ficha
PROCEDURE TFMantAsociado.GrabaLogImpFicha;
VAR
   Xsql: STRING;
BEGIN
   Xsql := 'INSERT INTO ASO_IMP_FICHA_LOG (ASOID,ASODNI,ASOAPENOM,FECHA,HORA,USUARIO,OFICINA,ORIDAT) VALUES(' +
      QuotedStr(DM1.cdsAso.FieldByName('Asoid').AsString) + ',' +
      QuotedStr(dbeLibDni.Text) + ',' +
      QuotedStr(EdtApePatDni.Text + ' ' + EdtApeMatDni.Text + ' ' + EdtAsoNomDni.Text) + ',' +
      QuotedStr(Copy(DM1.FechaHora, 1, 10)) + ',' +
      QuotedStr(Copy(DM1.FechaHora, 12, 8)) + ',' +
      QuotedStr(DM1.wUsuario) + ',' + QuotedStr(DM1.wofides) + ',''ASO'')';
   DM1.DCOM1.AppServer.EjecutaSql(xsql);
END;

PROCEDURE TFMantAsociado.FichaActualizacion2;
VAR
   xSql, foto, xValReniec: STRING;
BEGIN
   CDSINCOMPLETOS.EmptyDataSet;
   DM1.xsindata := 0;
   xValReniec := '';
   foto := trim(DM1.cdsAso.FieldByName('IDIMAGE').Asstring);
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest('SELECT USERNOM FROM USERTABLE WHERE USERID=''' + DM1.WUsuario + '''');
   DM1.cdsGradoI.Open;

   ppLUsuario_2.Caption := DM1.WUsuario + '-' + DM1.cdsGradoI.FieldByname('USERNOM').AsString;
   ppLmaquina_2.Caption := DM1.wcomputadora;
   ppLFechaHora_2.Caption := DM1.FechaHora;

   ppLUsuario_3.Caption := ppLUsuario_2.Caption;
   ppLMaquina_3.Caption := ppLmaquina_2.Caption;
   pplFechaHora_3.Caption := ppLFechaHora_2.Caption;

   //Datos a Imprimir
   ppLCodMod2.Caption := EdtCodMod.Text;
   VerificaSinData(EdtCodMod.Text, 'CODIGO MODULAR');
   ppLNombres2.Caption := EdtAsoNomDni.Text;
   VerificaSinData(EdtAsoNomDni.Text, 'NOMBRES');
   IF Length(trim(pplapepat2.Caption)) + Length(trim(pplapemat2.Caption)) = 0 THEN
      VerificaSinData(EdtApePatDni.Text, 'APELLIDO PATERNO y/o APELLIDO MATERNO');
   pplapepat2.Caption := EdtApePatDni.Text;
   ppLApeMat2.Caption := EdtApeMatDni.Text;

   VerificaSinData(DbLlRegPen.Text, 'REGIMEN DE PENSION');
   ppLAFP2.Visible := False;
   ppLTipoPension2.Caption := DM1.DisplayDescrip('', 'APO105', 'REGPENABR', 'REGPENID=''' + TRIM(DbLlRegPen.Text) + '''', 'REGPENABR');
   IF TRIM(DbLlRegPen.Text) = '03' THEN
   BEGIN
      VerificaSinData(DbLlAfp.Text, 'AFP');
      ppLAFP2.Visible := True;
      ppLAFP2.Caption := DM1.DisplayDescrip('', 'TGE201', 'PROVDES', 'PROV=''A00' + TRIM(DbLlAfp.Text) + ''' ', 'PROVDES');
   END;

      //Unidad de Proceso
   VerificaSinData(DbLUniPro.Text, 'UNIDAD DE PROCESO');
   ppLUniPro2.Caption := DbLUniPro.Text + ' ' + DM1.DisplayDescrip('', 'APO102', 'UPRONOM', 'UPROID = ' + QuotedStr(trim(DbLUniPro.Text)), 'UPRONOM');

      //Unidad de Pago
   VerificaSinData(DbLUniPag.Text, 'UNIDAD DE PAGO');

      //Codigo de Pago
   VerificaSinData(dbeCodPag.Text, 'CODIGO DE PAGO');
   ppLCodPag2.Caption := dbeCodPag.Text;

      //Estado Civil;
   DM1.cdsGradoI.Close;
   xsql := 'SELECT GRAINSTID,CONVIVID,TIPPROID,INMUEBLE,NROHIJOS,ESTCIVID,VEHICULO '
      + '  FROM (SELECT MAX(ITEM) ITEM FROM APO206 WHERE ASOID=''' + DM1.cdsAso.FieldByName('ASOID').AsString + ''') A, APO206 B ' +
      ' WHERE ASOID = ''' + DM1.cdsAso.FieldByName('ASOID').AsString + ''' AND A.ITEM=B.ITEM ';
   DM1.cdsGradoI.DataRequest(XSQL);
   DM1.cdsGradoI.Open;
   VerificaSinData(DM1.cdsGradoI.FieldByName('ESTCIVID').AsString, 'ESTADO CIVIL');
   ppLEstCiv2.Caption := DM1.DisplayDescrip('', 'TGE125', 'ESTCIVDES', 'ESTCIVID = ' + QuotedStr(TRIM(DM1.cdsGradoI.FieldByName('ESTCIVID').AsString)), 'ESTCIVDES');

      //Grado de Instruccion
   VerificaSinData(dm1.cdsGradoI.FieldByName('GRAINSTID').AsString, 'GRADO DE INSTRUCCION');
   ppLGradoInst2.Caption := DM1.DisplayDescrip('', 'TGE119', 'GRAINSDES', 'GRAINSID=''' + TRIM(dm1.cdsGradoI.FieldByName('GRAINSTID').AsString) + '''', 'GRAINSDES');

      //Condicion de Vivienda
   ppLCondicionViv2.Caption := DM1.DisplayDescrip('', 'APO109', 'TIPVIVDES', 'TIPVIVID=''' + TRIM(dm1.cdsGradoI.FieldByName('CONVIVID').AsString) + '''', 'TIPVIVDES');

    //UGEL
   VerificaSinData(DbLUses.Text, 'USE/UGEL');
   DM1.cdsGradoI.Close;

   xSql := 'SELECT USENOM FROM APO101 '
      + ' WHERE NVL(FDESHABILITADO,''S'') =''N'' AND'
      + '       UPROID  = ' + QuotedStr(trim(DbLUniPro.Text))
      + '   AND UPAGOID = ' + QuotedStr(trim(DbLUniPag.Text)) + ' AND USEID = ' + QuotedStr(trim(DbLUses.Text));
   DM1.cdsGradoI.DataRequest(xSql);
   DM1.cdsGradoI.Open;
   ppLUgel2.Caption := DbLUses.Text + ' ' + DM1.cdsGradoI.FieldByName('USENOM').AsString;

    //Cuenta de Ahorro
   ppLCtaAhorros2.Caption := trim(dbeCuenta.Text);
   VerificaSinData(dbeCuenta.Text, 'CUENTA DE AHORRO');
   ppLEstCta2.Caption := '(' + trim(dbeSitCta.Text) + ')';
   VerificaSinData(dbeSitCta.Text, 'SITUACION DE LA CUENTA');

    //Sexo del asociado
   VerificaSinData(DbLlSexo.Text, 'SEXO');
   ppLSEXO2.Caption := DbLlSexo.Text;

    //Situacin del asociado
   VerificaSinData(DbLlTipAso.Text, 'TIPO DE ASOCIADO');

   ppLTipAso2.Caption := '';
   IF DbLlTipAso.Text = 'DO' THEN
   BEGIN
      VerificaSinData(dbeNroRes.Text, 'NRO DE RESOLUCION DE NOMBRAMIENTO');
      VerificaSinData(DBDTResNom.Text, 'FECHA DE RESOLUCION DE NOMBRAMIENTO');
      ppLTipAso2.Caption := 'ACTIVO'
   END
   ELSE
      IF DbLlTipAso.Text = 'CE' THEN
      BEGIN
         VerificaSinData(dbeNroCes.Text, 'NRO DE RESOLUCION DE CESE');
         VerificaSinData(DBDTResCes.Text, 'FECHA DE RESOLUCION DE CESE');
         ppLTipAso2.Caption := 'CESANTE'
      END
      ELSE
         IF DbLlTipAso.Text = 'CO' THEN
         BEGIN
            VerificaSinData(dbeNroCes.Text, 'NRO DE RESOLUCION DE CESE');
            VerificaSinData(DBDTResCes.Text, 'FECHA DE RESOLUCION DE CESE');
            ppLTipAso2.Caption := 'CONTRATADO'
         END;

   //Flag de tipo de Documento (SIEMPRE DNI)
   ppLDNIFLAG.Visible := True;
   ppLDNI2.Caption := dbeLibDni.Text;
   If dblTipDoc.Text=xTIPDOCCOD Then
         VerificaSinData(dbeLibDni.Text, 'DNI')
   Else  VerificaSinData(edtnumdoc.Text, 'NÚMERO DE DOCUMENTO');
   ppLFecNac2.Caption := dbdtFecNac.Text;
   VerificaSinData(dbdtFecNac.Text, 'FECHA DE NACIMIENTO');

   ppLResCes2.Caption := dbeNroCes.Text;
   ppLFResCes2.Caption := DBDTResCes.Text;

   ppLResNom2.Caption := dbeNroRes.Text;
   ppLFResNom2.Caption := DBDTResNom.Text;

   ppLAsodir2.Caption := dbeDirec.Text;
   VerificaSinData(dbeDirec.Text, 'DIRECCION (DOMICILIO)');

   VerificaSinData(lkcDpto.Text, 'DEPARTAMENTO (DOMICILIO)');
   VerificaSinData(lkcProv.Text, 'PROVINCIA (DOMICILIO)');
   VerificaSinData(lkcDist.Text, 'DISTRITO (DOMICILIO)');
   xSql := 'SELECT TRIM(UBIGEODES)||''/'' DESCRIP '
      + '  FROM TGE147 '
      + ' WHERE UBIGEOID = ' + QuotedStr(copy(lkcDist.Text, 1, 2) + '0000');
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest(xSql);
   DM1.cdsGradoI.Open;
   ppLUbigeoDir2.Caption := DM1.cdsGradoI.FieldByName('DESCRIP').Asstring;

   xSql := 'SELECT TRIM(UBIGEODES)||''/'' DESCRIP '
      + '  FROM TGE147 '
      + ' WHERE UBIGEOID = ' + QuotedStr(copy(lkcDist.Text, 1, 4) + '00');
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest(xSql);
   DM1.cdsGradoI.Open;
   ppLUbigeoDir2.Caption := ppLUbigeoDir2.Caption + DM1.cdsGradoI.FieldByName('DESCRIP').Asstring;

   xSql := 'SELECT TRIM(UBIGEODES) DESCRIP '
      + '  FROM TGE147 '
      + ' WHERE UBIGEOID = ' + QuotedStr(lkcDist.Text);
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest(xSql);
   DM1.cdsGradoI.Open;
   ppLUbigeoDir2.Caption := ppLUbigeoDir2.Caption + DM1.cdsGradoI.FieldByName('DESCRIP').Asstring;

      // Descripción del lugar donde trabaja
   ppLAsoCenLab2.Caption := measodeslab.Text;
   ppLAsoDirLab2.Caption := measodirlab.Text;

   IF DbLlTipAso.Text = 'DO' THEN
   BEGIN

      VerificaSinData(measodeslab.Text, 'CENTRO LABORAL');
      VerificaSinData(measodirlab.Text, 'DIRECCION (CENTRO LOABORAL)');
      VerificaSinData(lkcDpto2.Text, 'DEPARTAMENTO (CENTRO LABORAL)');
      VerificaSinData(lkcProv2.Text, 'PROVINCIA (CENTRO LABORAL)');
      VerificaSinData(lkcDist2.Text, 'DISTRITO (CENTRO LABORAL )');
   END;

   xSql := 'SELECT TRIM(UBIGEODES)||''/'' DESCRIP '
      + '  FROM TGE147 '
      + ' WHERE UBIGEOID = ' + QuotedStr(copy(lkcDist2.Text, 1, 2) + '0000');
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest(xSql);
   DM1.cdsGradoI.Open;
   ppLUbigeoLab2.Caption := DM1.cdsGradoI.FieldByName('DESCRIP').Asstring;
   xSql := 'SELECT TRIM(UBIGEODES)||''/'' DESCRIP '
      + '  FROM TGE147 '
      + ' WHERE UBIGEOID = ' + QuotedStr(copy(lkcDist2.Text, 1, 4) + '00');
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest(xSql);
   DM1.cdsGradoI.Open;
   ppLUbigeoLab2.Caption := ppLUbigeoLab2.Caption + DM1.cdsGradoI.FieldByName('DESCRIP').Asstring;
   xSql := 'SELECT TRIM(UBIGEODES) DESCRIP '
      + '  FROM TGE147 '
      + ' WHERE UBIGEOID = ' + QuotedStr(lkcDist2.Text);
   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest(xSql);
   DM1.cdsGradoI.Open;
   ppLUbigeoLab2.Caption := ppLUbigeoLab2.Caption + DM1.cdsGradoI.FieldByName('DESCRIP').Asstring;

   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest('SELECT IDFIRMA,IDASO,ACTDATREN FROM APO110 WHERE OFDESID=''' + DM1.xOfiDes + '''');
   DM1.cdsGradoI.Open;
   xValReniec := DM1.cdsGradoI.FieldByName('ACTDATREN').AsString;

   pplSinFot2.Visible := False;
   pplSinFirma2.Visible := False;
   IF (dm1.xFto = 'N') AND (DM1.cdsGradoI.FieldByName('IDASO').AsString = 'S') THEN
   BEGIN
      ppLSINFOT2.Visible := True;
      DM1.xsindata := DM1.xsindata + 1;
      CDSINCOMPLETOS.Insert;
      CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'SIN FOTO'
   END
   ELSE
      IF dm1.xFto = 'S' THEN ppImgfoto2.Picture := ImagAso.Picture;

   IF (dm1.xFma = 'N') AND (DM1.cdsGradoI.FieldByName('IDFIRMA').AsString = 'S') THEN
   BEGIN
      DM1.xsindata := DM1.xsindata + 1;
      ppLSINFIRMA2.Visible := True;
      CDSINCOMPLETOS.Insert;
      CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'SIN FIRMA'
   END

   ELSE
      IF dm1.xFma = 'S' THEN ppImgFrima.Picture := ImaFirma.Picture;

   DM1.cdsGradoI.Close;
   DM1.cdsGradoI.DataRequest('SELECT ACTARCREN FROM ' + DM1.sAPO201 + ' WHERE ' + DM1.sAso_where + ' ASOID=''' + DM1.cdsAso.FieldByName('ASOID').AsString + '''');
   DM1.cdsGradoI.Open;
   IF DM1.cdsGradoI.FieldByName('ACTARCREN').AsString = 'S' THEN
      pplValReniec.Caption := 'SI'
   ELSE
      IF xValReniec = 'S' THEN
      BEGIN
         pplValReniec.Caption := 'NO';
         DM1.cdsGradoI.Close;
         DM1.cdsGradoI.DataRequest('SELECT IDFIRMA,IDASO,ACTDATREN FROM APO110 WHERE OFDESID=''' + DM1.xOfiDes + '''');
         DM1.cdsGradoI.Open;
         IF DM1.cdsGradoI.FieldByName('ACTDATREN').AsString = 'S' THEN
         BEGIN
            DM1.xsindata := DM1.xsindata + 1;
            CDSINCOMPLETOS.Insert;
            CDSINCOMPLETOS.FieldByName('CAMPO').AsString := 'NO ACTUALIZO DE RENIEC'
         END;
      END;

   IF DM1.xsindata > 0 THEN
      pplDatIncompletos2.Visible := true
   ELSE
      pplDatIncompletos2.Visible := False;

   IF DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO' THEN
   BEGIN
      ppLabel215.Caption := 'Inicio';
      ppLabel217.Caption := 'Fin';
      ppLabel225.Caption := 'Contrato';
      ppLabel218.Caption := '';
      ppLabel177.Caption := '';
      ppLresCes2.Caption := '';
   END;

// se agrega caption de fallecido el cual se hace visible si esta fallecido
   pplblFallecido.Visible := False;
   if DM1.cdsAso.FieldByName('FALLECIDO').AsString = 'S' then
   begin
      pplblFallecido.Caption := 'FALLECIDO';
      if length(trim(lblFallecido.Caption))>0 then
         pplblFallecido.Caption := lblFallecido.Caption;
      pplblFallecido.Visible := True;
   end;

   CDSINCOMPLETOS.First;
   PPDBP1.DataSource := dm1.dsAso;
   ppBDEReniec.DataSource := DSINCOMPLETOS;

   PPR2.Print;
   GrabaLogImpFicha;
   PPR2.Stop;

END;

PROCEDURE TFMantAsociado.btnactdirClick(Sender: TObject);
VAR
   sSQL: STRING;
BEGIN
   IF (DM1.sAPO201 = 'ASO_NUE_CLI') and (dblTipDoc.Text = xTIPDOCCOD) THEN
   //IF (DM1.sAPO201 = 'ASO_NUE_CLI') and (dblTipDoc.Text = '10') THEN
   BEGIN
      sSQL := 'SELECT ASOID FROM ' + DM1.sAPO201 + ' WHERE ' + DM1.sAso_where + ' ASODNI=' + QuotedStr(dbeLibDni.Text);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(sSQL);
      DM1.cdsQry.Open;
      IF DM1.cdsQry.RecordCount <= 0 THEN
      BEGIN
         ShowMessage('Advertencia: Antes de actualizar la dirección debe Capturar los datos de RENIEC');
         Exit;
      END;
   END;

   Try
      FNueManDom := TFNueManDom.create(self);
      FNueManDom.Showmodal;
   Finally
      FNueManDom.free;
   End;

End;

PROCEDURE TFMantAsociado.dbeTel1Enter(Sender: TObject);
BEGIN
   ExisteSolicitud;
END;

PROCEDURE TFMantAsociado.ExisteSolicitud;
BEGIN
   IF DM1.xInsert = '1' THEN
   BEGIN
      sSQL := 'SELECT ASOID FROM ' + DM1.sAPO201 + ' WHERE ' + DM1.sAso_where + ' ASODNI=' + QuotedStr(dbeLibDni.Text);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(sSQL);
      DM1.cdsQry.Open;
      IF DM1.cdsQry.RecordCount <= 0 THEN
      BEGIN
         IF DM1.xOfiDes > '01' THEN
         BEGIN
            dbeLibDni.Enabled := True;
            dbeLibDni.SetFocus;
         END
         ELSE
         BEGIN
            ShowMessage('Advertencia : Primero debe capturar los datos de la RENIEC');
         END;
      END;
   END;
END;

PROCEDURE TFMantAsociado.dbeTel2Enter(Sender: TObject);
BEGIN
   ExisteSolicitud;
END;

PROCEDURE TFMantAsociado.bitAutorizaClick(Sender: TObject);
var
  xSql: string;
  cant: integer;
BEGIN
   if DM1.xCnd = 'AUT' then
   begin
     Validar;

     IF DM1.xsindata > 0 THEN
     BEGIN
        TRY
           FMantAsociadoCompletar := TFMantAsociadoCompletar.create(self);
           FMantAsociadoCompletar.EnlazarDatos(self.DSINCOMPLETOS);
           FMantAsociadoCompletar.ShowModal;
        FINALLY
           FMantAsociadoCompletar.Free;
        END;
        Exit;
     END;

     TRY
        FAutoriza := TFAutoriza.create(self);
        FAutoriza.Showmodal;
     FINALLY
        FAutoriza.Close;
        FAutoriza.free;
     END;
   end
   else if DM1.xCnd = 'DESAUT' then
   begin
      xSql := 'SELECT COUNT(1) CANT FROM COB319 WHERE ASOID = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ' AND ROWNUM < 2';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cant := DM1.cdsQry.FieldByName('CANT').AsInteger;
      if cant > 0 then
      begin
        MessageDlg('El asociado tiene aporte(s) enviados, no puede retornar al Nivel 1', mtError,[mbOk], 0);
        Exit;
      end;

      xSql := 'SELECT COUNT(1) CANT FROM APO301 WHERE ASOID = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ' AND ROWNUM < 2';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cant := DM1.cdsQry.FieldByName('CANT').AsInteger;
      if cant > 0 then
      begin
        MessageDlg('El asociado tiene aporte(s), no puede retornar al Nivel 1', mtError,[mbOk], 0);
        Exit;
      end;

      xSql := 'SELECT COUNT(1) CANT FROM EVAL_RES_CAB WHERE ASOID = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ' AND ROWNUM < 2';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cant := DM1.cdsQry.FieldByName('CANT').AsInteger;
      if cant > 0 then
      begin
        MessageDlg('El asociado tiene solicitudes de crédito registradas, no puede retornar al Nivel 1', mtError,[mbOk], 0);
        Exit;
      end;

      xSql := 'SELECT COUNT(1) CANT FROM CRE301 WHERE ASOID = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ' AND ROWNUM < 2';
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      cant := DM1.cdsQry.FieldByName('CANT').AsInteger;
      if cant > 0 then
      begin
        MessageDlg('El asociado tiene crédito(s) otorgado(s), no puede retornar al Nivel 1', mtError,[mbOk], 0);
        Exit;
      end;

      If Application.MessageBox('¿Desea desautorizar al asociado y retornarlo al Nivel 1?', 'Confirmar desautorización', MB_YESNO + MB_ICONQUESTION) <> ID_YES Then Exit;

      xSql := 'BEGIN DB2ADMIN.SP_ASO_DESAUT_ASO_NUE(' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ', ' + QuotedStr(DM1.wUsuario) + '); END;';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
      MessageDlg('Registro actualizado', mtInformation, [mbOk], 0);
      Close;
   end;
END;

PROCEDURE TFMantAsociado.bitRechazaClick(Sender: TObject);
BEGIN
   TRY
      FRechazar := TFRechazar.create(self);
      FRechazar.Showmodal;
   FINALLY
      FRechazar.Close;
      FRechazar.free;
   END;
END;

PROCEDURE TFMantAsociado.bbtnN3Click(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   IF (BitGrabar.Enabled) AND (BitGrabar.Visible) THEN
   BEGIN
      ShowMessage('Debe [Grabar] para continuar...');
      Exit;
   END;

   validar;

   IF DM1.xsindata > 0 THEN
   BEGIN
      TRY
         FMantAsociadoCompletar := TFMantAsociadoCompletar.create(self);
         FMantAsociadoCompletar.EnlazarDatos(self.DSINCOMPLETOS);
         FMantAsociadoCompletar.ShowModal;
      FINALLY
         FMantAsociadoCompletar.Free;
      END;
      IF DSINCOMPLETOS.DataSet.RecordCount > 0 THEN Exit;
      DesactivaPantPrincipal;
   END;

   IF MessageDlg('Envia Asociado a Autorizar con Usuario de Nivel 3. ¿ Está seguro ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo THEN exit;

   xSQL := 'SELECT ASOID FROM ASO_NUE_CLI '
         + ' WHERE SOLICITUD   = ' + QuotedStr(DM1.cdsAso.FieldByname('SOLICITUD').AsString)
         + '   and EST_AUT_CLI = ''NU''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;

   IF DM1.cdsQry.RecordCount <= 0 THEN
   BEGIN
      ShowMessage('NO Existe Asociado Nuevo para enviar a Autorizar, con DNI ' + dbeLibDni.Text + '. Verificar...');
      Exit;
   END;

   xSQL := 'UPDATE ASO_NUE_CLI '
      + '   SET EST_AUT_CLI = ''N3'', '
      + '       USU_CRE_CLI = ''' + DM1.wUsuario + ''', '
      + '       FEC_CRE_CLI = sysdate '
      + ' WHERE SOLICITUD   = ' + QuotedStr(DM1.cdsAso.FieldByname('SOLICITUD').AsString)
      + '   AND ASOID       = ' + QuotedStr(DM1.cdsAso.FieldByname('ASOID').AsString)
      + '   AND EST_AUT_CLI = ''NU''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Execute;

   bbtnN3.Enabled := False;
   ActivaSalir;

   ShowMessage('Asociado enviado');
END;

PROCEDURE TFMantAsociado.bbtnCartaClick(Sender: TObject);
VAR
   sSQL: STRING;
BEGIN

// se valida para que no imprima para Asociados Fallecidos
   if DM1.cdsAso.FieldByName('FALLECIDO').AsString = 'S' then
   begin
      ShowMessage('No se permite la Impresión de este documento si el Asociado está Fallecido');
      exit;
   end;

   IF (BitGrabar.Enabled) AND (BitGrabar.Visible) THEN
   BEGIN
      ShowMessage('Debe [Grabar] para continuar...');
      Exit;
   END;

   IF (DM1.cdsAso.fieldbyname('ASOTIPID').AsString = 'DO') OR
      (DM1.cdsAso.fieldbyname('ASOTIPID').AsString = 'VO') OR
      (DM1.cdsAso.fieldbyname('ASOTIPID').AsString = 'CE') THEN

   ELSE
   BEGIN
      MessageDlg('Solo Asociados tipo DO, VO y CE tienen accesos a este botón.!!!', mtConfirmation, [mbOk], 0);
      Screen.Cursor := crDefault;
      Exit;
   END;
   sSQL := 'SELECT asoapenomdni, asodni, asofresnom, asoresnom, asodeslab, to_char(asofresnom,''yyyy'') Ano_Nomb, '
      + '       a.useid, c.usenom, a.dptoid, b.dptodes, asodir, asotelf1, a.asoemail, '
      + '       ASOTELF2, CEN.DIRREGEDU,SUBSTR(asofresnom,1,2) FERESDIA, SUBSTR(asofresnom,4,2) FERESMES,SUBSTR(asofresnom,7,4) FERESANIO,'
      + '       to_char(sysdate,''dd'') dia, to_char(sysdate,''mm'') mes, '
      + '       to_char(sysdate,''yy'') ano, '
      + '       case when to_char(asofresnom,''mm'')=''01'' then ''ENERO'' '
      + '       when to_char(asofresnom,''mm'')=''02'' then ''FEBRERO'' '
      + '       when to_char(asofresnom,''mm'')=''03'' then ''MARZO'' '
      + '       when to_char(asofresnom,''mm'')=''04'' then ''ABRIL'' '
      + '       when to_char(asofresnom,''mm'')=''05'' then ''MAYO'' '
      + '       when to_char(asofresnom,''mm'')=''06'' then ''JUNIO'' '
      + '       when to_char(asofresnom,''mm'')=''07'' then ''JULIO'' '
      + '       when to_char(asofresnom,''mm'')=''08'' then ''AGOSTO'' '
      + '       when to_char(asofresnom,''mm'')=''09'' then ''SETIEMBRE'' '
      + '       when to_char(asofresnom,''mm'')=''10'' then ''OCTUBRE'' '
      + '       when to_char(asofresnom,''mm'')=''11'' then ''NOVIEMBRE'' '
      + '       when to_char(asofresnom,''mm'')=''12'' then ''DICIEMBRE'' '
      + '       end mesres, '
      + '       case when to_char(sysdate,''mm'')=''01'' then ''ENERO'' '
      + '       when to_char(sysdate,''mm'')=''02'' then ''FEBRERO'' '
      + '       when to_char(sysdate,''mm'')=''03'' then ''MARZO'' '
      + '       when to_char(sysdate,''mm'')=''04'' then ''ABRIL'' '
      + '       when to_char(sysdate,''mm'')=''05'' then ''MAYO'' '
      + '       when to_char(sysdate,''mm'')=''06'' then ''JUNIO'' '
      + '       when to_char(sysdate,''mm'')=''07'' then ''JULIO'' '
      + '       when to_char(sysdate,''mm'')=''08'' then ''AGOSTO'' '
      + '       when to_char(sysdate,''mm'')=''09'' then ''SETIEMBRE'' '
      + '       when to_char(sysdate,''mm'')=''10'' then ''OCTUBRE'' '
      + '       when to_char(sysdate,''mm'')=''11'' then ''NOVIEMBRE'' '
      + '       when to_char(sysdate,''mm'')=''12'' then ''DICIEMBRE'' '
      + '       end mesdes '
      + '  FROM ' + DM1.sAPO201 + ' a,  APO101 C,  APO158 B , ASO_CEN_EDU CEN'
      + ' WHERE asodni=''' + DM1.cdsAso.FieldByname('ASODNI').AsString + ''' '
      +'  AND A.CENEDUID=CEN.CENEDUID(+)'
      + '   AND A.UPROID=C.UPROID(+) AND A.UPAGOID=C.UPAGOID(+) AND A.USEID=C.USEID(+) '

      + '   AND NVL(C.FDESHABILITADO,''S'') =''N'' AND C.DPTOID = B.DPTOID(+)';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(sSQL);
   DM1.cdsQry2.Open;

   ppdb1.DataSource := dm1.dsQry2;
   ppr3.DataPipeline := ppdb1;
   ppr3.Print;
END;

PROCEDURE TFMantAsociado.bbtnN1Click(Sender: TObject);
VAR
   xSQL: STRING;
BEGIN
   IF MessageDlg('Envia Asociado a Usuario de Nivel 1. ¿ Está seguro ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo THEN exit;

   xSQL := 'SELECT ASOID FROM ASO_NUE_CLI '
         + ' WHERE SOLICITUD   = ' + QuotedStr(DM1.cdsAso.FieldByname('SOLICITUD').AsString)
         + '   AND EST_AUT_CLI = ''N3''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   IF DM1.cdsQry.RecordCount <= 0 THEN
   BEGIN
      ShowMessage('NO Existe Asociado Nuevo para enviar a Usuario de Nivel 1, con DNI ' + dbeLibDni.Text + '. Verificar...');
      Exit;
   END;

   xSQL := 'UPDATE ASO_NUE_CLI '
      + '      SET EST_AUT_CLI    = ''NU'','
      + '          USU_CRE_CLI    = ''' + DM1.wUsuario + ''','
      + '          FEC_CRE_CLI    = sysdate, '
      + '          obs_aut_cli    = null, '
      + '          obs_aut_cli_uge= null, '
      + '          obs_aut_cli_pad= null, '
      + '          obs_aut_cli_otr= null '
      + '    WHERE SOLICITUD      = ' + QuotedStr(DM1.cdsAso.FieldByname('SOLICITUD').AsString)
      + '      AND ASOID          = ' + QuotedStr(DM1.cdsAso.FieldByname('ASOID').AsString)
      + '      AND EST_AUT_CLI    = ''N3''';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Execute;

   bbtnN1.Enabled := False;
   bitAutoriza.Enabled := False;
   bitRechaza.Enabled := False;
   ActivaSalir;

   ShowMessage('Asociado enviado');
END;


PROCEDURE TFMantAsociado.GrabaArchivo(xImage: TByteDynArray; NomArchivo: STRING);
VAR
   xArchivo: FILE;
   i, nWrite: integer;
BEGIN

  //Asigno un nombre a un File (archivo)
   AssignFile(xArchivo, NomArchivo);
  //Crea un archivo "Xarchivo"  fisico
   Rewrite(Xarchivo, 1);
  //escribo dentro del archivo el TByteDynArray capturado
   FOR i := low(xImage) TO high(xImage) DO
      BlockWrite(xArchivo, xImage[i], 1, nWrite);
  //Cierro el archivo fisico
   CloseFile(xArchivo);
END;

FUNCTION TFMantAsociado.AsignaSolicitud: STRING;
VAR
   xSQL: STRING;
BEGIN
   xSQL := 'SELECT MAX(SOLICITUD) SOLICITUD FROM ASO_NUE_CLI';
   DM1.cdsAsoX.Close;
   DM1.cdsAsoX.DataRequest(xSQL);
   DM1.cdsAsoX.Open;
   IF Length(Trim(DM1.cdsAsoX.FieldByName('SOLICITUD').AsString)) = 0 THEN
   BEGIN
      Result := '0000000001';
   END
   ELSE
   BEGIN
      Result := Format('%.10d', [DM1.cdsAsoX.FieldByName('SOLICITUD').AsInteger + 1]);
   END;
   DM1.cdsAsoX.Close;
END;

FUNCTION TFMantAsociado.AsignaAsoid: STRING;
VAR
   xSQL: STRING;
BEGIN
   xSQL := 'select max(asoid) ASOID from ('
      + 'select max(asoid) asoid from apo201 '
      + 'union all '
      + 'select max(asoid) asoid from aso_nue_cli) a';
   DM1.cdsAsoX.Close;
   DM1.cdsAsoX.DataRequest(xSQL);
   DM1.cdsAsoX.Open;
   IF Length(Trim(DM1.cdsAsoX.FieldByName('ASOID').AsString)) = 0 THEN
   BEGIN
      Result := '0000000001';
   END
   ELSE
   BEGIN
      Result := Format('%.10d', [DM1.cdsAsoX.FieldByName('ASOID').AsInteger + 1]);
   END;

   DM1.cdsAsoX.Close;
END;

//Aqui grabo la foto a la tabla
PROCEDURE TFMantAsociado.GrabafotoAtabla(xDni: STRING);
VAR
   xSql: STRING;
BEGIN
   xSql := 'SELECT dni, numlib, apepat, apemat, nombre, otrdoc, lugnac, nompad, nommad, fecnac, estatura, sexo, estciv, grains, lugdom,'+
                 ' restricciones, fecins, stavot, fecemidoc, direccion, foto, firma, usuact, fecact, ofiact, equusu, flag_expira, unico,'+
                 ' apecas, codubidepnac, desdepnac, codubipronac, despronac, codubidisnac, desdisnac, codgrains, codestciv, coddocsus, numdocsus,'+
                 ' flaconvot, codres, fecexp, codubidepdom, desdepdom, codubiprodom, desprodom, codubidisdom, desdisdom, precoddirecc, predesdirecc,'+
                 ' desdirecc, numdirecc, desetapa, desmanza, deslote, precodblock, predesblock, desblock, precodinter, predesinter, desinter,'+
                 ' precodurban, predesurban, desurban, usureniec '+
          'FROM SIOREN.SIO_CONSULTA_IDENTIDAD WHERE DNI = ''' + TRIM(xDni) + '''  ';           
   DM1.cdsParam.Close;
   DM1.cdsParam.DataRequest(xSql);
   DM1.cdsParam.Open;
   IF DM1.cdsParam.RecordCount > 0 THEN
   BEGIN
      DM1.cdsParam.Edit;
      TBlobField(DM1.cdsParam.FieldByName('Foto')).LoadFromStream(DM1.Stream);
      TBlobField(DM1.cdsParam.FieldByName('Firma')).LoadFromStream(DM1.StreamFirma);
      DM1.cdsParam.ApplyUpdates(-1);
   END;
   xSql := 'SELECT dni, numlib, apepat, apemat, nombre, otrdoc, lugnac, nompad, nommad, fecnac, estatura, sexo, estciv, grains, lugdom,'+
                 ' restricciones, fecins, stavot, fecemidoc, direccion, foto, firma, usuact, fecact, ofiact, equusu, flag_expira, unico,'+
                 ' apecas, codubidepnac, desdepnac, codubipronac, despronac, codubidisnac, desdisnac, codgrains, codestciv, coddocsus, numdocsus,'+
                 ' flaconvot, codres, fecexp, codubidepdom, desdepdom, codubiprodom, desprodom, codubidisdom, desdisdom, precoddirecc, predesdirecc,'+
                 ' desdirecc, numdirecc, desetapa, desmanza, deslote, precodblock, predesblock, desblock, precodinter, predesinter, desinter,'+
                 ' precodurban, predesurban, desurban, usureniec '+
           'FROM SIOREN.SIO_CONSULTA_IDENTIDAD WHERE DNI = ''' + TRIM(xDni) + '''  ';        
   DM1.cdsParam.Close;
   DM1.cdsParam.DataRequest(xSql);
   DM1.cdsParam.Open;
END;

//Convierte de Gif a Pcx
PROCEDURE TFMantAsociado.DeGifJpg(xGif, xJpg: STRING);
BEGIN
   {   DM1.gifFirma := TGIFImage.Create;
   DM1.gifFirma.LoadFromFile(xGif);
   DM1.jpgFirma := TJPEGImage.Create;
   DM1.jpgFirma.Assign(DM1.gifFirma);
   DM1.jpgFirma.CompressionQuality := 33;
   DM1.jpgFirma.SaveToFile(xJpg);
   }
END;

PROCEDURE TFMantAsociado.fcShapeBtn1Click(Sender: TObject);
VAR
   xfeccaduca: tdate;
   Xsql, Xdatovalidado: STRING;
BEGIN
   // IF (DM1.cdsAso.fieldbyname('ACTARCREN').AsString <> 'S') AND (xReniec = 'S') THEN
   IF (xReniec <> 'S') THEN   
   BEGIN
      MessageDlg(' Falta Capturar Datos de RENIEC', mtError, [mbOk], 0);
      Exit;
   END;

   IF MessageDlg('Desea Validar La Información de Asociado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes THEN
   BEGIN
    //Primero DESACTIVO VALIDACUONES ANTERIORES
      CDSVALIDA.First;
      WHILE NOT CDSVALIDA.Eof DO
      BEGIN
         IF CDSVALIDA.FieldByName('FLAG').AsString = '1' THEN
         BEGIN
            XSQL := 'UPDATE VAL_DAT_ASO SET STATUS='''' WHERE ASOID=''' + DM1.cdsAso.FieldByName('ASOID').AsString + ''' AND ' +
               'CAMPO=''' + CDSVALIDA.FieldByName('CAMPO').AsString + ''' ';
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
         END;
         CDSVALIDA.Next;
      END;

    //Inserto Los Datos Validados
      CDSVALIDA.First;
      WHILE NOT CDSVALIDA.Eof DO
      BEGIN
         IF CDSVALIDA.FieldByName('FLAG').AsString = '1' THEN
         BEGIN
            xfeccaduca := dm1.FechaSys + CDSVALIDA.FieldByName('TIEMPO').AsInteger;
            Xdatovalidado := DM1.cdsAso.FieldByName(CDSVALIDA.FieldByName('CAMPO').AsString).Asstring;
            XSQL := 'INSERT INTO VAL_DAT_ASO (ASOID,FECVAL,USUVAL,EQUUSU,OFIUSU,CAMPO,DATVAL,FECCAD,OBJETO,STATUS) '
               + 'VALUES ('
               + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) + ',SYSDATE,'
               + QuotedStr(DM1.wUsuario) + ','
               + QuotedStr(DM1.wcomputadora) + ','
               + QuotedStr(DM1.wofides) + ','
               + QuotedStr(CDSVALIDA.FieldByName('CAMPO').AsString) + ','
               + QuotedStr(Xdatovalidado) + ','
               + QuotedStr(DateToStr(xfeccaduca)) + ','
               + QuotedStr(CDSVALIDA.FieldByName('OBJETO').AsString) + ','
               + QuotedStr('S') + ')';
            DM1.DCOM1.AppServer.EjecutaSql(xSQL);
            xsinvalidar := xsinvalidar - 1;
         END;
         CDSVALIDA.Next;
      END;

      pintaCamposValidados(SELF);
      IF xsinvalidar = 0 THEN
         xvalido := 'S'
      ELSE
         xvalido := 'N';
      CDSVALIDA.First;
      WHILE NOT CDSVALIDA.Eof DO
      BEGIN
         CDSVALIDA.Edit;
         CDSVALIDA.FieldByName('FLAG').AsString := '';
         CDSVALIDA.Next;
      END;
      CDSVALIDA.First;
      ActivaPantPrincipal;
      IF DM1.xInsert <> '1' THEN
         BitGrabarClick(SELF)
      ELSE
      BEGIN
         VerificaCamposValidados;
         gbIdentidadAso.Enabled := False;
         gbLaboralAso.Enabled := False;
         pnlRegPension.Enabled := False;
         pnlCodPension.Enabled := False;
      END;
      ActivaPantPrincipal;
   END;
END;

//Carga Imagenes del blob
PROCEDURE TFMantAsociado.CargaImagenes;
BEGIN
   DM1.Jpg := NIL;
   DM1.Stream := NIL;
   DM1.JpgFirma := NIL;
   DM1.StreamFirma := NIL;
   TRY
    //Crear una corriente y cargarle el contenido de un campo Blob
      DM1.Stream := TMemoryStream.Create;
      TBlobField(DM1.cdsParam.FieldByName('FOTO')).SaveToStream(DM1.Stream);
      DM1.StreamFirma := TMemoryStream.Create;
      TBlobField(DM1.cdsParam.FieldByName('FIRMA')).SaveToStream(DM1.StreamFirma);
      IF DM1.Stream.Size > 0 THEN
      BEGIN
      //Crear una imagen JPEG y cargarla desde la corriente
         DM1.Jpg := TJpegImage.Create;
         DM1.Stream.Position := 0;
         DM1.Jpg.LoadFromStream(DM1.Stream);
      END
      ELSE
         DM1.Jpg := NIL;

      IF DM1.StreamFirma.Size > 0 THEN
      BEGIN
      //Crear una imagen JPEG y cargarla desde la corriente
         DM1.jpgFirma := TJpegImage.Create;
         DM1.StreamFirma.Position := 0;
         DM1.jpgFirma.LoadFromStream(DM1.StreamFirma);
      END
      ELSE
         DM1.jpgFirma := NIL;
   EXCEPT
      DM1.Jpg := NIL;
      DM1.jpgFirma := NIL;
   END;
END;


PROCEDURE TFMantAsociado.CargaFicha;
BEGIN
   TRY
      FMantAsociadoDatosReniec := TFMantAsociadoDatosReniec.Create(self);
      FMantAsociadoDatosReniec.ShowModal;
   FINALLY
      FMantAsociadoDatosReniec.Free;
   END;
END;

PROCEDURE TFMantAsociado.btnactceneduClick(Sender: TObject);
BEGIN
   TRY
      FFiltrarColegios := TFFiltrarColegios.create(self);
      FFiltrarColegios.Showmodal;
   FINALLY
      FFiltrarColegios.free;
   END;
   ActualizaColegios;
END;

PROCEDURE TFMantAsociado.ActualizaColegios;
VAR
   xSql: STRING;
BEGIN
   IF Trim(DM1.cdsAso.FieldByName('CENEDUID').AsString) = '' THEN
   BEGIN
      measodeslab.Text := DM1.cdsAso.FieldByName('ASODESLAB').AsString;
      measodirlab.Text := DM1.cdsAso.FieldByName('ASODIRLAB').AsString;
      meturnoce.Text   := DM1.cdsAso.FieldByName('D_COD_TUR').AsString;
      lkcDpto2.Text := Copy(DM1.cdsAso.FieldByName('ASODSTLABID').AsString, 1, 2);
      lkcProv2.Text := Copy(DM1.cdsAso.FieldByName('ASODSTLABID').AsString, 1, 4);
      lkcDist2.Text := DM1.cdsAso.FieldByName('ASODSTLABID').AsString;
   END
   ELSE
   BEGIN
      xSql := 'SELECT codmod, nomcenedu, nivmod, gesdep, codloc, dirregedu, uniges, direc, cenpo, telefono, director, genero, forma, serrec, estado,'
            + 'turno, email, anexo, ubigeo_dir, uproid, upagoid, useid, ceneduid, codurbviv, numetaviv, codtiplug, desmanviv, desintviv, desrefviv,'
            + 'desetaviv, desurbviv, numintviv, numlotviv, nummanviv, numdirviv, nomdirviv, freg, ureg, nivedu_id, codpago, latitud, longitud,'
            + 'ges_dep, d_niv_mod, cod_car, d_cod_car, tipssexo, gestion, d_gestion, pagweb, referencia, localidad, codcp_inei, codccpp, area_sig,'
            + 'd_areasig, d_dpto, d_prov, d_dist, codooii, d_dreugel, lengua, len_etnica, d_crecer, d_juntos, d_vraem, tipoprog, d_tipoprog,'
            + 'd_estado, d_fte_dato, talum_hom, talum_muj, talumno, tdocente, tseccion, cod_tur, d_cod_tur, est_reg '
            + 'FROM ASO_CEN_EDU '
            + 'WHERE CENEDUID = ' + QuotedStr(DM1.cdsAso.FieldByName('CENEDUID').AsString);
      DM1.cdsQry.Close;
      DM1.cdsQry.DataRequest(xSql);
      DM1.cdsQry.Open;
      measodeslab.Text := DM1.cdsQry.FieldByName('NOMCENEDU').AsString;
      measodirlab.Text := DM1.cdsQry.FieldByName('DIREC').AsString;
      meturnoce.Text   := DM1.cdsQry.FieldByName('D_COD_TUR').AsString;
      lkcDpto2.Text := Copy(DM1.cdsQry.FieldByName('UBIGEO_DIR').AsString, 1,
         2);
      lkcProv2.Text := Copy(DM1.cdsQry.FieldByName('UBIGEO_DIR').AsString, 1,
         4);
      lkcDist2.Text := DM1.cdsQry.FieldByName('UBIGEO_DIR').AsString;
   END;
END;

procedure TFMantAsociado.FechaFall;
var
   xSQL : String;
begin
// rutina para determinar la fecha de fallecimiento que ira como label adicional a la
// palabra fallecido
//Inicio MAS_202201_HPC
   xsql:= 'Select B.BENEFDES '
         +'  From DB2ADMIN.PVS301 A, DB2ADMIN.TGE186 B '
         +'  Where A.ASOID = '+quotedstr(DM1.cdsAso.FieldByName('ASOID').AsString)
         +'    And A.PVSESTADO Not In (''04'',''13'') And A.PVSTIPBEN = B.TIPBENEF ';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsql);
   DM1.cdsQry.Open;
   If Trim(Dm1.cdsQry.Fieldbyname('BENEFDES').AsString)='POR FALLECIMIENTO' Then
 //if DM1.cdsAso.FieldByName('TIPO_FALL_ID').AsString='X LIQ.FALL' then
   begin
 //   xSQL := 'select ASOFRESCESE FECHA_FALL '
      {xSQL := 'select ASOFECFAL FECHA_FALL '
             +'from DB2ADMIN.PVS301 '
             +'where ASOID='+quotedstr(DM1.cdsAso.FieldByName('ASOID').AsString)
             +'  and PVSESTADO not in (''13'',''04'') ';}

       xSQL := 'SELECT ASOFECFAL FECHA_FALL FROM APO201 '        //MMUCHA
              +'WHERE ASOID='+quotedstr(DM1.cdsAso.FieldByName('ASOID').AsString)
   end
   else
   begin
     // xSQL := 'select FECFALGES FECHA_FALL from ASO_FAC_GES_DET '
     //        +'where ASOID='+quotedstr(DM1.cdsAso.FieldByName('ASOID').AsString)
     //        +'  and NVL(ESTAPRFAL,''X'')<>''DESESTIMADO'' ';
      {xSql :=' Select A.FECFALGES FECHA_FALL '
            +'  From DB2ADMIN.ASO_FAC_GES_DET A,DB2ADMIN.ASO_FAC_GES_CAB B '
            +'  Where ASOID='+quotedstr(DM1.cdsAso.FieldByName('ASOID').AsString)
            +'    and NVL(ESTAPRFAL,''X'')<>''DESESTIMADO'' '
            +'    and A.IDEGESFAL = B.IDEGESFAL AND PVSTIPBEN=''02'' ';}

       xSQL := 'SELECT ASOFECFAL FECHA_FALL from APO201 '        //MMUCHA
              +'WHERE ASOID='+quotedstr(DM1.cdsAso.FieldByName('ASOID').AsString)
   end;
//Fin MAS_202201_HPC
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSQL);
   DM1.cdsQry.Open;
   if DM1.cdsQry.RecordCount>0 then
   begin
      lblFallecido.Caption := lblFallecido.Caption +chr(13)+ DM1.cdsQry.FieldByName('FECHA_FALL').AsString;
      lblFallecido.Height := 67;
   end;
end;

procedure TFMantAsociado.btnacttelClick(Sender: TObject);
VAR
   xSql: string;
BEGIN
  IF (DM1.sAPO201 = 'ASO_NUE_CLI')  and (dblTipDoc.Text=xTIPDOCCOD)  THEN
  BEGIN
    xSql := 'SELECT ASOID FROM ' + DM1.sAPO201 + ' WHERE ' + DM1.sAso_where + ' ASODNI=' + QuotedStr(dbeLibDni.Text);
    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSql);
    DM1.cdsQry.Open;
    IF DM1.cdsQry.RecordCount <= 0 THEN
    BEGIN
      ShowMessage('Advertencia: Antes de actualizar la dirección debe Capturar los datos de RENIEC');
      Exit;
    END;
  END;

  Try
     FNueManTel := TFNueManTel.Create(Self);
     FNueManTel.ShowModal;
  Finally
     FNueManTel.Free;
  End;
end;

procedure TFMantAsociado.edtCodPensionistaKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key In [' ','°','|','!','"','#','$','%','&','/','(',')','=','?','\','¡','¿','@','¨','´','*','+','~','~','[',']','{','}','^','`','<','>',';',',',':','''','-','_'] Then
     Key :=#0;
end;

//Inicio MAS_201907_HPC
//Se cambió por un formulario unico de la cuenta individual
procedure TFMantAsociado.btnCtaIndividualClick(Sender: TObject);
Var
   xSql: String;
begin
   CreaDM_CtaInd;
  // Inicio: MAS_201901_HPC
  // Mensaje de alerta
   If Length(Trim(DM1.cdsAso.FieldByName('ASOID').AsString))=0 Then
   begin
     ShowMessage('Primero debe Selecionar un Asociado Activo');
     exit;
   end;
  // Fin: MAS_201901_HPC
   xSql := 'SELECT A.*, C.ASOTIPDES, C.ASOTIPABR, B.USENOM FROM APO201 A, APO101 B, APO107 C'
      + ' WHERE A.ASOID = ' + DM1.cdsAso.FieldByName('ASOID').AsString
      + ' AND A.USEID = B.USEID'
      + ' AND A.UPAGOID = B.UPAGOID AND A.UPROID = B.UPROID AND A.ASOTIPID = C.ASOTIPID';
   DMCI.cdsAsociado.Close;
   DMCI.cdsAsociado.DataRequest(xSql);
   DMCI.cdsAsociado.Open;

   xSql := 'SELECT TO_CHAR(SYSDATE, ''YYYYMM'') ANOMESACT FROM DUAL';
   DMCI.cdsQry.Close;
   DMCI.cdsQry.DataRequest(xSql);
   DMCI.cdsQry.Open;
   DMCI.xanomesact := DMCI.cdsQry.FieldByName('ANOMESACT').AsString;

    If (DMCI.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'DO') and
       (DMCI.cdsAsociado.FieldByName('ASOTIPID').AsString <> 'CE') Then
   Begin
      MessageDlg('No es un Asociado Activo', mtInformation, [mbOk], 0);
      Exit;
   End;
   If DMCI.cdsAsociado.FieldByName('ASOTIPID').AsString<>'DO' Then
    Begin
        MessageDlg('OPCIÓN DISPONIBLE SÓLO PARA DOCENTES ACTIVOS !!! ', mtInformation, [mbOK], 0);
        Exit;
    End;
   If DMCI.cdsAsociado.FieldByName('ASOFRESNOM').AsString = '' Then
   Begin
      MessageDlg('Asociado no cuenta con resolución de nombramiento', mtInformation, [mbOk], 0);
      Exit;
   End;
   DMCI.asoresnom := DMCI.cdsAsociado.FieldByName('ASORESNOM').AsString;
   DMCI.asorescese := DMCI.cdsAsociado.FieldByName('ASORESCESE').AsString;
   DMCI.asofresnom := DMCI.cdsAsociado.FieldByName('ASOFRESNOM').AsString;
   DMCI.tipben := '01';
   xSql := 'SELECT MAX(APOSEC) APOSEC FROM APO301 WHERE ASOID = ' + QuotedStr(DMCI.cdsAsociado.FieldByName('ASOID').AsString);
   DMCI.cdsQry.Close;
   DMCI.cdsQry.DataRequest(xSql);
   DMCI.cdsQry.Open;
   if DMCI.cdsQry.FieldByName('APOSEC').AsString = '' then
   begin
     MessageDlg('El docente no tiene aportes', mtInformation, [mbOk], 0);
     Exit;
   end;
   DMCI.anoultapo := Copy(DMCI.cdsQry.FieldByName('APOSEC').AsString, 1, 4);
   DMCI.mesultapo := Copy(DMCI.cdsQry.FieldByName('APOSEC').AsString, 5, 2);
   DMCI.xanomesultapo := DMCI.cdsQry.FieldByName('APOSEC').AsString;
   DMCI.xanomestop := inttostr(StrToInt(DMCI.anoultapo) + 2) + DMCI.mesultapo;

   If DMCI.xanomestop > DMCI.xanomesact Then
      DMCI.asofrescese := '28/' + Copy(DMCI.xanomesact, 5, 2) + '/' + Copy(DMCI.xanomesact, 1, 4)
   Else
      DMCI.asofrescese := '28/' + Copy(DMCI.xanomestop, 5, 2) + '/' + Copy(DMCI.xanomestop, 1, 4);

   If DMCI.asofrescese = '' Then
   Begin
      MessageDlg('Ingrese fecha de resolución de cese para esa opción', mtInformation, [mbOk], 0);
      Exit;
   End;
   If Copy(DMCI.asofrescese, 7, 4) + Copy(DMCI.asofrescese, 4, 2) < '199912' Then
   Begin
      If DMCI.tipben = '' Then
      Begin
         MessageDlg('Ingrese el tipo de beneficio para procesar esta opción', mtInformation, [mbOk], 0);
         Exit;
      End;
   End;
   If (DMCI.tipben = '03') And (Copy(DMCI.asofrescese, 7, 4) < '1997') And (DMCI.cdsAsociado.FieldByName('ASOFECNAC').AsString = '') Then
   Begin
      MessageDlg('Ingrese la fecha de nacimiento del asociado para procesar esta opción', mtInformation, [mbOk], 0);
      Exit;
   End;
   DMCI.xpvslbennr := '';
   DMCI.xSgr := 'R';

   Try
      Fnuerepcueind2 := TFnuerepcueind2.create(Self);
      Fnuerepcueind2.xCODPALI_ORIGEN:= DM1.XCODPALI_ORIGEN;
      Fnuerepcueind2.ShowModal;
   Finally
      Fnuerepcueind2.Free;
   End;
end;
//Final MAS_201907_HPC

procedure TFMantAsociado.BitFonSolClick(Sender: TObject);
Var
   xSQL: String;
Begin
  // Inicio: MAS_201901_HPC
  // Mensaje de alerta 
   If Length(Trim(DM1.cdsAso.FieldByName('ASOID').AsString))=0 Then
   begin
     ShowMessage('Primero debe Selecionar un Asociado Activo');
     exit;
   end;
  // Fin: MAS_201901_HPC
   // Implementación de una ventana con información del FSC
   xSQL := 'SELECT ASOID '
          +' FROM COB_FSC_DEUDA_FSC_CAB '
          +' WHERE ASOID = '+ QuotedStr( DM1.cdsAso.fieldbyname('ASOID').AsString ) + ' AND ID_EST_FSC <> ''13'' ';
   If DM1.CountReg(xSQL) = 0 Then
   BEGIN
      MessageDlg('EL ASOCIADO NO TIENE APLICACIONES DE FSC !!!', mtInformation, [mbOk], 0);
      Exit;
   END;

   Try
      fMstFonSol := TfMstFonSol.Create(Self);
      fMstFonSol.ShowModal;
   Finally
      fMstFonSol.Free;
   End;
End;

procedure TFMantAsociado.BorraFotos;
Var search: TSearchRec;
    nFiles: integer;
begin
   nFiles:=FindFirst('C:\SOLEXES\*.JPG', faAnyFile,  search );
   while nFiles=0 do
   begin
      SysUtils.DeleteFile('C:\SOLEXES\'+ Search.Name);
      nFiles:=FindNext( Search );
   end;
   FindClose(Search);
   nFiles:=FindFirst('C:\SOLEXES\*.TIF', faAnyFile,  search );
   while nFiles=0 do
   begin
      SysUtils.DeleteFile('C:\SOLEXES\'+ Search.Name);
      nFiles:=FindNext( Search );
   end;
   FindClose(Search);
End;
FUNCTION TFMantAsociado.emailValido(CONST Value: String): boolean;
VAR
  i,len: Integer;
  namePart, serverPart: String;
BEGIN // of IsValidEmail
  Result:= False;
  i:= Pos('@', Value);
  IF (i=0) OR (Pos('..',Value) > 0) THEN Exit;
  namePart:= Copy(Value, 1, i - 1);
  serverPart:= Copy(Value,i+1,Length(Value));
  len:=Length(serverPart);
  // must have dot and at least 3 places from end, 2 places from begin
  IF (len<4) OR
     (Pos('.',serverPart)=0) OR
     (serverPart[1]='.') OR
     (serverPart[len]='.') OR
     (serverPart[len-1]='.') THEN Exit;
  Result:= CheckAllowed(namePart) AND CheckAllowed(serverPart);
END;

 FUNCTION TFMantAsociado.CheckAllowed(CONST s: String): boolean;
  VAR i: Integer;
 BEGIN
  Result:= False;
  FOR i:= 1 TO Length(s) DO // illegal char in s -> no valid address
  IF NOT (s[i] IN ['a'..'z','A'..'Z','0'..'9','_','-','.']) THEN Exit;
  Result:= true;
 END;

function TFMantAsociado.Validacionautomatica(xDNi, xAsoid: String): Boolean;
var XSQL: String;
begin
   If DM1.ValidaAutoCtas(xAsoid) Then
   Begin
      DM1.cdsCamposValida.First;
      While NOT DM1.cdsCamposValida.Eof do
      Begin
      If DM1.cdsCamposValida.FieldByName('GRUPO').AsString = 'C'  then  //Los campos de cuentas estan marcados GRUPO='S'
      Begin
        GrabaValidacion;
      End;
      DM1.cdsCamposValida.Next;
      End;
   End;

   //Valida automaticamente  los campos de DATOS PERSONALES DEL ASOCIADO, SEGUN  DNI CADUCO
   If DM1.VerDNICaduco(xDNi)= 'NO CADUCO' Then
   Begin
      DM1.cdsCamposValida.First;
      While NOT DM1.cdsCamposValida.Eof do
      Begin
      If DM1.cdsCamposValida.FieldByName('GRUPO').AsString = 'D' then  //Los campos de cuentas estan marcados GRUPO='D'
      Begin
        //Sí actualiza de RENIEC VALIDA AUTOMATICAMENTE los DATOS GENERALES del ASOCIADO
        If xActRENIEC='S' Then
        Begin
           //Se desmarca el campo validado
           If CDSVALIDA.Locate('CAMPO',DM1.cdsCamposValida.FieldByName('CAMPO').AsString,[]) Then
           Begin
              CDSVALIDA.Edit;
              CDSVALIDA.FieldByName('VALIDADO').AsString := '';
           End;
        End;

        GrabaValidacion;
      End;
      DM1.cdsCamposValida.Next;
      End;
   End;

   xSQL:='SELECT asoid, fecval, usuval, equusu, ofiusu, campo, feccad, datval, objeto, status, usudesval, fecdesval, obsdesval '
        +'FROM VAL_DAT_ASO WHERE ASOID='''+DM1.cdsAso.FieldByName('ASOID').AsString + ''' AND STATUS=''S''';
   DM1.cdsVAL_DAT_ASO.Close;
   DM1.cdsVAL_DAT_ASO.DataRequest(XSQL);
   DM1.cdsVAL_DAT_ASO.Open;

   // xActRENIEC:='N';

end;

procedure TFMantAsociado.GrabaValidacion;
var  xfeccaduca: tdate;
  Xsql, Xdatovalidado: string;
begin

    If CDSVALIDA.Locate('CAMPO',DM1.cdsCamposValida.FieldByName('CAMPO').AsString,[]) Then
    Begin
     If  Length(Trim(CDSVALIDA.FieldByName('VALIDADO').AsString))=0 Then
     Begin
       //Desativo el datos anterior
        XSQL := 'UPDATE VAL_DAT_ASO SET STATUS = '''' WHERE ASOID = '''+DM1.cdsAso.FieldByName('ASOID').AsString+''' AND' +
               ' CAMPO = ''' + DM1.cdsCamposValida.FieldByName('CAMPO').AsString + '''';
        DM1.DCOM1.AppServer.EjecutaSql(xSQL);

      //Inserto El nuevo Datos Validados
        xfeccaduca    := dm1.FechaSys+DM1.cdsCamposValida.FieldByName('TIEMPO').AsInteger;
        Xdatovalidado := DM1.cdsAso.FieldByName(DM1.cdsCamposValida.FieldByName('CAMPO').AsString).Asstring ;
        XSQL := 'INSERT INTO VAL_DAT_ASO (ASOID,FECVAL,USUVAL,EQUUSU,OFIUSU,CAMPO,DATVAL,FECCAD,OBJETO,STATUS) VALUES ('+
        QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+',SYSDATE,'+
        QuotedStr(DM1.wUsuario)+','+
        QuotedStr(DM1.wcomputadora)+','+
        QuotedStr(DM1.wofides)+','+
        QuotedStr(DM1.cdsCamposValida.FieldByName('CAMPO').AsString)+','+
        QuotedStr(Xdatovalidado)+','+
        QuotedStr(DateToStr(xfeccaduca))+','+
        QuotedStr(DM1.cdsCamposValida.FieldByName('OBJETO').AsString)+','+
        QuotedStr('S')+')';
        DM1.DCOM1.AppServer.EjecutaSql(xSQL);
        CDSVALIDA.Edit;
        CDSVALIDA.FieldByName('VALIDADO').AsString:='1';
     end;
   End;
end;

procedure TFMantAsociado.dbeCodPagExit(Sender: TObject);
begin
   If Copy(Trim(dbeCodPag.Text),1,2) <> Trim(DbLUses.Text) Then
   Begin
      MessageDlg('Los 2 primeros caracteres del código de pago debe ser igual al código de ugel.', mtInformation, [mbOk], 0);
      DM1.cdsAso.FieldByName('ASOCODPAGO').AsString := '';
      Exit;
   End;
end;

(******************************************************************************)
// MUESTRA MENSAJE DE HOJA DE CARGO DE EXPEDIENTE
procedure TFMantAsociado.fn_muestra_msj_hoja_cargo_exp(psAsoid : string);
var xsSql : string;
begin
    xsSql := ' SELECT A.FECHA_HORA, NVL(B.USERNOM, A.USUARIO) USUARIO FROM ('
    +' SELECT A.FECREGIMP FECHA_HORA, A.USUIMP USUARIO, DENSE_RANK() OVER(PARTITION BY A.CODCAREXP ORDER BY B.NUMIMP DESC) DNRK'
    +' FROM PRE_CARGO_EXPEDIENTE_MOV A, PRE_CARGO_EXPEDIENTE_IMP_MAE B'
    +' WHERE A.ASOID = '+QuotedStr(psAsoid)+' AND A.CODCAREXPEST = ''PENDIENTE'' AND A.CODCAREXP = B.CODCAREXP'
    +' ) A, TGE006 B WHERE A.USUARIO = B.USERID AND A.DNRK = 1';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsSql);
   DM1.cdsQry.Open;
   if DM1.cdsQry.RecordCount >= 1 then begin
      bgHojaCargoExp.Visible := true;
      lblHojaCargoExpFecha.Caption := 'FECHA : ' + DM1.cdsQry.fieldbyname('FECHA_HORA').AsString;
      lblHojaCargoExpUsuario.Caption := 'USR : ' + DM1.cdsQry.fieldbyname('USUARIO').AsString;
   end else begin
      bgHojaCargoExp.Visible := false;
   end;
end;



// Inicio: MAS_201901_HPC
// Se modifica el proceso de grabación de la hoja de cargo
(******************************************************************************)
// CREA LA HOJA DE CARGO DE EXPEDIENTE
procedure TFMantAsociado.btnHojaCargoExpedienteClick(Sender: TObject);
VAR xSql, xsSql : String;
begin
   If Length(Trim(DM1.cdsAso.FieldByName('ASOID').AsString))=0 Then
   begin
     ShowMessage('Primero debe Selecionar un Asociado Activo');
     exit;
   end;
   xsSql := 'SELECT MAX(CODCAREXP) CODCAREXP, MAX(PVSTIPBEN) PVSTIPBEN  FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV A, APO201 B'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND B.ASOTIPID IN (''DO'',''CE'') AND A.CODCAREXPEST = ''PENDIENTE'''
   +' AND A.ASOID = B.ASOID';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsSql);
   DM1.cdsQry.Open;
   xcodcargo := DM1.cdsQry.FieldByName('CODCAREXP').AsString;
   If ((Trim(DM1.cdsQry.FieldByName('CODCAREXP').AsString) <> '') And (Trim(DM1.cdsQry.FieldByName('PVSTIPBEN').AsString) = ''))
   Or (Trim(DM1.cdsQry.FieldByName('CODCAREXP').AsString) = '') Then
   Begin
      MessageDlg('No existe un registro de la hoja de cargo en la base de datos!', mtInformation, [mbOk], 0);
      If MessageDlg('¿Desea generar una hoja de cargo?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
      Begin
         Try
            Facttipbenhojcargo := TFacttipbenhojcargo.create(self);
            Facttipbenhojcargo.Showmodal;
         Finally
            Facttipbenhojcargo.free;
         End;
      End;
   End;
   xsSql := 'SELECT MAX(CODCAREXP) CODCAREXP, MAX(PVSTIPBEN) PVSTIPBEN  FROM DB2ADMIN.PRE_CARGO_EXPEDIENTE_MOV A, APO201 B'
   +' WHERE A.ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+' AND B.ASOTIPID IN (''DO'',''CE'') AND A.CODCAREXPEST = ''PENDIENTE'''
   +' AND A.ASOID = B.ASOID';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xsSql);
   DM1.cdsQry.Open;
   xcodcargo := DM1.cdsQry.FieldByName('CODCAREXP').AsString;
   If (Trim(DM1.cdsQry.FieldByName('CODCAREXP').AsString) <> '') And (Trim(DM1.cdsQry.FieldByName('PVSTIPBEN').AsString) <> '') Then
   Begin
      grabaimp_hojacargo;
      imprimehojacargo;
   End;
   fn_muestra_msj_hoja_cargo_exp(DM1.cdsAso.FieldByName('ASOID').AsString);
end;

procedure TFMantAsociado.dblcdCodPrestacionExit(Sender: TObject);
begin
   If trim(dblcdCodPrestacion.Text) = '' Then
   Begin
      edtdesprestacion.Text := '';
      Exit;
   End;
   edtdesprestacion.Text := DM1.DevuelveValor('ASO_COD_PRE_MAE', 'DESPRE', 'CODPRE', dblcdCodPrestacion.Text);
   If Trim(edtdesprestacion.Text) = '' Then
   Begin
     MessageDlg('Código de prestación no valido.', mtError, [mbOk], 0);
     dblcdCodPrestacion.Text := '';
     edtdesprestacion.Text := '';
     dblcdCodPrestacion.SetFocus;
     Exit;
   End;
end;

procedure TFMantAsociado.dblcdCodLeyPenExit(Sender: TObject);
begin
   If trim(dblcdCodLeyPen.Text) = '' Then
   Begin
      edtCodLeyPen.Text := '';
      Exit;
   End;
   edtCodLeyPen.Text := DM1.DevuelveValor('ASO_LEY_PEN_MAE', 'DESLEYPEN', 'CODLEYPEN', dblcdCodLeyPen.Text);
   If Trim(edtCodLeyPen.Text) = '' Then
   Begin
     MessageDlg('Código de ley de pensión no valido.', mtError, [mbOk], 0);
     dblcdCodLeyPen.Text := '';
     edtCodLeyPen.Text := '';
     dblcdCodLeyPen.SetFocus;
     Exit;
   End;
End;

//Se implementa el tipo de documento
Function TFMantAsociado.estadocivil(xestado: String): String;
begin
  If DbLlSexo.Text='M' Then
     Dm1.cdsUSES.Locate('ESTCIVDES',xestado,[]);
  If DbLlSexo.Text='F' Then
     Dm1.cdsUSES.Locate('ESTCIVDESFEM',xestado,[]);
  Result := Dm1.cdsUSES.Fieldbyname('ESTCIVID').AsString;
end;

//Se implementa el tipo de documento
procedure TFMantAsociado.editaRENIEC;
begin
  If dblTipDoc.Text=xTIPDOCCOD Then
  Begin
     pnlRENIEC1.Enabled  := False;
     PnlRENIEC1B.Enabled := False;
     pnlRENIEC2.Enabled  := False;
     pnlRENIEC3.Enabled  := False;
     pnlRENIEC4.Enabled  := False;
     pnlRENIEC5.Enabled  := False;
  End
  Else
  Begin
     pnlRENIEC1.Enabled  := True;
     PnlRENIEC1B.Enabled := True;
     pnlRENIEC2.Enabled  := True;
     pnlRENIEC3.Enabled  := True;
     pnlRENIEC4.Enabled  := True;
     pnlRENIEC5.Enabled  := True;
  End
end;

//Se implementa el tipo de documento
procedure TFMantAsociado.dblTipDocChange(Sender: TObject);
Var xSql:String;
begin

   If dblTipDoc.Text = '04' Then
   Begin
      xsql := 'SELECT campo, descripcion, flag, objeto, tiempo, tieale, valper, valrec, grupo FROM CAMPOS_VALIDA WHERE CAMPO <> ''ASODNI''';
      lblapepatdni.Caption := 'Apellido Paterno (CE)';
      lblapematdni.Caption := 'Apellido Materno (CE)';
      lblapecasdni.Caption := 'Apellido de Casada (CE)';
      lblnomdni.Caption    := 'Nombres (CE)';
      lblestciv.Caption    := 'E.Civil (CE)';
      lbleticarext.Visible := True;
      pnlRENIEC5.Visible := True;
      edtnumdoc.MaxLength := 9;
   End
   Else
   Begin
      xsql := 'SELECT campo, descripcion, flag, objeto, tiempo, tieale, valper, valrec, grupo FROM CAMPOS_VALIDA WHERE CAMPO <> ''ASODOCNUM''';
      lblapepatdni.Caption := 'Apellido Paterno (DNI)';
      lblapematdni.Caption := 'Apellido Materno (DNI)';
      lblapecasdni.Caption := 'Apellido de Casada (DNI)';
      lblnomdni.Caption    := 'Nombres (DNI)';
      lblestciv.Caption    := 'E.Civil (DNI)';
      lbleticarext.Visible := False;
      pnlRENIEC5.Visible := False;
      dbeLibDni.MaxLength := 8;
   End;

   DM1.cdsCamposValida.Close;
   DM1.cdsCamposValida.DataRequest(xSQL);
   DM1.cdsCamposValida.Open;
   DM1.cdsCamposValida.IndexFieldNames := 'CAMPO';

   If DM1.cdsCbcos.Locate('TIPDOCCOD',dblTipDoc.Text,[]) Then
      edtTipDoc.Text := Dm1.cdsCbcos.Fieldbyname('TIPDOCABR').AsString
   Else edtTipDoc.Text := '';
   dbeLibDni.MaxLength:= Dm1.cdsCbcos.Fieldbyname('LONCAM').AsInteger;
   edtnumdoc.MaxLength:= Dm1.cdsCbcos.Fieldbyname('LONCAM').AsInteger;
   If (Dm1.cdsCbcos.Fieldbyname('FLGDNI').AsString='S') or  (Length(Trim(dblTipDoc.Text))=0) Then
   Begin
      edtnumdoc.Text         := DM1.cdsAso.fieldbyname('ASODOCNUM').AsString;
      pnlRENIEC1.Enabled     := False;
      PnlRENIEC1B.Enabled    := False;
      pnlRENIEC2.Enabled     := False;
      pnlRENIEC3.Enabled     := False;
      edtnumdoc.Visible      := False;
      dbeLibDni.Visible      := True;
      dblEstadoCivil.Visible := False;
      edtEstadoCivil.Visible := True;
      pnlRENIEC4.Enabled     := False;
      pnlRENIEC5.Enabled     := False;
   End
   Else
   Begin
      dbeLibDni.Text         := DM1.cdsAso.fieldbyname('ASODNI').AsString;;
      edtnumdoc.Visible      := True;
      dbeLibDni.Visible      := False;
      dblEstadoCivil.Visible := True;
      edtEstadoCivil.Visible := False;
      pnlRENIEC1.Enabled     := False;
      PnlRENIEC1B.Enabled    := False;
      pnlRENIEC2.Enabled     := False;
      pnlRENIEC3.Enabled     := False;
      pnlRENIEC4.Enabled     := False;
      pnlRENIEC5.Enabled     := False;
      If (DM1.xCnd <> 'AUT') and (DM1.sAPO201 <> 'APO201') Then
      Begin
         pnlRENIEC1.Enabled     := True;
         PnlRENIEC1B.Enabled    := True;
         pnlRENIEC2.Enabled     := True;
         pnlRENIEC3.Enabled     := True;
         pnlRENIEC4.Enabled     := True;
         pnlRENIEC5.Enabled     := True;
      End
      Else
      Begin
         edtnumdoc.Enabled := False;
         dblEstadoCivil.Enabled := False;
      End;
   End;
   If  (DM1.xInsert  <> '1') And (Copy(DM1.CrgArea(DM1.wUsuario), 8, 2) <> 'N3') Then
   Begin
      dblTipDoc.Enabled := False;
      edtnumdoc.Enabled := False;
   End
   Else
   Begin
      If (dblTipDoc.Text <> '10') Then
      Begin
         dblEstadoCivil.Visible := True;
         pnlRENIEC4.Enabled := True;
         dblEstadoCivil.Enabled := True;
         edtEstadoCivil.Visible := False;
         If DM1.xInsert = '1' Then edtnumdoc.Enabled := True
         Else edtnumdoc.Enabled := False;
      End
      Else
      Begin
         dblEstadoCivil.Visible := False;
         edtEstadoCivil.Visible := True;
      End;
   End;


   If dblTipDoc.Text = '10' Then
   Begin
      edtnumdoc.MaxLength := 8;
      bitImpReniec.Caption := 'Información RENIEC';
      btnActualizaReniec.Caption := 'Captura Datos de RENIEC';
   End;

   If dblTipDoc.Text = '04' Then
   Begin
      edtnumdoc.MaxLength := 9;
      bitImpReniec.Caption := 'INFOR. CARNET EXT.';
      btnActualizaReniec.Caption := 'Carga carnet de Extranjería';
   End;


End;

function TFMantAsociado.GrabaApo201NO_DNI: Boolean;
Var xAsoApeNomDni:String;
    xsql, xAsoDni, xAsoid, xSolicitud,xestcivid: String;
begin
   xestcivid:=estadocivil(dblEstadoCivil.Text);
   If dm1.xInsert = '1' Then
   Begin
   //Si aun no tiene asignado un código de solicitud
      If DM1.cdsAso.fieldbyname('SOLICITUD').AsString = '' Then
      Begin
      //Valida que el dni no haya sido ingresado en una solicitud anterior
         If validaAsoDniNuevo(dbeLibDni.Text) Then
         Begin
            MessageDlg('DNI Ya Existe, Solicitud fue creada', mtError, [mbOk], 0);
            self.Close;
            exit;
         End;
         //Pide confirmación final al usuario
         If MessageDlg('¿Está seguro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Begin
            self.Close;
            exit;
         End;
         xSolicitud := AsignaSolicitud;
         xAsoid := AsignaAsoId;
         xSQL := 'INSERT INTO ' + DM1.sAPO201 + ' (SOLICITUD, ASOID, ASODNI, EST_AUT_CLI,ASODOCNUM,TIPDOCCOD)'
            + ' VALUES (''' + xSolicitud + ''', ''' + xAsoid + ''', ''' + trim(dbeLibDni.Text) + ''', ''NU'','''+Trim(edtnumdoc.Text)+''','''+dblTipDoc.Text+''')';
         dm1.cdsQry2.Close;
         dm1.cdsQry2.DataRequest(xSQL);
         dm1.cdsQry2.Execute;
      End;
   End;

   xAsoApeNomDni := '';
   If Trim(EdtApePatDni.Text) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(EdtApePatDni.Text)+ ' ';
   If Trim(EdtApeMatDni.Text) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(EdtApeMatDni.Text)+ ' ';
   If Trim(EdtApeCasDni.Text) <> '' Then xAsoApeNomDni := xAsoApeNomDni + Trim(EdtApeCasDni.Text)+ ' ';

   xAsoApeNomDni := xAsoApeNomDni + Trim(EdtAsoNomDni.Text);

   XSQL := 'UPDATE ' + DM1.sAPO201 + ' SET ' +
      '      ASOAPENOM   =' + QuotedStr(xAsoApeNomDni) + ',' +
      '      ASOAPEPAT   =' + QuotedStr(EdtApePatDni.Text) + ',' +
      '      ASOAPEMAT   =' + QuotedStr(EdtApeMatDni.Text) + ',' +
      '      ASOAPECASDNI =' + QuotedStr(EdtApeCasDni.Text) + ',' +
      '      ASONOMBRES  =' + QuotedStr(EdtAsoNomDni.Text) + ',' +
      '      ASOAPENOMDNI=' + QuotedStr(xAsoApeNomDni) + ',' +
      '      ASODPTO     =' + QuotedStr(trim(lkcDpto.Text)) + ',' +
      '      CIUDID      =' + QuotedStr(trim(lkcProv.Text)) + ',' +
      '      ZIPID       =' + QuotedStr(trim(lkcDist.Text)) + ',' +
      '      ASODIR      =' + QuotedStr(Copy(Trim(dbeDirec.Text), 1, 250)) + ',' +
      '      ASOAPEPATDNI=' + QuotedStr(EdtApePatDni.Text) + ',' +
      '      ASOAPEMATDNI=' + QuotedStr(EdtApeMatDni.Text) + ',' +
      '      ASONOMDNI   =' + QuotedStr(EdtAsoNomDni.Text) + ',' +
      '      ASODNI      =' + QuotedStr(dbeLibDni.Text) + ',' +
      '      ASODOCNUM   =' + QuotedStr(edtnumdoc.Text) + ',' +
      '      ASOFECNAC   =' + QuotedStr(dbdtFecNac.Text) + ',' +
      '      FECCADCAREXT=' + QuotedStr(dbdtFecExpCarExt.Text) + ',' +
      '      ESTCIVID    =' + QuotedStr(xestcivid) + ',' +
      '      ASOSEXO     =' + QuotedStr(DbLlSexo.Text) + ',' +
      '      ASOCODMOD   =' + QuotedStr(EdtCodMod.Text) + ',' +
      '      ASOTIPID    =' + QuotedStr(DbLlTipAso.Text) + ',' +
      '      REGPENID    =' + QuotedStr(DbLlRegPen.Text) + ',' +
      '      CODAFP      =' + QuotedStr(DbLlAfp.Text) + ',' +
      '      UPROID      =' + QuotedStr(DbLUniPro.Text) + ',' +
      '      UPAGOID     =' + QuotedStr(DbLUniPag.Text) + ',' +
      '      USEID       =' + QuotedStr(DbLUses.Text) + ',' +
      '      ASORESNOM   =' + QuotedStr(dbeNroRes.Text) + ',' +
      '      ASOFRESNOM  =' + QuotedStr(DBDTResNom.Text) + ',' +
      '      ASORESCESE  =' + QuotedStr(dbeNroCes.Text) + ',' +
      '      ASOFRESCESE =' + QuotedStr(DBDTResCes.Text) + ',' +
      '      ASOCODPAGO  =' + QuotedStr(dbeCodPag.Text) + ',' +
      '      ASONCTA     =' + QuotedStr(dbeCuenta.Text) + ',' +
      '      SITCTA      =' + QuotedStr(dbeSitCta.Text) + ',' +
      '      ASODESLAB   =' + QuotedStr(measodeslab.Text) + ',' +
      '      ASODIRLAB   =' + QuotedStr(measodirlab.Text) + ',' +
      // MAS_202308: Se actualiza columna de código de turno 
      '      D_COD_TUR   =' + QuotedStr(meturnoce.Text) + ',' +
      '      ASODPTLABID =' + QuotedStr(trim(lkcDpto2.Text)) + ',' +
      '      ASOPRVLABID =' + QuotedStr(trim(lkcProv2.Text)) + ',' +
      '      ASODSTLABID =' + QuotedStr(trim(lkcDist2.Text)) + ',' +
      '      CENEDUID    =' + QuotedStr(trim(dbeCenEduId.Text)) + ',' +
      '      USUARIO     =' + QuotedStr(DM1.wUsuario) + ',' +
      '      FREG        =' + QuotedStr(DateToStr(DM1.FechaSys)) + ',' +
      '      HREG        =    SYSDATE,' +
      '      ACTARCREN   =' + QuotedStr('N') +
      ' WHERE ASOID= ' + QuotedStr(xAsoid);

      Try
          DM1.DCOM1.AppServer.EjecutaSql(xSQL);
      Except
          ShowMessage('Error al Actualizar el Maestro de Asociados');
          Exit;
      End;

   xSQL := 'SELECT solicitud, asoid, asocodmod, asocodaux, asocodpago, asoapepat, asoapemat, asonombres, asoapenom, useid, uproid, upagoid,'+
           '       asoresnom, asofresnom, resid, regpenid, asositid, asofact, asotipid, viaid, vianombre, asonumdir, asofdpto, asodpto,'+
           '       zonaid, zonanomb, ubigeoid, dptoid, paisid, refdom, asofecnac, asotelf1, asotelf2, tipdoccod, asodocnum, asolibmil,'+
           '       asoruc, estcivid, asosexo, asoemail, bancoid, asoncta, sitcta, asodni, graacid, grainsid, profid, asofmov, asofluging,'+
           '       asodir, usuario, hreg, freg, asolugest, fecterest, tiempoest, asolnacid, asorescese, asofrescese, fgarante, zipid, ciudid,'+
           '       archivoftp, ciaid, flagvar, asoapncre, flgfsol, estclf, observa, usr_crea, fec_crea, usr_ben, fec_ben, ctaser, cargo, variascuot,'+
           '       crencuota, nfusion, idimage, fsinliq, asodescol, asodircol, asozipcol, asoapepatdni, asoapematdni, asonomdni, asoapenomdni, asodeslab,'+
           '       asodirlab, asodptlabid, asoprvlabid, asodstlabid, asotellab, dptnacid, prvnacid, dstnacid, vialabid, zonalabid, fecact, indicador,'+
           '       ccosid, password, codafp, deshabilitado, valida_ci, tcreacion, regverif, codmodant, valcodmoddni, actarcrenant, actarcren, reingreso,'+
           '       autdesapo, fecautdesapo, usuregautdesapo, ofiregautdesapo, codmodautdesapo, codarchivo, gencodbar, envautdes, corenvautdes, codtiplug,'+
           '       numdirviv, nummanviv, numlotviv, desintviv, desrefviv, codurbviv, desurbviv, numetaviv, desetaviv, numintviv, nomdirviv, anoenv, envio,'+
           '       codotrdocide, numotrdocide, codmotdestapo, autdescuo, fecautdescuo, usuregautdescuo, ofiregautdescuo, codmodautdescuo, mdfasodir, mdfzipid,'+
           '       mdfcntreg, mdfusrmod, mdffecmod, emicarta, desmanviv, codmotdestcuo, fecactpad, est_aut_cli, usu_aut_cli, fec_aut_cli, obs_aut_cli, usu_cre_cli,'+
           '       fec_cre_cli, obs_aut_cli_uge, obs_aut_cli_pad, obs_aut_cli_otr, ceneduid, fallecido, tipo_fall_id, codtiptel1, codreftel1, codtiptel2, codreftel2,'+
           '       codpension, fecregautdesapo, codleypen, codblocharen, numblocharen, coddepintren, desdepintren, asoapecasdni, asoaptser, fecactsit, codciutelfij1,'+
           '       codciutelfij2, fecreccadaps, usureccadaps, codmotautcadaps, codpre, nvl(validaaporte,''S'') validaaporte, '+
            '      CORREO_CONTACTO_DIGITAL,FUENTE_CORREO_CONT_DIGITAL,CELULAR_CONTACTO_DIGITAL,FUENTE_CELULAR_CONT_DIGITAL, AUTDESAPOFORMATO, FECCADCAREXT'+
           ' FROM ' + DM1.sAPO201 + ' WHERE SOLICITUD = ''' + xSolicitud + ''' AND ASOID = ' + QuotedStr(Trim(xAsoid));
   DM1.sAso_where := 'SOLICITUD = ''' + xSolicitud + ''' AND ';
   DM1.cdsAso.Close;
   DM1.cdsAso.DataRequest(xSQL);
   DM1.cdsAso.Open;
   xAsoId := DM1.cdsAso.fieldbyname('ASOID').AsString;
   result := true;

end;

procedure TFMantAsociado.edtnumdoc1KeyPress(Sender: TObject; var Key: Char);
begin
   If Key In [' ','°', '|', '!', '"', '#', '$', '%', '&', '/', '(', ')', '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '~', '[', ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''', '-', '_',chr(39)] Then
      Key := #0;
end;

function TFMantAsociado.validaNumerodoc(xnumerodoc: String): Boolean;
VAR
   xsql: STRING;
BEGIN
   XSQL := 'SELECT ''1'' FROM ASO_NUE_CLI WHERE TIPDOCCOD='+QuotedStr(dblTipDoc.Text) + ' and ASODOCNUM='+QuotedStr(xnumerodoc) +
           ' UNION ALL '+
           'SELECT ''1'' FROM APO201 WHERE TIPDOCCOD='+QuotedStr(dblTipDoc.Text) + ' and ASODOCNUM='+QuotedStr(edtnumdoc.Text);
   DM1.cdsMGrupo.Close;
   DM1.cdsMGrupo.DataRequest(XSQL);
   DM1.cdsMGrupo.Open;

   IF DM1.cdsMGrupo.RecordCount > 0 THEN
      Result := True
   ELSE
      Result := False;
   DM1.cdsMGrupo.Close;
   DM1.cdsMGrupo.IndexFieldNames := '';
end;

procedure TFMantAsociado.edtnumdoc1Exit(Sender: TObject);
begin
   IF (dm1.xInsert='1') AND (Length(trim(edtnumdoc.Text))<>0) AND (dblTipDoc.Text<>xTIPDOCCOD) THEN
   Begin
      If validaNumerodoc(Trim(edtnumdoc.Text)) Then
      BEGIN
         MessageDlg('Número de documento Ya Existe, verifique', mtError, [mbOk], 0);
         edtnumdoc.Color := $00E8FFFF;
         edtnumdoc.SetFocus;
         Exit;
      END;
   End;
end;

procedure TFMantAsociado.btnAsignarRegaloClick(Sender: TObject);
begin
    FMantRegalo:=TFMantRegalo.Create(Self);
    FMantRegalo.sOficinaId :=  DM1.xOfiDes;
    FMantRegalo.sUserReg :=  DM1.wUsuario;
    FMantRegalo.sAsociadoId :=  DM1.cdsAso.fieldbyname('ASOID').AsString;
    FMantRegalo.ShowModal;
    FMantRegalo.Free;
end;

procedure TFMantAsociado.ValidarAsignarRegalo;
var
    xSQL: STRING;
begin
//Inicio MAS_201901_HPC
//Cambio de regla de activación de botón de obsequio ed PANETON
   {xSQL := 'SELECT COUNT(1) cuenta ' +
            ' FROM APO301 ' +
            ' WHERE ASOID =' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) +
            ' AND   TRANSANO||TRANSMES>=TO_CHAR(ADD_MONTHS(SYSDATE,-3),''YYYYMM'')' +
            ' AND   TRANSANO||TRANSMES<=TO_CHAR(ADD_MONTHS(SYSDATE,-1),''YYYYMM'')' +
            ' UNION ' +
            ' SELECT COUNT(1) cuenta ' +
            ' FROM   ASO_NUE_CLI A ' +
            ' WHERE  A.ASOID = ' + QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString) +
            ' AND    TO_CHAR(FREG,''YYYYMM'')=TO_CHAR(SYSDATE,''YYYYMM'') ' +
            ' AND    ASOTIPID=''VO'' '+
            ' AND    EST_AUT_CLI=''AP'' '+
            ' AND    (SELECT COUNT(B.ASOID) ' +
            '         FROM  APO201 B ' +
            '         WHERE B.ASOID=A.ASOID ' +
            '         AND   B.ASOTIPID=''DO'' ' +
            '         AND   NVL(B.AUTDESAPO,''N'')=''S'' )=1 ';

    xSQL := ' SELECT SUM(D.cuenta) CUENTA  FROM ( ' + xSQL + ' ) D ';}

   xSql := 'SELECT SF_ASO_VAL_ASO_REGALO('''+DM1.cdsAso.FieldByName('ASOID').AsString+''') CUENTA FROM DUAL ';
//Fin MAS_201901_HPC
    DM1.cdsQryRegalo.Close;
    DM1.cdsQryRegalo.DataRequest( xSQL );
    DM1.cdsQryRegalo.Open;

    btnAsignarRegalo.Enabled := False;

   If (DM1.cdsQryRegalo.FieldByName('CUENTA').AsInteger > 0 ) Then
        btnAsignarRegalo.Enabled := True;
end;

procedure TFMantAsociado.Apo201_NueCLi;
begin
   If  DM1.sAPO201 = 'APO201' Then
      DM1.xSelect := 'asoid, asocodmod, asocodaux, asocodpago, asoapepat, asoapemat, asonombres, asoapenom, useid, uproid, upagoid,'
      +' asoresnom, asofresnom, resid, regpenid, asositid, asofact, asotipid, viaid, vianombre, asonumdir, asofdpto,'
      +' asodpto, zonaid, zonanomb, ubigeoid, dptoid, paisid, refdom, asofecnac, asotelf1, asotelf2, tipdoccod, asodocnum,'
      +' asolibmil, asoruc, estcivid, asosexo, asoemail, bancoid, asoncta, sitcta, asodni, graacid, grainsid, profid, asofmov,'
      +' asofluging, asodir, usuario, hreg, freg, asolugest, fecterest, tiempoest, asolnacid, asorescese, asofrescese, fgarante,'
      +' zipid, ciudid, archivoftp, ciaid, flagvar, asoapncre, flgfsol, estclf, observa, usr_crea, fec_crea, usr_ben, fec_ben,'
      +' ctaser, cargo, variascuot, crencuota, nfusion, idimage, fsinliq, asodescol, asodircol, asozipcol, asoapepatdni,'
      +' asoapematdni, asonomdni, asoapenomdni, asodeslab, asodirlab, asodptlabid, asoprvlabid, asodstlabid, asotellab,'
      +' dptnacid, prvnacid, dstnacid, vialabid, zonalabid, fecact, indicador, ccosid, password, codafp, deshabilitado,'
      +' valida_ci, tcreacion, regverif, codmodant, valcodmoddni, actarcrenant, actarcren, reingreso, autdesapo, fecautdesapo,'
      +' usuregautdesapo, ofiregautdesapo, codmodautdesapo, codarchivo, gencodbar, envautdes, corenvautdes, codtiplug, numdirviv,'
      +' nummanviv, numlotviv, desintviv, desrefviv, codurbviv, desurbviv, numetaviv, desetaviv, numintviv, nomdirviv, anoenv,'
      +' envio, codotrdocide, numotrdocide, codmotdestapo, autdescuo, fecautdescuo, usuregautdescuo, ofiregautdescuo, codmodautdescuo,'
      +' mdfasodir, mdfzipid, mdfcntreg, mdfusrmod, mdffecmod, emicarta, desmanviv, codmotdestcuo, fecactpad, ceneduid, fallecido,'
      +' tipo_fall_id, en_actualiz, codtiptel1, codreftel1, codtiptel2, codreftel2, codpension, fecregautdesapo, codleypen, numautonp,'
      +' codblocharen, numblocharen, coddepintren, desdepintren, asoapecasdni, invalidez, tipo_inva_id, fecautonp, asoaptser, fecactsit,'
      +' codreglab, usuautonp, oriopeonp, codciutelfij1, codciutelfij2, fecreccadaps, usureccadaps, codmotautcadaps, codpre, asocci,'
      +' latitud_dir, longitud_dir, nvl(validaaporte,''S'') validaaporte,'
      +' CORREO_CONTACTO_DIGITAL,FUENTE_CORREO_CONT_DIGITAL,CELULAR_CONTACTO_DIGITAL,FUENTE_CELULAR_CONT_DIGITAL, AUTDESAPOFORMATO, D_COD_TUR, FECCADCAREXT';
   If DM1.sAPO201 = 'ASO_NUE_CLI' Then
      DM1.xSelect :=
           'solicitud, asoid, asocodmod, asocodaux, asocodpago, asoapepat, asoapemat, asonombres, asoapenom, useid, uproid,'+
           'upagoid, asoresnom, asofresnom, resid, regpenid, asositid, asofact, asotipid, viaid, vianombre, asonumdir, asofdpto,'+
           'asodpto, zonaid, zonanomb, ubigeoid, dptoid, paisid, refdom, asofecnac, asotelf1, asotelf2, tipdoccod, asodocnum,'+
           'asolibmil, asoruc, estcivid, asosexo, asoemail, bancoid, asoncta, sitcta, asodni, graacid, grainsid, profid, asofmov,'+
           'asofluging, asodir, usuario, hreg, freg, asolugest, fecterest, tiempoest, asolnacid, asorescese, asofrescese, fgarante,'+
           'zipid, ciudid, archivoftp, ciaid, flagvar, asoapncre, flgfsol, estclf, observa, usr_crea, fec_crea, usr_ben, fec_ben, ctaser,'+
           'cargo, variascuot, crencuota, nfusion, idimage, fsinliq, asodescol, asodircol, asozipcol, asoapepatdni, asoapematdni, asonomdni,'+
           'asoapenomdni, asodeslab, asodirlab, asodptlabid, asoprvlabid, asodstlabid, asotellab, dptnacid, prvnacid, dstnacid, vialabid,'+
           'zonalabid, fecact, indicador, ccosid, password, codafp, deshabilitado, valida_ci, tcreacion, regverif, codmodant, valcodmoddni,'+
           'actarcrenant, actarcren, reingreso, autdesapo, fecautdesapo, usuregautdesapo, ofiregautdesapo, codmodautdesapo, codarchivo,'+
           'gencodbar, envautdes, corenvautdes, codtiplug, numdirviv, nummanviv, numlotviv, desintviv, desrefviv, codurbviv, desurbviv,'+
           'numetaviv, desetaviv, numintviv, nomdirviv, anoenv, envio, codotrdocide, numotrdocide, codmotdestapo, autdescuo, fecautdescuo,'+
           'usuregautdescuo, ofiregautdescuo, codmodautdescuo, mdfasodir, mdfzipid, mdfcntreg, mdfusrmod, mdffecmod, emicarta, desmanviv,'+
           'codmotdestcuo, fecactpad, est_aut_cli, usu_aut_cli, fec_aut_cli, obs_aut_cli, usu_cre_cli, fec_cre_cli, obs_aut_cli_uge,'+
           'obs_aut_cli_pad, obs_aut_cli_otr, ceneduid, fallecido, tipo_fall_id, codtiptel1, codreftel1, codtiptel2, codreftel2, codpension, nvl(validaaporte,''S'') validaaporte, '+
           'fecregautdesapo, codleypen, codblocharen, numblocharen, coddepintren, desdepintren, asoapecasdni, asoaptser, fecactsit, codciutelfij1, '+
           'codciutelfij2, fecreccadaps, usureccadaps, codmotautcadaps, codpre, AUTDESAPOFORMATO, D_COD_TUR, FECCADCAREXT';
end;

procedure TFMantAsociado.btnContactabilidadClick(Sender: TObject);
begin
  If DM1.cdsAso.Active then
  begin
     Try
       FContactabilidadVerificada := TfContactabilidadVerificada.create(Self);
       FContactabilidadVerificada.xASOID :=DM1.cdsAso.fieldbyname('ASOID').AsString;
       FContactabilidadVerificada.xASODNI :=DM1.cdsAso.fieldbyname('ASODNI').AsString;
       FContactabilidadVerificada.xASONOMDNI :=DM1.cdsAso.FieldByName('ASONOMDNI').AsString;
       FContactabilidadVerificada.ShowModal;
    Finally
       FContactabilidadVerificada.Free;
    End;
     //Actualiza en Ultimo Número Telefónico y correo en el maestro de asociados
     

  End;
end;
// Fin    MAS_201901_HPC : Consulta de Contactabilidad


procedure TFMantAsociado.pprHojaCargoExpSedCenPrintingComplete(Sender: TObject);
begin
   grabaimp_hojacargo;
end;


// Inicio: MAS_201901_HPC
// Procedimiento para el consentimiento de datos
procedure TFMantAsociado.fcsbConsentimientoClick(Sender: TObject);
//Inicio MAS_202303_HPC
Var
   DATOS   : sTRING ;
   SEInfo  : TShellExecuteInfo;
  ExitCode: DWORD;    
   ExecuteFile:String;
begin
   Try
//Inicio PRE_202207_PRE
      DATOS :=  DM1.wUsuario+' '+dm1.XPASS+' '+DM1.cdsAso.FieldByName('ASOID').AsString+' '+CONCONSENTIMIENTO+' '+DM1.wModulo;
   Except
      ShowMessage('Debe seleccionar un asociado');
      exit;
   End;
   ExecuteFile:='C:\SOLEXES\LPDP.exe';
   If not FileExists(ExecuteFile) Then
   Begin
      ShowMessage(' Debe descargar la versión de "Consentimiento de datos" en el icono de "Actualiza Sistemas DM" ' );
      Exit;
   End;
//Fin PRE_202207_PRE
   FillChar(SEInfo, SizeOf(SEInfo), 0) ;
   FMantAsociado.Enabled := False;


   with SEInfo do
   begin
      cbSize       := SizeOf(TShellExecuteInfo) ;
      fMask        := SEE_MASK_NOCLOSEPROCESS;
      Wnd          := Application.Handle;
      lpFile       := PChar(ExecuteFile) ;
      lpParameters := PChar(DATOS);
      nShow        := SW_SHOWNORMAL;
      If ShellExecuteEx(@SEInfo) Then
      begin
         repeat
           Application.ProcessMessages;
           GetExitCodeProcess(SEInfo.hProcess, ExitCode) ;
         until (ExitCode <> STILL_ACTIVE) or
         Application.Terminated;
         FMantAsociado.Enabled := True;
         ActivaBotonConsentimiento;
         Exit;
      end;
   end;
end;


procedure TFMantAsociado.ActivaBotonConsentimiento;
Var xSq,xASOIDl:String;
  HTTP1: TIdHTTP;
  Json: string;
  sResponse: string;
  JsonToSend: TStringStream;
  sServidorWeb : String;
  jsonBase:TlkJSONbase;
  obj,oList:TlkJSONobject;
  i:integer;
begin

  If ((DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'DO') Or (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CE') Or (DM1.cdsAso.FieldByName('ASOTIPID').AsString = 'CO'))
     And (DM1.cdsAso.FieldByName('FALLECIDO').AsString <> 'S') Then
     fcsbConsentimiento.Visible := True
  Else
//Inicio COB_202206_HPC
   fcsbConsentimiento.Visible := False;
   sServidorWeb:=DM1.sUrlGETCONSENTIMIENTO;
//Final COB_202206_HPC
   Json:='{'
         +'"ASODNI":"'+DM1.cdsAso.FieldByName('ASODNI').AsString+'"'
         +'}';
   JsonToSend := TStringStream.Create(Utf8Encode(Json));

   try
    HTTP1 := TIdHTTP.Create(Self);
    HTTP1.Request.ContentType := 'application/json';
    try
      sResponse := HTTP1.Post(sServidorWeb, JsonToSend);
      jsonBase  := TlkJSON.ParseText(sResponse);
      TlkJSONBase(oList) := TlkJSONobject(jsonBase);
      if oList.Count > 0 then
      Begin
//        for i := 0 to (oList.Count - 1) do begin
//          TlkJSONBase(obj) := oList.Child[0];
//          CONCONSENTIMIENTO := obj.Field['ICONO'].Value;
//Inicio COB_202207_HPC
           If oList.Field['ESTADO'].Value=null Then
                CONCONSENTIMIENTO:='N'
           else CONCONSENTIMIENTO:=oList.Field['ESTADO'].Value;
//Fin COB_202207_HPC
//        end;
      End;
    except
      on E: Exception do
      begin
        Screen.Cursor := crDefault;
        MessageDlg('NO ES POSIBLE CONECTAR CON EL SERVICIO DE LPDP!', mtError,[mbOk],0);
      end;
    end;
   finally
    Screen.Cursor := crDefault;
    JsonToSend.Free;
    HTTP1.Free;
   end;

   If CONCONSENTIMIENTO='S' then
   Begin
      fcsbConsentimiento.Color   := clBlue;
      fcsbConsentimiento.Caption := 'Con consentimiento';
   End
   Else
   Begin
      fcsbConsentimiento.Color   := clRed;
      fcsbConsentimiento.Caption := 'Sin consentimiento';
   End;

end;

//Inicio MAS_202303_HPC
procedure TFMantAsociado.pprEnvioClaveWebPrintingComplete(Sender: TObject);
begin
   //xactimp := 'S';
end;
//Fin MAS_202303_HPC

//Inicio MAS_202303_HPC
{
procedure TFMantAsociado.ActImp;
Var xSql:String;
begin
   If xactimp = 'S' Then
   Begin
      xSql := 'UPDATE ASO_LPDP_CON_DET SET LPDIMP = ''S'' WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
      +' AND LPDPNUMCON IN  (SELECT MAX(LPDPNUMCON)  FROM ASO_LPDP_CON_DET WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+')';
      DM1.DCOM1.AppServer.EjecutaSql(xSql);
   End;
end;
}
//Fin MAS_202303_HPC

// Inicio: MAS_201909_HPC
// Nuevos procedimientos de ayuda para la visualización y captura de documentos de no cancelación
procedure TFMantAsociado.VisbtnNoCancelacion;
Var xSql:String;
begin
   xSql := 'SELECT CODI_TIPO_CONSENTIMIENTO, DOCPRODAT01, DOCPRODAT02 FROM ASO_LPDP_CON_DET_VW WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)
   +' AND  CORRELATIVO = (SELECT MAX(CORRELATIVO)  FROM ASO_LPDP_CON_DET_VW WHERE ASOID = '+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+')';
   DM1.cdsQry.Close;
   DM1.cdsQry.DataRequest(xSql);
   DM1.cdsQry.Open;
   If (DM1.cdsQry.FieldByName('CODI_TIPO_CONSENTIMIENTO').AsString = 'C') And
      ((DM1.cdsQry.FieldByName('DOCPRODAT01').AsString <> '') Or (DM1.cdsQry.FieldByName('DOCPRODAT02').AsString <> '')) Then
      fcsbNoCan.Visible := True
   Else
      fcsbNoCan.Visible := False;
End;


procedure TFMantAsociado.fcsbNoCanClick(Sender: TObject);
begin
   Try
      FCapturaDatos := TFCapturaDatos.create(self);
      FCapturaDatos.btnbuscadoc01.Visible := False;
      FCapturaDatos.btnbuscadoc02.Visible := False;
      FCapturaDatos.Showmodal;
   Finally
      FCapturaDatos.free;
   End;
end;
// Fin: MAS_201909_HPC

// Inicio: MAS_201907_HPC
// Procedimientos que llama a la forma que muestra información
// Escaneada por GEMAP
procedure TFMantAsociado.pprHojaCargoExpSedCenPrintDialogClose(
  Sender: TObject);
begin
 MessageDlg('Hola', mtWarning, [mbOk], 0);
end;

procedure TFMantAsociado.fcDeclaracionClick(Sender: TObject);
begin
   if DM1.cdsQry26.RecordCount > 0 then
   begin
    Try
      Screen.Cursor := crDefault;
      FViewPDF := TFViewPDF.Create(Self);
      FViewPDF.xCodges:=DM1.cdsQry26.FieldByName('CODGES').AsString;
      FViewPDF.xNomarchivo:='DECLA';
      FViewPDF.ImagAso.Picture := imgFoto.Picture;
      FViewPDF.ImaFirma.Picture:= imgFirma.Picture;
      FViewPDF.Showmodal;
    Finally
    FViewPDF.free;
    End;
   end
   else
   begin
    DM1.xDecAut := 'DEC';
    Try
      FAutDec := TFAutDec.Create(self);
      FAutDec.Showmodal;
    Finally
      FAutDec.Free;
    End;
   end;
end;

procedure TFMantAsociado.fcAutorizacionClick(Sender: TObject);
begin
   if DM1.cdsQry26.RecordCount > 0 then
   begin
    Try
      Screen.Cursor := crDefault;
      FViewPDF := TFViewPDF.Create(Self);
      FViewPDF.xCodges:=DM1.cdsQry26.FieldByName('CODGES').AsString;
      FViewPDF.xNomarchivo:='CADAPS';
      FViewPDF.ImagAso.Picture := imgFoto.Picture;
      FViewPDF.ImaFirma.Picture:= imgFirma.Picture;
      FViewPDF.Showmodal;
    Finally
    FViewPDF.free;
    End;
   end
   else
   begin
    DM1.xDecAut := 'AUT';
    Try
      FAutDec := TFAutDec.Create(self);
      FAutDec.Showmodal;
    Finally
      FAutDec.Free;
    End;
   end;
end;

procedure TFMantAsociado.CreaDM_CtaInd;

begin
//   Application.Initialize;
   try
      if ( DMCI=nil )  then
      begin
         DMCI:=TDMCI.Create( Application );
         DMCI.DCOMCI := DM1.DCOM1;

         DMCI.cdsQry.RemoteServer :=DM1.DCOM1;
         DMCI.cdsQry1.RemoteServer :=DM1.DCOM1;
         DMCI.cdsQry9.RemoteServer :=DM1.DCOM1;
         DMCI.cdsQry19.RemoteServer :=DM1.DCOM1;
         DMCI.cdsQry20.RemoteServer :=DM1.DCOM1;
         DMCI.cdsQry21.RemoteServer :=DM1.DCOM1;
         DMCI.cdsQry22.RemoteServer :=DM1.DCOM1;
         DMCI.cdsQry24.RemoteServer :=DM1.DCOM1;
         DMCI.cdsQry25.RemoteServer :=DM1.DCOM1;
         DMCI.cdsResol.RemoteServer :=DM1.DCOM1;
         DMCI.cdsAsociado.RemoteServer :=DM1.DCOM1;
         DMCI.cdsAsociados.RemoteServer :=DM1.DCOM1;
         DMCI.cdsRepCCIDet.RemoteServer :=DM1.DCOM1;
       //DMCI.cdsEstapo.RemoteServer :=DM1.DCOM1;
         DMCI.cdsLeyPen.RemoteServer :=DM1.DCOM1;
      // DMCI.cdsCueInd.RemoteServer :=DM1.DCOM1;
         DMCI.cdsCuentas.RemoteServer :=DM1.DCOM1;
         DMCI.cdsRepCCI.RemoteServer :=DM1.DCOM1;
         DMCI.cdsRec.RemoteServer :=DM1.DCOM1;
         DMCI.cdsSexo.RemoteServer :=DM1.DCOM1;
         DMCI.cdsCarta.RemoteServer :=DM1.DCOM1;
         DMCI.cdsUpro.RemoteServer :=DM1.DCOM1;
         DMCI.cdsUpago.RemoteServer :=DM1.DCOM1;
         DMCI.cdsUse.RemoteServer :=DM1.DCOM1;
         DMCI.cdsOfidesAso.RemoteServer :=DM1.DCOM1;
         DMCI.cdsCtaIndCab.RemoteServer :=DM1.DCOM1;
        // DMCI.cdsCtaIndAso.RemoteServer :=DM1.DCOM1;
         DMCI.cdsCtaIndAnoAct.RemoteServer :=DM1.DCOM1;
       //  DMCI.cdsCtaIndAct.RemoteServer :=DM1.DCOM1;
         DMCI.cdsTransacciones.RemoteServer :=DM1.DCOM1;
         DMCI.cdsOfidesAso.RemoteServer :=DM1.DCOM1;
         DMCI.cdsUse.RemoteServer :=DM1.DCOM1;
         DMCI.cdsCtaIndResAnoAnt.RemoteServer :=DM1.DCOM1;
      end;
   finally
   end;
end;
// Fin: MAS_201907_HPC

//Inicio MAS_202006_HPC
//Se adicionó campos de contrato digital

procedure TFMantAsociado.btndatdigitalClick(Sender: TObject);
var xfuente,XSQL:String;
begin

  pnlDatosdigitales.Height :=  39;
  XSQL:=' SELECT A.CODTIPCOR CODTIP,''CORREO'' TIPO, A.CORREO DATO,A.OBSCOR OBS,A.CODFUEINF,B.DESFUEINF '
       +' From DB2ADMIN.ges_cor_aso A,DB2ADMIN.GES_FUE_INF_MAE B '
       +' Where ASOID ='''+Dm1.cdsAso.FieldByname('ASOID').AsString +''' AND  activo=''S'' '
       +'   AND  A.CODFUEINF=B.CODFUEINF(+) '
       +' UNION ALL '
       +' SELECT A.IDTIPTEL CODTIP,''TELEFONO'' TIPO,A.NROTELF DATO,A.OBSTEL OBS,A.CODFUEINF,B.DESFUEINF '
       +' From DB2ADMIN.ges_tel_aso A,DB2ADMIN.GES_FUE_INF_MAE B '
       +' Where ASOID ='''+Dm1.cdsAso.FieldByname('ASOID').AsString +''' AND  activo=''S'' '
       +'   AND  A.CODFUEINF=B.CODFUEINF(+) ';
     DM1.cdsQry26.Close;
     DM1.cdsQry26.DataRequest(XSQL);
     DM1.cdsQry26.Open;

  If DM1.cdsQry26.RecordCount>0 Then
  Begin
     pnlDatosdigitales.Height :=  171;
     dbgHistorico .DataSource :=  DM1.dsQry26;
     dbgHistorico.Selected.Clear;
     dbgHistorico.Selected.Add('TIPO'#9'10'#9'Tipo.'#9#9);
     dbgHistorico.Selected.Add('DATO'#9'30'#9'Dato'#9#9);
     dbgHistorico.Selected.Add('OBS'#9'30'#9'Observación'#9#9);
     dbgHistorico.Selected.Add('DESFUEINF'#9'20'#9'Fuente'#9#9);
     dbgHistorico.ApplySelected;
  End;


If  Length(trim(Dm1.cdsAso.FieldByname('CORREO_CONTACTO_DIGITAL').AsString))>0 Then
    xfuente :=DM1.CrgDescrip('CODFUEINF=' + Dm1.cdsAso.FieldByname('FUENTE_CORREO_CONT_DIGITAL').AsString, 'GES_FUE_INF_MAE', 'DESFUEINF');

If  Length(trim(Dm1.cdsAso.FieldByname('CELULAR_CONTACTO_DIGITAL').AsString))>0 Then
    xfuente:=DM1.CrgDescrip('CODFUEINF=' + Dm1.cdsAso.FieldByname('FUENTE_CELULAR_CONT_DIGITAL').AsString, 'GES_FUE_INF_MAE', 'DESFUEINF');

    edtcelulardigital.Text := Dm1.cdsAso.FieldByname('CELULAR_CONTACTO_DIGITAL').AsString;
    edtCorreodigital.Text  := Dm1.cdsAso.FieldByname('CORREO_CONTACTO_DIGITAL').AsString;
    edtfuente.Text         := xfuente;
 pnlDatosdigitales.Top := 270;
 pnlDatosdigitales.Left:= 221;
 pnlDatosdigitales.Visible:= TRue;

end;

procedure TFMantAsociado.Button1Click(Sender: TObject);
begin
pnlDatosdigitales.Visible:= False;
end;
//Fin MAS_202006_HPC

procedure TFMantAsociado.imprimehojacargo;
Var xSql:String;
begin
   xSql := 'SELECT A.CODCAREXP, SUBSTR(A.CODCAREXP, 1, 4) ANHO, SUBSTR(A.CODCAREXP,5,8) CORRELATIVO, C.ASOAPENOM, C.ASODNI,'
   +' A.PVSTIPBEN, A.USUREGTIPBE, A.FECREGTIPBE, A.TIPORETIRO,'
   +' DB2ADMIN.SF_SIO_CONTACTO_CELULAR('+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+') TELEFONOS,'
   +' DB2ADMIN.SF_SIO_CONTACTO_CORREO('+QuotedStr(DM1.cdsAso.FieldByName('ASOID').AsString)+') ASOEMAIL,'
   +' TO_CHAR(A.FECREG,''DD/MM/YYYY HH24:MI:SS'') FECHA_HORA,'
   +' UPPER(NVL(G.USERNOM ,A.USERID)) USUARIO, E.OFDESNOM, A.OFDESID, A.USUIMP, A.FECREGIMP,  C.TIPDOCCOD, C.ASODOCNUM'
   +' FROM PRE_CARGO_EXPEDIENTE_MOV A, APO201 C, APO110 E, TGE006 G'
   +' WHERE A.CODCAREXP = '+QuotedStr(xcodcargo)
   +' AND A.CODCAREXPEST = ''PENDIENTE'' AND A.ASOID = C.ASOID AND A.OFDESID = E.OFDESID AND A.USERID = G.USERID(+)';
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSql);
   DM1.cdsQry2.Open;
   If DM1.cdsQry2.RecordCount = 1 THEN
   Begin
      If Trim(DM1.cdsQry2.FieldByName('PVSTIPBEN').AsString) = '' Then
      Begin
         MessageDlg('Debe registrar el tipo de beneficio antes de imprimir la hoja de cargo.', mtError, [mbOk], 0);
         Exit;
      End;
      ppLabel190.Text     := 'CARGO DE RECEPCION DE EXPEDIENTE DE BENEFICIOS Nº '+DM1.cdsQry2.FieldByName('ANHO').AsString+'-'
      +DM1.cdsQry2.FieldByName('CORRELATIVO').AsString+'-PS';
      ppLblTitular.Text   := DM1.cdsQry2.FieldByName('ASOAPENOM').AsString;

      If DM1.cdsQry2.FieldByName('TIPDOCCOD').AsString = '04' Then
      Begin
         ppletiDNIhojcar.Caption := 'CE:';
         pplblDNI.Text := DM1.cdsQry2.FieldByName('ASODOCNUM').AsString;
      End
      Else
      Begin
         ppletiDNIhojcar.Caption := 'DNI:';
         pplblDNI.Text := DM1.cdsQry2.FieldByName('ASODNI').AsString;
      End;
      pplblTelefonos.Text := DM1.cdsQry2.FieldByName('TELEFONOS').AsString;
      pplblCorreo.Text    := DM1.cdsQry2.FieldByName('ASOEMAIL').AsString;
      // xSql := 'SELECT MENSAJE FROM PVS_EDICION_MENSAJE WHERE CODIGO = ''01''';
      xSql := 'SELECT MENSAJE, TIPO_LETRA, TAMA_LETRA FROM PVS_EDICION_MENSAJE WHERE CODIGO = ''01''';
      DM1.cdsQry1.Close;
      DM1.cdsQry1.DataRequest(xSql);
      DM1.cdsQry1.Open;
//    pprttexto.RichText := DM1.cdsQry1.FieldByName('MENSAJE').AsString;
      ppmcuerpohojcargo.Text := DM1.cdsQry1.FieldByName('MENSAJE').AsString;
      ppmcuerpohojcargo.Font.Name := DM1.cdsQry1.FieldByName('TIPO_LETRA').AsString;
      ppmcuerpohojcargo.Font.size := DM1.cdsQry1.FieldByName('TAMA_LETRA').AsInteger;
      pplFCargo.Text      := DM1.cdsQry2.FieldByName('FECHA_HORA').AsString;
      pplblUsuario.Text   := DM1.cdsQry2.FieldByName('USUARIO').AsString;
      pplblOficina.Text   := DM1.cdsQry2.FieldByName('OFDESNOM').AsString;
      pplusuario.Text :=  DM1.DevuelveValor('TGE006', 'USERNOM', 'USERID', DM1.wUsuario);
      pptipobeneficio.Text := DM1.DevuelveValor('TGE186', 'BENEFDES', 'TIPBENEF', DM1.cdsQry2.FieldByName('PVSTIPBEN').AsString);
      If Trim(DM1.cdsQry2.FieldByName('TIPORETIRO').AsString) <> '' Then
         pptipobeneficio.Text := pptipobeneficio.Text + ' - ' + DM1.cdsQry2.FieldByName('TIPORETIRO').AsString;
      pprHojaCargoExpSedCen.Print;
   End;
end;

procedure TFMantAsociado.grabaimp_hojacargo;
Var xsSql:String;
begin
   xsSql := 'BEGIN DB2ADMIN.PCK_PRE_CARGO_EXPEDIENTE.SP_PRE_GUARDA_IMPRESION(''S'', ' + QuotedStr(xcodcargo) + ', ' + QuotedStr(DM1.wUsuario) + '); END;';
   DM1.DCOM1.AppServer.EjecutaSql(xsSQL);
   xsSql := 'BEGIN DB2ADMIN.PCK_PRE_CARGO_EXPEDIENTE.SP_GUARDA_PRIMERA_IMPRESION('+QuotedStr(xcodcargo)+', '+QuotedStr(DM1.wUsuario)+'); END;';
   DM1.DCOM1.AppServer.EjecutaSql(xsSQL);
end;

procedure TFMantAsociado.btncodpagoClick(Sender: TObject);
begin
   Try
      FManCodigoPago := TFManCodigoPago.create(self);
      FManCodigoPago.Showmodal;
   Finally
      FManCodigoPago.free;
   End;
end;

procedure TFMantAsociado.btnInscarextClick(Sender: TObject);
Var xSql:String;
begin
// Fcarneextranjeria

end;

procedure TFMantAsociado.edtnumdocExit(Sender: TObject);
begin
   IF dblTipDoc.Focused THEN exit;
   IF BitSalir.Focused THEN exit;
   If dm1.xInsert = '1' Then
   Begin
      If dblTipDoc.Text = '04' Then
      Begin
         If Length(Trim(edtnumdoc.Text)) <> 9 Then
         Begin
            MessageDlg('Número de CE es de 9 digitos.', mtError, [mbOk], 0);
            edtnumdoc.SetFocus;
            Exit;
         End;
      End
      Else
      Begin
         If Length(Trim(dbeLibDni.Text)) <> 8 Then
         Begin
            MessageDlg('Número de DNI es de 8 digitos.', mtError, [mbOk], 0);
            dbeLibDni.SetFocus;
            Exit;
         End;
      End;
   End;
   IF (dm1.xInsert='1') AND (Length(trim(edtnumdoc.Text))<>0) AND (dblTipDoc.Text<>xTIPDOCCOD) THEN
   Begin
      If validaNumerodoc(Trim(edtnumdoc.Text)) Then
      BEGIN
        MessageDlg('Número de documento Ya Existe, verifique', mtError, [mbOk], 0);
        edtnumdoc.Color := $00E8FFFF;
        edtnumdoc.SetFocus;
        Exit;
      END;
   End;
end;

procedure TFMantAsociado.dbdtFecExpCarExtExit(Sender: TObject);
begin
   If dbdtFecExpCarExt.Date < DM1.FechaSys Then
   Begin
     MessageDlg('CE se encuentra vencido. Verificar.', mtError, [mbOk], 0);
     dbdtFecExpCarExt.Text := '';
     dbdtFecExpCarExt.SetFocus;
     Exit;
   End;
End;

procedure TFMantAsociado.edtnumdocKeyPress(Sender: TObject; var Key: Char);
begin
   If Not (Key In ['0'..'9']) then
   Begin
      Key:=#0;
      Showmessage('Por favor introduzca numeros.')
   End;
end;

procedure TFMantAsociado.dbeLibDniKeyPress(Sender: TObject; var Key: Char);
begin
   If Not (Key In ['0'..'9']) then
   Begin
      Key:=#0;
      Showmessage('Por favor introduzca numeros.')
   End;
end;

End.

//Final HPC_201801_MAS

