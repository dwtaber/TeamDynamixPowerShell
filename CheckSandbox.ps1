function Script:CheckSandbox
{
    if ($Sandbox)
    {
        Set-Variable -Name Uri -Value $Script:SbUriBase -Scope 1
        Write-Verbose -Message "Sandbox switch on, setting URI to $Uri"
        Return $Uri.AbsoluteUri
    }
    else
    {
        Set-Variable -Name Uri -Value $Script:TdxUriBase -Scope 1
        Write-Verbose -Message "Sandbox switch off, setting URI to $Uri"
        Return $Uri.AbsoluteUri
    }
}