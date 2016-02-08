unit l3ProxyStream;



{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3BaseStream,
  Classes
  ;

type
 Tl3ProxyStream = class(Tl3Stream)
  {* Поток служащий обёрткой над другим потоком }
 private
 // private fields
   f_Inner : IStream;
    {* Поток, над которым мы оборачиваемся}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // overridden public methods
   function Read(var Buffer;
    Count: Integer): Integer; override;
   function Write(const Buffer;
    Count: Integer): Integer; override;
   function Seek(const Offset: Int64;
    Origin: TSeekOrigin): Int64; override;
 public
 // public methods
   constructor Create(const aStream: IStream); reintroduce;
   class function Make(const aStream: IStream): IStream; reintroduce;
     {* Создаёт обёртку над потоком }
   procedure CloseInner;
     {* Освобождает внутренний поток }
 end;//Tl3ProxyStream

implementation

uses
  ComObj,
  l3Types
  ;

// start class Tl3ProxyStream

constructor Tl3ProxyStream.Create(const aStream: IStream);
//#UC START# *49BE699000B0_49BE68B201D1_var*
//#UC END# *49BE699000B0_49BE68B201D1_var*
begin
//#UC START# *49BE699000B0_49BE68B201D1_impl*
 Assert(aStream <> nil);
 inherited Create;
 f_Inner := aStream;
//#UC END# *49BE699000B0_49BE68B201D1_impl*
end;//Tl3ProxyStream.Create

class function Tl3ProxyStream.Make(const aStream: IStream): IStream;
var
 l_Inst : Tl3ProxyStream;
begin
 l_Inst := Create(aStream);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure Tl3ProxyStream.CloseInner;
//#UC START# *49C0DA3F015D_49BE68B201D1_var*
//#UC END# *49C0DA3F015D_49BE68B201D1_var*
begin
//#UC START# *49C0DA3F015D_49BE68B201D1_impl*
 f_Inner := nil;
//#UC END# *49C0DA3F015D_49BE68B201D1_impl*
end;//Tl3ProxyStream.CloseInner

procedure Tl3ProxyStream.Cleanup;
//#UC START# *479731C50290_49BE68B201D1_var*
//#UC END# *479731C50290_49BE68B201D1_var*
begin
//#UC START# *479731C50290_49BE68B201D1_impl*
 f_Inner := nil;
 inherited;
//#UC END# *479731C50290_49BE68B201D1_impl*
end;//Tl3ProxyStream.Cleanup

function Tl3ProxyStream.Read(var Buffer;
  Count: Integer): Integer;
//#UC START# *49BE656C006E_49BE68B201D1_var*
//#UC END# *49BE656C006E_49BE68B201D1_var*
begin
//#UC START# *49BE656C006E_49BE68B201D1_impl*
 OleCheck(f_Inner.Read(@Buffer, Count, @Result));
//#UC END# *49BE656C006E_49BE68B201D1_impl*
end;//Tl3ProxyStream.Read

function Tl3ProxyStream.Write(const Buffer;
  Count: Integer): Integer;
//#UC START# *49BE658C0261_49BE68B201D1_var*
//#UC END# *49BE658C0261_49BE68B201D1_var*
begin
//#UC START# *49BE658C0261_49BE68B201D1_impl*
 OleCheck(f_Inner.Write(@Buffer, Count, @Result));
//#UC END# *49BE658C0261_49BE68B201D1_impl*
end;//Tl3ProxyStream.Write

function Tl3ProxyStream.Seek(const Offset: Int64;
  Origin: TSeekOrigin): Int64;
//#UC START# *49BE65E80020_49BE68B201D1_var*

 function ConvertOrigin: Integer;
 begin
  Case Origin of
   soBeginning:
    Result := STREAM_SEEK_SET;
   soCurrent:
    Result := STREAM_SEEK_CUR;
   soEnd:
    Result := STREAM_SEEK_END;
   else
   begin
    Result := -1;
    Assert(false);
   end;//else
  end;//Case Origin
 end;

//#UC END# *49BE65E80020_49BE68B201D1_var*
begin
//#UC START# *49BE65E80020_49BE68B201D1_impl*
 OleCheck(f_Inner.Seek(Offset, ConvertOrigin, Result));
//#UC END# *49BE65E80020_49BE68B201D1_impl*
end;//Tl3ProxyStream.Seek

end.