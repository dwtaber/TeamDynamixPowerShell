function New-TdxToken {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $true,
            Position = 0
        )]
        [pscredential]
        $Credential,

        [Parameter(
            Mandatory = $true,
            Position = 1
        )]
        [uri]
        $Uri,

        [Parameter(
            Mandatory = $false,
            Position = 2
        )]
        [uri]
        $SandboxUri
    )

    begin
    {
        if ($null -eq $PSBoundParameters['SandboxUri'])
        {
            $SandboxUri = [uri]"$($Uri.ToString().Replace("tdwebapi","sbtdwebapi"))"
            Write-Verbose "Sandbox: $SandboxUri"
        }

        $UserName = $Credential.UserName
        $Password = $Credential.GetNetworkCredential().Password

        $Body = [ordered]@{
            UserName = $UserName
            Password = $Password
        } | ConvertTo-Json
    }

    process
    {
        $RestSplat = @{
            Method = "Post"
            Body = $Body
            ContentType = "Application/Json"
            ErrorAction = "Stop"
        }
        $Script:TdxToken = Invoke-RestMethod @RestSplat -Uri "$Uri/auth"
        $Script:TdxHeaders = @{authorization = "Bearer $($Script:TdxToken)"}
        $Script:TdxUriBase = $Uri
        $Script:SbUriBase = $SandboxUri
        $Script:TdxUserName = $UserName
        $Script:TdxCredential = $Credential
        $Script:TdxTokenExpiry = [datetime]::now + [timespan]::FromHours(23.99)
        }

    end
    {
        return [PSCustomObject]@{
            TdxUserName = $Script:TdxUserName
            TdxUri = $Script:TdxUriBase.AbsoluteUri
            TdxTokenExpires = $Script:TdxTokenExpiry.datetime
        }
    }
}