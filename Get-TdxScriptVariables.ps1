function Get-TdxScriptVariables {
    [CmdletBinding()]
    param ()
    begin {}
    process {
        [pscustomobject]@{
            TdxUserName = $Script:TdxUserName
            TdxToken = $Script:TdxToken
            TdxUriBase = $Script:TdxUriBase
            SbUriBase = $Script:SbUriBase
            TdxHeaders = $Script:TdxHeaders
            TdxTokenExpiry = $Script:TdxTokenExpiry
        }
    }
    end {}
}