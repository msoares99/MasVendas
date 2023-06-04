unit Produto.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, Geral.Cadastros, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Edit, FMX.Objects, FMX.Controls.Presentation, FMX.ListView, FMX.Layouts;

type
  TfrmCadastroProduto = class(TfrmCadastroPadrao)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroProduto: TfrmCadastroProduto;

implementation

{$R *.fmx}

procedure TfrmCadastroProduto.btnVoltarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadastroProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := TCloseAction.caFree;
  frmCadastroProduto := nil;
end;

procedure TfrmCadastroProduto.FormShow(Sender: TObject);
begin
  inherited;
  for var I := 0 to 30 do
  begin
    with ListView1.Items.Add do
    begin
      TListItemText(Objects.FindDrawable('txtProduto')).Text := 'Sistema de automação comercial';
      TListItemText(Objects.FindDrawable('txtID')).Text := 'ID: 00001';
      TListItemText(Objects.FindDrawable('txtValor')).Text := 'Preço Unit.: R$ 500,00';
    end;
  end;
end;

end.
