
ProgramTitle := "DailyRunner"
IniLocation := A_ScriptDir . "\" . ProgramTitle . ".ini"

ifnotexist % ReadIni("TargetProgram")
{
	Try{
		WriteIni("TargetProgram", ChooseFile("Choose your executable file"))
	}Catch{
		ExitApp
	}
}
if (ReadIni("LastCheck") != GetTodayDate()){
    Run, % ReadIni("TargetProgram"), % ReadIni("TargetProgram") . "\.."
	WriteIni("LastCheck", GetTodayDate())
}
ExitApp

WriteIni(Key, Value){
	global
	IfNotExist, % IniLocation . "\.."
		FileCreateDir, IniLocation . "\.."
    IniWrite, % Value, % IniLocation, % ProgramTitle, % Key
}

ReadIni(Key){
	global
	local out:=""
	ifexist, % IniLocation
        IniRead, out, % IniLocation, % ProgramTitle, % Key, % A_Space
	return % out
}

GetTodayDate(){
	Return % SubStr(A_Now, 1, 8)
}

ChooseFile(title){
	local out
	FileSelectFile, out,,,% ProgramTitle . " - " . title
	if(ErrorLevel)
		Throw ErrorLevel
	Return % out
}
