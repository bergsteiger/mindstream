program RefCount;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils

  , l3ObjectsSpy
  ;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    l3ObjectsSpy.Test;
    //ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
