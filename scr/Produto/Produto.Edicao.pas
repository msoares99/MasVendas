unit Produto.Edicao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Geral.Cadastros.Edicao.Padrao, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts, FMX.Edit, FMX.ListBox;

type
  TAlteracao = (TAEdicao, TAInclusao);

  TfrmEdicaoProduto = class(TfrmCadastrosEdicaoPadrao)
    Layout2: TLayout;
    Layout4: TLayout;
    edtNome: TEdit;
    Label6: TLabel;
    StyleBook1: TStyleBook;
    Layout5: TLayout;
    Layout3: TLayout;
    edtCodBarras: TEdit;
    Label1: TLabel;
    Layout6: TLayout;
    edtCodNota: TEdit;
    Label2: TLabel;
    Layout7: TLayout;
    Layout8: TLayout;
    edtPreco: TEdit;
    Label3: TLabel;
    Layout9: TLayout;
    edtPeso: TEdit;
    Label4: TLabel;
    Layout13: TLayout;
    Layout10: TLayout;
    Label7: TLabel;
    cbxNCM: TComboBox;
    Layout12: TLayout;
    Label8: TLabel;
    cbxCEST: TComboBox;
    Layout16: TLayout;
    Layout17: TLayout;
    edtQuantidade: TEdit;
    Label11: TLabel;
    Layout18: TLayout;
    Label12: TLabel;
    cbxGrupo: TComboBox;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    Layout14: TLayout;
    Label9: TLabel;
    cbxOrigem: TComboBox;
    origem0: TListBoxItem;
    origem1: TListBoxItem;
    origem2: TListBoxItem;
    origem3: TListBoxItem;
    origem4: TListBoxItem;
    origem5: TListBoxItem;
    origem6: TListBoxItem;
    origem7: TListBoxItem;
    procedure imgVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cbxNCMClick(Sender: TObject);
  private
    FTipoAlteracao: TAlteracao;
    { Private declarations }
  public
    { Public declarations }
    property TipoAlteracao: TAlteracao read FTipoAlteracao write FTipoAlteracao;
  end;

var
  frmEdicaoProduto: TfrmEdicaoProduto;

implementation

{$R *.fmx}

procedure TfrmEdicaoProduto.cbxNCMClick(Sender: TObject);
begin
  inherited;
  ShowMessage('113123');
end;

procedure TfrmEdicaoProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := TCloseAction.caFree;
  frmEdicaoProduto := nil;
end;

procedure TfrmEdicaoProduto.FormShow(Sender: TObject);
begin
  inherited;
  if (FTipoAlteracao = TAInclusao) then
    lblTitulo.Text := 'Novo produto'
  else
    lblTitulo.Text := 'Alterar produto';
end;

procedure TfrmEdicaoProduto.imgVoltarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
