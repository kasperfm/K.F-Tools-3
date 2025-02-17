///////////////////////////////////////////////////////////////////////////////////////////////
//
// FileUtils.pas
// --------------------------
// Changed:   2002-12-31
// Maintain:  Michael Vinther: meesoft.cjb.net  ||  solo@meesoft.cjb.net
//
// Last change:
//   GetDirList includes path from Search
//
unit FileUtils;

interface

uses Windows, SysUtils, Forms, ShellAPI, Classes, MemUtils, Controls, Messages;

var ProgramPath : string; // Path to program executable including '\'

// Append text line to file
procedure WriteLog(const FileName, LogLine: string);
// Execute file. Failure if Result<=32
function ExecuteFile(const FileName: string; const Params: string=''; const DefaultDir: string=''; ShowCmd: Integer=SW_SHOW): THandle;
// Return file name without extension
function RemoveFileExt(FileName: string): string;
// Return path name with a \ as the last character
function ForceBackslash(const PathName: string): string;
function RemoveBackslash(const PathName: string): string;
// Case sensitive compare with mask
const
  SingleWildcard = '?';
  MultiWildcard = '*';
function MaskCompare(Str,Mask: string): Boolean;
// Get size of file
function GetFileSize(FileName: string): Int64;
procedure GetDirList(const Search: string; List: TStrings);
// Delete file(s).
// Default is flags will recycle: FOF_ALLOWUNDO|FOF_NOCONFIRMATION|FOF_SILENT|FOF_NOERRORUI
// Multiple files can be seperated by #0, wildcards are allowed, full path must be specified
function DeleteFileEx(FileName: string; Flags: FILEOP_FLAGS=0): Boolean;
// Move file(s).
// Default is flags will recycle: FOF_NOCONFIRMMKDIR or FOF_NOCONFIRMATION or FOF_SILENT or FOF_NOERRORUI
// Multiple files can be seperated by #0, wildcards are allowed, full path must be specified
function MoveFile(Source,Dest: string; Flags: FILEOP_FLAGS=0): Boolean;

function MakeValidFileName(const Str: string): string;

// Show standard Windows dialogs
procedure ShowFileProperties(const FileName: string);
procedure ShowSearchDialog(const Directory: string);

function GetParameterFileName: string;

// Get file dropped by WM_DROPFILES
function GetDroppedFile(const Msg: TMessage; Index: Integer): string;

const
  TabChar = #9;

implementation

function MakeValidFileName(const Str: string): string;
const
  FileNameChars = ['A'..'Z','0'..'9','.','_','~','-','@'];
  ReplaceChar = '_';
var
  I : Integer;
begin
  Result:=Str;
  for I:=1 to Length(Result) do
    if not (UpCase(Result[I]) in FileNameChars) then Result[I]:=ReplaceChar;
  if Result='' then Result:='-';
  if Result[1]='.' then Result:=ReplaceChar+Result;
  if Length(Result)>255 then SetLength(Result,255);
end;

procedure GetDirList(const Search: string; List: TStrings);
var
  SRec : TSearchRec;
  E : Integer;
  Path : string;
begin
  Path:=ExtractFilePath(Search);
  List.BeginUpdate;
  E:=FindFirst(Search,faAnyFile,SRec);
  try
    while E=0 do
    begin
      if SRec.Attr and faDirectory<>0 then
      begin
      end
      else if SRec.Attr and faVolumeID=0 then
      begin
        List.Add(Path+SRec.Name);
      end;
      E:=FindNext(SRec);
    end;
  finally
    FindClose(SRec);
    List.EndUpdate;
  end;
end;

procedure WriteLog(const FileName, LogLine: string);
var Log : TextFile;
begin
  try
    Assign(Log,FileName);
    {$I-} Append(Log); {$I+}
    if IOResult<>0 then Rewrite(Log);
    try
      WriteLn(Log,LogLine);
    finally
      CloseFile(Log);
    end;
  except
  end;
end;

// Execute file. ShowCmd is often SW_SHOW
function ExecuteFile(const FileName,Params,DefaultDir: string; ShowCmd: Integer): THandle;
begin
  Result:=ShellExecute(Application.Handle,nil,
                       PChar(FileName),
                       PChar(Params),
                       PChar(DefaultDir),ShowCmd);
end;

function RemoveFileExt(FileName: string): string;
var P : Integer;
begin
  for P:=Length(FileName) downto 1 do
    if FileName[P]='\' then Break
    else
    if FileName[P]='.' then
    begin
      Result:=Copy(FileName,1,P-1);
      Exit;
    end;
  Result:=FileName;
end;

function MaskCompare(Str,Mask: string): Boolean;
var
  P : Integer;
begin
  Result:=True;
  for P:=1 to Length(Mask) do case Mask[P] of
    SingleWildcard : if P>Length(Str) then
                     begin
                       Result:=False;
                       Exit;
                     end;
    MultiWildcard  : begin
                       if P=Length(Mask) then Exit;
                       Delete(Mask,1,P);
                       Delete(Str,1,P-1);
                       repeat
                         if MaskCompare(Str,Mask) then Exit; // Suitable substring found, return true
                         Delete(Str,1,1);
                       until Length(Str)=0;
                       Result:=False;
                       Exit;
                     end;
    else if (P>Length(Str)) or (Str[P]<>Mask[P]) then
    begin
      Result:=False;
      Exit;
    end;
  end;
  if Length(Mask)<>Length(Str) then Result:=False;
end;

function ForceBackslash(const PathName: string): string;
begin
  Result:=PathName;
  if (PathName<>'') and (Result[Length(Result)]<>'\') then Result:=Result+'\';
end;

function RemoveBackslash(const PathName: string): string;
begin
  Result:=PathName;
  if (PathName<>'') and (Result[Length(Result)]='\') then SetLength(Result,Length(Result)-1);
end;

function GetFileSize(FileName: string): Int64;
var
  Handle: THandle;
  FindData: TWin32FindData;
begin
  Result:=-1;
  Handle:=FindFirstFile(PChar(FileName),FindData);
  if Handle<>INVALID_HANDLE_VALUE then
  begin
    Windows.FindClose(Handle);
    if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY)=0 then
    begin
      Result:=FindData.nFileSizeLow or (Int64(FindData.nFileSizeHigh) shl 32);
    end;
  end;
end;

function DeleteFileEx(FileName: string; Flags: FILEOP_FLAGS): Boolean;
var
  fos : TSHFileOpStruct;
begin
  if FileName='' then
  begin
    Result:=False;
    Exit;
  end;
  if FileName[Length(FileName)]<>#0 then FileName:=FileName+#0;
  ZeroMem(fos,SizeOf(fos));
  with fos do
  begin
    Wnd:=Application.Handle;
    wFunc:=FO_DELETE;
    pFrom:=PChar(FileName);
    if Flags=0 then fFlags:=FOF_ALLOWUNDO or FOF_NOCONFIRMATION or FOF_SILENT or FOF_NOERRORUI
    else fFlags:=Flags;
  end;
  Result:=SHFileOperation(fos)=0;
end;

function MoveFile(Source,Dest: string; Flags: FILEOP_FLAGS=0): Boolean;
var
  fos : TSHFileOpStruct;
begin
  if (Source='') or (Dest='') then
  begin
    Result:=False;
    Exit;
  end;
  if Source[Length(Source)]<>#0 then Source:=Source+#0;
  if Dest[Length(Dest)]<>#0 then Dest:=Dest+#0;
  ZeroMem(fos,SizeOf(fos));
  with fos do
  begin
    Wnd:=Application.Handle;
    wFunc:=FO_MOVE;
    pFrom:=PChar(Source);
    pTo:=PChar(Dest);
    if Flags=0 then fFlags:=FOF_NOCONFIRMMKDIR or FOF_NOCONFIRMATION or FOF_SILENT or FOF_NOERRORUI
    else fFlags:=Flags;
  end;
  Result:=SHFileOperation(fos)=0;
end;

function GetParameterFileName: string;
var
  I : Integer;
begin
  Result:=ParamStr(1);
  for I:=2 to ParamCount do Result:=Result+' '+ParamStr(I);
end;

procedure ShowFileProperties(const FileName: string);
var
  SEI : SHELLEXECUTEINFO;
begin
 ZeroMem(SEI,SizeOf(SEI));
 with SEI do
 begin
   cbSize:=SizeOf(SEI);
   fMask:=SEE_MASK_NOCLOSEPROCESS or SEE_MASK_INVOKEIDLIST or SEE_MASK_FLAG_NO_UI;
   Wnd:=Application.Handle;
   lpVerb:='properties';
   lpFile:=PChar(FileName);
  end;
  if not ShellExecuteEx(@SEI) then RaiseLastWin32Error;
end;

procedure ShowSearchDialog(const Directory: string);
var
  SEI : SHELLEXECUTEINFO;
begin
 ZeroMem(SEI,SizeOf(SEI));
 with SEI do
 begin
   cbSize:=SizeOf(SEI);
   fMask:=SEE_MASK_NOCLOSEPROCESS or SEE_MASK_INVOKEIDLIST or SEE_MASK_FLAG_NO_UI;
   Wnd:=Application.Handle;
   lpVerb:='find';
   lpFile:=PChar(Directory);
  end;
  if not ShellExecuteEx(@SEI) then RaiseLastWin32Error;
end;

function GetDroppedFile(const Msg: TMessage; Index: Integer): string;
begin
  SetLength(Result,DragQueryFile(Msg.wParam,Index,nil,0));
  DragQueryFile(Msg.wParam,Index,@Result[1],Length(Result)+1);
end;

var P : Integer;
initialization
  ProgramPath:=ParamStr(0); P:=Length(ProgramPath);
  while (P>0) and (ProgramPath[P]<>'\') do Dec(P);
  SetLength(ProgramPath,P);
end.

