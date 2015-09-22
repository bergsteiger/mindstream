program Protocols;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
 TmyClass = class
  public
   // Дальше идут протоколы "для продвинутого пользователя":
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

    Advanced3 = record
     private
      f_Provider : TmyClass;
     public
      constructor Create(aProvider: TmyClass);
      procedure ForAdvancedUser2;
    end;//Advanced3

   // Дальше идут протоколы "для экспертов":
   type
    Expert1 = record
     private
      f_Provider : TmyClass;
     public
      constructor Create(aProvider: TmyClass);
      procedure ForExpertUser1;
      procedure ForExpertUser2;
    end;//Expert1

    Expert2 = record
     private
      f_Provider : TmyClass;
     public
      constructor Create(aProvider: TmyClass);
      procedure ForExpertUser1;
    end;//Expert2

    Expert3 = record
     private
      f_Provider : TmyClass;
     public
      constructor Create(aProvider: TmyClass);
      procedure ForExpertUser2;
    end;//Expert3

  private
   procedure ForAdvancedUser1;
   procedure ForAdvancedUser2;

   procedure ForExpertUser1;
   procedure ForExpertUser2;
  public
   procedure ForRegularUser1;
   procedure ForRegularUser2;
  public
   // Далее идут методы для получения "протоколов"
   function AsA1: Advanced1;
   function AsA2: Advanced2;
   function AsA3: Advanced3;

   function AsE1: Expert1;
   function AsE2: Expert2;
   function AsE3: Expert3;
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

// TmyClass.Expert1

constructor TmyClass.Expert1.Create(aProvider: TmyClass);
begin
 f_Provider := aProvider;
end;

procedure TmyClass.Expert1.ForExpertUser1;
begin
 f_Provider.ForExpertUser1;
end;

procedure TmyClass.Expert1.ForExpertUser2;
begin
 f_Provider.ForExpertUser2;
end;

// TmyClass.Expert2

constructor TmyClass.Expert2.Create(aProvider: TmyClass);
begin
 f_Provider := aProvider;
end;

procedure TmyClass.Expert2.ForExpertUser1;
begin
 f_Provider.ForExpertUser1;
end;

// TmyClass.Expert3

constructor TmyClass.Expert3.Create(aProvider: TmyClass);
begin
 f_Provider := aProvider;
end;

procedure TmyClass.Expert3.ForExpertUser2;
begin
 f_Provider.ForExpertUser2;
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

// TmyClass.Advanced3

constructor TmyClass.Advanced3.Create(aProvider: TmyClass);
begin
 f_Provider := aProvider;
end;

procedure TmyClass.Advanced3.ForAdvancedUser2;
begin
 f_Provider.ForAdvancedUser2;
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

procedure TmyClass.ForExpertUser1;
begin
  WriteLn('ForExpertUser1');
end;

procedure TmyClass.ForExpertUser2;
begin
  WriteLn('ForExpertUser2');
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

function TmyClass.AsA2: Advanced2;
begin
  Result := Advanced2.Create(Self);
end;

function TmyClass.AsA3: Advanced3;
begin
  Result := Advanced3.Create(Self);
end;

function TmyClass.AsE1: Expert1;
begin
  Result := Expert1.Create(Self);
end;

function TmyClass.AsE2: Expert2;
begin
  Result := Expert2.Create(Self);
end;

function TmyClass.AsE3: Expert3;
begin
  Result := Expert3.Create(Self);
end;

var
 l_C : TmyClass;
begin
  try
    //CloseFile(Output);
    AssignFile(Output, ParamStr(0) + '.out');
    Rewrite(Output);
    l_C := TmyClass.Create;
    try
      l_C.ForRegularUser1;
      l_C.ForRegularUser2;

      l_C.AsA1.ForAdvancedUser1;
      l_C.AsA1.ForAdvancedUser2;

      l_C.AsA2.ForAdvancedUser1;

      l_C.AsA3.ForAdvancedUser2;

      l_C.AsE1.ForExpertUser1;
      l_C.AsE1.ForExpertUser2;

      l_C.AsE2.ForExpertUser1;

      l_C.AsE3.ForExpertUser2;
    finally
      FreeAndNil(l_C);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
