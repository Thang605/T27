$file = "C:\Users\thang\Dropbox\DATA\T27\19. Google antigravity\T27\Input\experts.xlsx"
try {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
    $workbook = $excel.Workbooks.Open($file)
    $sheet = $workbook.Sheets.Item(6)
    
    # Read headers (Row 1)
    $headers = @()
    $c = 1
    while ($true) {
        $val = $sheet.Cells.Item(1, $c).Value2
        if ([string]::IsNullOrWhiteSpace($val)) { break }
        $headers += $val
        $c++
    }
    Write-Output "Headers: $($headers -join ', ')"

    # Read first 5 data rows
    for ($r = 2; $r -le 6; $r++) {
        $row_data = @()
        for ($c = 1; $c -le $headers.Count; $c++) {
            $val = $sheet.Cells.Item($r, $c).Value2
            $row_data += $val
        }
        if ($row_data[0] -eq $null) { break } # Stop if first column is empty
        Write-Output "Row $r : $($row_data -join ' | ')"
    }
    
    $workbook.Close($false)
    $excel.Quit()
    [System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
}
catch {
    Write-Error $_.Exception.Message
}
