unit uPixMercadoPago;

interface

uses
  FMX.Graphics, System.NetEncoding, System.JSON, REST.Types,
  REST.Client, FMX.Dialogs, System.Classes, FMX.Objects,
  FMX.StdCtrls;

type
  TPixMercadoPago = class
    private
      FAccessToken: string;
      FValor: string;
      FDescricao: string;
      FEmailCliente: string;
      FNomeCliente: string;
      FCPF: string;
      FCNPJ: string;
      FImgQRCode: TImage;
      FLblPixCopiaCola: Tlabel;
      FIdCobrança: Tlabel;
      function MontarJson(): string;
      function Base64ToBitmap(const ABase64: string): TBitmap;
      procedure TratarJson(pJson: string);
    public
      property AccessToken: string read FAccessToken write FAccessToken;
      property Valor: string read FValor write FValor;
      property Descricao: string read FDescricao write FDescricao;
      property EmailCliente: string read FEmailCliente write FEmailCliente;
      property NomeCliente: string read FNomeCliente write FNomeCliente;
      property CPF: string read FCPF write FCPF;
      property CNPJ: string read FCNPJ write FCNPJ;
      property ImgQRCode: TImage read FImgQRCode write FImgQRCode;
      property LblPixCopiaCola: Tlabel read FLblPixCopiaCola write FLblPixCopiaCola;
      property IdCobrança: Tlabel read FIdCobrança write FIdCobrança;
      procedure GerarCobrancaPix();
      function ConsultarCobranca(pIdCobrança: string): Boolean;
  end;

implementation

{ TPixMercadoPago }

function TPixMercadoPago.Base64ToBitmap(const ABase64: string): TBitmap;
var
  lDecoder: TBase64Encoding;
  lStream: TStringStream;
begin
  Result := TBitmap.Create;
  try
    lDecoder := TBase64Encoding.Create;
    try
      lStream := TStringStream.Create(lDecoder.DecodeStringToBytes(ABase64));
      try
        Result.LoadFromStream(lStream);
      finally
        lStream.Free;
      end;
    finally
      lDecoder.Free;
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TPixMercadoPago.ConsultarCobranca(pIdCobrança: string): Boolean;
var
  lRESTClient: TRESTClient;
  lRESTRequest: TRESTRequest;
  lRESTResponse: TRESTResponse;
  lURLBase: string;
begin
  lURLBase := 'https://api.mercadopago.com/v1/payments/' + pIdCobrança;
  lRESTClient := TRESTClient.Create(lURLBase);
  lRESTRequest := TRESTRequest.Create(nil);
  lRESTResponse := TRESTResponse.Create(nil);
  try
    lRESTClient.Accept := 'application/json';
    lRESTRequest.Response := lRESTResponse;
    lRESTRequest.Client := lRESTClient;
    lRESTRequest.Method := TRESTRequestMethod.rmGET;
    lRESTRequest.Accept := 'application/json';
    lRESTRequest.AcceptCharset := 'utf-8, *;q=0.8';
    lRESTRequest.Params.Clear;
    lRESTRequest.Params.AddItem('Authorization', 'Bearer ' + FAccessToken, TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    lRESTRequest.Execute;

    Result := (lRESTResponse.JSONValue.GetValue<string>('status') = 'approved');
  finally
    lRESTClient.Free;
    lRESTRequest.Free;
    lRESTResponse.Free;
  end;
end;

procedure TPixMercadoPago.GerarCobrancaPix();
var
  lRESTClient: TRESTClient;
  lRESTRequest: TRESTRequest;
  lRESTResponse: TRESTResponse;
  lURLBase: string;
begin
  lURLBase := 'https://api.mercadopago.com/v1/payments';
  lRESTClient := TRESTClient.Create(lURLBase);
  lRESTRequest := TRESTRequest.Create(nil);
  lRESTResponse := TRESTResponse.Create(nil);
  try
    lRESTClient.Accept := 'application/json';
    lRESTRequest.Response := lRESTResponse;
    lRESTRequest.Client := lRESTClient;
    lRESTRequest.Method := TRESTRequestMethod.rmPOST;
    lRESTRequest.Accept := 'application/json';
    lRESTRequest.AcceptCharset := 'utf-8, *;q=0.8';
    lRESTRequest.Params.Clear;
    lRESTRequest.Params.AddItem('Authorization', 'Bearer ' + FAccessToken, TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    lRESTRequest.Params.AddItem('Content-Type', 'application/json', TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    lRESTRequest.AddBody(MontarJson, TRESTContentType.ctAPPLICATION_JSON);
    lRESTRequest.Execute;

    if (lRESTResponse.StatusCode = 201) then
      TratarJson(lRESTResponse.Content)
    else
      ShowMessage('Erro ao gerar cobrança PIX: ' + lRESTResponse.Content);
  finally
    lRESTClient.Free;
    lRESTRequest.Free;
    lRESTResponse.Free;
  end;
end;

function TPixMercadoPago.MontarJson(): string;
var
  lJson: TJSONObject;
  lPayer: TJSONObject;
  lIdentification: TJSONObject;
begin
  Result := '';
  lJson := TJSONObject.Create;
  lIdentification := TJSONObject.Create;
  lPayer := TJSONObject.Create;
  try
    lJson.AddPair('transaction_amount', TJSONNumber.Create(FValor));
    lJson.AddPair('description', TJSONString.Create(FDescricao));
    lJson.AddPair('payment_method_id', TJSONString.Create('pix'));

    if (FCPF <> '') then
    begin
      lIdentification.AddPair('type', TJSONString.Create('CPF'));
      lIdentification.AddPair('number', TJSONString.Create(FCPF));
    end
    else if (FCNPJ <> '') then
    begin
      lIdentification.AddPair('type', TJSONString.Create('CNPJ'));
      lIdentification.AddPair('number', TJSONString.Create(FCNPJ));
    end;

    lPayer.AddPair('email', TJSONString.Create(FEmailCliente));
    lPayer.AddPair('first_name', TJSONString.Create(FNomeCliente));
    lPayer.AddPair('last_name', TJSONString.Create(''));
    lPayer.AddPair('identification', lIdentification);
    lJson.AddPair('payer', lPayer);

    Result := lJson.ToString;
  finally
    lJson.Free;
  end;
end;

procedure TPixMercadoPago.TratarJson(pJson: string);
var
  lJsonObj,lJsonObj1,lJsonObj2: TJSONObject;
  lqrcodeObj, lqrcodebase64Obj: TJSONValue;
  lBitmap: TBitmap;
begin
  lJsonObj := TJSONObject.ParseJSONValue(pJson) as TJSONObject;
  try
    lJsonObj1 := lJsonObj.Values['point_of_interaction'].GetValue<TJSONObject>;
    lJsonObj2 := lJsonObj1.Values['transaction_data'].GetValue<TJSONObject>;

    lqrcodeObj := lJsonObj2.GetValue('qr_code');
    lqrcodebase64Obj := lJsonObj2.GetValue('qr_code_base64');;

    lBitmap := Base64ToBitmap(lqrcodebase64Obj.ToString);

    if Assigned(FImgQRCode) then
      FImgQRCode.Bitmap.Assign(lBitmap);

    if Assigned(FLblPixCopiaCola) then
      FLblPixCopiaCola.Text := lqrcodeObj.ToString;

    if Assigned(FIdCobrança) then
      FIdCobrança.Text := lJsonObj.GetValue('id').ToString;
  finally
    lJsonObj.Free;
  end;
end;

end.
