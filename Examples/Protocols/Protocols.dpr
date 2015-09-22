program Protocols;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
 TmyClass = class
  public
   procedure ForAdvancedUser1;
   procedure ForAdvancedUser2;
  public
   procedure ForRegularUser1;
   procedure ForRegularUser2;
 end;//TmyClass

procedure TmyClass.ForAdvancedUser1;
begin
  WriteLn('ForAdvancedUser1');
end;

procedure TmyClass.ForAdvancedUser2;
begin
  WriteLn('ForAdvancedUser2');
end;

procedure TmyClass.ForRegularUser1;
begin
  WriteLn('ForRegularUser1');
end;

procedure TmyClass.ForRegularUser2;
begin
  WriteLn('ForRegularUser2');
end;

var
 l_C : TmyClass;
begin
  try
    l_C := TmyClass.Create;
    try
      l_C.ForRegularUser1;
      l_C.ForRegularUser2;
    finally
      FreeAndNil(l_C);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
