MsgBox, % "Executable file is running!`n`n  Date: " . GetTodayDate()
ExitApp
GetTodayDate(){
	Return % SubStr(A_Now, 1, 8)
}