unit VERPDF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw;

type
  TFVERPDF = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Archivo: String;
  end;

var
  FVERPDF: TFVERPDF;

implementation

{$R *.dfm}

procedure TFVERPDF.FormShow(Sender: TObject);
begin
 Try
   WebBrowser1.Navigate('file:///'+Archivo );
 except
  ShowMessage('error');
 end;
end;

end.
