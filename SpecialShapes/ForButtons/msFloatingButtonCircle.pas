unit msFloatingButtonCircle;

interface

uses
 msInterfaces,
 msCircleWithRadius
 ;

type
 TmsFloatingButtonCircle = class(TmsCircleWithRadius)
 public
  class function Create(const aButton: ImsShape; aShift : Extended): ImsShape;
 end;//TmsFloatingButtonCircle

implementation

uses
 System.Types,
 Math
 ;

// TmsFloatingButtonCircle

class function TmsFloatingButtonCircle.Create(const aButton: ImsShape; aShift : Extended): ImsShape;
var
 l_B : TRectF;
 l_Mid : TPointF;
begin
 l_B := aButton.DrawBounds;
 l_Mid.X := (l_B.Left + l_B.Right) / 2;
 l_Mid.Y := (l_B.Top + l_B.Bottom) / 2;
 Result := inherited Create(l_Mid,
                            Max(Abs(l_B.Right - l_B.Left),
                                Abs(l_B.Bottom - l_B.Top)) / 2
                                + aShift / 2 );
end;

end.
