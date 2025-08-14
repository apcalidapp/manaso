unit ASO260R;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, fcLabel, ExtCtrls;

type
  TFMenCarnetExt = class(TForm)
    StaticText1: TStaticText;
    fcLabel2: TfcLabel;
    GroupBox3: TGroupBox;
    fclMensaje1: TfcLabel;
    fclMensaje2: TfcLabel;
    btnacepta: TBitBtn;
    Timer1: TTimer;
    procedure btnaceptaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenCarnetExt: TFMenCarnetExt;

implementation

{$R *.dfm}

procedure TFMenCarnetExt.btnaceptaClick(Sender: TObject);
begin
   Close;
end;


procedure TFMenCarnetExt.Timer1Timer(Sender: TObject);
begin
   If fclMensaje2.Visible = True Then
   Begin
      fclMensaje1.Visible := False;
      fclMensaje2.Visible := False;
   End
   Else
   Begin
      fclMensaje1.Visible := True;
      fclMensaje2.Visible := True;
   End;
end;

end.
