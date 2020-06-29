program Project1;
type
W=array of array of integer;

var
A:W;
p, q :integer;
i, j, sx, sy, x, y:integer;
znach: integer;
newz: boolean;

function IncDec (): integer;
begin
IncDec:=znach;
if znach=1 then newz:=true ;
if znach=9 then newz:=false;

if newz then znach:=znach+1
else znach:=znach-1 ;
end;
begin
write ('Enter number of strings: ');
readln(p);
write ('Enter number of columns: ');
readln(q);

SetLength(A,q);
for i:=0 to q-1 do SetLength (A[i], p);
sx:=p;
sy:=q-1;
x:=0;
y:=0;
znach:=1;

while (Sx+Sy)>0 do
begin
for i:=0 to sx-1 do
begin
A[y][x+i]:=IncDec();
end;
if sy=0 then break;
sx:= sx-1;
x:=x+i;
y:=y+1;

for i:=0 to sy-1 do
begin
A[y+i][x]:=IncDec();
end;
if sx=0 then break;
sy:= sy-1;
x:=x-1;
y:=y+i;

for i:=0 to sx-1 do
begin
A[y][x-i]:=IncDec();
end;
if sy=0 then break;
sx:= sx-1;
x:=x-i;
y:=y-1;

for i:=0 to sy-1 do
begin
A[y-i][x]:=IncDec();
end;
if sx=0 then break;
sy:= sy-1;
x:=x+1;
y:=y-i;

end;
for i:=0 to q-1 do
begin
for j:=0 to p-1 do
begin
write (A[i][j]:3);
end;
writeln ();
end;
readln();
end.
