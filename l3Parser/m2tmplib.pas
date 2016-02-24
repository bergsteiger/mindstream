unit    m2TMPLib;
{* Функции для работы с временными файлами. }

(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
// $Id: m2tmplib.pas,v 1.1 2008/02/22 17:10:08 lulin Exp $

// $Log: m2tmplib.pas,v $
// Revision 1.1  2008/02/22 17:10:08  lulin
// - библиотека переехала.
//
// Revision 1.2  2007/12/10 15:33:04  lulin
// - cleanup.
//
// Revision 1.1  2007/12/07 11:51:05  lulin
// - переезд.
//
// Revision 1.4  2006/05/05 07:41:48  lulin
// - cleanup.
//
// Revision 1.3  2001/10/18 12:18:06  law
// - comments: исправлены комментарии.
//
// Revision 1.2  2001/10/18 12:10:32  law
// - comments: xHelpGen.
//

{$I m2Define.inc}

interface

 uses
         Windows,
        SysUtils,

        m2AddRdr,
        m2AddPrc;


function m2TMPGetFilePath: WideString;
  {* - возвращает путь для временных файлов. }

function m2TMPGetFileName(const APath: WideString;
                          const AExt: WideString): WideString;
  {* - создает имя временного файла. }

implementation

var
 GFilePath : WideString;

function m2TMPGetFilePath: WideString;
begin
 Result := GFilePath;
end;

function m2TMPGetFileName(const APath : WideString;
                          const AExt  : WideString): WideString;

 function __CreateFile(const AName: WideString;
                       const AAccess: DWORD;
                       const ASharedMode: DWORD;
                       const ADistribution: DWORD;
                       const AFlags: DWORD;
                       var   AHandle: THandle): BOOL;
 var
  LString : AnsiString;
 begin
  if (Win32Platform = VER_PLATFORM_WIN32_NT) then
   AHandle:=CreateFileW(PWideChar(AName),AAccess,ASharedMode,nil,ADistribution,AFlags,0)
  else
   AHandle:=CreateFileA(m2MakeAnsiString(LString,AName),AAccess,ASharedMode,nil,ADistribution,AFlags,0);
  Result:=(AHandle <> INVALID_HANDLE_VALUE);
 end;

const
       CAccess=                  0;

       CSharedMode=              0;

       CDistribution=            CREATE_NEW;

       CFlags=                   FILE_ATTRIBUTE_HIDDEN;
var
       LExt:                     WideString;
       LHandle:                  THandle;
       LPath:                    WideString;
begin

 if (APath = WideString('')) then
  LPath:=GFilePath
 else
  LPath:=APath;
 if (AExt = WideString('')) then
  LExt:=WideString('tmp')
 else
  LExt:=AExt;
 repeat

  Result:=WideString(Format('%s~%.3x%.4x.%s',[AnsiString(LPath),Random($1000),Random($FFFF),AnsiString(LExt)]));

  if __CreateFile(Result,CAccess,CSharedMode,CDistribution,CFlags,LHandle) then
  begin
   Win32Check(CloseHandle(LHandle));
   Break;
  end;

 until False;

end;

{$I *.inc}

end.

