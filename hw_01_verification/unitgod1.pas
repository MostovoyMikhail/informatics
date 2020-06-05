unit unitgod1;

interface
uses
  SysUtils;
type
  Point=record
    X,Y:Real;
    end;
  Triangle=record
    A,B,C:Point;
  end;


Function CreatePoint():Point;
Function CreateTriangle():Triangle;


Function MinDistance(const T:Triangle):Real;
Function MaxDistance(const T:Triangle):Real;


Function GetDistance(l:Point; r:Point):Real;

implementation



Function GetDistance(l:Point; r:Point):Real;
var
   vec:Point;
begin
vec.x:=l.x-r.x;
vec.y:=l.y-r.y;
GetDistance:=sqrt(sqr(vec.x)+sqr(vec.y));
end;



Function CreatePoint():Point;
begin
  Write('X: ');
  ReadLn(CreatePoint.X);
  Write('Y: ');
  ReadLn(CreatePoint.Y);
end;



Function CreateTriangle():Triangle;
begin
  WriteLn('(.)A ');
  CreateTriangle.A:=CreatePoint();
  WriteLn('(.)B ');
  CreateTriangle.B:=CreatePoint();
  WriteLn('(.)C ');
  CreateTriangle.C:=CreatePoint();
end;




Function MinDistance(const T:Triangle):Real;
var A:array[1..3] of Real;
    i:Integer;
    min:Real;
begin
A[1]:=GetDistance(T.A, T.B);
A[2]:=GetDistance(T.B, T.C);
A[3]:=GetDistance(T.A, T.C);
min:=A[1];
for i:=2 to 3 do
    if A[i]<min then min:=A[i];
MinDistance:=min;
end;

Function MaxDistance(const T:Triangle):Real;
var A:array[1..3] of Real;
    i:Integer;
    max:Real;
begin
A[1]:=GetDistance(T.A, T.B);
A[2]:=GetDistance(T.B, T.C);
A[3]:=GetDistance(T.A, T.C);
max:=A[1];
for i:=2 to 3 do
    if A[i]>max then max:=A[i];
MaxDistance:=max;
end;



end.

