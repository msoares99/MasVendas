unit Geral.Cadastros;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
  TfrmCadastroPadrao = class(TForm)
    Layout1: TLayout;
    btnVoltar: TImage;
    lblTitulo: TLabel;
    Layout2: TLayout;
    Edit1: TEdit;
    Image1: TImage;
    StyleBook1: TStyleBook;
    btnAdd: TImage;
    Layout3: TLayout;
    ListView1: TListView;
    Rectangle1: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

{$R *.fmx}

end.
