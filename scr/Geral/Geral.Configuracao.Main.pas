unit Geral.Configuracao.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmConfiguracao = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    lblTitulo: TLabel;
    btnVoltar: TImage;
    layBotoes1: TLayout;
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
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Label5: TLabel;
    Image5: TImage;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure recNotasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

{$R *.fmx}

uses Geral.Configuracao.DadosEmpresa;

procedure TfrmConfiguracao.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfiguracao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  frmConfiguracao := nil;
end;

procedure TfrmConfiguracao.recNotasClick(Sender: TObject);
begin
  if (not assigned(frmConfiguracaoDadosEmpresa)) then
  begin
    Application.CreateForm(TfrmConfiguracaoDadosEmpresa, frmConfiguracaoDadosEmpresa);
    frmConfiguracaoDadosEmpresa.Show;
  end;
end;

end.
