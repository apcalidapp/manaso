unit ASO205B;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls,  ExtCtrls, fcImager, StdCtrls, SHDocVw,idHTTP, uLkJSON, idMultipartFormData;

type
  TFViewPDF = class(TForm)
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox1: TGroupBox;
    ImagAso: TImage;
    GroupBox2: TGroupBox;
    ImaFirma: TImage;
    WebBrowser1: TWebBrowser;
    pnl01: TPanel;
    Shape2: TShape;

    procedure FormActivate(Sender: TObject);
    function ViewImage(codges, nomarchivo : String) :String;
    procedure WebBrowser1DownloadComplete(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    { Private declarations }
  public
    { Public declarations }
    xPath,xCodges,xNomarchivo:String;
  end;

var
  FViewPDF: TFViewPDF;

implementation

uses ASODM;

{$R *.dfm}


procedure TFViewPDF.FormActivate(Sender: TObject);
begin        
  //Servicio metodo get para ver documento pdf
  ViewImage(xcodges, xnomarchivo);
end;

function TFViewPDF.ViewImage(codges, nomarchivo : String) :String;
var
  Response: String;
  HTTPClient: TidHTTP;
  ImageStream: TIdMultipartFormDataStream;
  Params: TStringList;
  xServerImg:String;
begin
  try
    HTTPClient := TidHTTP.Create(self);
    HTTPClient.Request.ContentEncoding := 'UTF-8';
    xServerImg:=DM1.CrgDescrip('CODPAR=' + QuotedStr('01'), 'ASO_PAR_GEN_SIS', 'URL_SER_IMG');
    try
      ImageStream := TIdMultiPartFormDataStream.Create;
      Params := TStringList.Create;
      try
          pnl01.Visible:=true;
          WebBrowser1.Navigate(xServerImg+'documentos/getPdf?codges='+xCodges+'&nomarchivo='+xNomarchivo);
      finally
        ImageStream.Free;
      end;
    finally
      HTTPClient.Free;
    end;
  except
    MessageDlg('HAY PROBLEMAS AL CONECTARSE CON EL SERVIDOR', mtWarning, [mbOk], 0);   
  end;
  result:= response;
end;

procedure TFViewPDF.WebBrowser1DownloadComplete(Sender: TObject);
begin
  pnl01.Visible:=false;
end;

procedure TFViewPDF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
end;

end.procedure TFViewPDF.FormClose(Sender: TObject; var Action: TCloseAction);
begin

end;


