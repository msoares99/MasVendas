unit Geral.Cadastros.Edicao.Padrao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmCadastrosEdicaoPadrao = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    lblTitulo: TLabel;
    imgVoltar: TImage;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastrosEdicaoPadrao: TfrmCadastrosEdicaoPadrao;

implementation

{$R *.fmx}

end.
