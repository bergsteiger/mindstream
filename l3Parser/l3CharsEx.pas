unit l3CharsEx;

{ Ѕиблиотека "L3 (Low Level Library)" }
{ јвтор: Ћюлин ј.¬. ©                 }
{ ћодуль: l3CharsEx -                 }
{ Ќачат: 22.11.2000 21:03             }
{ $Id: l3CharsEx.pas,v 1.5 2007/08/02 10:37:10 lulin Exp $ }

// $Log: l3CharsEx.pas,v $
// Revision 1.5  2007/08/02 10:37:10  lulin
// - добавлены структуры дл€ оптимизации хранени€ строк.
//
// Revision 1.4  2001/12/27 16:06:34  law
// - change: изменен пор€док полей Tl3PCharLen.
//
// Revision 1.3  2000/12/15 15:18:59  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

interface

uses
  l3Types,
  l3Chars
  ;

const
  cc_FrameParts : array [Bool, // - верх
                         Bool, // - низ
                         Bool, // - лево
                         Bool] // - право
                  of Tl3StrPair =
    (
     ( // - нет верха
      ( // - нет низа
       ( // - нет лева
         ((S: cc_HardSpace; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_HardSpace; SLen: 1; SCodePage: CP_OEM;  )),    // - нет права
         ((S: #151; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_HLine; SLen: 1; SCodePage: CP_OEM;  ))          // - есть право
       ),
       ( // -есть лево
         ((S: #151; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_HLine; SLen: 1; SCodePage: CP_OEM;  )),         // - нет права
         ((S: #151; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_HLine; SLen: 1; SCodePage: CP_OEM;  ))          // - есть право
       )
      ),
      ( // - есть низ
       ( // - нет лева
         ((S: '|'; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_VLine; SLen: 1; SCodePage: CP_OEM;  )),    // - нет права
         ((S: '√'; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_TopLeft; SLen: 1; SCodePage: CP_OEM;  ))     // - есть право
       ),
       ( // -есть лево
         ((S: #172; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_TopRight; SLen: 1; SCodePage: CP_OEM;  )),    // - нет права
         ((S: 'T'; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_UpCross; SLen: 1; SCodePage: CP_OEM;  ))     // - есть право
       )
      )
     ),
     ( // - есть верх
      ( // - нет низа
       ( // - нет лева
         ((S: '|'; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_VLine; SLen: 1; SCodePage: CP_OEM;  )),    // - нет права
         ((S: 'L'; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_BottomLeft; SLen: 1; SCodePage: CP_OEM;  ))     // - есть право
       ),
       ( // -есть лево
         ((S: 'J'; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_BottomRight; SLen: 1; SCodePage: CP_OEM;  )),   // - нет права
         ((S: cc_DownCross; SLen: 1; SCodePage: CP_OEM;  ),
          (S: cc_DownCross; SLen: 1; SCodePage: CP_OEM;  ))      // - есть право
       )
      ),
      ( // - есть низ
       ( // - нет лева
         ((S: '|'; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_VLine; SLen: 1; SCodePage: CP_OEM;  )),    // - нет права
         ((S: cc_Plus; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_LeftCross; SLen: 1; SCodePage: CP_OEM;  ))     // - есть право
       ),
       ( // -есть лево
         ((S: cc_Plus; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_RightCross; SLen: 1; SCodePage: CP_OEM;  )),    // - нет права
         ((S: cc_Plus; SLen: 1; SCodePage: CP_ANSI; ),
          (S: cc_Cross; SLen: 1; SCodePage: CP_OEM;  ))          // - есть право
       )
      )
     )
    );

implementation

end.

