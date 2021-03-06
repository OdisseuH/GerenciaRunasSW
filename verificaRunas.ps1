cd C:\BotSw\SWProxy-windows
$runasLow = Import-Csv .\*-runes.csv | Where-Object{$_."Max Potential" -lt 66 -and $_."level" -lt 15 -and $_."Equipped to monster" -eq 0}
$runasHigh66 = Import-Csv .\*-runes.csv | Where-Object{$_."Max Potential" -gt 66 -and $_."Equipped to monster" -eq 0}
$runasMonstros = Import-Csv .\*-runes.csv | Where-Object{$_."Equipped to monster" -ne 0}
$runasLowCount = ($runasLow | Measure).count
#$runasHigh69 = ($runasHigh69 | measure).count
#$runasMonstros = ($runasMonstros | measure).count

$listaExcluir = $runasLow | select "Rune Set","Slot no","Stars","Level","Primary effect" ,"First Substat","Second Substat","Third Substat","Max Potential" | Sort-Object "Rune Set", "Slot no" | ConvertTo-Html -Fragment

#Generate our full HTML with CSS styling
$HTML = ConvertTo-Html -Body "<h1>Sell Runes</h1> <h2>Total: $runasLowCount</h2> $listaExcluir" -Head "<style> @import url('https://fonts.googleapis.com/css?family=Permanent+Marker'); @import url('https://fonts.googleapis.com/css?family=Roboto'); h1 {margin-left: 385px; font-family: 'Permanent Marker', cursive; font-size: 50px;} h2 {margin-left: 435px; font-family: 'Permanent Marker', cursive; font-size: 30px;} body {background-color: lightblue; font-family: 'Roboto', sans-serif;} table {background-color: white; margin: 5px; float: left; top: 0px; display: inline-block; padding: 5px; border: 1px solid black} tr:nth-child(odd) {background-color: lightgray} </style>"

#Output to a file
$HTML | Out-File Sellrunes.html
ii Sellrunes.html

