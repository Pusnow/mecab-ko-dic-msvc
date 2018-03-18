$PROC_PATH = "C:\mecab\"
$DIC_PATH = "$($PROC_PATH)mecab-ko-dic\"
$USERDIC_PATH = "$($PROC_PATH)user-dic\"
$MECAB_EXEC_PATH = "$($PROC_PATH)mecab.exe"
$DICT_INDEX = "$($PROC_PATH)mecab-dict-index.exe"

function Get-Userdics {
    $Dir = Get-Childitem $USERDIC_PATH -recurse 
    $List = $Dir | Where-Object {$_.extension -eq ".csv"} 
    $List
}

function Get-Cost {
    $input_dic = $args[0]
    & $DICT_INDEX -m  "$($DIC_PATH)model.def"     -d $DIC_PATH     -u "$($DIC_PATH)user-$($input_dic)"     -f utf-8     -t utf-8     -a "$($USERDIC_PATH)$($input_dic)"
}

function Compile {
    Remove-Item .\mecab-ko-dic\*.bin
    Remove-Item .\mecab-ko-dic\*.txt
    & .\mecab-dict-index.exe -d mecab-ko-dic -o mecab-ko-dic -f UTF-8 -t UTF-8

}

function main {
    Write-Output "generating userdic..."
    Remove-Item .\mecab-ko-dic\user-*.csv

    Get-Userdics  | ForEach-Object {
        Get-Cost $_
    }


    Compile
}

main

