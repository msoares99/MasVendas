program MasVendas;

uses
  System.StartUpCopy,
  FMX.Forms,
  Geral.Login in '..\scr\Geral\Geral.Login.pas' {frmLogin},
  Geral.Main in '..\scr\Geral\Geral.Main.pas' {frmPrincipal},
  Geral.Cadastros in '..\scr\Geral\frmPadrao\Geral.Cadastros.pas' {frmCadastroPadrao},
  Geral.Cadastros.Edicao.Padrao in '..\scr\Geral\frmPadrao\Geral.Cadastros.Edicao.Padrao.pas' {frmCadastrosEdicaoPadrao},
  Geral.Utils in '..\scr\Geral\Geral.Utils.pas',
  ClienteFornecedor.Main in '..\scr\Cliente\ClienteFornecedor.Main.pas' {frmCadastroClienteFornecedor},
  ClienteFornecedor.Edicao in '..\scr\Cliente\ClienteFornecedor.Edicao.pas' {frmEdicaoClienteFornecedor},
  uCEP in '..\scr\API\uCEP.pas',
  uCNPJ in '..\scr\API\uCNPJ.pas',
  uPixMercadoPago in '..\scr\API\uPixMercadoPago.pas',
  Produto.Main in '..\scr\Produto\Produto.Main.pas' {frmCadastroPadrao1},
  Produto.Edicao in '..\scr\Produto\Produto.Edicao.pas' {frmEdicaoProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
