unit uteste;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit,
  FMX.Objects;

type
  TForm1 = class(TForm)
    edValorusu1: TEdit;
    edValorusu2: TEdit;
    LayoutPontuacao: TLayout;
    Layout6: TLayout;
    RoundRect1: TRoundRect;
    lbTtalQuedaUsu1: TLabel;
    lbTtalQuedaUsu2: TLabel;
    lbTotal: TLabel;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
