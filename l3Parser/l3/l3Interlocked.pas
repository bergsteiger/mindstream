unit l3Interlocked;

{$Include ..\L3\l3Define.inc}

interface

function l3InterlockedIncrement(var aAddend: Integer): Integer; register;
  {-}

function l3InterlockedDecrement(var aAddend: Integer): Integer; register;
  {-}

function l3InterlockedCompareExchange(var aDestination: Pointer; aExchange: Pointer; aComperand: Pointer): Pointer; register;
  {-}

function l3InterlockedExchange(var aTarget: Integer; aValue: Integer): Integer; register;
  {-}

function l3InterlockedExchangeAdd(aAddend: PLongint; aValue: Longint): Longint; register; overload;
  {-}

function l3InterlockedExchangeAdd(var aAddend: Longint; aValue: Longint): Longint; register; overload;
  {-}

implementation

{$Define l3Interlocked}

function l3InterlockedIncrement(var aAddend: Integer): Integer;
  {-}
{$IfDef l3Interlocked}
asm
          mov  edx, 1
          xchg eax, edx
          lock xadd [edx], eax
          inc  eax
end;
{$Else  l3Interlocked}
asm
          mov  edx, 1
          xchg eax, edx
          {lock }xadd [edx], eax
          inc  eax
end;
{$EndIf l3Interlocked}

function l3InterlockedDecrement(var aAddend: Integer): Integer;
  {-}
{$IfDef l3Interlocked}
asm
          mov  edx, -1
          xchg eax, edx
          lock xadd [edx], eax
          dec  eax
end;
{$Else  l3Interlocked}
asm
          mov  edx, -1
          xchg eax, edx
          {lock }xadd [edx], eax
          dec  eax
end;
{$EndIf l3Interlocked}

function l3InterlockedCompareExchange(var aDestination: Pointer; aExchange: Pointer; aComperand: Pointer): Pointer;
  {-}
asm
          xchg eax, ecx
          lock cmpxchg [ecx], edx
end;

function l3InterlockedExchange(var aTarget: Integer; aValue: Integer): Integer;
  {-}
asm
          lock xchg [eax], edx
          mov  eax, edx
end;

function l3InterlockedExchangeAdd(aAddend: PLongint; aValue: Longint): Longint;
  // overload;
  {-}
asm
          xchg eax, edx
          lock xadd [edx], eax
end;

function l3InterlockedExchangeAdd(var aAddend: Longint; aValue: Longint): Longint;
  // overload;
  {-}
begin
 Result := l3InterlockedExchangeAdd(@aAddend, aValue);
end;

end.