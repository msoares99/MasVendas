{
  ===========================================================================

  Copyright (c) 2023 MANASSÉS DE ASSIS SOARES

  Todos os direitos reservados.

  [Classe de conexão com a API da viaCEP]

  ===========================================================================
}

unit uCEP;

interface

uses
  REST.Types, REST.Response.Adapter, REST.Client, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCEPRecord = record
    Rua, Bairro, Numero, Cidade, UF: string;
  end;

  TCEP = class
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FRESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    FFDMemTable: TFDMemTable;
  public
    function ConsultarCep(pCEP: string): TCEPRecord;
  end;

implementation

{ TCEP }

function TCEP.ConsultarCep(pCEP: string): TCEPRecord;
begin
  FRESTClient := TRESTClient.Create(nil);
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);
  FRESTResponseDataSetAdapter := TRESTResponseDataSetAdapter.Create(nil);
  FFDMemTable := TFDMemTable.Create(nil);

  try
    FRESTClient.BaseURL := 'https://viacep.com.br/ws/' + pCEP + '/json';
    FRESTRequest.Client := FRESTClient;
    FRESTRequest.Response := FRESTResponse;
    FRESTResponseDataSetAdapter.Response := FRESTResponse;
    FRESTResponseDataSetAdapter.Dataset := FFDMemTable;
    FRESTRequest.Execute;

    if (not FFDMemTable.IsEmpty) then
    begin
      Result.Rua := FFDMemTable.FieldByName('logradouro').AsString;
      Result.Bairro := FFDMemTable.FieldByName('bairro').AsString;
      Result.Numero := FFDMemTable.FieldByName('siafi').AsString;
      Result.Cidade := FFDMemTable.FieldByName('localidade').AsString;
      Result.UF := FFDMemTable.FieldByName('uf').AsString;
    end;
  finally
    FRESTClient.Free;
    FRESTRequest.Free;
    FRESTResponse.Free;
    FRESTResponseDataSetAdapter.Free;
    FFDMemTable.Free;
  end;
end;

end.
