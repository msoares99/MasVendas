unit uCNPJ;

interface

uses
  REST.Client, REST.Types, REST.Response.Adapter, FireDAC.Comp.Client, Data.DB;

type
  TCNPJRecord = record
    RazaoSocial, Rua, Bairro, Numero, CEP, Cidade, UF: string;
  end;

  TCNPJ = class
    public
      function ConsultarCNPJ(pCNPJ: string): TCNPJRecord;
  end;

implementation

{ TCNPJ }

function TCNPJ.ConsultarCNPJ(pCNPJ: string): TCNPJRecord;
var
  lRESTClient: TRESTClient;
  lRESTRequest: TRESTRequest;
  lRESTResponse: TRESTResponse;
  lRESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
  lFDMemTable: TFDMemTable;
begin
  lRESTClient := TRESTClient.Create(nil);
  lRESTRequest := TRESTRequest.Create(nil);
  lRESTResponse := TRESTResponse.Create(nil);
  lRESTResponseDataSetAdapter := TRESTResponseDataSetAdapter.Create(nil);
  lFDMemTable := TFDMemTable.Create(nil);
  try
    lRESTClient.BaseURL := 'https://receitaws.com.br/v1/cnpj/' + pCNPJ;
    lRESTRequest.Client := lRESTClient;
    lRESTRequest.Response := lRESTResponse;
    lRESTResponseDataSetAdapter.Response := lRESTResponse;
    lRESTResponseDataSetAdapter.Dataset := lFDMemTable;
    lRESTRequest.Execute;

    if (not lFDMemTable.IsEmpty) then
    begin
      Result.RazaoSocial := lFDMemTable.FieldByName('nome').AsString;
      Result.Rua := lFDMemTable.FieldByName('logradouro').AsString;
      Result.Bairro := lFDMemTable.FieldByName('bairro').AsString;
      Result.Numero := lFDMemTable.FieldByName('numero').AsString;
      Result.CEP := lFDMemTable.FieldByName('cep').AsString;
      Result.Cidade := lFDMemTable.FieldByName('municipio').AsString;
      Result.UF := lFDMemTable.FieldByName('uf').AsString;
    end;
  finally
    lRESTClient.Free;
    lRESTRequest.Free;
    lRESTResponse.Free;
    lRESTResponseDataSetAdapter.Free;
    lFDMemTable.Free;
  end;
end;

end.
