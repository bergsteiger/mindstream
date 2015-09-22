program Protocols;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
 TmyClass = class

 end;//TmyClass

var
 l_C : TmyClass;
begin
  try
    l_C := TmyClass.Create;
    try

    finally
      FreeAndNil(l_C);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
