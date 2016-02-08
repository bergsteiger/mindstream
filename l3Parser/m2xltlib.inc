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


                function          InitProc00000002    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000002    (
                                                      );


                function          InitProc00000004    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000004    (
                                                      );


                function          InitProc00000008    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000008    (
                                                      );


                function          InitProc00000010    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000010    (
                                                      );


                function          InitProc00000020    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000020    (
                                                      );


                function          InitProc00000040    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000040    (
                                                      );


                function          InitProc00000080    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000080    (
                                                      );


                function          InitProc00000100    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000100    (
                                                      );


                function          InitProc00000200    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000200    (
                                                      );


                function          InitProc00000400    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000400    (
                                                      );


                function          InitProc00000800    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000800    (
                                                      );


                function          InitProc00001000    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00001000    (
                                                      );


         private


         protected


         public


                constructor       Create              (
                                                      );

                destructor        Destroy             (
                                                      ); override;


         end;


 var
        GUnitHelper:              TUnitHelper = nil;


// TUnitHelper.private

 function    TUnitHelper.InitProc00000001(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTOem2Ansi);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000001(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTOem2Ansi);

   end;

 end;

 function    TUnitHelper.InitProc00000002(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTAnsi2Oem);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000002(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTAnsi2Oem);

   end;

 end;

 function    TUnitHelper.InitProc00000004(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTOem2Upper);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000004(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTOem2Upper);

   end;

 end;

 function    TUnitHelper.InitProc00000008(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTOem2Lower);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000008(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTOem2Lower);

   end;

 end;

 function    TUnitHelper.InitProc00000010(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTAnsi2Upper);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000010(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTAnsi2Upper);

   end;

 end;

 function    TUnitHelper.InitProc00000020(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTAnsi2Lower);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000020(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTAnsi2Lower);

   end;

 end;

 function    TUnitHelper.InitProc00000040(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTOemRus2Eng);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000040(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTOemRus2Eng);

   end;

 end;

 function    TUnitHelper.InitProc00000080(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTOemEng2Rus);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000080(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTOemEng2Rus);

   end;

 end;

 function    TUnitHelper.InitProc00000100(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTAnsiRus2Eng);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000100(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTAnsiRus2Eng);

   end;

 end;

 function    TUnitHelper.InitProc00000200(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTAnsiEng2Rus);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000200(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTAnsiEng2Rus);

   end;

 end;

 function    TUnitHelper.InitProc00000400(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTOem2Swap);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000400(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTOem2Swap);

   end;

 end;

 function    TUnitHelper.InitProc00000800(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTAnsi2Swap);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00000800(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTAnsi2Swap);

   end;

 end;

 function    TUnitHelper.InitProc00001000(const ABitMask: LongWord
                                         ): LongWord;
 begin

  with Self do
   begin

    _AllocData08(Cm2XLTOem2Special);

   end;

  Result:=ABitMask;

 end;

 procedure   TUnitHelper.DoneProc00001000(
                                         );
 begin

  with Self do
   begin

    _FreeData08(Cm2XLTOem2Special);

   end;

 end;

// TUnitHelper.protected

// TUnitHelper.public

 constructor TUnitHelper.Create(
                               );
 begin

  inherited Create();

  m2InitOperation(_Status,InitProc00000001($00000001));
  m2InitOperation(_Status,InitProc00000002($00000002));
  m2InitOperation(_Status,InitProc00000004($00000004));
  m2InitOperation(_Status,InitProc00000008($00000008));
  m2InitOperation(_Status,InitProc00000010($00000010));
  m2InitOperation(_Status,InitProc00000020($00000020));
  m2InitOperation(_Status,InitProc00000040($00000040));
  m2InitOperation(_Status,InitProc00000080($00000080));
  m2InitOperation(_Status,InitProc00000100($00000100));
  m2InitOperation(_Status,InitProc00000200($00000200));
  m2InitOperation(_Status,InitProc00000400($00000400));
  m2InitOperation(_Status,InitProc00000800($00000800));
  m2InitOperation(_Status,InitProc00001000($00001000));


 end;

 destructor  TUnitHelper.Destroy(
                                );
 begin

  m2DoneOperation(_Status,$00001000,DoneProc00001000);
  m2DoneOperation(_Status,$00000800,DoneProc00000800);
  m2DoneOperation(_Status,$00000400,DoneProc00000400);
  m2DoneOperation(_Status,$00000200,DoneProc00000200);
  m2DoneOperation(_Status,$00000100,DoneProc00000100);
  m2DoneOperation(_Status,$00000080,DoneProc00000080);
  m2DoneOperation(_Status,$00000040,DoneProc00000040);
  m2DoneOperation(_Status,$00000020,DoneProc00000020);
  m2DoneOperation(_Status,$00000010,DoneProc00000010);
  m2DoneOperation(_Status,$00000008,DoneProc00000008);
  m2DoneOperation(_Status,$00000004,DoneProc00000004);
  m2DoneOperation(_Status,$00000002,DoneProc00000002);
  m2DoneOperation(_Status,$00000001,DoneProc00000001);

  inherited Destroy();

 end;

// TUnitHelper.end


 initialization GUnitHelper:=TUnitHelper.Create();
 finalization   GUnitHelper.Free();
