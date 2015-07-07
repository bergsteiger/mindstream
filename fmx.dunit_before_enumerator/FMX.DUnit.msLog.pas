unit FMX.DUnit.msLog;

interface

uses
 System.Classes,
 Script.Interfaces
 ;

type
 TmsLog = class;

 TmsLogLambda = reference to procedure (aLog: TmsLog);

 TmsLog = class(TObject, IscriptCompileLog, IscriptRunLog)
  strict private
   f_FS : TFileStream;
  protected
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
   class procedure Log(const aFileName: String; aLambda: TmsLogLambda);
   constructor Create(const aFileName: String);
   destructor Destroy; override;
   procedure ToLog(const aString: AnsiString); overload;
   procedure ToLog(const aString: String); overload;
 end;//TmsLog

implementation

uses
 System.SysUtils
 ;

// TmsLog

function TmsLog.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

function TmsLog._AddRef: Integer;
begin
 Result := -1;
end;

function TmsLog._Release: Integer;
begin
 Result := -1;
end;

class procedure TmsLog.Log(const aFileName: String; aLambda: TmsLogLambda);
var
 l_Log : TmsLog;
begin
 l_Log := Create(aFileName);
 try
  aLambda(l_Log);
 finally
  FreeAndNil(l_Log);
 end;//try..finally
end;

constructor TmsLog.Create(const aFileName: String);
begin
 inherited Create;
 f_FS := TFileStream.Create(aFileName, fmCreate);
end;

destructor TmsLog.Destroy;
begin
 FreeAndNil(f_FS);
 inherited;
end;

procedure TmsLog.ToLog(const aString: AnsiString);
const
 cEOL : ANSIString = #13#10;
begin//OutLn
 f_FS.Write(aString[1], Length(aString));
 f_FS.Write(cEOL[1], Length(cEOL));
end;//OutLn

procedure TmsLog.ToLog(const aString: String);
begin
 ToLog(AnsiString(aString));
end;

end.
