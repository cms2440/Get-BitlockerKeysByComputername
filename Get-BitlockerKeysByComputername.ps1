$comps = @"
AWUBW3-GG00008

AWUBW3-GG00017

AWUBW3-GG00021

AWUBW3-GG00015
"@.split("`n") | foreach {$_.trim()} | where {$_ -ne ""}

foreach ($comp in $comps) {
    $compObj = get-adcomputer $comp
    $key = get-adobject -searchscope onelevel -SearchBase $compObj.distinguishedname -filter * -Properties *
    $key | foreach {"$($_.name.split("{")[1].split("-")[0]) - $($_.'msFVE-RecoveryPassword')"}
    }
