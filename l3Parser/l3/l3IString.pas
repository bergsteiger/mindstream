unit l3IString;

{ $Id: l3IString.pas,v 1.1 2011/07/08 13:14:39 fireton Exp $ }

// $Log: l3IString.pas,v $
// Revision 1.1  2011/07/08 13:14:39  fireton
// - работа с IString
//

interface

uses
  l3Interfaces,
  l3Types,
  l3Base,

  IOUnit
  ;

type
  Tl3IString = class(Tl3CustomString, Il3CString)
    private
    // internal fields
      f_String : IString;
    protected
    // internal methods
      class function IsCacheable: Bool;
        override;
        {-}
      function  GetAsPCharLen: Tl3PCharLenPrim;
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(const aString: IString);
        reintroduce;
        {-}
      procedure Insert(const aSt       : Tl3PCharLenPrim;
                       aPos            : Long;
                       aRepeat         : Long = 1);
        override;
        {* - вставляет строку aSt в позицию aPos, aRepeat раз. }
  end;//Tl3IString

  Tl3ConstIString = class(Tl3IString)
    public
    // public methods
      class function MakeI(const aStr: IString): Il3CString;
        {-}
  end;//Tl3ConstIString

function l3CStr(const aString: IString): Il3CString; overload;

implementation

uses
  l3String
  ;

function l3CStr(const aString: IString): Il3CString;
  //overload;
begin
 Result := Tl3ConstIString.MakeI(aString);
end;

// start class Tl3IString

constructor Tl3IString.Create(const aString: IString);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_String := aString;
end;

procedure Tl3IString.Insert(const aSt       : Tl3PCharLenPrim;
                              aPos            : Long;
                              aRepeat         : Long = 1);
  //override;
  {* - вставляет строку aSt в позицию aPos, aRepeat раз. }
begin
 Assert(false);
end;

procedure Tl3IString.Cleanup;
  //override;
  {-}
begin
 f_String := nil;
 inherited;
end;

class function Tl3IString.IsCacheable: Bool;
  //override;
  {-}
begin
 Result := true;
end;

function Tl3IString.GetAsPCharLen: Tl3PCharLenPrim;
  //override;
  {-}
begin
 if (f_String = nil) then
  l3AssignNil(Result)
 else
  Result := l3PCharLen(f_String.GetData, f_String.GetLength, f_String.GetCodePage);
end;

class function Tl3ConstIString.MakeI(const aStr: IString): Il3CString;
  {-}
var
 l_S : Tl3ConstIString;
begin
 l_S := Create(aStr);
 try
  Result := l_S;
 finally
  l3Free(l_S);
 end;//try..finally
end;

end.
