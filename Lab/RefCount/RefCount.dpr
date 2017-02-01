program RefCount;

{$R *.res}

uses
  System.SysUtils

  , l3ObjectsSpy
  ;

begin
  try
    l3ObjectsSpy.Test;
    //ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
