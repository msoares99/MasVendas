unit ClienteFornecedor.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Geral.Cadastros, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.ListView, FMX.Layouts, ClienteFornecedor.Edicao;

type
  TfrmCadastroClienteFornecedor = class(TfrmCadastroPadrao)
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
    procedure btnVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroClienteFornecedor: TfrmCadastroClienteFornecedor;

implementation

{$R *.fmx}

procedure TfrmCadastroClienteFornecedor.btnVoltarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadastroClienteFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := TCloseAction.caFree;
  frmCadastroClienteFornecedor := nil;
end;

procedure TfrmCadastroClienteFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  for var I := 0 to 30 do
  begin
    with ListView1.Items.Add do
    begin
      TListItemText(Objects.FindDrawable('txtRazao')).Text := 'MANASSES DE ASSIS SOARES';
      TListItemText(Objects.FindDrawable('txtFantasia')).Text := 'MAS INFO';
      TListItemText(Objects.FindDrawable('txtIE')).Text := 'IE: 999999999';
      TListItemText(Objects.FindDrawable('txtCNPJ')).Text := 'CNPJ: 05.277.768/0001-20';
    end;
  end;
end;

procedure TfrmCadastroClienteFornecedor.Image2Click(Sender: TObject);
begin
  inherited;
  if not Assigned(frmEdicaoClienteFornecedor) then
  begin
    Application.CreateForm(TfrmEdicaoClienteFornecedor, frmEdicaoClienteFornecedor);
    frmEdicaoClienteFornecedor.TipoAlteracao := TAInclusao;
  end;
  frmEdicaoClienteFornecedor.Show;
end;

procedure TfrmCadastroClienteFornecedor.ListView1ItemClick(const Sender: TObject; const AItem: TListViewItem);
begin
  inherited;
  if not Assigned(frmEdicaoClienteFornecedor) then
  begin
    Application.CreateForm(TfrmEdicaoClienteFornecedor, frmEdicaoClienteFornecedor);
    frmEdicaoClienteFornecedor.TipoAlteracao := TAEdicao;
  end;
  frmEdicaoClienteFornecedor.Show;
end;

end.
