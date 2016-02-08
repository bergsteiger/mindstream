unit m2AddRdr;

(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)

{$I m2Define.inc}

interface

procedure m2ExcErrHandler;

implementation

uses
 m2AddDbg
 ;
 
procedure m2ExcErrHandler;
begin
 Assert(m2TraceString(m2ExceptionMessage));
end;

end.
