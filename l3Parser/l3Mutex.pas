unit l3Mutex;
 
{$Include l3Define.inc}

interface

uses
  Windows,
  l3ProtoObject
  ;

type
 Tl3Mutex = class(Tl3ProtoObject)
 private
 // private fields
   f_Handle : THandle;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   procedure Enter;
   procedure Leave;
   constructor Create(const aName: AnsiString;
    InitialLocked: Boolean = False); reintroduce;
 end;//Tl3Mutex

implementation

// start class Tl3Mutex

procedure Tl3Mutex.Enter;
//#UC START# *540EDC2E03AF_540EDC10016F_var*
//#UC END# *540EDC2E03AF_540EDC10016F_var*
begin
//#UC START# *540EDC2E03AF_540EDC10016F_impl*
 WaitForSingleObject(f_Handle, INFINITE);
//#UC END# *540EDC2E03AF_540EDC10016F_impl*
end;//Tl3Mutex.Enter

procedure Tl3Mutex.Leave;
//#UC START# *540EDC3E006A_540EDC10016F_var*
//#UC END# *540EDC3E006A_540EDC10016F_var*
begin
//#UC START# *540EDC3E006A_540EDC10016F_impl*
 ReleaseMutex(f_Handle);
//#UC END# *540EDC3E006A_540EDC10016F_impl*
end;//Tl3Mutex.Leave

constructor Tl3Mutex.Create(const aName: AnsiString;
  InitialLocked: Boolean = False);
//#UC START# *540EDC5F015E_540EDC10016F_var*
//#UC END# *540EDC5F015E_540EDC10016F_var*
begin
//#UC START# *540EDC5F015E_540EDC10016F_impl*
 inherited Create;
 f_Handle := CreateMutexA(nil, InitialLocked, PAnsiChar(aName));
//#UC END# *540EDC5F015E_540EDC10016F_impl*
end;//Tl3Mutex.Create

procedure Tl3Mutex.Cleanup;
//#UC START# *479731C50290_540EDC10016F_var*
//#UC END# *479731C50290_540EDC10016F_var*
begin
//#UC START# *479731C50290_540EDC10016F_impl*
 CloseHandle(f_Handle);
 inherited;
//#UC END# *479731C50290_540EDC10016F_impl*
end;//Tl3Mutex.Cleanup

end.