unit ClienteFornecedor.Edicao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Geral.Cadastros.Edicao.Padrao, FMX.Layouts, FMX.Objects,
  FMX.Controls.Presentation, FMX.ListBox, FMX.Edit, FMX.TabControl, System.Actions, FMX.ActnList;

type
  TAlteracao = (TAEdicao, TAInclusao);

  TfrmEdicaoClienteFornecedor = class(TfrmCadastrosEdicaoPadrao)
    tbClienteFornecedor: TTabControl;
    tabGeral: TTabItem;
    tabEndereco: TTabItem;
    Layout2: TLayout;
    Layout4: TLayout;
    edtRazao: TEdit;
    Label6: TLabel;
    Layout5: TLayout;
    edtFantasia: TEdit;
    Label9: TLabel;
    Layout6: TLayout;
    Layout13: TLayout;
    edtInscEst: TEdit;
    Label7: TLabel;
    Layout14: TLayout;
    edtInscMuni: TEdit;
    Label8: TLabel;
    Layout7: TLayout;
    Layout3: TLayout;
    Label1: TLabel;
    cbxTpPessoa: TComboBox;
    PessoaFisica: TListBoxItem;
    PessoaJuridica: TListBoxItem;
    Layout9: TLayout;
    Label2: TLabel;
    cbxTpContribuinte: TComboBox;
    Contribuinte: TListBoxItem;
    NaoContribuinte: TListBoxItem;
    Isento: TListBoxItem;
    Layout8: TLayout;
    Layout10: TLayout;
    Label3: TLabel;
    cbxTpConsumidor: TComboBox;
    Revenda: TListBoxItem;
    Final: TListBoxItem;
    Layout11: TLayout;
    Label4: TLabel;
    cbxTpCadastro: TComboBox;
    Cliente: TListBoxItem;
    Fornecedor: TListBoxItem;
    Layout12: TLayout;
    Label5: TLabel;
    edtCNPJ: TEdit;
    Layout15: TLayout;
    Layout16: TLayout;
    edtTelefone: TEdit;
    Label10: TLabel;
    Layout17: TLayout;
    edtEmail: TEdit;
    Label11: TLabel;
    Rectangle2: TRectangle;
    Layout18: TLayout;
    Layout19: TLayout;
    Image2: TImage;
    Label12: TLabel;
    Label13: TLabel;
    Image3: TImage;
    ActionList1: TActionList;
    ChangeTabAction1: TChangeTabAction;
    ChangeTabAction2: TChangeTabAction;
    Layout20: TLayout;
    Layout22: TLayout;
    edtBairro: TEdit;
    Label15: TLabel;
    Layout23: TLayout;
    Layout24: TLayout;
    edtComplemento: TEdit;
    Label16: TLabel;
    Layout29: TLayout;
    Layout31: TLayout;
    Label21: TLabel;
    cbxUF: TComboBox;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    Layout33: TLayout;
    Layout34: TLayout;
    edtCEP: TEdit;
    Label23: TLabel;
    Layout35: TLayout;
    edtLogradouro: TEdit;
    Label24: TLabel;
    Layout25: TLayout;
    edtNumero: TEdit;
    Label17: TLabel;
    Layout27: TLayout;
    Layout28: TLayout;
    edtCidade: TEdit;
    Label18: TLabel;
    Layout30: TLayout;
    edtPais: TEdit;
    Label19: TLabel;
    procedure edtCNPJChange(Sender: TObject);
    procedure Layout18Click(Sender: TObject);
    procedure Layout19Click(Sender: TObject);
    procedure ChangeTabAction1Update(Sender: TObject);
    procedure ChangeTabAction2Update(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FTipoAlteracao: TAlteracao;
    { Private declarations }
  public
    { Public declarations }
    property TipoAlteracao: TAlteracao read FTipoAlteracao write FTipoAlteracao;
  end;

var
  frmEdicaoClienteFornecedor: TfrmEdicaoClienteFornecedor;

implementation

{$R *.fmx}

procedure TfrmEdicaoClienteFornecedor.ChangeTabAction1Update(Sender: TObject);
begin
  inherited;
  tbClienteFornecedor.ActiveTab := tabGeral;
end;

procedure TfrmEdicaoClienteFornecedor.ChangeTabAction2Update(Sender: TObject);
begin
  inherited;
  tbClienteFornecedor.ActiveTab := tabEndereco;
end;

procedure TfrmEdicaoClienteFornecedor.edtCNPJChange(Sender: TObject);
begin
  inherited;

  var lCNPJ := TEdit(Sender).Text;

  case Length(lCNPJ) of
    3: lCNPJ := lCNPJ + '.';
    7: lCNPJ := lCNPJ + '.';
    11: lCNPJ := lCNPJ + '/';
    15: lCNPJ := lCNPJ + '-';
  end;

  TEdit(Sender).Text := lCNPJ;
  TEdit(Sender).SelStart := Length(lCNPJ);
end;

procedure TfrmEdicaoClienteFornecedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := TCloseAction.caFree;
  frmEdicaoClienteFornecedor := nil;
end;

procedure TfrmEdicaoClienteFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  Layout18.Opacity := 0.6;
end;

procedure TfrmEdicaoClienteFornecedor.imgVoltarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEdicaoClienteFornecedor.Layout18Click(Sender: TObject);
begin
  inherited;
  Layout18.Opacity := 0.6;
  Layout19.Opacity := 1;
  ChangeTabAction1.Execute;
end;

procedure TfrmEdicaoClienteFornecedor.Layout19Click(Sender: TObject);
begin
  inherited;
  Layout19.Opacity := 0.6;
  Layout18.Opacity := 1;
  ChangeTabAction2.Execute;
end;

end.
