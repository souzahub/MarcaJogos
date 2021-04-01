unit untApp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox, FMX.Effects,
  FMX.Media, FMX.Ani, FMX.Edit, FMX.EditBox, FMX.ComboTrackBar,
  FMX.NumberBox, FMX.VirtualKeyboard, FMX.Platform;


type
  TToastLength = (LongToast, ShortToast);
  TfrmApplication = class(TForm)
    Image1: TImage;
    LtJogador1: TLayout;
    Layout2: TLayout;
    edValorusu1: TLabel;
    Layout8: TLayout;
    img_open: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    ToolBar1: TToolBar;
    Label1: TLabel;
    btnMore: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnSair: TSpeedButton;
    LtJogador2: TLayout;
    Layout5: TLayout;
    edValorusu2: TLabel;
    lbJogador1: TLabel;
    lbJogador2: TLabel;
    lbJogador3: TLabel;
    Layout4: TLayout;
    Layout9: TLayout;
    edValorusu3: TLabel;
    lbJogador4: TLabel;
    LT: TLayout;
    Layout1: TLayout;
    Layout11: TLayout;
    Layout6: TLayout;
    RoundRect1: TRoundRect;
    edUsu1: TEdit;
    Layout7: TLayout;
    RoundRect4: TRoundRect;
    edUsu2: TEdit;
    Layout3: TLayout;
    Layout12: TLayout;
    RoundRect2: TRoundRect;
    edUsu3: TEdit;
    Layout13: TLayout;
    RoundRect5: TRoundRect;
    edUsu4: TEdit;
    LtJogador4: TLayout;
    Layout15: TLayout;
    edValorusu4: TLabel;
    Layout14: TLayout;
    Layout10: TLayout;
    lbTtalQuedaUsu1: TLabel;
    lbTtalQuedaUsu2: TLabel;
    lbTotal: TLabel;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    lbPopup: TListBox;
    ListBoxItem1: TListBoxItem;
    btnConfig: TSpeedButton;
    ListBoxItem2: TListBoxItem;
    btnInfo: TSpeedButton;
    ListBoxItem3: TListBoxItem;
    sbLimpar: TSpeedButton;
    ShadowEffect1: TShadowEffect;
    lbTtalQuedaUsu4: TLabel;
    lbTtalQuedaUsu3: TLabel;
    LayoutPontuacao: TLayout;
    Panel1: TPanel;
    Image5: TImage;
    Label2: TLabel;
    edPontMax: TEdit;
    sbCancel: TSpeedButton;
    sbConfirm: TSpeedButton;
    procedure btnSairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbPopupExit(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure img_openClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure edUsu1Exit(Sender: TObject);
    procedure sbConfirmClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure ddddddClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
  private
    { Private declarations }
    var
    xPontuacao, xTotalQueda : Integer;
    xJogador1, xJogador2, xJogador3, xJogador4 : Boolean;
    xQeda1, xVal2, xJog2Qeda1, xJog2Val2 , xJog3Qeda, xJog4Val2, xJog4Qeda, xJog4Val: Integer;

  public
    { Public declarations }
  end;

var
  frmApplication: TfrmApplication;

implementation

{$IFDEF ANDROID}
uses
  Androidapi.JNI.Toasts,
  Androidapi.Helpers,
  FMX.Helpers.Android, uDados;

  procedure Toast(const Msg: string; duration: TToastLength);
  var
    ToastLength: Integer;
  begin
    if duration = ShortToast then
      ToastLength := TJToast.JavaClass.LENGTH_SHORT
    else
      ToastLength := TJToast.JavaClass.LENGTH_LONG;

    CallInUIThread (
      procedure
      begin
        TJToast.JavaClass.makeText (SharedActivityContext,StrToJCharSequence(Msg), ToastLength).show
      end
    );
  end;
{$ENDIF}

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}

procedure TfrmApplication.btnConfigClick(Sender: TObject);
begin
  if xQeda1 > 0 then
  begin
    {$IFDEF ANDROID}
    Toast ('Caso queira mudar a pontuação, saia e entre novamente no App', LongToast);
    {$ENDIF ANDROID}
    exit;
  end;
  LayoutPontuacao.Visible := True;
  edPontMax.Text := '';

end;

procedure TfrmApplication.btnInfoClick(Sender: TObject);
begin
  Close;
;;
end;

procedure TfrmApplication.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmApplication.ddddddClick(Sender: TObject);
begin
  ShowMessage('By Luan - 28/03/2021, App para ajudar a marcar jogos de Baralho, Dominó e entre outros.');
  if lbPopup.Visible = false then
      begin
        lbPopup.Visible := true;

      end

    else
      begin
        lbPopup.Visible := false;

      end;
end;

procedure TfrmApplication.edUsu1Exit(Sender: TObject);
begin
  edUsu2.SetFocus;
end;

procedure TfrmApplication.FormShow(Sender: TObject);
begin
  xPontuacao := 0 ;
  edUsu1.Text := '';
  edUsu2.Text := '';
  edUsu3.Text := '';
  edUsu4.Text := '';

  lbPopup.Visible := false;
  edValorusu1.Text := IntToStr( 0);
  edValorusu2.Text := IntToStr( 0);
  edValorusu3.Text := IntToStr( 0);
  edValorusu4.Text := IntToStr( 0);

  lbTtalQuedaUsu1.Text := 'Total Quedas Jogador(s) 1:  ' +IntToStr( 0 );

  lbTtalQuedaUsu2.Text := 'Total Quedas Jogador(s) 2:  ' +IntToStr( 0 );

  lbTtalQuedaUsu3.Text := 'Total Quedas Jogador(s) 3:  ' +IntToStr( 0 );

  lbTtalQuedaUsu4.Text := 'Total Quedas Jogador(s) 4:  ' +IntToStr( 0 );

  LayoutPontuacao.Visible := False;
end;

procedure TfrmApplication.Image1Click(Sender: TObject);
var
xUsu1, xVal : Integer;

begin
  if edValorusu1.Text = IntToStr( 0) then exit;

  xVal :=  StrToInt (edValorusu1.Text);
  xUsu1 := xVal;
  Inc(xUsu1,-1);
  edValorusu1.Text := IntToStr(xUsu1);
end;

procedure TfrmApplication.Image2Click(Sender: TObject);
var
xUsu2, xVa2 : Integer;

begin
  if edValorusu2.Text = IntToStr(0) then exit;

  xVa2 :=  StrToInt (edValorusu2.Text);
  xUsu2 := xVa2;
  Inc(xUsu2,-1);
  edValorusu2.Text := IntToStr(xUsu2);
end;

procedure TfrmApplication.Image3Click(Sender: TObject);
var
xUsu2, xVa2 : Integer;

begin
  if edValorusu2.Text = IntToStr(0) then exit;

  xVa2 :=  StrToInt (edValorusu2.Text);
  xUsu2 := xVa2;
  Inc(xUsu2,-1);
  edValorusu2.Text := IntToStr(xUsu2);

end;

procedure TfrmApplication.Image4Click(Sender: TObject);
var
xUsu2, xVa2 : Integer;

begin
  if  xPontuacao <= 0 then
  begin
    {$IFDEF ANDROID}
    Toast ('Informe a Pontuação Máxima em (configuração )', LongToast);
    {$ENDIF ANDROID}
    exit;
  end;

  xJogador1 := False;
  xJogador2 := True;

  xVa2 :=  StrToInt (edValorusu2.Text);
  xUsu2 := xVa2;
  Inc(xUsu2);
  edValorusu2.Text := IntToStr(xUsu2);

    if  edValorusu2.Text = IntToStr(xPontuacao) then
  begin
    if xJogador2 = True then ;
    begin
     Inc (xJog2Qeda1);
     lbTtalQuedaUsu2.Text := 'Total Quedas Jogador(s) 2:  '+ IntToStr( xJog2Qeda1 );
     edValorusu1.Text := IntToStr( 0);
     edValorusu2.Text := IntToStr( 0);
     exit;
    end;

  end;
end;

procedure TfrmApplication.Image6Click(Sender: TObject);
var
xUsu4, xVa4 : Integer;

begin
  if edValorusu4.Text = IntToStr(0) then exit;

  xVa4 :=  StrToInt (edValorusu4.Text);
  xUsu4 := xVa4;
  Inc(xUsu4,-1);
  edValorusu4.Text := IntToStr(xUsu4);
end;

procedure TfrmApplication.Image7Click(Sender: TObject);
var
xUsu4, xVa4 : Integer;

begin
  if  xPontuacao <= 0 then
  begin
    {$IFDEF ANDROID}
    Toast ('Informe a Pontuação Máxima em (configuração )', LongToast);
    {$ENDIF ANDROID}
    exit;
  end;

  xJogador1 := False;
  xJogador2 := False;
  xJogador3 := False;
  xJogador4 := True;

  xVa4 :=  StrToInt (edValorusu4.Text);
  xUsu4 := xVa4;
  Inc(xUsu4);
  edValorusu4.Text := IntToStr(xUsu4);

  if  edValorusu4.Text = IntToStr(xPontuacao) then
  begin
    if xJogador4 = True then ;
    begin
     Inc (xJog4Qeda);
     lbTtalQuedaUsu4.Text := 'Total Quedas Jogador(s) 4:  '+ IntToStr( xJog4Qeda );
     edValorusu1.Text := IntToStr( 0);
     edValorusu2.Text := IntToStr( 0);
     edValorusu3.Text := IntToStr( 0);
     edValorusu4.Text := IntToStr( 0);
     exit;
    end;

  end;
end;

procedure TfrmApplication.Image8Click(Sender: TObject);
var
xUsu3, xVa3 : Integer;

begin
  if edValorusu3.Text = IntToStr(0) then exit;

  xVa3 :=  StrToInt (edValorusu3.Text);
  xUsu3 := xVa3;
  Inc(xUsu3,-1);
  edValorusu3.Text := IntToStr(xUsu3);
end;

procedure TfrmApplication.Image9Click(Sender: TObject);
var
xUsu3, xVa3 : Integer;

begin
  if  xPontuacao <= 0 then
  begin
    {$IFDEF ANDROID}
    Toast ('Informe a Pontuação Máxima em (configuração )', LongToast);
    {$ENDIF ANDROID}
    exit;
  end;

  xJogador1 := False;
  xJogador2 := False;
  xJogador3 := True;
  xJogador4 := False;

  xVa3 :=  StrToInt (edValorusu3.Text);
  xUsu3 := xVa3;
  Inc(xUsu3);
  edValorusu3.Text := IntToStr(xUsu3);

  if  edValorusu3.Text = IntToStr(xPontuacao) then
  begin
    if xJogador3 = True then ;
    begin
     Inc (xJog3Qeda);
     lbTtalQuedaUsu3.Text := 'Total Quedas Jogador(s) 3:  '+ IntToStr( xJog3Qeda );
     edValorusu1.Text := IntToStr( 0);
     edValorusu2.Text := IntToStr( 0);
     edValorusu3.Text := IntToStr( 0);
     edValorusu4.Text := IntToStr( 0);
     exit;
    end;

  end;

end;

procedure TfrmApplication.img_openClick(Sender: TObject);
var
xUsu1, xVal : Integer;

begin
  if  xPontuacao <= 0 then
  begin
    {$IFDEF ANDROID}
    Toast ('Informe a Pontuação Máxima em (configuração )', LongToast);
    {$ENDIF ANDROID}
    exit;
  end;

  xJogador1 := True;
  xJogador2 := False;

  xVal :=  StrToInt (edValorusu1.Text);
  xUsu1 := xVal;
  Inc(xUsu1);
  edValorusu1.Text := IntToStr(xUsu1);

  if  edValorusu1.Text = IntToStr(xPontuacao) then
  begin
    if xJogador1 = True then ;
    begin
     Inc (xQeda1);
     lbTtalQuedaUsu1.Text := 'Total Quedas Jogador(s) 1:  '+ IntToStr( xQeda1 );
     edValorusu1.Text := IntToStr( 0);
     edValorusu2.Text := IntToStr( 0);
     exit;
    end;

  end;



end;

procedure TfrmApplication.lbPopupExit(Sender: TObject);
begin
   if lbPopup.Visible = false then
      begin
        lbPopup.Visible := true;
      end

    else
      begin
        lbPopup.Visible := false;
      end;
end;

procedure TfrmApplication.SpeedButton1Click(Sender: TObject);
begin
  if lbPopup.Visible = false then
      begin
        lbPopup.Visible := true;

      end

    else
      begin
        lbPopup.Visible := false;

      end;
end;

procedure TfrmApplication.sbCancelClick(Sender: TObject);
begin
  edPontMax.Text := '';
  if lbPopup.Visible = false then
      begin
        lbPopup.Visible := true;

      end

    else
      begin
        lbPopup.Visible := false;

      end;

    LayoutPontuacao.Visible := FALSE;
end;

procedure TfrmApplication.sbConfirmClick(Sender: TObject);

begin
  if edPontMax.Text = '' then
  begin
    {$IFDEF ANDROID}
     Toast ('Informe o valor', ShortToast);

    {$ENDIF ANDROID}
   EXIT;
  end;

  LayoutPontuacao.Visible := FALSE;

  if lbPopup.Visible = false then
      begin
        lbPopup.Visible := true;

      end

    else
      begin
        lbPopup.Visible := false;

      end;

  xPontuacao := StrToInt( edPontMax.Text );



end;

end.
