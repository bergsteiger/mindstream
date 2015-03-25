unit Script.WordsInterfaces;

interface

uses
 System.Generics.Collections,
 Core.Obj,
 Script.Interfaces
 ;

type
 TscriptValueType = (script_vtUnknown, script_vtString, script_vtObject);

 TscriptValue = record
  public
   rValueType : TscriptValueType;
  private
   rAsString : String;
   rAsObject : TObject;
  public
   constructor Create(const aString: String); overload;
   constructor Create(anObject: TObject); overload;
   function AsString: String;
   function AsObject: TObject;
   function AsPrintable: String;
 end;//TscriptValue

 TscriptValuesStack = TList<TscriptValue>;

 TscriptContext = class(TCoreObject)
  private
   f_Log : IscriptLog;
   f_Stack : TscriptValuesStack;
   f_LogLevel : Integer;
  protected
   procedure Cleanup; override;
  public
   constructor Create(const aLog: IscriptLog);
   procedure Enter(const aString: String; const aDetails: String);
   procedure Leave(const aString: String; const aDetails: String);
   procedure LogStack(const aString: String; const aDetails: TscriptValue);
   procedure Log(const aString: String; const aDetails: String); virtual;
    {* - Выводит сообщение в лог. }
   function Pop: TscriptValue;
   procedure Push(const aValue: TscriptValue);
   function PopString: String;
   procedure PushString(const aString: String);
   function PopObject: TObject;
   procedure PushObject(const anObject: TObject);
 end;//TscriptContext

 IscriptCompiler = interface;

 TscriptCompileContext = class(TscriptContext)
  private
   f_Parser : IscriptParser;
   f_Compiler : IscriptCompiler;
  protected
   procedure Cleanup; override;
  public
   constructor Create(const aLog      : IscriptCompileLog;
                      const aParser   : IscriptParser;
                      const aCompiler : IscriptCompiler);
   procedure Log(const aString: String; const aDetails: String); override;
   property Parser: IscriptParser
    read f_Parser;
   property Compiler: IscriptCompiler
    read f_Compiler;
 end;//TscriptCompileContext

 TscriptRunContext = class(TscriptContext)
  public
   constructor Create(const aLog: IscriptRunLog);
 end;//TscriptRunContext

 IscriptWord = interface
  {* - слово скриптовой машины. }
  procedure DoIt(aContext: TscriptContext);
   {* - собственно процедура для выполнения слова словаря. }
 end;//IscriptWord

 IscriptCode = interface
  {* - компилированный код скриптовой машины. }
  procedure Run(aContext : TscriptRunContext);
   {* - выполняет компилированный код. }
 end;//IscriptCode

 IscriptCompiler = interface
  {* - компилятор кода скриптовой машины. }
   procedure CompileWord(const aWord: IscriptWord);
    {* - компилирует указанное слово в код. }
   function CompiledCode: IscriptCode;
    {* - скомпилированный код }
 end;//IscriptCompiler

implementation

uses
 TypInfo,
 System.SysUtils,
 System.Classes
 ;

// TscriptValue

constructor TscriptValue.Create(const aString: String);
begin
 inherited;
 rValueType := script_vtString;
 rAsString := aString;
end;

constructor TscriptValue.Create(anObject: TObject);
begin
 inherited;
 rValueType := script_vtObject;
 rAsObject := anObject;
end;

function TscriptValue.AsString: String;
begin
 Assert(rValueType = script_vtString);
 Result := rAsString;
end;

function TscriptValue.AsObject: TObject;
begin
 Assert(rValueType = script_vtObject);
 Result := rAsObject;
end;

function TscriptValue.AsPrintable: String;
begin
 Result := '';
 Case rValueType of
  script_vtUnknown:
   Result := '(unknown)';
  script_vtString:
   Result := rAsString;
  script_vtObject:
  begin
   if (rAsObject = nil) then
   begin
    Result := 'nil';
    Exit;
   end;//rAsObject = nil
   Result := rAsObject.ClassName;
   if (rAsObject Is TComponent) then
    Result := TComponent(rAsObject).Name + ': ' + Result;
  end;//script_vtObject
  else
   Assert(false, 'Неизвестный тип значения');
 end;//Case rValueType
end;

// TscriptContext

constructor TscriptContext.Create(const aLog: IscriptLog);
begin
 inherited Create;
 f_Log := aLog;
 f_Stack := TscriptValuesStack.Create;
end;

procedure TscriptContext.Enter(const aString: String; const aDetails: String);
begin
 Log('Enter: ' + aString, aDetails);
 Inc(f_LogLevel);
end;

procedure TscriptContext.Leave(const aString: String; const aDetails: String);
begin
 Dec(f_LogLevel);
 Log('Leave: ' + aString, aDetails);
end;

procedure TscriptContext.LogStack(const aString: String; const aDetails: TscriptValue);
begin
 Log(aString + ' ' + GetEnumName(TypeInfo(TscriptValueType), Ord(aDetails.rValueType)),
     aDetails.AsPrintable + ' stack size: ' + IntToStr(f_Stack.Count));
end;

procedure TscriptContext.Log(const aString: String; const aDetails: String);
 {* - Выводит сообщение в лог. }
var
 l_String : String;
begin
 if (f_Log <> nil) then
 begin
  l_String := aString;
  if (aDetails <> '') then
   l_String := l_String + ': ' + aDetails;
  f_Log.ToLog(StringOfChar(#32, f_LogLevel * 2) + l_String);
 end;//f_Log <> nil
end;

function TscriptContext.Pop: TscriptValue;
begin
 Assert(f_Stack.Count > 0);
 Result := f_Stack.Last;
 f_Stack.Delete(f_Stack.Count - 1);
 LogStack('pop', Result);
end;

procedure TscriptContext.Push(const aValue: TscriptValue);
begin
 f_Stack.Add(aValue);
 LogStack('push', aValue);
end;

function TscriptContext.PopString: String;
begin
 Result := Pop.AsString;
end;

procedure TscriptContext.PushString(const aString: String);
begin
 Push(TscriptValue.Create(aString));
end;

function TscriptContext.PopObject: TObject;
begin
 Result := Pop.AsObject;
end;

procedure TscriptContext.PushObject(const anObject: TObject);
begin
 Push(TscriptValue.Create(anObject));
end;

procedure TscriptContext.Cleanup;
begin
 f_Log := nil;
 FreeAndNil(f_Stack);
 inherited;
end;

// TscriptCompileContext

constructor TscriptCompileContext.Create(const aLog      : IscriptCompileLog;
                                         const aParser   : IscriptParser;
                                         const aCompiler : IscriptCompiler);
begin
 Assert(aParser <> nil);
 Assert(aCompiler <> nil);
 inherited Create(aLog);
 f_Parser := aParser;
 f_Compiler := aCompiler;
end;

procedure TscriptCompileContext.Log(const aString: String; const aDetails: String);
begin
 inherited Log(IntToStr(f_Parser.CurrentLineNumber) + ': ' + aString, aDetails);
end;

procedure TscriptCompileContext.Cleanup;
begin
 f_Parser := nil;
 f_Compiler := nil;
 inherited;
end;

// TscriptRunContext

constructor TscriptRunContext.Create(const aLog: IscriptRunLog);
begin
 inherited Create(aLog);
end;

end.
