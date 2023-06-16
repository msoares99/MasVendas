unit Configuracao.DadosEmpresa;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Geral.Cadastros.Edicao.Padrao, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts, FMX.Edit, FMX.ListBox;

type
  TfrmConfiguracaoDadosEmpresa = class(TfrmCadastrosEdicaoPadrao)
    VertScrollBox1: TVertScrollBox;
    Layout4: TLayout;
    edtRazao: TEdit;
    Label6: TLabel;
    Layout13: TLayout;
    Layout10: TLayout;
    Label7: TLabel;
    cbxTpPessoa: TComboBox;
    Layout12: TLayout;
    Label8: TLabel;
    tpPessoaJuridica: TListBoxItem;
    tpPessoaFisica: TListBoxItem;
    edtCNPJCPF: TEdit;
    Layout2: TLayout;
    edtNomeFantasia: TEdit;
    Label1: TLabel;
    Layout5: TLayout;
    Layout3: TLayout;
    edtCodBarras: TEdit;
    Label2: TLabel;
    Layout6: TLayout;
    edtCodNota: TEdit;
    Label3: TLabel;
    Layout7: TLayout;
    Layout8: TLayout;
    Label4: TLabel;
    cbxCNAE: TComboBox;
    Layout9: TLayout;
    Label5: TLabel;
    cbxCRT: TComboBox;
    crtSimples: TListBoxItem;
    crtSimples2: TListBoxItem;
    crtNormal: TListBoxItem;
    Layout22: TLayout;
    edtBairro: TEdit;
    Label15: TLabel;
    Layout23: TLayout;
    Layout24: TLayout;
    edtComplemento: TEdit;
    Label16: TLabel;
    Layout27: TLayout;
    Layout28: TLayout;
    edtCidade: TEdit;
    Label18: TLabel;
    Layout30: TLayout;
    edtPais: TEdit;
    Label19: TLabel;
    Layout29: TLayout;
    Layout31: TLayout;
    Label21: TLabel;
    cbxUF: TComboBox;
    Layout33: TLayout;
    Layout34: TLayout;
    edtCEP: TEdit;
    Label23: TLabel;
    Layout25: TLayout;
    edtNumero: TEdit;
    Label17: TLabel;
    Layout35: TLayout;
    edtLogradouro: TEdit;
    Label24: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracaoDadosEmpresa: TfrmConfiguracaoDadosEmpresa;

implementation

{$R *.fmx}

procedure TfrmConfiguracaoDadosEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := TCloseAction.caFree;
  frmConfiguracaoDadosEmpresa := nil;
end;

procedure TfrmConfiguracaoDadosEmpresa.imgVoltarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
