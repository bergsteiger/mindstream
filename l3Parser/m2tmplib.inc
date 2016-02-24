(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
 type
        TUnitHelper               = class(TObject)
         private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


         private


         protected


         public


                constructor       Create              (
                                                      );

                destructor        Destroy             (
                                                      ); override;


                procedure         AfterConstruction   (
                                                      ); override;


         end;


 var
        GUnitHelper:              TUnitHelper = nil;


// TUnitHelper.private

 function    TUnitHelper.InitProc00000001(const ABitMask: LongWord
                                         ): LongWord;
                                         
  function    __GetTempPath(
                           ): WideString;
  const
        CLength=                  2048;
  var
        LString:                  AnsiString;
  begin

   SetLength(Result,CLength);

   if (Win32Platform = VER_PLATFORM_WIN32_NT)
    then
     begin

      SetLength(Result,GetTempPathW(Length(Result),PWideChar(Result)));

     end
    else
     begin

      SetLength(LString,CLength);

      SetLength(LString,Integer(GetTempPathA(Length(LString),PAnsiChar(LString))));
      SetLength(Result,MultiByteToWideChar(0,0,PAnsiChar(LString),Length(LString),PWideChar(Result),Length(Result)));

     end;

   Win32Check(Length(Result) <> 0);

  end;

 begin

  with Self do
   begin

    GFilePath:=__GetTempPath();

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000001(
                                         );
 begin

  with Self do
   begin

    SetLength(GFilePath,0);

   end;

 end;

// TUnitHelper.protected

// TUnitHelper.public

 constructor TUnitHelper.Create(
                               );
 begin

  inherited Create();

  m2InitOperation(_Status,InitProc00000001($00000001));

 end;

 destructor  TUnitHelper.Destroy(
                                );
 begin

  m2DoneOperation(_Status,$00000001,DoneProc00000001);

  inherited Destroy();

 end;

 procedure   TUnitHelper.AfterConstruction(
                                          );
 begin

  inherited AfterConstruction();

  try

   Randomize();

  except

   m2ExcErrHandler();

  end;

 end;

// TUnitHelper.end


 initialization GUnitHelper:=TUnitHelper.Create();
 finalization   GUnitHelper.Free();
