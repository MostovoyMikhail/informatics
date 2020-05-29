unit Geom;

interface

type
Point = record
x : Real;
y : Real;
end;
Line = record
A : Point;
B : Point;
end;

Triangle = record
A : Point;
B : Point;
C : Point;
end;

function CrPoint() : Point;
function CrTriangle() : Triangle;
function CrLine() :Line;
function GetDistance(const l : Point; const r : Point) : Real;
function GetTrPer(const T : Triangle) : Real;
function GetTrSq(const T : Triangle) : Real;
function CreateLine(const L : line ; const p1, p2 : Point ) : Boolean;
function CrossOrNot(const L : line ;const T : Triangle) : Boolean;
implementation

function CrPoint() : Point;
begin
write('x: ');
readln(CrPoint.x);
write('y: ');
readln(CrPoint.y);
end;

function GetDistance(const l : Point; const r : Point) : Real;
var v: Point;
begin
v.x := l.x - r.x;
v.y := l.y - r.y;
GetDistance := sqrt(v.x * v.x + v.y * v.y);
end;

function CrTriangle() : Triangle;
begin
writeln('vvedi A: ');
CrTriangle.A:=CrPoint();
writeln('vvedi B: ');
CrTriangle.B:=CrPoint();
writeln('vvedi C: ');
CrTriangle.C:=CrPoint();
end;

function CrLine():Line;
begin
writeln('vvedi LA: ');
CrLine.A:=CrPoint();
writeln('vvedi LB: ');
CrLine.B:=CrPoint();
end;

procedure TrPerAndSide(const T : Triangle; out AB : Real; out BC : Real; out AC : Real; out Per : Real);
begin
AB := GetDistance(T.A, T.B);
BC := GetDistance(T.B, T.C);
AC := GetDistance(T.A, T.C);
Per := GetTrPer(T);
end;

function GetTrPer(const T : Triangle) : Real;
begin
GetTrPer := GetDistance(T.A, T.B) + GetDistance(T.B, T.C) + GetDistance(T.A, T.C);
end;

function GetTrSq(const T : Triangle) : Real;
var
p : Real;
AB, BC, AC : Real;
begin
TrPerAndSide(T, AB, BC, AC, p);
p:=(GetDistance(T.A, T.B)+GetDistance(T.C, T.B)+GetDistance(T.C, T.A))/2;
GetTrSq := sqrt(p * (p - AB) * (p - BC) * (p - AC));
end;

function CreateLine(const L : line ; const p1, p2 : Point ) : Boolean;
var
m : real;
g:real;
begin
m:=(p1.x-p2.x)*(l.A.y-l.B.y)-(p1.y-p2.y)*(l.A.x-l.B.x);
if m=0 then
exit(false);
g := ((p1.x - l.A.x)*(l.A.y - l.B.y) - (p1.y - l.A.y)*(l.A.x - l.B.x)) / ((p1.x - p2.x)*(l.A.y-l.B.y) - (p1.y - p2.y)*(l.A.x - l.B.x));
if (g <= 1) and (g >= 0) then
exit(true)
else
exit(false);
end;

function CrossOrNot(const L : line ;const T : Triangle) : Boolean;
begin
if CreateLine (L , T.A , T.B ) then
exit(true);
if CreateLine (L , T.B , T.C ) then
exit(true);
if CreateLine (L , T.A , T.C ) then
exit(true);
exit(false);
end;
end.
