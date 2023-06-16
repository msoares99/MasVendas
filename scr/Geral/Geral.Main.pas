unit Geral.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl,
  FMX.Gestures, System.Actions, FMX.ActnList, ClienteFornecedor.Main, Produto.Main;

type
  TfrmPrincipal = class(TForm)
    layHeader: TLayout;
    layGadget: TLayout;
    layBotoes1: TLayout;
    recHeader: TRectangle;
    recNotas: TRectangle;
    Label1: TLabel;
    Image1: TImage;
    recCadastros: TRectangle;
    Label2: TLabel;
    Image2: TImage;
    layBotoes2: TLayout;
    recConfiguracoes: TRectangle;
    Label3: TLabel;
    Image3: TImage;
    recCobrancas: TRectangle;
    Label4: TLabel;
    Image4: TImage;
    Image6: TImage;
    Label8: TLabel;
    Image7: TImage;
    tabGadget: TTabControl;
    tbValidadas: TTabItem;
    recNotasValidadas: TRectangle;
    Label9: TLabel;
    Rectangle3: TRectangle;
    Label10: TLabel;
    Image8: TImage;
    Label11: TLabel;
    tbCanceladas: TTabItem;
    tbPendentes: TTabItem;
    GestureManager1: TGestureManager;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    recNotasPendentes: TRectangle;
    Label15: TLabel;
    Rectangle6: TRectangle;
    Label16: TLabel;
    Image10: TImage;
    Label17: TLabel;
    recNotasCanceladas: TRectangle;
    Label5: TLabel;
    Rectangle2: TRectangle;
    Label6: TLabel;
    Image5: TImage;
    Label7: TLabel;
    procedure NextTabAction1Update(Sender: TObject);
    procedure PreviousTabAction1Update(Sender: TObject);
    procedure recCadastrosClick(Sender: TObject);
    procedure recNotasClick(Sender: TObject);
    procedure recConfiguracoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses Configuracao.Main;

procedure TfrmPrincipal.NextTabAction1Update(Sender: TObject);
begin
  tabGadget.Next();
end;

procedure TfrmPrincipal.PreviousTabAction1Update(Sender: TObject);
begin
  tabGadget.Previous();
end;

procedure TfrmPrincipal.recCadastrosClick(Sender: TObject);
begin
  if (not assigned(frmCadastroProduto)) then
  begin
    Application.CreateForm(TfrmCadastroProduto, frmCadastroProduto);
    frmCadastroProduto.Show;
  end;
end;

procedure TfrmPrincipal.recConfiguracoesClick(Sender: TObject);
begin
  if (not assigned(frmConfiguracao)) then
  begin
    Application.CreateForm(TfrmConfiguracao, frmConfiguracao);
    frmConfiguracao.Show;
  end;
end;

procedure TfrmPrincipal.recNotasClick(Sender: TObject);
begin
  if (not assigned(frmCadastroClienteFornecedor)) then
  begin
    Application.CreateForm(TfrmCadastroClienteFornecedor, frmCadastroClienteFornecedor);
    frmCadastroClienteFornecedor.Show;
  end;
end;

end.
