program Protocols;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
 TmyClass = class
  public
   type
    Advanced1 = record
     private
      f_Provider : TmyClass;
     public
      constructor Create(aProvider: TmyClass);
      procedure ForAdvancedUser1;
      procedure ForAdvancedUser2;
    end;//Advanced1

    Advanced2 = record
     private
      f_Provider : TmyClass;
     public
      constructor Create(aProvider: TmyClass);
      procedure ForAdvancedUser1;
    end;//Advanced2
  private
   procedure ForAdvancedUser1;
   procedure ForAdvancedUser2;
  public
   procedure ForRegularUser1;
   procedure ForRegularUser2;
   function AsA1: Advanced1;
   function AsA2: Advanced2;
 end;//TmyClass

// TmyClass.Advanced1

constructor TmyClass.Advanced1.Create(aProvider: TmyClass);
begin
 f_Provider := aProvider;
end;

procedure TmyClass.Advanced1.ForAdvancedUser1;
begin
 f_Provider.ForAdvancedUser1;
end;

procedure TmyClass.Advanced1.ForAdvancedUser2;
begin
 f_Provider.ForAdvancedUser2;
end;

// TmyClass.Advanced2

constructor TmyClass.Advanced2.Create(aProvider: TmyClass);
begin
 f_Provider := aProvider;
end;

procedure TmyClass.Advanced2.ForAdvancedUser1;
begin
 f_Provider.ForAdvancedUser1;
end;

// TmyClass

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

function TmyClass.AsA1: Advanced1;
begin
  Result := Advanced1.Create(Self);
end;

function TmyClass.AsA2: Advanced1;
begin
  Result := Advanced2.Create(Self);
end;

var
 l_C : TmyClass;
begin
  try
    l_C := TmyClass.Create;
    try
      l_C.ForRegularUser1;
      l_C.ForRegularUser2;
      l_C.AsA1.ForAdvancedUser1;
      l_C.AsA1.ForAdvancedUser2;
      l_C.AsA2.ForAdvancedUser1;
    finally
      FreeAndNil(l_C);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
