unit KrVerificarPermissaoDiretorios;

interface

uses
  System.Classes, System.SysUtils, StrUtils;

type
  TDiretorioVerificacao = record
    Diretorio: string;
    Descricao: string;
  end;

  TDiretorioVerificacaoArray = array of TDiretorioVerificacao;

procedure VerificaAcessoDiretorio(ADiretorio: string);

implementation

procedure VerificaAcessoDiretorio(ADiretorio: string);
var
  nomeArquivo: string;
  arquivo: TStringList;
begin
  try
    if (ADiretorio = '') then
      raise Exception.Create('N�o foi passado um diret�rio para ser verificado.');

    nomeArquivo := 'Teste.txt';
    nomeArquivo := IncludeTrailingPathDelimiter(ADiretorio) + nomeArquivo;

    arquivo := TStringList.Create;
    try
      arquivo.Add('Teste de acesso ao diret�rio do conhecimento');
      arquivo.SaveToFile(nomeArquivo);
    finally;
      arquivo.Free;
    end;

    if (FileExists(NomeArquivo)) then
      DeleteFile(NomeArquivo);
  except
    on e: Exception do
    begin
      if AnsiContainsStr(UpperCase(E.Message), 'I/O ERROR') or AnsiContainsStr(UpperCase(E.Message), 'CANNOT CREATE FILE') then
        raise Exception.Create('N�o foi poss�vel acessar o diret�rio. O usu�rio n�o tem permiss�o ao diret�rio ' + ADiretorio +
        ' ou o mesmo n�o existe.')
      else
        raise Exception.Create(E.Message);
    end;
  end;
end;

end.
